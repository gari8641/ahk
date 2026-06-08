#Requires AutoHotkey v2.0
#SingleInstance Force

;; =========================
;; ファイル起動ショートカット
;; =========================
^!a::Run "C:\portable_soft\penta-path-convert\penta_path_convert.bat"
^!b::Run "bthprops.cpl"
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
^!l::Run "C:\portable_soft\launcher\launcher.bat"
^!m::Run "C:\job\LM_.xmind"
^!n::Run ('"C:\Program Files\Google\Chrome\Application\chrome_proxy.exe" --profile-directory=Default --app-id=fcpohfnckgkeokplbfekfjgngnegfnhk')
^!s::
{
    Run '"C:\Program Files\Google\Chrome\Application\chrome.exe" --app="https://docs.google.com/document/d/1OdAN4fTm8zif2cW4IEoIMumgxq9doL5yosnrldjSalA/edit?tab=t.0"'
}
^!t::Run "C:\Users\bpc_m\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\クロック - ショートカット.lnk"
^!r::Run "C:\Users\bpc_m\OneDrive\Documents\reuse.md"
^!i::Run "C:\job\tmp\isms\2026src"
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
; --- CapsLock layer ---
CapsLock & c::Run ('"C:\Program Files\Google\Chrome\Application\chrome_proxy.exe" --profile-directory=Default --app-id=jckaldkomadaenmmgladeopgmfbahfjm')
;CapsLock & e::{
;    RunWait 'taskkill /F /IM ms-teams.exe', , "Hide"
;    RunWait 'taskkill /F /IM Teams.exe', , "Hide"
;    RunWait 'taskkill /F /IM TeamsWebView.exe', , "Hide"
;}
CapsLock & r::Run('"C:\Program Files (x86)\Vim\vim82\gvim.exe" "C:\Users\bpc_m\OneDrive\Documents\reuse.md"')
CapsLock & v::
{
    if WinExist("ahk_exe gvim.exe") {
        WinActivate
    } else {
        Run('"C:\Program Files (x86)\Vim\vim82\gvim.exe" --servername GVIM')
    }
}


CapsLock & a::Send "{Home}"
CapsLock & b::Send "{Left}"
CapsLock & d::Send "{Delete}"
CapsLock & e::Send "{End}"
CapsLock & f::Send "{Right}"
CapsLock & h::Send "{Backspace}"
CapsLock & k::
{
    Send "+{End}"
    Send "{Delete}"
}
CapsLock & n::Send "{Down}"
CapsLock & p::Send "{Up}"
CapsLock & s::Run '"C:\Windows\System32\scrnsave.scr" /s'
CapsLock & t::Run "C:\job\tmp"

;; =========================
;; CapsLockをIME OFFに割り当てる
;; =========================
#Requires AutoHotkey v2.0
SetCapsLockState "AlwaysOff"

*CapsLock::
{
    SetCapsLockState "AlwaysOff"
    Send "{Blind}{vk1Dsc07B}"
}


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
        newY := (t2 + b2) // 2
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
^j::Send "{Enter}"        ; あなたの設定に合わせて Down
^k::{
    Send "+{End}"
    Send "{Delete}"
}

::;s:: {
    Send "webtest"
    Send "{Tab}"
    Send "sw1ngPass"
    Send "{Enter}"
}

#HotIf

; =========================
; XMind（Ctrl+K は未定義＝アプリ既定に任せる）
; =========================
#HotIf WinActive("ahk_exe Xmind.exe")
^h::Send "{Backspace}"
^d::Send "{Delete}"
^b::Send "{Left}"
;^f::Send "{Right}"    ; ctrl+f でしか検索できんので
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
^e::Send "{End}"
^j::Send "{Enter}"
^k::{
    Send "+{End}"
    Send "{Delete}"
}
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
; Teams（Ctrl+J 送信）
; =========================
#HotIf WinActive("ahk_exe ms-teams.exe") || WinActive("ahk_class TeamsWebView") ||  WinActive("ahk_exe ChatGPT.exe")
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
^+a::Send "^a"
^e::Send "{End}"
^j::Send "{Enter}"
^k::{
    Send "+{End}"
    Send "{Delete}"
}
::;s:: {
    Send ":wfh:作業開始します"
    Loop 7
        Send "{Left}"
    Send " "
    Send " "
    Send "{Backspace}"
    Send "{Backspace}"
    Send "{Enter}"
}

::;e:: {
    Send ":endarrow:作業終了します"
    Loop 7
        Send "{Left}"
    Send " "
    Send " "
    Send "{Backspace}"
    Send "{Backspace}"
    Send "{Enter}"
}
#HotIf

; =========================
; Perplexity（Ctrl+J 送信）
; =========================
#HotIf WinActive("ahk_exe Perplexity.exe")
^h::Send "{Backspace}"
^d::Send "{Delete}"
^b::Send "{Left}"
^f::Send "{Right}"
^n::Send "{Down}"
^p::Send "{Up}" 
^+a::Send "^a"
^a::{
    static threshold := 250  ; 2連打判定(ms)
    if (A_PriorHotkey = "^a" && A_TimeSincePriorHotkey < threshold) {
        Send "^a"            ; 2回目：全選択
    } else {
        Send "{Home}"        ; 1回目：Home（現状維持）
    }
}
^e::Send "{End}"
;^j::Send "+{Enter}"     ; 改行
^j::Send "{Enter}"
;Enter::Send "+{Enter}"
^k::{
    Send "+{End}"
    Send "{Delete}"
}
#HotIf

; =========================
; LINE
; =========================
#HotIf WinActive("ahk_exe LINE.exe")
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
^+a::Send "^a"
^e::Send "{End}"
;^j::Send "+{Enter}"     ; 改行
^j::Send "{Enter}"
;Enter::Send "+{Enter}"  ; 変換の確定ができない
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
;^d::Send "{Delete}"  ; vimと競合
;^b::Send "{Left}"  ; vimと競合
;^f::Send "{Right}"  ; vimと競合
^n::Send "{Down}"
^p::Send "{Up}"
^a::Send "{Home}"
;^+a::Send "^a"
;^e::Send "{End}"  ; vimと競合
;^j::Send "{Enter}"   ; tmuxでのCTRL+Jに干渉してまう。。
; ※ ^k は定義しない
#HotIf

