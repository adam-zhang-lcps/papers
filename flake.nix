{
  description = "LaTeX sources for school papers";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
  self,
    flake-parts,
    nixpkgs,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];

      imports = [inputs.devshell.flakeModule];

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        apps = {
          build-changed-files.program = pkgs.writeScriptBin "get-changed-files" ''
            #!${pkgs.lib.getExe pkgs.nushell}
            mkdir out
            let files = (${pkgs.lib.getExe pkgs.git} diff-tree --no-commit-id --name-only -r ${self.rev} | lines | where { str ends-with ".typ" })
            for file in $files {
              ${pkgs.lib.getExe pkgs.typst} c $file $'out/(basename -s .typ $file).pdf'
            }
          '';
        };

        devshells.default = with pkgs; {
          commands = [
            {
              category = "Typst";
              package = typst;
            }
            {
              category = "Typst";
              package = typst-lsp;
            }
            {
              category = "Typst";
              package = typstfmt;
            }
            {
              package = gnuplot;
            }
          ];
        };
      };
    };
}
