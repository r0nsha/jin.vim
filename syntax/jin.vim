if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
end

let b:current_syntax = "jin"

set iskeyword+=?

syn sync minlines=200

" Numbers
syn match jinNumber "\d\+\([\._]\d\+\)*\([eE]+\d\+\)\?u\?"
syn match jinOctal "0[oO][0-7]\+"
syn match jinHex "0[xX][0-9a-fA-F]\+"

" Variables/Identifiers
syn match jinIdentifier "_\?[a-zA-Z][_\-a-zA-Z0-9]*"

syn region jinRawIdentifier matchgroup=jinRawIdentifierDelimiter
    \ start="`" end="`" skip="\\\\\|\\\""

" Strings
syn region jinString matchgroup=jinStringDelimiter
    \ start="\"" end="\"" skip="\\\\\|\\\"" contains=jinStringEmbed

syn region jinStringEmbed matchgroup=jinStringEmbedDelimiter
    \ start="{" end="}" skip="\\\\\|\\{" contains=TOP contained

" Generic characters
syn match jinArrow "->"
syn match jinDelimiters "[\[\]{}.,=_]"
syn match jinOperators "[-+\*^%!/<>&|~]"

" Keywords
syn match jinKeyword '\.\@<!\<\(fn\|let\|const\|else\|type\|mod\|use\|mut\|return\|true\|false\)\>'
syn match jinKeyword '\.\@<!\<\(as\|match\|extern\|if\|for\|move\|break\|unsafe\)\>'

" Builtins
syn match jinBuiltin '\.\@<!\<\(i8\|i16\|i32\|i64\|int\)\>'
syn match jinBuiltin '\.\@<!\<\(u8\|u16\|u32\|u64\|uint\)\>'
syn match jinBuiltin '\.\@<!\<\(f32\|f64\|str\|char\|bool\|unit\|never\|ptr\)\>'

" Comments
syn region jinComment start="//" end="$" keepend

hi def link jinDelimiters Delimiter
hi def link jinArrow Delimiter
hi def link jinOperators Operator
hi def link jinKeyword Keyword
hi def link jinBuiltin Type
hi def link jinComment Comment
hi def link jinNumber Number
hi def link jinOctal Number
hi def link jinHex Number
hi def link jinString String
hi def link jinChar jinString
hi def link jinStringDelimiter jinString
hi def link jinStringEmbedDelimiter Delimiter
hi def link jinIdentifier Identifier
hi def link jinRawIdentifier jinString
hi def link jinRawIdentifierDelimiter jinString
