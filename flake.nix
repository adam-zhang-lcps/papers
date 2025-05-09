{
  description = "LaTeX sources for school papers";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
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
          env = [
            {
              name = "LANG";
              value = "en_US.UTF-8";
            }
          ];
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
              category = "(La)TeX";
              name = "latexmk";
              help = "Compile LaTeX with packages included";
              package = texliveBasic.withPackages (ps:
                with ps; [
                  latexmk

                  amsmath
                  fontspec
                  etoolbox
                  xkeyval
                  xstring
                  xpatch
                  translations

                  hyperref
                  cleveref
                  fancyhdr
                  titlesec
                  parskip
                  enumitem
                  caption
                  float
                  hanging
                  ragged2e

                  xcolor
                  pgf
                  pgfplots
                  cancel

                  biblatex
                  biber
                  csquotes

                  preprint
                  biblatex-mla
                  newtx
                  iftex
                  fontaxes
                  enotez
                  mlacls
                ]);
            }
            {
              category = "(La)TeX";
              package = texlab;
            }
            {
              category = "Analysis";
              package = gnuplot;
            }
            # {
            #   category = "Analysis";
            #   package = octave.withPackages (ps: with ps; [optim]);
            # }
            {
              category = "CI Tooling";
              package = gitMinimal;
            }
            {
              category = "CI Tooling";
              package = just;
            }
            {
              category = "CI Tooling";
              package = nushell;
            }
            {
              category = "Fonts";
              package = courier-prime;
            }
          ];
        };
      };
    };
}
