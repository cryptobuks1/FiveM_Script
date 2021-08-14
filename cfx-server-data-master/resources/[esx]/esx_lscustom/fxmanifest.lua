fx_version 'adamant'
game 'gta5'
ui_page 'html/index.html'

files {
	'html/index.html',
	-- css
	'html/style.css',
	--js
	'html/script.js',
	--fonts
	'html/*ttf',
	-- Ikony
	'html/*.png',
	'html/img/*.png',
	'html/img/*.svg',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/server.lua'
}

client_scripts {
	'config.lua',
	'client/*.lua'
}