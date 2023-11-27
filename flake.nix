{
  description = "LaTeX sources for school papers";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
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

        devShells.default = with pkgs;
          mkShell {
            buildInputs = [
              (texlive.combine {
                inherit
                  (texlive)
                  scheme-basic
                  latexmk
                  siunitx
                  multirow
                  biblatex
                  # APA7 + dependencies
                  
                  apa7
                  biblatex-apa
                  booktabs
                  caption
                  draftwatermark
                  endfloat
                  etoolbox
                  fancyhdr
                  float
                  geometry
                  scalerel
                  threeparttable
                  pgf
                  times
                  ;
              })
              texlab
            ];

            shellHook = ''
              export PATH=bin:$PATH
            '';
          };
      };
    };
}
