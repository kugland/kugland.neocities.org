INCLUDES := $(wildcard include/*.php)

%.html: %.php $(INCLUDES)
	@mkdir -p "$(dir $@)"
	@printf "%s -> %s\n" "$<" "$@"
	@php "$<" > "$@"
	@prettier -w "$@"

%.css: %.scss
	@mkdir -p "$(dir $@)"
	@printf "%s -> %s\n" "$<" "$@"
	@sass --sourcemap=none -t compressed "$<" "$@"

%.min.js: %.js
	@mkdir -p "$(dir $@)"
	@printf "%s -> %s\n" "$<" "$@"
	@uglifyjs "$<" --compress --mangle --output "$@"
