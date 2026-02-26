Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

irm get.scoop.sh | iex

scoop install git
scoop bucket add versions
scoop install steam
