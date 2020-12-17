fx_version 'bodacious'
game 'gta5'
description 'Mafia pack by sogolisica | edited, fixed and tweaked by sync'

version '1.0.0'

shared_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua'
} 

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}

client_script 'client/main.lua'

dependency 'sync_utils'