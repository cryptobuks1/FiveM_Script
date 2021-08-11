local isJudge = false
local isPolice = false
local isMedic = false
local isDoctor = false
local isNews = false
local isDead = false
local isInstructorMode = false
local myJob = "unemployed"
local isHandcuffed = false
local isHandcuffedAndWalking = false
local hasOxygenTankOn = false
local gangNum = 0
local cuffStates = {}
local PlayerData = {}

ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

rootMenuConfig =  {
    {
        id = "general",
        displayName = "เมนูทั่วไป",
        icon = "#globe-europe",
        enableMenu = function()
            return not isDead
        end,
        subMenus = {"general:emoji","general:trade","general:barbie" }
    },
    {
        id = "police-action",
        displayName = "ตำรวจ",
        icon = "#police-action",
        enableMenu = function()
            return (PlayerData.job.name == 'police' and not isDead)
        end,
        subMenus = {"general:outofvehicle","general:putinvehicle", "general:escort", "cuffs:checkinventory", "cuffs:cuff", "cuffs:uncuff", "police:drages", "police:billing"}
        
    },
    {
        id = "police-check",
        displayName = "เมนูอื่นๆ",
        icon = "#police-check",
        enableMenu = function()
            return (PlayerData.job.name == 'police' and not isDead)
        end,
        functionName = "obj_xIcPolice"
    },
    {
        id = "police-vehicle",
        displayName = "ค้นรถ",
        icon = "#police-vehicle",
        enableMenu = function()
            return (PlayerData.job.name == 'police' and not isDead and IsPedInAnyVehicle(PlayerPedId(), false))
        end,
        subMenus = {"general:unseatnearest", "police:runplate", "police:toggleradar"}
    },
    {
        id = "judge-raid",
        displayName = "DoJ Menu",
        icon = "#judge-raid",
        enableMenu = function()
            return (not isDead and isJudge)
        end,
        subMenus = { "judge-raid:checkowner", "judge-raid:seizeall", "judge-raid:takecash", "judge-raid:takedm"}
    },
    {
        id = "judge-licenses",
        displayName = "บัตร",
        icon = "#judge-licenses",
        enableMenu = function()
            return (not isDead and isJudge)
        end,
        subMenus = { "police:checklicenses", "judge:grantDriver", "judge:grantBusiness", "judge:grantWeapon", "judge:grantHouse", "judge:grantBar", "judge:grantDA", "judge:removeDriver", "judge:removeBusiness", "judge:removeWeapon", "judge:removeHouse", "judge:removeBar", "judge:removeDA", "judge:denyWeapon", "judge:denyDriver", "judge:denyBusiness", "judge:denyHouse" }
    },
    {
        id = "judge-actions",
        displayName = "เมนู",
        icon = "#judge-actions",
        enableMenu = function()
            return (not isDead and isJudge)
        end,
        subMenus = { "police:cuff", "cuffs:uncuff", "general:escort", "police:frisk", "cuffs:checkinventory", "police:checkbank"}
    },
    {
        id = "da-actions",
        displayName = "เมนู",
        icon = "#judge-actions",
        enableMenu = function()
            return (not isDead and isJudge)
        end,
        subMenus = { "police:cuff", "cuffs:uncuff", "general:escort", "police:frisk", "cuffs:checkinventory"}
    },
    {
        id = "cuff",
        displayName = "ใส่จกุญแมือ",
        icon = "#cuffs",
        enableMenu = function()
            if not isDead and not IsPlayerFreeAiming(PlayerId()) and not IsPedInAnyVehicle(PlayerPedId(), false) and not isHandcuffed and not isHandcuffedAndWalking then
                if isPolice then
                    return true
                elseif not isPolice then
                    t, distance = GetClosestPlayer()
                    local serverId = GetPlayerServerId(t)
                    if(distance ~= -1 and distance < 3 and not IsPedRagdoll(PlayerPedId())) then
                        if cuffStates[serverId] == nil then
                            return false
                        else
                            return cuffStates[serverId]
                        end
                    end
                end
            end
            return false
        end,
        subMenus = { "cuffs:uncuff", "cuffs:remmask", "cuffs:checkinventory", "cuffs:unseat", "police:seat", "cuffs:checkphone" }
    },
    {
        id = "medic",
        displayName = "เมนูหมอ",
        icon = "#medic",
        enableMenu = function()
            return (PlayerData.job.name == 'ambulance' and not isDead)
        end,
        subMenus = {"medic:revive", "medic:heal", "general:escort", "general:putinvehicle", "general:outofvehicle", "ambu:billing" }
    },
    {
        id = "news",
        displayName = "Weazel News",
        icon = "#news",
        enableMenu = function()
            return (PlayerData.job.name == 'reporter' and not isDead)
        end,
        subMenus = { "news:setCamera", "news:setMicrophone", "news:setBoom" }
    },
    {
        id = "vehicle",
        displayName = "เปิดท้ายรถ",
        icon = "#vehicle-options-vehicle",
        functionName = "veh:options",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
	{
        id = "mechanic",
        displayName = "ช่างยนต์",
        icon = "#obj-mechanic",
        enableMenu = function()
            if PlayerData.job.name == 'mechanic' and not isDead then
                return true
            end
            return false
        end,
        subMenus = { "mecha:billing", "mecha:crack", "mecha:repair","mecha:clean" ,"mecha:pound","mecha:more"  }
    }, {
        id = "oxygentank",
        displayName = "Remove Oxygen Tank",
        icon = "#oxygen-mask",
        functionName = "RemoveOxyTank",
        enableMenu = function()
            return not isDead and hasOxygenTankOn
        end
    }

}

newSubMenus = {
    ['general:emotes'] = {
        title = "ท่าทาง",
        icon = "#phone",
        functionName = "dp:RecieveMenu"
    },    
    ['general:keysgive'] = {
        title = "ให้กุญแจ",
        icon = "#general-keys-give",
        functionName = "SOSAY_Locking:GiveKeys"
    },
    ['general:checkoverself'] = {
        title = "ตรวจสอบตนเอง",
        icon = "#general-check-over-self",
        functionName = "Evidence:CurrentDamageList"
    },
    ['general:checktargetstates'] = {
        title = "ตรวจสอบเป้าหมาย",
        icon = "#general-check-over-target",
        functionName = "requestWounds"
    },
    ['ambu:billing'] = {
        title = "ให้บิล",
        icon = "#obj-billing",
        functionName = "obj_xAbilling"
    },
    ['mecha:crack'] = {
        title = "งัดรถ",
        icon = "#obj-crack",
        functionName = "obj_xCrack"
    }
    ,
    ['mecha:repair'] = {
        title = "ซ่อมรถ",
        icon = "#obj-repair",
        functionName = "obj_xRepair"
    }
    ,
    ['mecha:clean'] = {
        title = "ทำความสะอาด",
        icon = "#obj-clean",
        functionName = "obj_xClean"
    }
    ,
    ['mecha:pound'] = {
        title = "พาวท์",
        icon = "#obj-pound",
        functionName = "obj_xPound"
    }
    ,
    ['mecha:more'] = {
        title = "อื่นๆ",
        icon = "#obj-more",
        functionName = "obj_xMMore"
    }
    ,
    ['mecha:billing'] = {
        title = "ให้บิล",
        icon = "#obj-billing",
        functionName = "obj_xMbilling"
    }
    ,['police:billing'] = {
        title = "ให้บิล",
        icon = "#obj-billing",
        functionName = "obj_xPbilling"
    },
    ['general:checkvehicle'] = {
        title = "เปิดท้ายรถ",
        icon = "#general-check-vehicle",
        functionName = "towgarage:annoyedBouce"
    },
    ['general:emoji'] = {
        title = "อีโม",
        icon = "#walking",
        functionName = "obj_xEmoji"
    },
    ['general:putinvehicle'] = {
        title = "ใส่รถยนต์นั่ง",
        icon = "#general-put-in-veh",
        functionName = "obj_xPutVeh"
    },['general:outofvehicle'] = {
        title = "ออกรถยนต์นั่ง",
        icon = "#general-unseat-nearest",
        functionName = "obj_xOutVeh"
    },
    
    ['general:unseatnearest'] = {
        title = "ปลดล็อคที่ใกล้ที่สุด",
        icon = "#general-unseat-nearest",
        functionName = "unseatPlayer"
    },    
    ['general:flipvehicle'] = {
        title = "พลิกรถ",
        icon = "#general-flip-vehicle",
        functionName = "FlipVehicle"
    },
    ['animations:phone'] = {
        title = "โทรศัพท์",
        icon = "#phone",
        functionName = "AnimSet:Brave"
    },
    ['animations:hurry'] = {
        title = "รีบเร่ง",
        icon = "#animation-hurry",
        functionName = "AnimSet:Hurry"
    },
    ['animations:business'] = {
        title = "ธุรกิจ",
        icon = "#animation-business",
        functionName = "AnimSet:Business"
    },
    ['animations:tipsy'] = {
        title = "มึนเมา",
        icon = "#animation-tipsy",
        functionName = "AnimSet:Tipsy"
    },
    ['animations:injured'] = {
        title = "ได้รับบาดเจ็บ",
        icon = "#animation-injured",
        functionName = "AnimSet:Injured"
    },
    ['animations:tough'] = {
        title = "ยาก",
        icon = "#animation-tough",
        functionName = "AnimSet:ToughGuy"
    },
    ['animations:sassy'] = {
        title = "หน้าด้าน",
        icon = "#animation-sassy",
        functionName = "AnimSet:Sassy"
    },
    ['animations:sad'] = {
        title = "เสียใจ",
        icon = "#animation-sad",
        functionName = "AnimSet:Sad"
    },
    ['animations:posh'] = {
        title = "เยี่ยม",
        icon = "#animation-posh",
        functionName = "AnimSet:Posh"
    },
    ['animations:alien'] = {
        title = "มนุษย์ต่างดาว",
        icon = "#animation-alien",
        functionName = "AnimSet:Alien"
    },
    ['animations:nonchalant'] =
    {
        title = "ไม่ไยดี",
        icon = "#animation-nonchalant",
        functionName = "AnimSet:NonChalant"
    },
    ['animations:hobo'] = {
        title = "กุ๊ย",
        icon = "#animation-hobo",
        functionName = "AnimSet:Hobo"
    },
    ['animations:money'] = {
        title = "เงิน",
        icon = "#animation-money",
        functionName = "AnimSet:Money"
    },
    ['animations:swagger'] = {
        title = "กรีดกราย",
        icon = "#animation-swagger",
        functionName = "AnimSet:Swagger"
    },
    ['animations:shady'] = {
        title = "ร่มครึ้ม",
        icon = "#animation-shady",
        functionName = "AnimSet:Shady"
    },
    ['animations:maneater'] = {
        title = "Man Eater",
        icon = "#animation-maneater",
        functionName = "AnimSet:ManEater"
    },
    ['animations:chichi'] = {
        title = "ChiChi",
        icon = "#animation-chichi",
        functionName = "AnimSet:ChiChi"
    },
    ['animations:default'] = {
        title = "ค่าเริ่มต้น",
        icon = "#animation-default",
        functionName = "AnimSet:default"
    },
    ['k9:spawn'] = {
        title = "เรียก",
        icon = "#k9-spawn",
        functionName = "K9:Create"
    },
    ['k9:delete'] = {
        title = "ยกเลิก",
        icon = "#k9-dismiss",
        functionName = "K9:Delete"
    },
    ['k9:follow'] = {
        title = "ติดตาม",
        icon = "#k9-follow",
        functionName = "K9:Follow"
    },
    ['k9:vehicle'] = {
        title = "รับเข้า / ออก",
        icon = "#k9-vehicle",
        functionName = "K9:Vehicle"
    },
    ['k9:sit'] = {
        title = "นั่ง",
        icon = "#k9-sit",
        functionName = "K9:Sit"
    },
    ['k9:lay'] = {
        title = "วาง",
        icon = "#k9-lay",
        functionName = "K9:Lay"
    },
    ['k9:stand'] = {
        title = "ยืน",
        icon = "#k9-stand",
        functionName = "K9:Stand"
    },
    ['k9:sniff'] = {
        title = "คนดมกลิ่น",
        icon = "#k9-sniff",
        functionName = "K9:Sniff"
    },
    ['k9:sniffvehicle'] = {
        title = "ยานสูดอากาศ",
        icon = "#k9-sniff-vehicle",
        functionName = "sniffVehicle"
    },
    ['k9:huntfind'] = {
        title = "ตามล่าที่ใกล้ที่สุด",
        icon = "#k9-huntfind",
        functionName = "K9:Huntfind"
    },
    ['blips:gasstations'] = {
        title = "ปั๊มน้ำมัน",
        icon = "#blips-gasstations",
        functionName = "CarPlayerHud:ToggleGas"
    },    
    ['blips:trainstations'] = {
        title = "สถานีรถไฟ",
        icon = "#blips-trainstations",
        functionName = "Trains:ToggleTainsBlip"
    },
    ['blips:garages'] = {
        title = "อู่",
        icon = "#blips-garages",
        functionName = "Garages:ToggleGarageBlip"
    },
    ['blips:barbershop'] = {
        title = "ร้านตัดตผม",
        icon = "#blips-barbershop",
        functionName = "hairDresser:ToggleHair"
    },    
    ['blips:tattooshop'] = {
        title = "ร้านสัก",
        icon = "#blips-tattooshop",
        functionName = "tattoo:ToggleTattoo"
    },
    ['drivinginstructor:drivingtest'] = {
        title = "การทดสอบการขับขี่",
        icon = "#drivinginstructor-drivingtest",
        functionName = "drivingInstructor:testToggle"
    },
    ['drivinginstructor:submittest'] = {
        title = "ส่งการทดสอบ",
        icon = "#drivinginstructor-submittest",
        functionName = "drivingInstructor:submitTest"
    },
    ['judge-raid:checkowner'] = {
        title = "ตรวจสอบเจ้าของ",
        icon = "#judge-raid-check-owner",
        functionName = "appartment:CheckOwner"
    },
    ['judge-raid:seizeall'] = {
        title = "ยึดเนื้อหาทั้งหมด",
        icon = "#judge-raid-seize-all",
        functionName = "appartment:SeizeAll"
    },
    ['judge-raid:takecash'] = {
        title = "รับเงินสด",
        icon = "#judge-raid-take-cash",
        functionName = "appartment:TakeCash"
    },
    ['judge-raid:takedm'] = {
        title = "รับตั๋วที่ทำเครื่องหมายไว้",
        icon = "#judge-raid-take-dm",
        functionName = "appartment:TakeDM"
    },
    ['cuffs:cuff'] = {
        title = "ใส่กุญแจมือ",
        icon = "#cuffs-cuff",
        functionName = "obj_xCuff"
    },
    ['cuffs:uncuff'] = {
        title = "ปลดกุญแจมือ",
        icon = "#cuffs-uncuff",
        functionName = "obj_xUncuff"
    },
    ['cuffs:remmask'] = {
        title = "ถอดหน้ากาก",
        icon = "#cuffs-remove-mask",
        functionName = "police:remmask"
    },
    ['cuffs:checkinventory'] = {
        title = "ค้นหาบุคคล",
        icon = "#cuffs-check-inventory",
        functionName = "obj_xSearch"
    },
    ['cuffs:unseat'] = {
        title = "ไล่ออกจากตำแหน่ง",
        icon = "#cuffs-unseat-player",
        functionName = "unseatPlayerCiv"
    },
    ['cuffs:checkphone'] = {
        title = "อ่านโทรศัพท์",
        icon = "#cuffs-check-phone",
        functionName = "police:checkPhone"
    },
    ['medic:revive'] = {
        title = "ปั้มหัวใจ",
        icon = "#medic-revive",
        functionName = "obj_xRevive"
    },
    ['medic:heal'] = {
        title = "เพิ่มเลือด",
        icon = "#medic-heal",
        functionName = "obj_xHeal"
    },
    ['police:cuff'] = {
        title = "กุญแจมือ",
        icon = "#cuffs-cuff",
        functionName = "police:cuffFromMenu"
    },
    ['police:checkbank'] = {
        title = "เช็คเงินธนาคาร",
        icon = "#police-check-bank",
        functionName = "police:checkBank"
    },
    ['police:checklicenses'] = {
        title = "ตรวจสอบใบอนุญาต",
        icon = "#police-check-licenses",
        functionName = "police:checkLicenses"
    },
    ['police:removeweapons'] = {
        title = "ลบสิทธิ์การใช้งานอาวุธ",
        icon = "#police-action-remove-weapons",
        functionName = "police:removeWeapon"
    },
    ['police:gsr'] = {
        title = "การทดสอบ GSR",
        icon = "#police-action-gsr",
        functionName = "police:gsr"
    },
    ['police:dnaswab'] = {
        title = "DNA Swab",
        icon = "#police-action-dna-swab",
        functionName = "evidence:dnaSwab"
    },
    ['police:toggleradar'] = {
        title = "สลับเรดาร์",
        icon = "#police-vehicle-radar",
        functionName = "startSpeedo"
    },
    ['police:runplate'] = {
        title = "เรียกใช้จาน",
        icon = "#police-vehicle-plate",
        functionName = "clientcheckLicensePlate"
    },

    ['police:drages'] = {
        title = "ลาก",
        icon = "#obj-drag",
        functionName = "obj_xDrag"
    },
    ['police:frisk'] = {
        title = "ร่าเริง",
        icon = "#police-action-frisk",
        functionName = "police:frisk"
    },

    ['judge:grantDriver'] = {
        title = "ให้ไดรเวอร์",
        icon = "#judge-licenses-grant-drivers",
        functionName = "police:grantDriver"
    }, 
    ['judge:grantBusiness'] = {
        title = "ให้สิทธิ์ธุรกิจ",
        icon = "#judge-licenses-grant-business",
        functionName = "police:grantBusiness"
    },  
    ['judge:grantWeapon'] = {
        title = "ให้อาวุธ",
        icon = "#judge-licenses-grant-weapon",
        functionName = "police:grantWeapon"
    },
    ['judge:grantHouse'] = {
        title = "บ้านแกรนท์",
        icon = "#judge-licenses-grant-house",
        functionName = "police:grantHouse"
    },
    ['judge:grantBar'] = {
        title = "Grant BAR",
        icon = "#judge-licenses-grant-bar",
        functionName = "police:grantBar"
    },
    ['judge:grantDA'] = {
        title = "ให้สิทธิ์",
        icon = "#judge-licenses-grant-da",
        functionName = "police:grantDA"
    },
    ['judge:removeDriver'] = {
        title = "ลบไดรเวอร์",
        icon = "#judge-licenses-remove-drivers",
        functionName = "police:removeDriver"
    },
    ['judge:removeBusiness'] = {
        title = "Remove Business",
        icon = "#judge-licenses-remove-business",
        functionName = "police:removeBusiness"
    },
    ['judge:removeWeapon'] = {
        title = "ลบธุรกิจ",
        icon = "#judge-licenses-remove-weapon",
        functionName = "police:removeWeapon"
    },
    ['judge:removeHouse'] = {
        title = "ลบบ้าน",
        icon = "#judge-licenses-remove-house",
        functionName = "police:removeHouse"
    },
    ['judge:removeBar'] = {
        title = "Remove BAR",
        icon = "#judge-licenses-remove-bar",
        functionName = "police:removeBar"
    },
    ['judge:removeDA'] = {
        title = "Remove DA",
        icon = "#judge-licenses-remove-da",
        functionName = "police:removeDA"
    },
    ['judge:denyWeapon'] = {
        title = "ปฏิเสธอาวุธ",
        icon = "#judge-licenses-deny-weapon",
        functionName = "police:denyWeapon"
    },
    ['judge:denyDriver'] = {
        title = "ปฏิเสธไดรเวอร์",
        icon = "#judge-licenses-deny-drivers",
        functionName = "police:denyDriver"
    },
    ['judge:denyBusiness'] = {
        title = "ปฏิเสธธุรกิจ",
        icon = "#judge-licenses-deny-business",
        functionName = "police:denyBusiness"
    },
    ['judge:denyHouse'] = {
        title = "ปฏิเสธบ้าน",
        icon = "#judge-licenses-deny-house",
        functionName = "police:denyHouse"
    },
    ['news:setCamera'] = {
        title = "กล้อง",
        icon = "#news-job-news-camera",
        functionName = "Cam:ToggleCam"
    },
    ['news:setMicrophone'] = {
        title = "ไมค์",
        icon = "#news-job-news-microphone",
        functionName = "Mic:ToggleMic"
    },
    ['news:setBoom'] = {
        title = "บูมไมโครโฟน",
        icon = "#news-job-news-boom",
        functionName = "Mic:ToggleBMic"
    },
    ['weed:currentStatusServer'] = {
        title = "สถานะคำขอ",
        icon = "#weed-cultivation-request-status",
        functionName = "weed:currentStatusServer"
    },   
    ['weed:weedCrate'] = {
        title = "เอาลังออก",
        icon = "#weed-cultivation-remove-a-crate",
        functionName = "weed:weedCrate"
    },
    ['cocaine:currentStatusServer'] = {
        title = "สถานะคำขอ",
        icon = "#meth-manufacturing-request-status",
        functionName = "cocaine:currentStatusServer"
    },
    ['cocaine:methCrate'] = {
        title = "เอาลังออก",
        icon = "#meth-manufacturing-remove-a-crate",
        functionName = "cocaine:methCrate"
    },
    ["expressions:angry"] = {
        title="โกรธ",
        icon="#expressions-angry",
        functionName = "expressions",
        functionParameters =  { "mood_angry_1" }
    },
    ["expressions:drunk"] = {
        title="เมา",
        icon="#expressions-drunk",
        functionName = "expressions",
        functionParameters =  { "mood_drunk_1" }
    },
    ["expressions:dumb"] = {
        title="โง่",
        icon="#expressions-dumb",
        functionName = "expressions",
        functionParameters =  { "pose_injured_1" }
    },
    ["expressions:electrocuted"] = {
        title="ไฟฟ้าดูด",
        icon="#expressions-electrocuted",
        functionName = "expressions",
        functionParameters =  { "electrocuted_1" }
    },
    ["expressions:grumpy"] = {
        title="ไม่พอใจ",
        icon="#expressions-grumpy",
        functionName = "expressions", 
        functionParameters =  { "mood_drivefast_1" }
    },
    ["expressions:happy"] = {
        title="ดีใจ",
        icon="#expressions-happy",
        functionName = "expressions",
        functionParameters =  { "mood_happy_1" }
    },
    ["expressions:injured"] = {
        title="ได้รับบาดเจ็บ",
        icon="#expressions-injured",
        functionName = "expressions",
        functionParameters =  { "mood_injured_1" }
    },
    ["expressions:joyful"] = {
        title="สนุกสนาน",
        icon="#expressions-joyful",
        functionName = "expressions",
        functionParameters =  { "mood_dancing_low_1" }
    },
    ["expressions:mouthbreather"] = {
        title="Mouthbreather",
        icon="#expressions-mouthbreather",
        functionName = "expressions",
        functionParameters = { "smoking_hold_1" }
    },
    ["expressions:normal"]  = {
        title="ปกติ",
        icon="#expressions-normal",
        functionName = "expressions:clear"
    },
    ["expressions:oneeye"]  = {
        title="ตาเดียว",
        icon="#expressions-oneeye",
        functionName = "expressions",
        functionParameters = { "pose_aiming_1" }
    },
    ["expressions:shocked"]  = {
        title="ตกใจ",
        icon="#expressions-shocked",
        functionName = "expressions",
        functionParameters = { "shocked_1" }
    },
    ["expressions:sleeping"]  = {
        title="หลับ",
        icon="#expressions-sleeping",
        functionName = "expressions",
        functionParameters = { "dead_1" }
    },
    ["expressions:smug"]  = {
        title="พอใจในตัวเอง",
        icon="#expressions-smug",
        functionName = "expressions",
        functionParameters = { "mood_smug_1" }
    },
    ["expressions:speculative"]  = {
        title="เกี่ยวกับการพิจารณา",
        icon="#expressions-speculative",
        functionName = "expressions",
        functionParameters = { "mood_aiming_1" }
    },
    ["expressions:stressed"]  = {
        title="เครียด",
        icon="#expressions-stressed",
        functionName = "expressions",
        functionParameters = { "mood_stressed_1" }
    },
    ["expressions:sulking"]  = {
        title="บูดบึ้ง",
        icon="#expressions-sulking",
        functionName = "expressions",
        functionParameters = { "mood_sulk_1" },
    },
    ["expressions:weird"]  = {
        title="แปลก",
        icon="#expressions-weird",
        functionName = "expressions",
        functionParameters = { "effort_2" }
    },
    ["expressions:weird2"]  = {
        title="แปลก2",
        icon="#expressions-weird2",
        functionName = "expressions",
        functionParameters = { "effort_3" }
    }
}

RegisterNetEvent("menu:setCuffState")
AddEventHandler("menu:setCuffState", function(pTargetId, pState)
    cuffStates[pTargetId] = pState
end)


RegisterNetEvent("isJudge")
AddEventHandler("isJudge", function()
    isJudge = true
end)

RegisterNetEvent("isJudgeOff")
AddEventHandler("isJudgeOff", function()
    isJudge = false
end)

RegisterNetEvent("np-jobmanager:playerBecameJob")
AddEventHandler("np-jobmanager:playerBecameJob", function(job, name, notify)
    if isMedic and job ~= "ambulance" then isMedic = false end
    if isPolice and job ~= "police" then isPolice = false end
    if isDoctor and job ~= "doctor" then isDoctor = false end
    if isNews and job ~= "reporter" then isNews = false end
    if job == "police" then isPolice = true end
    if job == "ambulance" then isMedic = true end
    if job == "reporter" then isNews = true end
    if job == "doctor" then isDoctor = true end
    myJob = job
end)

RegisterNetEvent('pd:deathcheck')
AddEventHandler('pd:deathcheck', function()
    if not isDead then
        isDead = true
    else
        isDead = false
    end
end)

RegisterNetEvent("drivingInstructor:instructorToggle")
AddEventHandler("drivingInstructor:instructorToggle", function(mode)
    if myJob == "driving instructor" then
        isInstructorMode = mode
    end
end)

RegisterNetEvent("police:currentHandCuffedState")
AddEventHandler("police:currentHandCuffedState", function(pIsHandcuffed, pIsHandcuffedAndWalking)
    isHandcuffedAndWalking = pIsHandcuffedAndWalking
    isHandcuffed = pIsHandcuffed
end)

RegisterNetEvent("menu:hasOxygenTank")
AddEventHandler("menu:hasOxygenTank", function(pHasOxygenTank)
    hasOxygenTankOn = pHasOxygenTank
end)

RegisterNetEvent('enablegangmember')
AddEventHandler('enablegangmember', function(pGangNum)
    gangNum = pGangNum
end)

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local closestPed = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        for index,value in ipairs(players) do
            local target = GetPlayerPed(value)
            if(target ~= ply) then
                local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
                local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
                if(closestDistance == -1 or closestDistance > distance) and not IsPedInAnyVehicle(target, false) then
                    closestPlayer = value
                    closestPed = target
                    closestDistance = distance
                end
            end
        end
        return closestPlayer, closestDistance, closestPed
    end
end

trainstations = {
    {-547.34057617188,-1286.1752929688,25.3059978411511},
    {-892.66284179688,-2322.5168457031,-13.246466636658},
    {-1100.2299804688,-2724.037109375,-8.3086919784546},
    {-1071.4924316406,-2713.189453125,-8.9240007400513},
    {-875.61907958984,-2319.8686523438,-13.241264343262},
    {-536.62890625,-1285.0009765625,25.301458358765},
    {270.09558105469,-1209.9177246094,37.465930938721},
    {-287.13568115234,-327.40936279297,8.5491418838501},
    {-821.34295654297,-132.45257568359,18.436864852905},
    {-1359.9794921875,-465.32354736328,13.531299591064},
    {-498.96591186523,-680.65930175781,10.295949935913},
    {-217.97073364258,-1032.1605224609,28.724565505981},
    {113.90325164795,-1729.9976806641,28.453630447388},
    {117.33223724365,-1721.9318847656,28.527353286743},
    {-209.84713745117,-1037.2414550781,28.722997665405},
    {-499.3971862793,-665.58514404297,10.295639038086},
    {-1344.5224609375,-462.10494995117,13.531820297241},
    {-806.85192871094,-141.39852905273,18.436403274536},
    {-302.21514892578,-327.28854370117,8.5495929718018},
    {262.01733398438,-1198.6135253906,37.448017120361},
    {2072.4086914063,1569.0856933594,76.712524414063},
    {664.93090820313,-997.59942626953,22.261747360229},
    {190.62687683105,-1956.8131103516,19.520135879517},
    {2611.0278320313,1675.3806152344,26.578210830688},
    {2615.3901367188,2934.8666992188,39.312232971191},
    {2885.5346679688,4862.0146484375,62.551517486572},
    {47.061096191406,6280.8969726563,31.580261230469},
    {2002.3624267578,3619.8029785156,38.568252563477},
    {2609.7016601563,2937.11328125,39.418235778809}
}
