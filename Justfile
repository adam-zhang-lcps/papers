default:
    just --list

build-changed:
    #!/usr/bin/env nu
    mkdir out
    let files = (git diff-tree --no-commit-id --name-only -r HEAD | lines | where { str ends-with  ".typ" })
    for file in $files {
      typst c $file $'out/(basename -s .typ $file).pdf'
    }

build-html:
    #!/usr/bin/env nu
    # This is 100% not a completely scuffed handwritten templating engine…
    mkdir public/pdf
    
    let template = (open html/template.html | split row '<!-- CONTENT HERE -->')
    let files = (ls *.typ | get name)

    let html = ($files | par-each {|f|
      let basename = (basename -s '.typ' $f)

      typst c $f $'public/pdf/($basename).pdf'

      $'<li><a href="pdf/($basename).pdf">($basename)</a></li>'
    })

    [$template.0, ...$html, $template.1] | str join | save public/index.html

    cp -r html/assets public/
