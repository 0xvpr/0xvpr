" Creator:  VPR
" Modified: March 21st, 2025

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "cooler"

" Highlights current line
hi CursorLine       guibg=#18374F

" Cursor's colour
hi CursorColumn     guibg=#FFFFFF
hi MatchParen       guifg=#FFFFFF   guibg=#439EA9   gui=BOLD
hi Pmenu            guifg=#DFEFF6   guibg=#1E415E
hi PmenuSel         guifg=#DFEFF6   guibg=#2D7889

" Search
hi IncSearch        gui=BOLD        guifg=#E2DAEF   guibg=#AF81F4
hi Search           gui=NONE        guifg=#E2DAEF   guibg=#AF81F4


" General colors
hi Cursor           guifg=NONE      guibg=#55A096   gui=NONE
hi Normal           guifg=NONE      guibg=NONE      gui=NONE

" e.g. tildes at the end of file
hi NonText          guifg=#1A8EFF   guibg=NONE      gui=NONE
hi LineNr           guifg=#00D7D7   guibg=#0C1926   gui=NONE

hi ColorColumn      guifg=#000000   guibg=#F842FF   gui=NONE
hi StatusLine       guifg=#1A8EFF   guibg=#0C1926   gui=ITALIC
hi StatusLineNC     guifg=#68CEE8   guibg=#0C1926   gui=NONE
hi VertSplit        guifg=#1A3951   guibg=#1A3951   gui=NONE
hi Folded           guifg=#68CEE8   guibg=#1A3951   gui=NONE
hi FoldColumn       guifg=#1E415E   guibg=#1A3951   gui=NONE
hi Title            guifg=#DFEFF6   guibg=NONE      gui=BOLD

 " Selected text color
hi Visual           guifg=#DFEFF6   guibg=#24557A   gui=NONE
hi SpecialKey       guifg=#1A8EFF   guibg=#102235   gui=NONE

"
" Syntax highlighting
"
hi Comment          guifg=#0286B6   gui=ITALIC
hi Todo             guifg=#ADED80   guibg=#579929   gui=BOLD
hi Constant         guifg=#1A8EFF   gui=NONE
hi String           guifg=#F842FF   gui=NONE

" Names of variables
hi Identifier       guifg=#8AC6F2   gui=NONE

" Declarations of type, e.g. int blah
hi Type             guifg=#1A8EFF   gui=BOLD

" Statement, such as 'hi' right here
hi Statement        guifg=#1A8EFF   gui=NONE
hi Keyword          guifg=#1A8EFF   gui=NONE

" Specified preprocessed words (like BOLD, ITALIC etc. above)
hi PreProc          guifg=#1A8EFF   gui=NONE
hi Number           guifg=#1A8EFF   gui=NONE
hi Special          guifg=#1A8EFF   gui=NONE
