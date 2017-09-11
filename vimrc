" syntax highlight
syntax enable

" Always set auto indenting on
set autoindent
" 4 spaces for indenting
set shiftwidth=4
set tabstop=4

set backspace=indent,eol,start

" Mouse scroll/select
set mouse=a
" select when using the mouse
set selectmode=mouse

" Show a line where the cursor is
set cursorline

" Line Numbers
set nu
" " " set ww=<,>,b,s,[,]

" " " set hlsearch incsearch ignorecase smartcase

" " " set ru
" " " syn on

" not compatible with vi
" " " set nocp

" Status bar
set statusline=%1*%F%m%r%h%w%=%(%c%V\ %l/%L\ %P%)
set laststatus=2
" this enables "visual" wrapping
set wrap!

" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0

set wildmode=longest,list,full
set wildmenu
"set softtabstop=2

" Mapping other file extensions
au BufNewFile,BufRead *.ino set filetype=arduino
au BufNewFile,BufRead *.pde set filetype=arduino

" #######################
" # PRETTY TAB NUMBERS! #
set tabline=%!MyTabLine()
function MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " select the highlighting for the buffer names
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " empty space
    let s .= ' '
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " set page number string
    let s .= t + 1 . ' '
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0 " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
        "let n .= bufname(b)
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      "let s .= '[' . m . '+]'
      let s.= '+ '
    endif
    " add buffer names
    if n == ''
      let s .= '[No Name]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space to buffer list
    "let s .= '%#TabLineSel#' . ' '
    let s .= ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif
  return s
endfunction
" END PRETTY TAB NUMBERS!
" #######################

" highlight EOL whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Code Abbreviations
iab fori for(i=0; i<; i++)<CR>{<CR>}<ESC>kk0f<a
iab forj for(j=0; j<; j++)<CR>{<CR>}<ESC>kk0f<a
iab foreach foreach as $key => $value) {<CR>}<ESC>k0fha
iab printr echo "<pre>";<CR>print_r);<CR>echo "</pre>";<CR>die();<CR><ESC>kkkf)i
iab vardump echo "<pre>";<CR>var_dump);<CR>echo "</pre>";<CR>die();<CR><ESC>kkkf)i

" Create getter and setter for an attribute in a PHP class
let @m = 'mm0f$€kryw?classf{%O	public function pbvUisetA($data) {	$this->pA = $data;€kb}public function pbvUigetA() {	return $this->pA;€kb}`m'
