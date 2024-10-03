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
        packages.devshell = self.outputs.devShells.${system}.default;

        devshells.default = with pkgs; {
          commands = [
            {
              category = "Typst";
              package = typst;
            }
            {
              category = "Typst";
              package = tinymist;
            }
            {
              category = "Typst";
              package = typstyle;
            }
            {
              category = "Analysis";
              package = gnuplot;
            }
            {
              category = "Analysis";
              package = octave.withPackages (ps: with ps; [optim]);
            }
            {
              category = "CI Tooling";
              package = gitMinimal;
            }
          ];
        };
      };
    };
}
