$BasePath = "$env:USERPROFILE\Downloads"
$ZipPath = "$BasePath\Scoop-main.zip"

Invoke-WebRequest -Uri "https://github.com/ScoopInstaller/Scoop/archive/refs/heads/main.zip" -OutFile $ZipPath

if (Test-Path "$BasePath\Scoop-main") {
    Remove-Item "$BasePath\Scoop-main" -Recurse -Force
}

Expand-Archive $ZipPath -DestinationPath $BasePath -Force

Set-Location "$BasePath\Scoop-main"

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

irm get.scoop.sh | iex

scoop install git
scoop bucket add versions
scoop install steam