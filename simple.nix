let
  lib = import ./lib;
  eval = import (./nixos/lib/eval-config.nix);
in
eval {
  system = "x86_64-linux";
  modules = [
    # {
    #   nixpkgs.config =
    #     { pkgs }:
    #     {
    #       allowUnfreePredicate = x: pkgs ? hello';
    #     };
    # }
    # {
    #   nixpkgs.config =
    #     { pkgs }:
    #     {
    #       allowUnfreePredicate = x: pkgs ? hello;
    #     };
    # }
    { nixpkgs.config.allowUnfreePredicate = x: true; }
    { nixpkgs.config.allowUnfreePredicate = x: true; }
    {
      nixpkgs.config.allowUnfreePredicate = lib.mkMerge [
        (x: true)
        (x: true)
      ];
    }
    # {nixpkgs.config = [ [ [ [ 1 ] ] ] ];}
  ];
}
