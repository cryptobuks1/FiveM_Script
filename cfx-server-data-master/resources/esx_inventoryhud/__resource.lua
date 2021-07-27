resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description "ESX Inventory HUD"

version "1.1"

ui_page "html/ui.html"

client_scripts {
  "@es_extended/locale.lua",
  "client/main.lua",
  "client/vault.lua",
  "client/trunk.lua",
  "client/property.lua",
  "client/player.lua",
  "locales/cs.lua",
  "locales/en.lua",
  "locales/fr.lua",
  "config.lua"
}

server_scripts {
  "@es_extended/locale.lua",
  "server/main.lua",
  "locales/cs.lua",
  "locales/en.lua",
  "locales/fr.lua",
  "config.lua"
}

files {
  "html/ui.html",
  "html/css/ui.css",
  "html/css/jquery-ui.css",
  "html/js/inventory.js",
  "html/js/config.js",
  "html/sweetalert/dist/sweetalert2.all.min.js",
  "html/sweetalert/dist/sweetalert2.min.js",
  "html/sweetalert/dist/sweetalert2.min.css",
  -- JS LOCALES
  "html/locales/cs.js",
  "html/locales/en.js",
  "html/locales/fr.js",
  -- IMAGES
  "html/img/bullet.png",
  "html/img/logo.png",
  -- ICONS
	'html/img/items/lsrp_stone.png',
	'html/img/items/stone_color.png',
	'html/img/items/lsrp_gold.png',
	'html/img/items/lsrp_steel.png',
	'html/img/items/lsrp_copper.png',
	'html/img/items/lsrp_diamond.png',
	'html/img/items/rock_excavator.png',

	'html/img/items/lsrp_pumpkin.png',
	'html/img/items/fried_pumpkin.png',
	'html/img/items/pumpkin_shovel.png',

	'html/img/items/lsrp_cabbage.png',
	'html/img/items/lsrp_sauerkraut.png',
	'html/img/items/cabbage_shovel.png',

	'html/img/items/lsrp_wood.png',
	'html/img/items/wood_pulp.png',
	'html/img/items/wood_cutting_ax.png',

	'html/img/items/lsrp_pineapple.png',
	'html/img/items/pineapple_stir.png',
	'html/img/items/pineapple_shovel.png',

	'html/img/items/lsrp_rice.png',
	'html/img/items/rice_pro.png',
	'html/img/items/scissors_rice.png',

	'html/img/items/lsrp_honeycomb.png',
	'html/img/items/lsrp_honey.png',
	'html/img/items/knife_bee.png',

	'html/img/items/lsrp_mushroom.png',
	'html/img/items/stone_mushroom.png',
	'html/img/items/mushroom_shovel.png',

	'html/img/items/lsrp_banana.png',
	'html/img/items/dried_banana.png',
	'html/img/items/basket_banana.png',

	'html/img/items/lsrp_orange.png',
	'html/img/items/orange_juice.png',
	'html/img/items/basket_orange.png',

	'html/img/items/lsrp_garbage.png',
	'html/img/items/recycled_doll.png',
	'html/img/items/waste_bin.png',

	'html/img/items/lsrp_treasure.png',
	'html/img/items/treasure_lsrp.png',
	'html/img/items/treasure_rare.png',
	'html/img/items/treasure_knife.png',

	'html/img/items/lsrp_watermelon.png',
	'html/img/items/watermelon_smoothie.png',
	'html/img/items/basket_watermelon.png',

	'html/img/items/dia_a.png',
	'html/img/items/dia_b.png',
	'html/img/items/dia_c.png',

	'html/img/items/gold_o.png',
	'html/img/items/gold_t.png',

	'html/img/items/gem_a.png',
	'html/img/items/gem_b.png',

	'html/img/items/drill.png',
	'html/img/items/stone.png',
	'html/img/items/iron.png',
	'html/img/items/copper.png',

	'html/img/items/radio.png',

    'html/img/items/WEAPON_PISTOL.png',
    'html/img/items/gun.png',
    'html/img/items/trigger.png',
    'html/img/items/mag.png',
    'html/img/items/slide.png',
    'html/img/items/highradio.png',
    'html/img/items/airbag.png',
    'html/img/items/highrim.png',
    'html/img/items/speaker.png',
    'html/img/items/lowradio.png',
    'html/img/items/stockrim.png',
    'html/img/items/laptop.png',
    'html/img/items/lotteryticket.png',
    'html/img/items/battery.png',
    'html/img/items/lockpick.png',
    'html/img/items/cigarett.png',
    'html/img/items/lighter.png',
    'html/img/items/nurek.png',
    'html/img/items/meth_pooch.png',
	'html/img/items/phone.png',
    'html/img/items/black_money.png',
	'html/img/items/bottle.png',
	'html/img/items/bread.png',
	'html/img/items/clip.png',
	'html/img/items/coke.png',
	'html/img/items/coke_pooch.png',
	'html/img/items/croquettes.png',
	'html/img/items/essence.png',
	'html/img/items/fish.png',
	'html/img/items/lfish.png',
	'html/img/items/fishbait.png',
	'html/img/items/fishingrod.png',
	'html/img/items/fixkit.png',
	'html/img/items/jumelles.png',
	'html/img/items/meth.png',
	'html/img/items/shark.png',
	'html/img/items/armor.png',
	'html/img/items/turtle.png',
	'html/img/items/turtlebait.png',
	'html/img/items/water.png',
	'html/img/items/cannabis.png',
	'html/img/items/weed_pooch.png',
	'html/img/items/cash.png',
	'html/img/items/repairkit.png',
	'html/img/items/lrod.png',
	'html/img/items/lbait.png',
	'html/img/items/bandage.png',
	'html/img/items/medikit.png',
	'html/img/items/bandage.png',
	'html/img/items/water.png',
	'html/img/items/scel.png',
	'html/img/items/wire.png',
	'html/img/items/hifi.png',
	'html/img/items/chocolate.png',
	'html/img/items/cocacola.png',
	'html/img/items/coffe.png',
	'html/img/items/cupcake.png',
	'html/img/items/cupcake2.png',
	'html/img/items/donut11.png',
	'html/img/items/donut2.png',
	'html/img/items/hamburger.png',
	'html/img/items/sandwich.png',
	'html/img/items/icetea.png',
	'html/img/items/vodka.png',
	'html/img/items/whisky.png',
	'html/img/items/target.png',
	'html/img/items/Cements.png',
	'html/img/items/WEAPON_BAT.png',
	'html/img/items/WEAPON_GOLFCLUB.png',
	'html/img/items/WEAPON_KNIFE.png',
	'html/img/items/weapon_wrench.png',
	'html/img/items/WEAPON_KNUCKLE.png',
	'html/img/items/gacha_01.png',
	'html/img/items/gacha_02.png',
	'html/img/items/clothe2.png'
}