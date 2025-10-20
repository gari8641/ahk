#Requires AutoHotkey v2.0

; =========================
; Chrome
; =========================
#HotIf WinActive("ahk_exe chrome.exe")
^h::Send "{Backspace}"
^d::Send "{Delete}"
^b::Send "{Left}"
^f::Send "{Right}"
^n::Send "{Down}"
^p::Send "{Up}"
^a::Send "{Home}"
^+a::Send "^a"           ; 全選択
^e::Send "{End}"
^j::Send "{Enter}"        ; あなたの設定に合わせて Down
^k::{
    Send "+{End}"
    Send "{Delete}"
}
#HotIf

; =========================
; XMind（Ctrl+K は未定義＝アプリ既定に任せる）
; =========================
#HotIf WinActive("ahk_exe Xmind.exe")
^h::Send "{Backspace}"
^d::Send "{Delete}"
^b::Send "{Left}"
^f::Send "{Right}"
^n::Send "{Down}"
^p::Send "{Up}"
;^a::Send "{Home}"
;^+a::Send "^a"
^e::Send "{End}"
^j::Send "{Enter}"
; ※ ^k は定義しない
#HotIf

; =========================
; XMind 有料広告ポップアップ
; =========================
#HotIf WinActive("Xmind ahk_exe Xmind.exe")
q::Send "!{F4}"
x::Send "!{F4}"
d::Send "!{F4}"
#HotIf

; =========================
; Teams（Ctrl+J は Shift+Enter で改行）
; =========================
#HotIf WinActive("ahk_exe ms-teams.exe") || WinActive("ahk_class TeamsWebView")
^h::Send "{Backspace}"
^d::Send "{Delete}"
^b::Send "{Left}"
^f::Send "{Right}"
^n::Send "{Down}"
^p::Send "{Up}"
^a::Send "{Home}"
^+a::Send "^a"
^e::Send "{End}"
^j::Send "+{Enter}"      ; 改行
^k::{
    Send "+{End}"
    Send "{Delete}"
}
#HotIf

; =========================
; LINE
; =========================
#HotIf WinActive("ahk_exe ms-teams.exe") || WinActive("ahk_class TeamsWebView")
^h::Send "{Backspace}"
^d::Send "{Delete}"
^b::Send "{Left}"
^f::Send "{Right}"
^n::Send "{Down}"
^p::Send "{Up}"
^a::Send "{Home}"
^+a::Send "^a"
^e::Send "{End}"
^j::Send "+{Enter}"      ; 改行
^k::{
    Send "+{End}"
    Send "{Delete}"
}
#HotIf

; =========================
; Windows Terminal
; 
; =========================
#HotIf WinActive("ahk_exe WindowsTerminal.exe")
^h::Send "{Backspace}"
^d::Send "{Delete}"
^b::Send "{Left}"
^f::Send "{Right}"
^n::Send "{Down}"
^p::Send "{Up}"
^a::Send "{Home}"
;^+a::Send "^a"
^e::Send "{End}"
^j::Send "{Enter}"
; ※ ^k は定義しない
#HotIf

