" IP/Port, Site or Hostname
" syntax match host "\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}"
syntax match host ":\d\+"
syntax match host "[0-9a-zA-Z_-]\+@.\+"
syntax match host "\(\w*\.\)\+\w*"

" Website
" syntax match site ".\+\(,\)\@="

" Public SSH Key
syntax match pub_key "AAAA[0-9a-zA-Z+/]\+[=]\{0,2}"

highlight def link host Special 
highlight def link pub_key SpecialKey
