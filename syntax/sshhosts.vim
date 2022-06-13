syn match sshhost "\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}"
syn match sshhost ":\d\+"
syn match sshhost "[0-9a-zA-Z_-]\+@.\+"

syn match sshsite ".\+\(,\)\@="

syn match sshpubkey "AAAA[0-9a-zA-Z+/]\+[=]\{0,2}"

hi def link sshsite Statement
hi def link sshhost Special 
hi def link sshpubkey SpecialKey
