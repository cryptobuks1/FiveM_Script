--[[
    ================== เริ่มต้นพื้นฐาน ==================
    ** weight 1 = 1 กิโลกรัม | สามารถกำหนด 0.50 หรือ 0.01 ได้ **
    -- weight = น้ำหนัก            (0  = ไม่มีน้ำหนัก)
    -- limit = จำนวนไอเทมที่เก็บได้  (-1 = ไม่จำกัดจำนวน)
]]
Config.Item_Info_Weight_Default     = 1.00  -- ค่าเริ่มต้นของไอเทม
Config.Item_Info_Limit_Default      = -1    -- ค่าเริ่มต้นของจำกัดจำนวนไอเทม (-1 = ไม่จำกัดจำนวน)
Config.Item_Info_Cal                = 1000  -- หากใช้ประเป๋าประชารัชให้ปรับเป็น 1


--[[
    ================== ตั้งค่าไอเทม ==================
     ** weight 1 = 1 กิโลกรัม | สามารถกำหนด 0.50 หรือ 0.01 ได้ **
    weight = น้ำหนัก            (0  = ไม่มีน้ำหนัก)
    limit = จำนวนไอเทมที่เก็บได้  (-1 = ไม่จำกัดจำนวน)
]]
Config.Item_Info = {

    ['bread']                   = {weight = 1.00, limit = 10},
    ['medikit']                 = {weight = 1.50},
    ['phone']                   = {weight = 0.30},
	['water']                   = {weight = 0.50, limit = 10},
    ['lockpick']                = {weight = 0.30},
    ['bandage']                 = {weight = 0.10},
    ['blowpipe']                = {weight = 0.10},
    ['carokit']                 = {weight = 0.10},
    ['carotool']                = {weight = 0.10},
    ['fixkit']                  = {weight = 0.10},
    ['fixtool']                 = {weight = 0.10},
	

    --------------- Money ---------------
    ['money']                   = { weight = 0.00, limit = 100000 },
    ['black_money']             = { weight = 0.00, limit = 100000 },

    
    --------------- Weapon ---------------
    ['WEAPON_KNIFE']            = { weight = 9999999.00, limit = 1 },
    ['WEAPON_NIGHTSTICK']       = { weight = 9999999.00, limit = 1 },
    ['WEAPON_HAMMER']           = { weight = 9999999.00, limit = 1 },
    ['WEAPON_BAT']              = { weight = 9999999.00, limit = 1 },
    ['WEAPON_CROWBAR']          = { weight = 9999999.00, limit = 1 },
    ['WEAPON_GOLFCLUB']         = { weight = 9999999.00, limit = 1 },
    ['WEAPON_BOTTLE']           = { weight = 9999999.00, limit = 1 },
    ['WEAPON_DAGGER']           = { weight = 9999999.00, limit = 1 },
    ['WEAPON_HATCHET']          = { weight = 9999999.00, limit = 1 },
    ['WEAPON_MACHETE']          = { weight = 9999999.00, limit = 1 },
    ['WEAPON_FLASHLIGHT']       = { weight = 9999999.00, limit = 1 },
    ['WEAPON_SWITCHBLADE']      = { weight = 9999999.00, limit = 1 },
    ['WEAPON_POOLCUE']          = { weight = 9999999.00, limit = 1 },
    ['WEAPON_WRENCH']           = { weight = 9999999.00, limit = 1 },
    ['WEAPON_BATTLEAXE']        = { weight = 9999999.00, limit = 1 },
    ['WEAPON_KNUCKLE']          = { weight = 9999999.00, limit = 1 },
    ['WEAPON_PETROLCAN']        = { weight = 9999999.00, limit = 1 },
    ['WEAPON_STUNGUN']          = { weight = 9999999.00, limit = 1 },
    ['WEAPON_BOTTLE']           = { weight = 9999999.00, limit = 1 },
    ['WEAPON_MARKSMANPISTOL']   = { weight = 9999999.00, limit = 1 },
    ['WEAPON_COMBATPDW']        = { weight = 9999999.00, limit = 1 },
    ['WEAPON_BZGAS']            = { weight = 9999999.00, limit = 1 },
}


--[[
    ================== BlackList ไอเทมที่จะไม่ให้เก็บในหลังรถ ==================
]]
Config.Item_BlackList_Name = {
    "id_card",
    "id_driver",
    "card_back",
	"coin_gang",
	"coin_gang1",
	"clothbag",
	"coin_ganglv1",
	"coin_ganglv2",
    "money",
}