{
  description = "yolo-agent: containerized Claude Code in YOLO mode";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        yolo-claude = pkgs.writeShellApplication {
          name = "yolo-claude";
          runtimeInputs = [ pkgs.docker pkgs.coreutils ];
          text = builtins.readFile ./yolo-claude;
        };
      in {
        packages = {
          inherit yolo-claude;
          default = yolo-claude;
        };
      });
}
