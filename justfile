build:
    #!/usr/bin/env bash
    set -e
    rm -rf build
    mkdir build
    (
        find static/ -type f '(' -iname '*.js' -a '(' '!' -iname '*.min.js' ')' ')' -print0 \
            | sed -zEe 's/\.js$/.min.js/'
        find static/ -type f -iname '*.scss' -print0 \
            | sed -zEe 's/\.scss$/.css/'
        find content/ -type f -iname '*.php' -print0 \
            | sed -zEe 's/\.php$/.html/'
    ) | xargs -0 make
    tar -C static -c . | tar -C build -x
    cp .neocitiesignore build/.neocitiesignore
    find ./content ./static -type f -print0 \
        | tar --exclude-from=.neocitiesignore --xform='s#^\./[^/]\+/##g' --null -T- -c \
        | tar -C build -x

clean:
    #!/usr/bin/env bash
    set -e
    rm -rf build
    (
        find static/ -type f -iname '*.min.js' -print0
        find static/ -type f -iname '*.css' -print0
        find content/ -type f -iname '*.html' -print0
    ) | xargs -0 rm -f

watch:
    #!/usr/bin/env bash
    set -e
    just build
    while inotifywait -qq -r -e modify content include static; do
        just build
    done

serve:
    #!/usr/bin/env bash
    darkhttpd build --addr 127.0.0.1 --port 8088 &
    just watch
    kill %1

deploy:
    neocities-deploy deploy -s kugland
