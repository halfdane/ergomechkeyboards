{
  description = "PowerPoint-Karaoke deck: Split-Ergo-Tastaturen (reveal.js via reveal-md)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        slides = "slides.md";
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.reveal-md ];

          shellHook = ''
            echo "Split-Ergo-Tastaturen deck"
            echo "  reveal-md ${slides} -w     # live-reload server on http://localhost:1948"
            echo "  reveal-md ${slides} --static _site --static-dirs=assets,css   # static export"
          '';
        };

        # `nix run` serves the deck with live reload.
        apps.default = {
          type = "app";
          program = toString (pkgs.writeShellScript "serve-deck" ''
            exec ${pkgs.reveal-md}/bin/reveal-md ${slides} -w
          '');
        };
      });
}
