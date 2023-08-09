#region scoop
# enable completion in current shell, use absolute path because PowerShell Core not respect $env:PSModulePath
Import-Module "$($(Get-Item $(Get-Command scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"
# Fast scoop search
Invoke-Expression (&scoop-search --hook)
#endregion

#region mamba initialize
# !! Contents within this block are managed by 'mamba shell init' !!
$Env:MAMBA_ROOT_PREFIX = "C:\Users\wuli\scoop\persist\micromamba\mamba"
$Env:MAMBA_EXE = "C:\Users\wuli\scoop\apps\micromamba\current\micromamba.exe"
(& $Env:MAMBA_EXE 'shell' 'hook' -s 'powershell' -p $Env:MAMBA_ROOT_PREFIX) | Out-String | Invoke-Expression
#endregion

# PSReadline
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key "Ctrl+p" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "Ctrl+n" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key 'Ctrl+d' -Function DeleteCharOrExit
Set-PSReadLineOption -PredictionSource History

# Colorlize
Import-Module Get-ChildItemColor
Import-Module posh-git
Invoke-Expression (oh-my-posh init pwsh --config ~/gitRepo/dotfiles/pwsh_theme.omp.json)
colortool -q OneHalfDark.itermcolors

# gsudo
Import-Module (Get-Command 'gsudoModule.psd1').Source

# Autojump
Invoke-Expression ($(lua "C:\Users\wuli\scoop\apps\z.lua\current\z.lua" --init powershell enhanced once echo) -join "`n")

# Env
$env:JULIA_PKG_SERVER = 'https://mirrors.tuna.tsinghua.edu.cn/julia'

# Alias
Set-Alias 'sudo' 'gsudo'
Set-Alias 'mamba' 'micromamba'
Function which {
	Get-Command -All $args
}
Function prc {
	code "C:\Users\XueHa\Documents\Powershell\profile.ps1"
}
Function ytdl {
	yt-dlp --downloader aria2c --proxy http://127.0.0.1:8128/ $args
}
