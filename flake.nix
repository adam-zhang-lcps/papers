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
        # Per-system attributes can be defined here. The self' and inputs'
        # module parameters provide easy access to attributes of the same
        # system.

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
