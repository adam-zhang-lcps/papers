default:
    just --list

build-changed-typst:
    #!/usr/bin/env nu
    mkdir out
    let files = (git diff-tree --no-commit-id --name-only -r HEAD | lines | where { str ends-with  ".typ" })
    for file in $files {
      typst c $file $'out/(basename -s .typ $file).pdf'
    }

build-changed-latex:
    #!/usr/bin/env nu
    mkdir out
    let files = (git diff-tree --no-commit-id --name-only -r HEAD | lines | where { str ends-with  ".tex" })
    for file in $files {
      latexmk -lualatex -outdir=out $file
    }

build-html:
    #!/usr/bin/env nu
    # This is 100% not a completely scuffed handwritten templating engine…
    mkdir public/pdf
    
    let template = (open html/template.html | split row '<!-- CONTENT HERE -->')
    let files = (glob *.{typ,tex} | path parse)

    let html = ($files | each {|f|
      let file = $'($f.stem).($f.extension)'

      if $f.extension == "typ" {
        typst c $file $'public/pdf/($f.stem).pdf'
      } else {
        latexmk -lualatex -out2dir=public/pdf $file
      }

      $'<li><a href="pdf/($f.stem).pdf">($f.stem)</a></li>'
    })

    [$template.0, ...$html, $template.1] | str join | save public/index.html

    cp -r html/assets public/
