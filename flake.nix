{
  description = "pekko-cqrs-es-example 開発環境";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Java / Scala
            temurin-bin-21
            sbt
            scala_3

            # Infrastructure
            docker-compose

            # AWS (LocalStack)
            awscli2

            # Database
            postgresql_16

            # Protocol Buffers
            protobuf
          ];

          shellHook = ''
            export JAVA_HOME=${pkgs.temurin-bin-21}
            export PROTOC_PATH=${pkgs.protobuf}/bin/protoc
          '';
        };
      });
}
