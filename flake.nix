{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    kugland-nur-packages.url = "github:kugland/nur-packages/master";
    kugland-nur-packages.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    kugland-nur-packages,
  }:
    flake-utils.lib.eachDefaultSystem
    (
      system: let
        pkgs = import nixpkgs {inherit system;};
        neocities-deploy = kugland-nur-packages.packages."${system}".neocities-deploy;
      in
        with pkgs; {
          devShells.default = mkShell {
            buildInputs = [
              darkhttpd
              gnumake
              just
              neocities-deploy
              nodePackages.prettier
              nodePackages.uglify-js
              (php.withExtensions ({all, ...}: with all; [tidy]))
              sass
            ];
          };
        }
    );
}
