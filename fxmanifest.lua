fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

name 'qr-goldpanning'
description 'Gold Panning Script for RedM QRCore'
author 'QRCore Maintainers'
version '1.0.0'

server_scripts { 'server/main.lua' }
client_scripts { 'client/main.lua' }
shared_scripts { '@ox_lib/init.lua', 'config.lua' }
