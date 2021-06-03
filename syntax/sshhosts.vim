" IP, Port or HostName
syn match sshhost "\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}"
syn match sshhost ":\d\+"
syn match sshhost "[0-9a-zA-Z_-]\+@.\+"

" Website
syn match sshsite ".\+\(,\)\@="

" Public SSH key
syn match sshpubkey "AAAA[0-9a-zA-Z+/]\+[=]\{0,2}"

" Define the default highlighting

hi def link sshsite Statement
hi def link sshhost Special 
hi def link sshpubkey SpecialKey
