"       ______       ________
"      /__/\__\     |________|
"     /__/__\__\    |__|__|__|    Adriel Perkins
"    /__/____\__\   |________|    https://github.com/adrielp
"   /__/      \__\  |__|          https://adrielperkins.dev
"  /__/        \__\ |__|          https://www.youtube.com/channel/UCMvC5sEUUx4U5CsM24Egmhg

let mapleader = " "

set ignorecase
set colorcolumn=80

function! s:split(...) abort
    let direction = a:1
    let file = exists('a:2') ? a:2 : ''
    call VSCodeCall(direction ==# 'h' ? 'workbench.action.splitEditorDown' : 'workbench.action.splitEditorRight')
    if !empty(file)
        call VSCodeExtensionNotify('open-file', expand(file), 'all')
    endif
endfunction

function! s:splitNew(...)
    let file = a:2
    call s:split(a:1, empty(file) ? '__vscode_new__' : file)
endfunction

function! s:closeOtherEditors()
    call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
    call VSCodeNotify('workbench.action.closeOtherEditors')
endfunction

function! s:manageEditorHeight(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
        call VSCodeNotify(to ==# 'increase' ? 'workbench.action.increaseViewHeight' : 'workbench.action.decreaseViewHeight')
    endfor
endfunction

function! s:manageEditorWidth(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
        call VSCodeNotify(to ==# 'increase' ? 'workbench.action.increaseViewWidth' : 'workbench.action.decreaseViewWidth')
    endfor
endfunction

command! -complete=file -nargs=? Split call <SID>split('h', <q-args>)
command! -complete=file -nargs=? Vsplit call <SID>split('v', <q-args>)
command! -complete=file -nargs=? New call <SID>split('h', '__vscode_new__')
command! -complete=file -nargs=? Vnew call <SID>split('v', '__vscode_new__')
command! -bang Only if <q-bang> ==# '!' | call <SID>closeOtherEditors() | else | call VSCodeNotify('workbench.action.joinAllGroups') | endif

AlterCommand sp[lit] Split
AlterCommand vs[plit] Vsplit
AlterCommand new New
AlterCommand vne[w] Vnew
AlterCommand on[ly] Only

" buffer management
nnoremap <leader>n <Cmd>call <SID>splitNew('h', '__vscode_new__')<CR>

nnoremap <leader>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <leader>c <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <leader><C-c> <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

" window/splits management 
nnoremap <leader>s <Cmd>call <SID>split('h')<CR>

nnoremap <leader>v <Cmd>call <SID>split('v')<CR>

nnoremap <leader>= <Cmd>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>
nnoremap <leader>_ <Cmd>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

nnoremap <leader>+ <Cmd>call <SID>manageEditorHeight(v:count, 'increase')<CR>
nnoremap <leader>- <Cmd>call <SID>manageEditorHeight(v:count, 'decrease')<CR>
nnoremap <leader>> <Cmd>call <SID>manageEditorWidth(v:count,  'increase')<CR>
nnoremap <leader>< <Cmd>call <SID>manageEditorWidth(v:count,  'decrease')<CR>

nnoremap <leader>o <Cmd>call VSCodeNotify('workbench.action.joinAllGroups')<CR>
nnoremap <leader><C-o> <Cmd>call VSCodeNotify('workbench.action.joinAllGroups')<CR>

" window navigation
nnoremap <leader>j <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
nnoremap <leader>k <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
nnoremap <leader>h <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
nnoremap <leader>l <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>

nnoremap <leader><Down> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
nnoremap <leader><Up> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
nnoremap <leader><Left> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
nnoremap <leader><Right> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>

nnoremap <leader><C-j> <Cmd>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>
nnoremap <leader><C-i> <Cmd>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>
nnoremap <leader><C-h> <Cmd>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>
nnoremap <leader><C-l> <Cmd>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>

nnoremap <leader><C-Down> <Cmd>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>
nnoremap <leader><C-Up> <Cmd>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>
nnoremap <leader><C-Left> <Cmd>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>
nnoremap <leader><C-Right> <Cmd>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>

nnoremap <leader><S-j> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupDown')<CR>
nnoremap <leader><S-k> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupUp')<CR>
nnoremap <leader><S-h> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupLeft')<CR>
nnoremap <leader><S-l> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupRight')<CR>

nnoremap <leader><S-Down> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupDown')<CR>
nnoremap <leader><S-Up> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupUp')<CR>
nnoremap <leader><S-Left> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupLeft')<CR>
nnoremap <leader><S-Right> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupRight')<CR>

nnoremap <leader>w <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
nnoremap <leader><leader> <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
nnoremap <leader>W <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>

nnoremap <leader>t <Cmd>call VSCodeNotify('workbench.action.focusFirstEditorGroup')<CR>
nnoremap <leader>b <Cmd>call VSCodeNotify('workbench.action.focusLastEditorGroup')<CR>

nnoremap <silent> <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>"