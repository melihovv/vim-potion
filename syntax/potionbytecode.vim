if exists("b:current_syntax")
    finish
endif
let b:current_syntax = "potionbytecode"

syntax keyword potionBytecodeKeyword getlocal setlocal
syntax keyword potionBytecodeKeyword getupval setupval
syntax keyword potionBytecodeKeyword mult
syntax keyword potionBytecodeKeyword return call self
syntax keyword potionBytecodeKeyword move message proto
syntax keyword potionBytecodeKeyword loadpn loadk bind
highlight link potionBytecodeKeyword Keyword

syntax match potionBytecodeLineNumber "\v^\[\s*\d*\]"
highlight link potionBytecodeLineNumber Comment

syntax match potionBytecodeComment ";.*$"
highlight link potionBytecodeComment Comment
