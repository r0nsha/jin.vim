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
syn match jinHex "0[xX][0-9a-fA-F]\+"

" Variables/identifiers
syn match jinIdentifier "_\?[a-z][_\-a-zA-Z0-9]\+" nextgroup=@jinArguments

syn region jinRawIdentifier matchgroup=jinRawIdentifierDelimiter
    \ start="`" end="`" skip="\\\\\|\\\""

" Constants
syn match jinConstant "_\?[A-Z][_\-a-zA-Z0-9]*"

" Functions
syn match jinKeyword '\<fn\s\+\>\?'
    \ nextgroup=jinFunctionName skipempty skipwhite
syn match jinFunctionName "=\?[^( -!{]\+" contained

" Function positional/named arguments.
syn cluster jinArguments contains=jinFunctionArguments
syn region jinFunctionArguments start="(" end=")" contained contains=TOP
syn match jinKeywordArgument "[a-z][a-zA-Z0-9]*:[^:]" contained
    \ containedin=jinFunctionArguments

" Strings
syn region jinDoubleString matchgroup=jinDoubleStringDelimiter
    \ start="\"" end="\"" skip="\\\\\|\\\"" contains=jinStringEmbed

syn region jinChar matchgroup=jinSingleStringDelimiter
    \ start="'" end="'" skip="\\\\\|\\'"

syn region jinStringEmbed matchgroup=jinStringEmbedDelimiter
    \ start="{" end="}" skip="\\\\\|\\{" contains=TOP contained

" Generic characters
syn match jinArrow "->"
syn match jinDelimiters "[\[\]{}.,=_]"
syn match jinOperators "[-+\*^%!/<>&|~]"

" Keywords
syn match jinKeyword '\.\@<!\<\(let\|else\|type\|mod\|import\|mut\|return\|true\|false\)\>'
syn match jinKeyword '\.\@<!\<\(as\|match\|extern\|if\|for\|move\|ref\|break\|unsafe\)\>'

" Builtins
syn match jinBuiltin '\.\@<!\<\(i8\|i16\|i32\|i64\|int\)\>'
syn match jinBuiltin '\.\@<!\<\(u8\|u16\|u32\|u64\|uint\)\>'
syn match jinBuiltin '\.\@<!\<\(f32\|f64\|str\|char\|bool\|never\|ptr\)\>'

" Comments
syn region jinComment start="//" end="$" keepend

hi def link jinDelimiters Delimiter
hi def link jinArrow Delimiter
hi def link jinOperators Operator
hi def link jinKeyword Keyword
hi def link jinBuiltin Type
hi def link jinComment Comment
hi def link jinModuleDocComment Comment
hi def link jinDocComment Comment
hi def link jinNumber Number
hi def link jinHex Number
hi def link jinString String
hi def link jinDoubleString jinString
hi def link jinChar jinString
hi def link jinSingleStringDelimiter jinString
hi def link jinDoubleStringDelimiter jinString
hi def link jinStringEmbedDelimiter Delimiter
hi def link jinFunctionName Function
hi def link jinIdentifier Identifier
hi def link jinRawIdentifier jinString
hi def link jinRawIdentifierDelimiter jinString
hi def link jinKeywordArgument Identifier
hi def link jinConstant Constant
