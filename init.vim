set nocompatible "look it up
set number
set mouse=a
set encoding=utf8
set clipboard=unnamedplus
syntax enable
set cursorline
set showmatch
set wildmenu
colors dracula

" UI
    set colorcolumn=80 " mark the 80th column
    set list " display some normally invisible characters (see listchars)

" Filetypes
    filetype plugin off
    "filetype indent off
    au BufNewFile,BufRead *.s set filetype=nasm
    au BufNewFile,BufRead *.asm set filetype=nasm
    au BufNewFile,BufRead *.sage set filetype=python
    au FileType make IndentMode t 4

" Indentation
    function SetIndentMode(mode, num)
        if a:num !~# '^\d\+$'
            echoerr "IndentMode: num must be a positive integer"
        elseif a:mode == "tabs" || a:mode == "t"
            set listchars=tab:\ \ ,extends:›,precedes:‹,nbsp:·,trail:·
            set noexpandtab
            let &tabstop=a:num
            let &softtabstop=a:num
            let &shiftwidth=a:num
        elseif a:mode == "spaces" || a:mode == "s"
            set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
            set expandtab
            let &tabstop=a:num
            let &softtabstop=a:num
            let &shiftwidth=a:num
        else
            echoerr "IndentMode: mode must be 'tabs', 't', 'spaces', or 's'"
        endif
    endfunction
    command -nargs=* IndentMode call SetIndentMode(<f-args>)

    IndentMode s 4
