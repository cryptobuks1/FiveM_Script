Config = Config or {}

Config.Menus = {
    ['empty'] = {
        title = '',
        options = {},
    },
    ['main'] = {
        title = '',
        options = {
            {label = 'Tamir', img = 'img/icons/repair.png', price = 1000, onSelect = function() repairtVehicle(customVehicle) end},
            {label = 'Parçalar', img = 'img/icons/visual.png', openSubMenu = 'visual'},
            {label = 'Yükseltmeler', img = 'img/icons/upgrade.png', openSubMenu = 'upgrade'}
        },
        onBack = function() closeUI(1) end,
        defaultOption = 1
    },
        ['upgrade'] = {
            title = 'Yükseltmeler',
            options = {
                {label = 'Motor', img = 'img/icons/engine.png', modType = 11, priceMult = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
                {label = 'Fren', img = 'img/icons/brakes.png', modType = 12, priceMult = {0.0, 0.0, 0.0, 0.0, 0.0}},
                {label = 'Transmission', img = 'img/icons/transmission.png', modType = 13, priceMult = {0.0, 0.0, 0.0, 0.0, 0.0}},
                {label = 'Süspansiyon', img = 'img/icons/suspension.png', modType = 15, priceMult = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
                {label = 'Zırh', img = 'img/icons/armor.png', modType = 16, priceMult = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
                {label = 'Turbo', img = 'img/icons/engine.png', modType = 18, priceMult = {0.0, 0.0}},
            },
            onBack = function() updateMenu('main') end
        },
        ['visual'] = {
            title = 'Parçalar',
            options = {
                {label = 'Gövde Parçaları', img = 'img/icons/body.png', openSubMenu = 'body_parts'},
                {label = 'Araç İçi Parçalar', img = 'img/icons/body.png', openSubMenu = 'inside_parts'},
                {label = 'Boyama', img = 'img/icons/respray.png', openSubMenu = 'respray'},
                {label = 'Tekerlek', img = 'img/icons/wheel.png', openSubMenu = 'wheels', onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'wheel_lf', {x = -1.8, y = 0.0, z = 0.0}, {x = 0.0, y = 0.0, z = -20.0})
                end},
                {label = 'Plaka', img = 'img/icons/plate.png', openSubMenu = 'plate'},
                {label = 'Işık', img = 'img/icons/headlights.png', openSubMenu = 'lights'},
                {label = 'Çıkartma', img = 'img/icons/respray.png', openSubMenu = 'stickers'},
                {label = 'Ekstra', img = 'img/icons/plus.png', modType = 'extras', priceMult = 2.0},
                {label = 'Cam', img = 'img/icons/door.png', modType = 'windowTint', priceMult = 1.12, onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'window_lf', {x = -2.0, y = 0.0, z = 0.0}, {x = 0.0, y = 0.0, z = -10.0})
                end, onSubBack = function()
                    SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                end},
                {label = 'Korna', img = 'img/icons/horn.png', modType = 14, priceMult = 1.12},
                {label = 'İç', img = 'img/icons/body.png', modType = 27, priceMult = 6.98},
                {label = 'Plaket', img = '', modType = 35, priceMult = 4.19},
                {label = 'Hoparlör', img = 'img/icons/speaker.png', modType = 36, priceMult = 6.98},
                {label = 'Bagaj', img = 'img/icons/trunk.png', modType = 37, priceMult = 5.58, onSelect = function() openDoors(customVehicle, {0,0,0,0,0,1,1}) end},
                {label = 'Hidrolik', img = 'img/icons/hydrulics.png', modType = 38, priceMult = 5.12},
                {label = 'Motor Kapağı', img = 'img/icons/engine_block.png', modType = 39, priceMult = 5.12, onSelect = function() openDoors(customVehicle, {0,0,0,0,1,0,0}) end},
                {label = 'Hava Filtresi', img = 'img/icons/air_filter.png', modType = 40, priceMult = 3.72},
                {label = 'Struts', img = 'img/icons/suspension.png', modType = 41, priceMult = 6.51},
                {label = 'Benzin Deposu', img = 'img/icons/gas_tank.png', modType = 45, priceMult = 4.19},
            },
            onBack = function() updateMenu('main') end
        },
            ['body_parts'] = {
                title = 'Gövde Parçaları',
                options = {
                    {label = 'Spoiler', img = 'img/icons/spoiler.png', modType = 0, priceMult = 2.65},
                    {label = 'Ön Tampon', img = 'img/icons/bumper.png', modType = 1, priceMult = 2.12},
                    {label = 'Arka Tampon', img = 'img/icons/bumper.png', modType = 2, priceMult = 2.12, onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'bumper_r', {x = 0.0, y = -4.0, z = 1.5}, {x = -30.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Side Skirts', img = 'img/icons/bumper.png', modType = 3, priceMult = 2.65, onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'wheel_lf', {x = -2.5, y = 0.0, z = 0.0}, {x = 0.0, y = 0.0, z = -20.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Exhaust', img = 'img/icons/exhaust.png', modType = 4, priceMult = 2.12, onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'bumper_r', {x = 0.0, y = -4.0, z = 1.5}, {x = -30.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Cage', img = 'img/icons/body.png', modType = 5, priceMult = 2.12, onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'interiorlight', {x = 0.0, y = 1.0, z = -0.1}, {x = 0.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Izgara', img = '', modType = 6, priceMult = 2.72},
                    {label = 'Kaput', img = 'img/icons/hood.png', modType = 7, priceMult = 2.88},
                    {label = 'Sol Çamurluk', img = 'img/icons/bumper.png', modType = 8, priceMult = 2.12},
                    {label = 'Sağ Çamurluk', img = 'img/icons/bumper.png', modType = 9, priceMult = 2.12},
                    {label = 'Tavan', img = '', modType = 10, priceMult = 2.58},
                    {label = 'Kafes', img = 'img/icons/bumper.png', modType = 42, priceMult = 4.19},
                    {label = 'Anten', img = '', modType = 43, priceMult = 1.12},
                    {label = 'Kanat', img = 'img/icons/bumper.png', modType = 44, priceMult = 6.05},
                    {label = 'Cam', img = 'img/icons/door.png', modType = 46, priceMult = 1.0},
                },
                onBack = function() updateMenu('visual') end
            },
            ['inside_parts'] = {
                title = 'iç Parçalar',
                options = {
                    {label = 'Gösterge', img = 'img/icons/dashboard.png', modType = 29, priceMult = 4.65},
                    {label = 'Kadran', img = 'img/icons/dashboard.png', modType = 30, priceMult = 4.19},
                    {label = 'Kapı Hoparlörü', img = 'img/icons/speaker.png', modType = 31, priceMult = 5.58, onSelect = function() openDoors(customVehicle, {1,1,1,1,0,0,0}) end},
                    {label = 'Koltuk', img = 'img/icons/seat.png', modType = 32, priceMult = 4.65},
                    {label = 'Direksiyon', img = 'img/icons/steering_wheel.png', modType = 33, priceMult = 4.19},
                    {label = 'Vites', img = 'img/icons/shifter_leaver.png', modType = 34, priceMult = 3.26},
                    {label = 'Süsler', img = '', modType = 28, priceMult = 0.9},
                },
                onBack = function() updateMenu('visual') end
            },
            ['respray'] = {
                title = 'Boyama',
                options = {
                    {label = 'Brincil', img = 'img/icons/respray.png', modType = 'color1', customType = 'customColor', priceMult = 1.12, onSelect = function() openColorPicker('Primary Color', 'color1', true, 0.1) end},
                    {label = 'İkincil', img = 'img/icons/respray.png', modType = 'color2', customType = 'customColor', priceMult = 0.66, onSelect = function() openColorPicker('Secondary Color', 'color2', true, 0.5) end},
                    {label = 'Birincil Boyama Tipi', img = 'img/icons/respray.png', modType = 'paintType1', priceMult = 0.5},
                    {label = 'İkincil Boyama Tipi', img = 'img/icons/respray.png', modType = 'paintType2', priceMult = 0.5},
                    {label = 'Sedef', img = 'img/icons/respray.png', modType = 'pearlescentColor', customType = 'color', priceMult = 0.88, onSelect = function() openColorPicker('Pearlescent Color', 'pearlescentColor', false, 0.5) end},
                },
                onBack = function() updateMenu('visual') end
            },
            ['wheels'] = {
                title = 'Teker',
                options = {
                    {label = 'Tekerlek Tipi', img = 'img/icons/wheel.png', onSelect = function() updateMenu('wheels_type') end},
                    {label = 'Tekerlek Rengi', img = 'img/icons/respray.png', modType = 'wheelColor', customType = 'color', priceMult = 0.66, onSelect = function() openColorPicker('Wheels Color', 'wheelColor', false, 0.5) end},
                    {label = 'Tekerlek Dumanı', img = 'img/icons/respray.png', modType = 'tyreSmokeColor', customType = 'customColor', priceMult = 1.12, onSelect = function() openColorPicker('Tyre Smoke Color', 'tyreSmokeColor', true, 0.5) end},
                },
                onBack = function() updateMenu('visual') SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true) end
            },
                ['wheels_type'] = {
                    title = 'Tekerlek Tipi',
                    options = {
                        {label = 'Sport', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 0) end},
                        {label = 'Muscle ', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 1) end},
                        {label = 'Lowrider', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 2) end},
                        {label = 'SUV', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 3) end},
                        {label = 'Offroad', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 4) end},
                        {label = 'Tuner', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 5) end},
                        {label = 'Bike Wheels', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 6) end},
                        {label = 'High End', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 7) end},
                    },
                    onBack = function() updateMenu('wheels') end
                },
            ['plate'] = {
                title = 'Plaka',
                options = {
                    {label = 'Tür', img = 'img/icons/plate.png', modType = 25, priceMult = 1.1},
                    {label = 'Renk', img = 'img/icons/respray.png', modType = 'plateIndex', priceMult = 1.1, onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'bumper_r', {x = -2.0, y = -2.0, z = 1.5}, {x = -30.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Tutacak', img = 'img/icons/bumper.png', modType = 26, priceMult = 3.49},
                },
                onBack = function() updateMenu('visual') end
            },
            ['lights'] = {
                title = 'Işık',
                options = {
                    {label = 'Xenon', img = 'img/icons/headlights.png', modType = 'modXenon', priceMult = 0.1, onSelect = function() SetVehicleEngineOn(customVehicle, true, false, false) end},
                    {label = 'Neon', img = 'img/icons/headlights.png', modType = 'neonColor', customType = 'customColor', priceMult = 1.12, onSelect = function() SetVehicleEngineOn(customVehicle, true, false, false) openColorPicker('Neon Color', 'neonColor', true, 0.5) end},
                },
                onBack = function() updateMenu('visual') end
            },
            ['stickers'] = {
                title = 'Çıkartma',
                options = {
                    {label = 'Çıkartma', img = 'img/icons/respray.png', modType = 48, priceMult = 6.0},
                    {label = 'Kaplama', img = 'img/icons/respray.png', modType = 'livery', priceMult = 6.0},
                },
                onBack = function() updateMenu('visual') end
            },
}