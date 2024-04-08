{
  description = "Blog Environment";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    mkShell = pkgs.mkShell.override { stdenv = pkgs.stdenvNoCC; };
  in {
    devShells.${system}.default = mkShell {
      packages = with pkgs; [
        hugo
        marksman
      ];
    };
  };
}
