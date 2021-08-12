-- This resource is part of the default Cfx.re asset pack (cfx-server-data)
-- Altering or recreating for local use only is strongly discouraged.

version '1.0.0'
author 'Jay Jungdung'
description 'Supermarket in the city'

client_scripts {
    '@es_extended/locale.lua',
    'client/client.lua',
}

server_scripts{
    '@es_extended/locale.lua',
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/test.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js',
    'html/jquery-ui.js',
    'html/jquery-1.12.4.js',
    'html/jquery-ui.css',
    'html/bootstrap.min.css',
    'html/img/bread.png',
    'html/img/money.png',
    'html/img/water.png',
    'html/img/yellow_phone.png',
    'html/img/white_phone.png',
    'html/img/green_phone.png',
}

fx_version 'cerulean'

dependency 'es_extended'

game 'gta5'