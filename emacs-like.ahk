#Requires AutoHotkey v2.0
#SingleInstance Force

; 前提: PowerToys Keyboard Manager で「Caps Lock → F14」にリマップ済み
; AHK側では CapsLock を一切見ず、F14 だけを扱う。

capsWasUsedWithShift := false

;; =========================
;; Shift + F14 を明示的に無効化
;; Google日本語入力の かな/カナ変換 対策
;; =========================

<+F14::
{
    global capsWasUsedWithShift
    capsWasUsedWithShift := true
    return
}

>+F14::
{
    global capsWasUsedWithShift
    capsWasUsedWithShift := true
    return
}

<+F14 Up::
{
    global capsWasUsedWithShift
    capsWasUsedWithShift := true
    return
}

>+F14 Up::
{
    global capsWasUsedWithShift
    capsWasUsedWithShift := true
    return
}

;; 念のため通常の Shift + F14 も殺す
*+F14::
{
    global capsWasUsedWithShift
    capsWasUsedWithShift := true
    return
}

*+F14 Up::
{
    global capsWasUsedWithShift
    capsWasUsedWithShift := true
    return
}

;; =========================
;; F14単押し => IME OFF
;; =========================

*F14 Up::
{
    global capsWasUsedWithShift


    ; Shift + F14 の直後なら何もしない
    if (capsWasUsedWithShift) {
        capsWasUsedWithShift := false
        return
    }

    ; F14単押しのときだけ IME OFF
    if (A_PriorKey = "F14") {
        Send "{vk1Dsc07B}"
    }
}


;; =========================
;; ファイル起動ショートカット
;; =========================
^!a::Run "C:\portable_soft\penta-path-convert\penta_path_convert.bat"
^!b::Run "bthprops.cpl"
^!c::Run ('"C:\Program Files\Google\Chrome\Application\chrome_proxy.exe" --profile-directory=Default --app-id=jckaldkomadaenmmgladeopgmfbahfjm')
^!d::Run "C:\portable_soft\call302\CloseALL.exe"
^!e::{
    RunWait 'taskkill /F /IM ms-teams.exe', , "Hide"
    RunWait 'taskkill /F /IM Teams.exe', , "Hide"
    RunWait 'taskkill /F /IM TeamsWebView.exe', , "Hide"
}
$^!h::{
    Run '"C:\Program Files (x86)\Vim\vim82\gvim.exe" "C:\Windows\System32\drivers\etc\hosts"'
}
^!g::Run "https://docs.google.com/spreadsheets/d/1Cd48kVgP-xjf-o_OmtMkmpcTnkPNqXpGgmyOav-AO2E/edit#gid=204609307"
^!j::Run "C:\job"
^!l::{
  RunWait "C:\portable_soft\call302\CloseALL.exe"
  Run "C:\portable_soft\launcher\launcher.bat"
}
^!m::Run "C:\job\LM_.xmind"
^!n::Run ('"C:\Program Files\Google\Chrome\Application\chrome_proxy.exe" --profile-directory=Default --app-id=fcpohfnckgkeokplbfekfjgngnegfnhk')
^!s::
{
    Run '"C:\Program Files\Google\Chrome\Application\chrome.exe" --app="https://docs.google.com/document/d/1OdAN4fTm8zif2cW4IEoIMumgxq9doL5yosnrldjSalA/edit?tab=t.0"'
}
^!t::Run "C:\Users\bpc_m\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\クロック - ショートカット.lnk"
^!r::Run "C:\Users\bpc_m\OneDrive\Documents\reuse.md"
^!i::Run "C:\job\isms"
^!v::{
    if WinExist("ahk_exe gvim.exe") {
        WinActivate
    } else {
        Run '"C:\Program Files (x86)\Vim\vim82\gvim.exe" --servername GVIM'
        WinWait "ahk_exe gvim.exe", , 5
        if WinExist("ahk_exe gvim.exe") {
            WinActivate
        }
    }
}
^!y::Run ('"C:\Program Files (x86)\Vim\vim82\gvim.exe" "C:\job\bitpark\yotei\yotei.md"')
;;;;;^!v::
; --- F14 layer ---
F14 & c::
{
    target := "ChatGPT ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe"

    if WinExist(target) {
        WinActivate target
    } else {
        Run '"C:\Program Files\Google\Chrome\Application\chrome_proxy.exe" --profile-directory=Default --app-id=jckaldkomadaenmmgladeopgmfbahfjm'
    }
}
;F14 & e::{
;    RunWait 'taskkill /F /IM ms-teams.exe', , "Hide"
;    RunWait 'taskkill /F /IM Teams.exe', , "Hide"
;    RunWait 'taskkill /F /IM TeamsWebView.exe', , "Hide"
;}
F14 & r::Run('"C:\Program Files (x86)\Vim\vim82\gvim.exe" "C:\Users\bpc_m\OneDrive\Documents\reuse.md"')
F14 & v::
{
    if WinExist("ahk_exe gvim.exe") {
        WinActivate
    } else {
        Run('"C:\Program Files (x86)\Vim\vim82\gvim.exe" --servername GVIM')
    }
}

;;emacs like↓↓↓
;F14 & a::Send "{Home}"
;F14 & b::Send "{Left}"
;F14 & d::Send "{Delete}"
;F14 & e::Send "{End}"
;F14 & f::Send "{Right}"
;F14 & h::Send "{Backspace}"
;F14 & i::Send "{F2}"
;F14 & j::Send "{Enter}"
;F14 & k::
;{
;    Send "+{End}"
;    Send "{Delete}"
;}
;F14 & n::Send "{Down}"
;F14 & p::Send "{Up}"
;;emacs like↑↑↑







; ------------------------------------------------------------
; F14 Vim-like layer
; ------------------------------------------------------------

; 左右上下
F14 & h::
{
    Send "{Left}"
}

F14 & j::
{
    Send "{Down}"
}

F14 & k::
{
    Send "{Up}"
}

F14 & l::
{
    Send "{Right}"
}

; 単語移動
F14 & w::
{
    Send "^{Right}"
}
F14 & e::
{
    Send "^{Right}"
}

F14 & b::
{
    Send "^{Left}"
}

; 行頭・行末
F14 & i::
{
    Send "{F2}"
    Send "^{Home}"
}

F14 & a::
{
    Send "{F2}"
    Send "^{End}"
}

; ページ移動
F14 & u::
{
    Send "{PgUp}"
}

F14 & f::
{
    Send "{PgDn}"
}

; 文書先頭・末尾
F14 & 0::
{
    Send "{Home}"
}

F14 & 4::
{
    Send "{End}"
}

; Backspace / Delete
F14 & x::
{
    Send "{Delete}"
}

F14 & d::
{
    Send "+{End}"
    Send "{Delete}"
}

; Enter / Escape
F14 & m::
{
    Send "{Enter}"
}

F14 & [::
{
    Send "{Esc}"
}

F14 & q::
{
  Send "^{w}"
}

; ------------------------------------------------------------
; Vim Like 選択移動: F14 + Shift + hjkl / etc
; ------------------------------------------------------------

#HotIf GetKeyState("F14", "P") && GetKeyState("Shift", "P")

h::
{
    Send "+{Left}"
}

j::
{
    Send "+{Down}"
}

k::
{
    Send "+{Up}"
}

l::
{
    Send "+{Right}"
}

w::
{
    Send "+^{Right}"
}

b::
{
    Send "+^{Left}"
}

a::
{
    Send "+{Home}"
}

e::
{
    Send "+{End}"
}

u::
{
    Send "+{PgUp}"
}

d::
{
    Send "+{PgDn}"
}

g::
{
    Send "+^{End}"
}

[::
{
    Send "+^{Home}"
}

#HotIf










F14 & s::Run '"C:\Windows\System32\scrnsave.scr" /s'
F14 & t::Run "C:\job\tmp"



;; =========================
;; マウスカーソルを別モニタの中心に移動させるショートカットキー
;; =========================
#!v:: {
    monitorCount := MonitorGetCount()
    if (monitorCount < 2)
        return

    MouseGetPos &x, &y

    ; モニタ1情報
    MonitorGet 1, &l1, &t1, &r1, &b1
    ; モニタ2情報
    MonitorGet 2, &l2, &t2, &r2, &b2

    ; 今いるモニタをY座標で判定（上下配置想定）
    if (y >= t1 && y <= b1) {
        newX := (l2 + r2) // 2

    } else {
        newX := (l1 + r1) // 2
        newY := (t1 + b1) // 2
    }

    MouseMove newX, newY, 0
}

;; =========================
;; 日付 yy-MM-dd_
;; =========================
::;h:: {
    SendText FormatTime(A_Now, "yy-MM-dd_")
}


;; =========================
;; ファイル名を指定して実行
;; =========================
#HotIf WinActive("ahk_class #32770")
^h::Send "{Backspace}"
^d::Send "{Delete}"
^b::Send "{Left}"
^f::Send "{Right}"
^n::Send "{Down}"
^p::Send "{Up}"
^a::{
    static threshold := 250  ; 2連打判定(ms)
    if (A_PriorHotkey = "^a" && A_TimeSincePriorHotkey < threshold) {
        Send "^a"            ; 2回目：全選択
    } else {
        Send "{Home}"        ; 1回目：Home（現状維持）
    }
}
^+a::Send "^a"           ; 全選択
^e::Send "{End}"
^j::Send "{Enter}"

^k::
{
    Send "+{End}"
    Send "{Delete}"
}
return
#HotIf







; =========================
; Chrome
; =========================
#HotIf WinActive("ahk_exe chrome.exe")
;;;^h::Send "{Backspace}"
;;;^d::Send "{Delete}"
;;;^b::Send "{Left}"
;;;^f::Send "{Right}"
;;;^n::Send "{Down}"
;;;^p::Send "{Up}"
;;;
;;;^a::{
;;;    static threshold := 250  ; 2連打判定(ms)
;;;    if (A_PriorHotkey = "^a" && A_TimeSincePriorHotkey < threshold) {
;;;        Send "^a"            ; 2回目：全選択
;;;    } else {
;;;        Send "{Home}"        ; 1回目：Home（現状維持）
;;;    }
;;;}
;;;
;;;^+a::Send "^a"           ; 全選択
;;;^e::Send "{End}"
;;;^j::Send "{Enter}"        ; あなたの設定に合わせて Down
;;;^k::{
;;;    Send "+{End}"
;;;    Send "{Delete}"
;;;}

::;s:: {
    Send "webtest"
    Send "{Tab}"
    Send "sw1ngPass"
    Send "{Enter}"
}

#HotIf

;;;; =========================
;;;; XMind（Ctrl+K は未定義＝アプリ既定に任せる）
;;;; =========================
;;;#HotIf WinActive("ahk_exe Xmind.exe")
;;;^h::Send "{Backspace}"
;;;^d::Send "{Delete}"
;;;^b::Send "{Left}"
;;;;^f::Send "{Right}"    ; ctrl+f でしか検索できんので
;;;^n::Send "{Down}"
;;;^p::Send "{Up}"
;;;^a::{
;;;    static threshold := 250  ; 2連打判定(ms)
;;;    if (A_PriorHotkey = "^a" && A_TimeSincePriorHotkey < threshold) {
;;;        Send "^a"            ; 2回目：全選択
;;;    } else {
;;;        Send "{Home}"        ; 1回目：Home（現状維持）
;;;    }
;;;}
;;;^e::Send "{End}"
;;;^j::Send "{Enter}"
;;;^k::{
;;;    Send "+{End}"
;;;    Send "{Delete}"
;;;}
;;;#HotIf

; =========================
; XMind 有料広告ポップアップ
; =========================
#HotIf WinActive("Xmind ahk_exe Xmind.exe")
q::Send "!{F4}"
x::Send "!{F4}"
d::Send "!{F4}"
#HotIf

; =========================
; Teams（Ctrl+J 送信）
; =========================
#HotIf WinActive("ahk_exe ms-teams.exe") || WinActive("ahk_class TeamsWebView") ||  WinActive("ahk_exe ChatGPT.exe")
;;;^h::Send "{Backspace}"
;;;^d::Send "{Delete}"
;;;^b::Send "{Left}"
;;;^f::Send "{Right}"
;;;^n::Send "{Down}"
;;;^p::Send "{Up}"
;;;^a::{
;;;    static threshold := 250  ; 2連打判定(ms)
;;;    if (A_PriorHotkey = "^a" && A_TimeSincePriorHotkey < threshold) {
;;;        Send "^a"            ; 2回目：全選択
;;;    } else {
;;;        Send "{Home}"        ; 1回目：Home（現状維持）
;;;    }
;;;}
;;;^+a::Send "^a"
;;;^e::Send "{End}"
;;;^j::Send "{Enter}"
;;;^k::{
;;;    Send "+{End}"
;;;    Send "{Delete}"
;;;}

::;s::
{
    SendText ":wfh:"
    Sleep 100

    ; Teamsに絵文字変換させるためのスペース
    SendEvent "{Space}"
    Sleep 250

    ; 絵文字後に残ったスペースを消す
    SendEvent "{Backspace}"
    Sleep 50

    SendText "作業開始します"
    SendEvent "{Enter}"
}

::;e::
{
    SendText ":endarrow:"
    Sleep 100

    ; Teamsに絵文字変換させるためのスペース
    SendEvent "{Space}"
    Sleep 250

    ; 絵文字後に残ったスペースを消す
    SendEvent "{Backspace}"
    Sleep 50

    SendText "作業終了します"
    SendEvent "{Enter}"
}
#HotIf

;;;; =========================
;;;; Perplexity（Ctrl+J 送信）
;;;; =========================
;;;#HotIf WinActive("ahk_exe Perplexity.exe")
;;;^h::Send "{Backspace}"
;;;^d::Send "{Delete}"
;;;^b::Send "{Left}"
;;;^f::Send "{Right}"
;;;^n::Send "{Down}"
;;;^p::Send "{Up}" 
;;;^+a::Send "^a"
;;;^a::{
;;;    static threshold := 250  ; 2連打判定(ms)
;;;    if (A_PriorHotkey = "^a" && A_TimeSincePriorHotkey < threshold) {
;;;        Send "^a"            ; 2回目：全選択
;;;    } else {
;;;        Send "{Home}"        ; 1回目：Home（現状維持）
;;;    }
;;;}
;;;^e::Send "{End}"
;;;;^j::Send "+{Enter}"     ; 改行
;;;^j::Send "{Enter}"
;;;;Enter::Send "+{Enter}"
;;;^k::{
;;;    Send "+{End}"
;;;    Send "{Delete}"
;;;}
;;;#HotIf

;;;; =========================
;;;; LINE
;;;; =========================
;;;#HotIf WinActive("ahk_exe LINE.exe")
;;;^h::Send "{Backspace}"
;;;^d::Send "{Delete}"
;;;^b::Send "{Left}"
;;;^f::Send "{Right}"
;;;^n::Send "{Down}"
;;;^p::Send "{Up}"
;;;^a::{
;;;    static threshold := 250  ; 2連打判定(ms)
;;;    if (A_PriorHotkey = "^a" && A_TimeSincePriorHotkey < threshold) {
;;;        Send "^a"            ; 2回目：全選択
;;;    } else {
;;;        Send "{Home}"        ; 1回目：Home（現状維持）
;;;    }
;;;}
;;;^+a::Send "^a"
;;;^e::Send "{End}"
;;;;^j::Send "+{Enter}"     ; 改行
;;;^j::Send "{Enter}"
;;;;Enter::Send "+{Enter}"  ; 変換の確定ができない
;;;^k::{
;;;    Send "+{End}"
;;;    Send "{Delete}"
;;;}
;;;#HotIf

;;;; =========================
;;;; Windows Terminal
;;;; 
;;;; =========================
;;;#HotIf WinActive("ahk_exe WindowsTerminal.exe")
;;;^h::Send "{Backspace}"
;;;;^d::Send "{Delete}"  ; vimと競合
;;;;^b::Send "{Left}"  ; vimと競合
;;;;^f::Send "{Right}"  ; vimと競合
;;;^n::Send "{Down}"
;;;^p::Send "{Up}"
;;;^a::Send "{Home}"
;;;;^+a::Send "^a"
;;;;^e::Send "{End}"  ; vimと競合
;;;;^j::Send "{Enter}"   ; tmuxでのCTRL+Jに干渉してまう。。
;;;; ※ ^k は定義しない
;;;#HotIf
