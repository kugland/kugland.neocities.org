kugland.neocities.org
=====================

This is the source code for my personal website,
[kugland.neocities.org](https://kugland.neocities.org/).
It’s a simple static site, built with PHP, Sass and some ad-hoc scripts,
for maximum fun and nostalgia.

Since I use NixOS, I’ve included a `flake.nix` file to make it easy to
get the dependencies and build the site. Just run `nix develop` and
then `just build` to build the site, or `just watch` to rebuild the
site whenever a file changes.

To deploy this site, I use the `neocities-deploy` command-line tool,
which I have written myself. You can find it in its own repository:
[neocities-deploy](https://github.com/kugland/neocities-deploy).

License
=======

All the code in this repository is licensed under the GPLv3 license.
See the `LICENSE` file for details.

Any text under `content/`, or any images in `static/`, however, are covered by
the [CC BY-ND 4.0](https://creativecommons.org/licenses/by-nd/4.0/) license.
