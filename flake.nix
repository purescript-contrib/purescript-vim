{
  description = "PureScript language support for Vim and Neovim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    }@inputs:
    let
      projectName = "purescript-vim";

      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      nixpkgsFor = forAllSystems (system: import nixpkgs {
        inherit system;
        overlays = [ self.overlays.default ];
      });
    in
    {
      overlays.default = final: prev: { };

      apps = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          format = {
            type = "app";
            program = pkgs.writeShellApplication
              {
                name = "format";
                runtimeInputs = with pkgs; [
                  nixpkgs-fmt
                ];
                text = ''
                  set -euo pipefail
                  cd ${self}
                  nixpkgs-fmt .
                '';
              } + "/bin/format";
          };
        });

      checks = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          editorconfig = pkgs.runCommand "editorconfig-checker"
            {
              src = self;
              nativeBuildInputs = with pkgs; [
                editorconfig-checker
                nixpkgs-fmt
              ];
            } ''
            set -euo pipefail
            cd ${self}
            editorconfig-checker | tee $out
            nixpkgs-fmt --check . | tee $out
          '';
        });

      devShells = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            name = projectName;
            buildInputs = with pkgs; [
              editorconfig-checker
              nixpkgs-fmt
            ];
          };
        });
    };
}
