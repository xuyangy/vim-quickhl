function! quickhl#get_selected_text() "{{{
"copy & paste from tyru's open-browser.vim
  let save_z = getreg('z', 1)
  let save_z_type = getregtype('z')
  try
    silent normal! gv"zy
    return substitute(@z,"\n.*",'','')
  finally
    call setreg('z', save_z, save_z_type)
  endtry
endfunction "}}}

function! quickhl#warn(error) "{{{
	echohl WarningMsg
  echomsg 'quickhl:  ' . a:error
  echohl None
endfunction "}}}

let s:metachar = '\/~ .*^[''$'
function! quickhl#escape(pattern) "{{{
  return escape(a:pattern, s:metachar)
endfunction "}}}

function! quickhl#our_match(pattern) "{{{
  return filter(getmatches(), "v:val.group =~# '". a:pattern . "'")
endfunction "}}}

function! quickhl#windo(func, obj) "{{{
  if has('nvim') && exists('*nvim_list_wins') && exists('*nvim_win_call')
    let cur_win = win_getid()
    for win in nvim_list_wins()
      if type(win) != type(0) || win == 0
        continue
      endif

      let config = nvim_win_get_config(win)
      if type(config) == type({}) && has_key(config, 'relative') && type(config.relative) == type('') && config.relative !=# ''
        continue
      endif

      call nvim_win_call(win, {-> call(a:func, [], a:obj)})
    endfor

    if cur_win != 0
      call win_gotoid(cur_win)
    endif
    return
  endif

  let winnum = winnr()
  let pwinnum = winnr('#')
  try
    noautocmd windo call call(a:func, [], a:obj)
  catch /^Vim\%((\a\+)\)\=:E445/
    " Ignore focus switching restrictions when other windows block :windo.
  endtry

  if pwinnum !=# 0
    execute pwinnum . "wincmd w"
  endif
  execute winnum . "wincmd w"
endfunction "}}}

" vim: foldmethod=marker
