" Load html and css syntax
" runtime! syntax/html.vim
" unlet! b:current_syntax

" " don't use standard HiLink, it will not work with included syntax files
" if version < 508
" 	command! -nargs=+ HtmlHiLink hi link <args>
" else
" 	command! -nargs=+ HtmlHiLink hi def link <args>
" endif

" " Embedded Latex syntax using $ or $$
" syn include @tex syntax/tex.vim
" syn region mkdMath start="\\\@<!\$" end="\$" skip="\\\$" contains=@tex keepend
" syn region mkdMath start="\\\@<!\$\$" end="\$\$" skip="\\\$" contains=@tex keepend

" Headings: # Heading OR ### Heading
syn region markdownH1 matchgroup=markdownHeadingIcon start='^\s*# '      end='$' keepend oneline
syn region markdownH2 matchgroup=markdownHeadingIcon start='^\s*## '     end='$' keepend oneline
syn region markdownH3 matchgroup=markdownHeadingIcon start='^\s*### '    end='$' keepend oneline
syn region markdownH4 matchgroup=markdownHeadingIcon start='^\s*#### '   end='$' keepend oneline
syn region markdownH5 matchgroup=markdownHeadingIcon start='^\s*##### '  end='$' keepend oneline
syn region markdownH6 matchgroup=markdownHeadingIcon start='^\s*###### ' end='$' keepend oneline

" Lists: * list item OR - list item OR + list item
syn match markdownList '^[-+*] 'me=e-1 conceal cchar=●
syn match markdownList /^\t[-+*] /ms=s+1,me=e-1 conceal cchar=▨
syn match markdownList /^\t\t[-+*] /ms=s+2,me=e-1 conceal cchar=◑
syn match markdownList /^\t\t\t[-+*] /ms=s+3,me=e-1 conceal cchar=□
syn match markdownList /^\t\t\t\t[-+*] /ms=s+4,me=e-1 conceal cchar=▨

" Nunmbered Lists
syn match markdownNumberList '^\s*\d\+\. '

" Any url
syntax match markdownGeneralUrl '\(https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z0-9][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?[^] \t]*\)'

" Markdown Links: [text](url) OR ![image-alt](url)
syntax region markdownLinkUrl matchgroup=markdownLinkUrlParans start="(" end=")" contains=markdownGeneralUrl keepend oneline
syntax region markdownLinkTitle matchgroup=markdownLinkTitleBracks start="!\?\[" end="\]" keepend oneline

" Tables: | txt | txt |\n|--|--|\n| txt | txt |

" Italic: *italicized*
syn region markdownItalic start='\%(^\|\s\)\zs\*\ze[^\\\*\t ]\%(\%([^*]\|\\\*\|\n\)*[^\\\*\t ]\)\?\*\_W'ms=s+1 end='[^\\\*\t ]\zs\*\ze\_W'me=e-1 keepend contains=@Spell oneline
" Italic: _italicized_
syn region markdownItalic start='\%(^\|\s\)\zs_\ze[^\\_\t ]'ms=s+1 end='[^\\_\t ]\zs_\ze\_W'me=e-1 keepend contains=@Spell oneline
" Bold: **Bold**
syn region markdownBold start='\%(^\|\s\)\zs\*\*\ze\S'ms=s+2 end='\S\zs\*\*'me=e-2 keepend contains=@Spell oneline
" Bold: __Bold__
syn region markdownBold start='\%(^\|\s\)\zs__\ze\S'ms=s+2 end='\S\zs__'me=e-2 keepend contains=@Spell oneline
" Strikethrough: ~~strike 3~~
syn region markdownStrike start='\%(^\|\s\)\zs\~\~\ze\S'ms=s+2 end='\S\zs\~\~'me=e-2 keepend contains=@Spell oneline
" Code: `monospace font`
syn region markdownCode start='\%(^\|\s\)\zs`\ze\S'ms=s+1 end='\S\zs`'me=e-1 keepend contains=@Spell oneline

" Task List: * [ ] Not Done OR - [X] Done OR + [x] also done

" BlockQuote: > This is a quote
syn region markdownBlockQuote start='^\s*> ' end='$' keepend oneline

" Code Blocks: \s\s\s\scode
syn region markdownCodeBlock start='^    ' end='$'

" Fenced Code Blocks: ```javascript\nThis is a code block\n```

" Horizontal Rule: ---

" Footnote: [^1]: Text

" Custom coloring
hi! markdownGeneralUrl guifg=#FFA3BD    gui=underline

" Highlight Groups
hi! def link markdownHeadingIcon        GruvboxFg4
hi! def link markdownH1                 GruvboxYellow
hi! def link markdownH2                 GruvboxOrange
hi! def link markdownH3                 GruvboxOrange
hi! def link markdownH4                 GruvboxGreen
hi! def link markdownH5                 GruvboxGreen
hi! def link markdownH6                 GruvboxGreen
hi! def link markdownBlockQuote         GruvboxAqua
hi! def link markdownList               GruvboxRed
hi! def link markdownNumberList         GruvboxRed
hi! def link markdownBold               GruvboxBlue
hi! def link markdownItalic             GruvboxBlue
hi! def link markdownStrike             GruvboxBlue
hi! def link markdownCode               GruvboxPurple
hi! def link markdownCodeBlock          GruvboxRed
hi! def link markdownLinkTitleBracks    GruvboxAqua
hi! def link markdownLinkUrlParans      GruvboxAqua
hi! def link markdownLinkTitle          GruvboxFg2
hi! def link markdownLinkUrl            GruvboxRed

" Conceal Highlight Color
hi! def link Conceal GruvboxRed

set conceallevel=2

let b:current_syntax = "markdown"
