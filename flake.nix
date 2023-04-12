{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachSystem [
      "x86_64-linux"
    ]
      (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        rec {
          packages.default = pkgs.writeShellApplication {
            name = "my-app.sh";
            text = ''
              echo 'Hello, World!'
            '';
          };

          devShells.default = pkgs.mkShell {
          };
        }
      );
}
