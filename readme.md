## Uninstall Xbox
  - `Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage` Run this command on PowerShell as administrator.

## Set Autohotkey as a Startup App.
  - https://windowsloop.com/delay-startup-programs-with-task-scheduler/

## Find the App Path That Installed by Microsoft Store.
  - Get-AppxPackage *xodo*
  
## 
  - Install app: `winget import -i app`.
  - Uninstall widget: `winget uninstall MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy`.

## Rime
  - https://rime.im
  
## Magic Touchpad
  - https://github.com/imbushuo/mac-precision-touchpad

## Ssh
  - Generate ssh key `ssh-keygen -t ed25519 -C "example@outlook.com"`.
  - [add to github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

## Node
  - pnpm
    ```
    run `pnpm setup` after install pnpm with winget.
    add 'C:\Users\buddh\AppData\Local\pnpm' to user path.
    ```

## Windows Terminal
```
  "commandline": "%SystemRoot%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -nologo",
  "font": 
  {
      "cellHeight": "1.6",
      "face": "JetBrainsMono Nerd Font",
      "size": 14.0
  },
  "padding": "0",
  "scrollbarState": "hidden",
  "useAtlasEngine": false
```