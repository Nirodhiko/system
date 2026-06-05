  ; variables
HOME := "C:\Users\tiany"

; Tap Caps Lock = Escape, Hold Caps Lock = Control
*CapsLock:: {
  global capsDownTime := A_TickCount
  Send("{Ctrl down}")
}
*CapsLock Up:: {
  global capsDownTime
  Send("{Ctrl up}")
  if (A_TickCount - capsDownTime < 200)   ; 200ms threshold – adjust to taste
    Send("{Escape}")
}

  ; task manager
#m::
  {
    Run "taskmgr"
  }

  ; close process
#space::
  {
    send "!{f4}"
  }

  ; window manage
#;::
  {
    send "#d" ; toggle desktop
  }
#'::
  {
    Send("#{Down}") ; minimize window
  }
#"::
  {
    Send("#{Up}") ; restore  window
  }

  ; toggle full screen
#f::
  {
    send "{f11}"
  }

  ; file explorer
#e::
  {
    Run "explorer"
  }

  ; terminal
#Enter::
  {
    if !WinExist("ahk_exe alacritty.exe") {
      Run '"C:\Program Files\Alacritty\alacritty.exe" -e wsl.exe --cd ~'
      Sleep 1000
    }
    WinActivate("ahk_exe alacritty.exe")
  }

  ; zed
#z::
  {
    if !WinExist("ahk_exe Zed.exe") {
      Run HOME . "\AppData\Local\Programs\Zed\Zed.exe"
      Sleep 3000
    }
    WinActivate("ahk_exe Zed.exe")
  }

  ; chrome
#g::
  {
    if !WinExist("ahk_exe chrome.exe") {
      Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
      Sleep 4000
    }
    WinActivate("ahk_exe chrome.exe")
  }

  ; typora
#t::
  {
    if !WinExist("ahk_exe Typora.exe") {
      Run "C:\Program Files\Typora\Typora.exe"
      Sleep 2000
    }
    WinActivate("ahk_exe Typora.exe")
  }

  ; wps
#w::
  {
    if !WinExist("ahk_exe wps.exe") {
      Run HOME . "\AppData\Local\Kingsoft\WPS Office\ksolaunch.exe"
      Sleep 2000
    }
    WinActivate("ahk_exe wps.exe")
  }

  ; Neat reader
#n::
  {
    if !WinExist("ahk_exe NeatReader.exe") {
      Run "C:\Program Files (x86)\NeatReader\NeatReader.exe"
      Sleep 4000
    }
    WinActivate("ahk_exe NeatReader.exe")
  }

  ; video editor
#v::
  {
    if !WinExist("ahk_exe shotcut.exe") {
      Run "C:\Program Files\Shotcut\shotcut.exe"
      Sleep 4000
    }
    WinActivate("ahk_exe shotcut.exe")
  }

  ; obs
#o::
  {
    if !WinExist("ahk_exe obs64.exe") {
      Run "C:\Program Files\obs-studio\bin\64bit\obs64.exe"
      Sleep 3000
    }
    WinActivate("ahk_exe obs64.exe")
  }

  ; inkscape
#i::
  {
    if !WinExist("ahk_exe inkscape.exe") {
      Run "C:\Program Files\Inkscape\bin\inkscape.exe"
      Sleep 3000
    }
    WinActivate("ahk_exe inkscape.exe")
  }

  ; GoldenDict
#d::
  {
    if !WinExist("ahk_exe GoldenDict.exe") {
      Run "C:\Dictionary\GoldenDict-ng-26.2.0-Qt6.6.3\goldendict.exe"
      Sleep 3000
    }
    WinActivate("ahk_exe GoldenDict.exe")
  }

  ; wireguard
Wireguard := HOME . "\Documents\client.conf"
#PgUp::
  {
    Run "*RunAs wireguard.exe /installtunnelservice " . Wireguard
  }

#PgDn::
  {
    Run "*RunAs wireguard.exe /uninstalltunnelservice client"
  }
