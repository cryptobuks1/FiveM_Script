-- This resource is part of the default Cfx.re asset pack (cfx-server-data)
-- Altering or recreating for local use only is strongly discouraged.

version '1.0.0'
author 'Jay Jungdung'
description 'Supermarket in the city'

client_scripts {
    '@es_extended/locale.lua',
    'client.lua',
}

server_scripts{
    '@es_extended/locale.lua',
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js',
    'html/img/bread.png',
    'html/img/money.png',
    'html/img/water.png',
}

fx_version 'cerulean'

dependency 'es_extended'

game 'gta5'