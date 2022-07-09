if has('autocmd')
  autocmd BufNewFile,BufRead known_hosts,authorized_keys,*.pub setfiletype sshhosts
endif
