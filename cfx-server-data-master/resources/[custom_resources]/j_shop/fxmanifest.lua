fx_version 'bodacious'

game 'gta5'

description 'ESX Supermarket'

version '1.0.1'

files {
	'html/ui.html',
	'html/styles.css',
	'html/reset.css',
	'html/scripts.js',
	'html/debounce.min.js',
	'html/iransans.otf',
	-- default
	'html/img/default.png',
	'html/img/bread.png',
	'html/img/close.png',
	'html/img/croquettes.png',
	'html/img/water.png',
	'html/img/plus.png',
	'html/img/minus.png',
	'html/img/green_phone.png',
	'html/img/white_phone.png',
	'html/img/yellow_phone.png'
}

ui_page 'html/ui.html'

client_scripts {
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/fa.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/fa.lua',
	'config.lua',
	'server/main.lua'
}

dependency 'es_extended'
