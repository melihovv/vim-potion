if !exists("g:potion_command")
    let g:potion_command = "/home/tudututu/projects/potion/bin/potion"
endif

function! PotionCompileAndRunFile()
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>

function! PotionShowBytecode()
    " get the bytecode.
    silent! write
    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))
    if bytecode =~# '\v^\*\* Syntax error\!' || v:shell_error
        echohl ErrorMsg | echom "Syntax error in " . bufname("%") | echohl None
        return
    endif

    " open a new split and set it up.
    let win = bufwinnr('__Potion_Bytecode__')

    if win >= 0
        execute win . "wincmd w"
    else
        below split __Potion_Bytecode__
    end

    normal! ggdG
    setlocal filetype=potionbytecode
    setlocal buftype=nofile

    " insert the bytecode.
    call append(0,
    split(bytecode, '\v\n'))
endfunction

nnoremap <buffer> <localleader>b :call PotionShowBytecode()<cr>
