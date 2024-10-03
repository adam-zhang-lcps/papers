default:
    just --list

build-changed:
    #!/usr/bin/env nu
    mkdir out
    let files = (git diff-tree --no-commit-id --name-only -r HEAD | lines | where { str ends-with  ".typ" })
    for file in $files {
      typst c $file $'out/(basename -s .typ $file).pdf'
    }
