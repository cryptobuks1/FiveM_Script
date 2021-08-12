local a = nil
Citizen.CreateThread(
    function()
        print(("^2[%s]^7 ^0Verify Success^7"):format(script_name))
        a = true
        Init()
end)
RegisEvent(
    true,
    events.sv["OnVerifyRequest"],
    function()
        TriggerClientEvent(events.cl["OnVerifyReceive"], source, a)
    end
)
ESX = nil
MySQL_Init = false
xZero = {}
xZero.Funcs = {}
xZero.C = {}
Store = {}
StoreOwnerVehicles = {}
VCFG_DATA = {}
_timeOutSaveDBdefault = 5 * 1000
_openTrunkCheckTime = 12 * 1000
Init = function()
    Wait(500)
    if not a then
        return
    end
    if not Config then
        pr("^1Error Config NotFound!^7")
        return
    end
    ConfigBaseVaild()
    while ESX == nil do
        TriggerEvent(
            Config.Base.getSharedObject,
            function(h)
                ESX = h
            end
        )
        Wait(1)
    end
    MySQL.ready(
        function()
            MySQL_Init = true
        end
    )
    while MySQL_Init == false do
        Wait(1)
    end
    VersionInit()
    StoreInit()
    EventsInit()
end
StoreInit = function()
    xZero.Funcs.Store_ClearEmptyDataFromDB()
    xZero.Funcs.Store_ClearNPCFromDB()
    xZero.Funcs.Store_LoadedFromDB()
end
EventsInit = function()
    RSC(
        events.sv["OnInventoryDataRequestCB"],
        function(i, j, k, l)
            local m = ESX.GetPlayerFromId(i)
            if not m or not k or not k.plate then
                j(false)
                return
            end
            local n = m.getIdentifier()
            xZero.Funcs.OwnerVehicles_GetByPlate(
                function(o)
                    local p = o ~= nil and true or false
                    if Config.Vehicle_NPC_Disabled and not p then
                        j(false)
                        return
                    end
                    if Config.Vehicle_OwnerOnly and p and o ~= n then
                        local q = VJob(m.getJob().name)
                        if not (q.Vaild and q.OwnerOnly_Allow()) then
                            NotifyT(i, "vehicle_owneronly_error", {k.plate}, "error")
                            j(false)
                            return
                        end
                    end
                    local r = xZero.Funcs.Store_GetByPlate(k.plate, p, o)
                    if Config.Vehicle_OpenTrunkMax and Config.Vehicle_OpenTrunkMax > 0 and not l then
                        if not r.OpenTrunk_Check(Config.Vehicle_OpenTrunkMax) then
                            NotifyT(
                                i,
                                "vehicle_opentrunkmax_error",
                                {r.plate, #r.OpenTrunk_PlayerList, Config.Vehicle_OpenTrunkMax},
                                "error"
                            )
                            j(false)
                            return
                        end
                        xZero.Funcs.OpenTrunk_Update(n, r.plate)
                    end
                    j(r.InventoryData)
                end,
                k.plate
            )
        end
    )
    RegisEvent(
        true,
        events.sv["OnPut"],
        function(s, t)
            local i = source
            local m = ESX.GetPlayerFromId(i)
            if not m or not funcs.DATA_VEH_Vaild(s) or not t then
                return
            end
            local r = Store[s.plate] or nil
            if not r or not r.IsVaild() then
                pr(("^1ERROR Store Invaild | %s | %s^7"):format(m.getIdentifier(), s.plate))
                return
            end
            local u = xZero.Funcs.VCFG_Get(s)
            if not u then
                return
            end
            if r.Prograss then
                return
            end
            r.Prograss = true
            local v, w = t.item, t.count
            if r.slotsCurrent == nil or r.weightCurrent == nil then
                r.SlotsAndWeightCurrent()
            end
            local x, y, z = r.getNewCountSlotsWeight("PUT", v, w)
            local A = u.getItemLimit(v.name)
            if A ~= -1 and x > A then
                NotifyT(i, "limit_error", nil, "error")
                r.Prograss = false
                return
            end
            if u.slots_max ~= -1 and y > u.slots_max then
                NotifyT(i, "slots_error", nil, "error")
                r.Prograss = false
                return
            end
            if u.weight_max ~= -1 and z > u.weight_max then
                NotifyT(i, "weight_error", nil, "error")
                r.Prograss = false
                return
            end
            local B = false
            local C = nil
            if v.type == "item_standard" then
                local D = m.getInventoryItem(v.name) or nil
                if w > 0 and D and D.count >= w then
                    r.Items_Add(v.name, w)
                    m.removeInventoryItem(v.name, w)
                    C = {item_name = v.name, item_label = v.label, count = w, DC_TYPE = "item"}
                    B = true
                else
                    NotifyT(i, "item_invaild_count", nil, "error")
                end
            elseif v.type == "item_account" then
                local E = xZero.C.PlayerAccounts(m)
                if E.Get(v.name) >= w then
                    r.Accounts_Add(v.name, w)
                    E.Remove(v.name, w)
                    C = {item_name = v.name, item_label = v.label, count = w, DC_TYPE = "account"}
                    B = true
                else
                    NotifyT(i, "item_invaild_count", nil, "error")
                end
            elseif v.type == "item_weapon" then
                local F, G = m.getWeapon(v.name)
                if G then
                    r.Weapons_Add(G.name, G.ammo, G.components)
                    m.removeWeapon(G.name)
                    C = {item_name = v.name, item_label = v.label, count = G.ammo, DC_TYPE = "weapon"}
                    B = true
                else
                    NotifyT(i, "item_invaild_count", nil, "error")
                end
            end
            if B then
                r.slotsCurrent = y
                r.weightCurrent = z
                if C and DC_CFG_Vaild(C.DC_TYPE, "Put") then
                    local H = Config.DC[C.DC_TYPE]["Put"]
                    DC_Log(
                        m,
                        s,
                        r.Owner_Iden,
                        C["item_name"],
                        C["item_label"],
                        C["count"],
                        {
                            URL_Webhook = H.URL_Webhook,
                            color = H.Template.color,
                            title = H.Template.title,
                            description = H.Template.description
                        }
                    )
                end
            end
            r.Prograss = false
        end
    )
    RegisEvent(
        true,
        events.sv["OnTake"],
        function(s, t)
            local i = source
            local m = ESX.GetPlayerFromId(i)
            if not m or not funcs.DATA_VEH_Vaild(s) or not t then
                return
            end
            local r = Store[s.plate] or nil
            if not r or not r.IsVaild() then
                pr(("^1ERROR Store Invaild | %s | %s^7"):format(m.getIdentifier(), s.plate))
                return
            end
            if r.Prograss then
                return
            end
            r.Prograss = true
            local v, w = t.item, t.count
            if r.slotsCurrent == nil or r.weightCurrent == nil then
                r.SlotsAndWeightCurrent()
            end
            local x, y, z = r.getNewCountSlotsWeight("TAKE", v, w)
            local I = false
            local C = nil
            if v.type == "item_standard" then
                local J = r.Items_Get(v.name)
                local D = m.getInventoryItem(v.name) or nil
                if D and w ~= nil and w > 0 and J >= w then
                    if D.limit == nil or D.limit == -1 or w + D.count <= D.limit then
                        if not Config.UseCarryItem or m["canCarryItem"] == nil or m.canCarryItem(v.name, w) then
                            r.Items_Remove(v.name, w)
                            m.addInventoryItem(v.name, w)
                            C = {item_name = v.name, item_label = v.label, count = w, DC_TYPE = "item"}
                            I = true
                        else
                            NotifyT(i, "weight_error", nil, "error")
                        end
                    else
                        NotifyT(i, "limit_error", nil, "error")
                    end
                else
                    NotifyT(i, "item_invaild_count", nil, "error")
                end
            elseif v.type == "item_account" then
                local K = r.Accounts_Get(v.name)
                if w ~= nil and w > 0 and K >= w then
                    r.Accounts_Remove(v.name, w)
                    xZero.C.PlayerAccounts(m).Add(v.name, w)
                    C = {item_name = v.name, item_label = v.label, count = w, DC_TYPE = "account"}
                    I = true
                else
                    NotifyT(i, "item_invaild_count", nil, "error")
                end
            elseif v.type == "item_weapon" and v.wKey then
                local L = r.Weapons_Get(v.wKey)
                if L then
                    if not m.hasWeapon(L.name) then
                        local M = L.ammo
                        m.addWeapon(L.name, M)
                        if L.components and #L.components > 0 then
                            for N, O in ipairs(L.components) do
                                m.addWeaponComponent(L.name, O)
                            end
                        end
                        r.Weapons_Remove(v.wKey)
                        C = {item_name = v.name, item_label = v.label, count = M, DC_TYPE = "weapon"}
                        I = true
                    else
                        NotifyT(i, "item_hasweapon_error", nil, "error")
                    end
                else
                    NotifyT(i, "item_invaild_count", nil, "error")
                end
            end
            if I then
                r.slotsCurrent = y
                r.weightCurrent = z
                if C and DC_CFG_Vaild(C.DC_TYPE, "Take") then
                    local H = Config.DC[C.DC_TYPE].Take
                    DC_Log(
                        m,
                        s,
                        r.Owner_Iden,
                        C["item_name"],
                        C["item_label"],
                        C["count"],
                        {
                            URL_Webhook = H.URL_Webhook,
                            color = H.Template.color,
                            title = H.Template.title,
                            description = H.Template.description
                        }
                    )
                end
            end
            r.Prograss = false
        end
    )
    RegisEvent(
        true,
        events.sv["OnTrunkInventoryOpen"],
        function(P)
            if Config.Vehicle_OpenTrunkMax and Config.Vehicle_OpenTrunkMax > 0 then
                local m = ESX.GetPlayerFromId(source)
                if m and P then
                    xZero.Funcs.OpenTrunk_Update(m.getIdentifier(), P)
                end
            end
        end
    )
    RegisEvent(
        true,
        events.sv["OnTrunkInventoryClose"],
        function(P)
            if Config.Vehicle_OpenTrunkMax and Config.Vehicle_OpenTrunkMax > 0 then
                local m = ESX.GetPlayerFromId(source)
                if m and P then
                    xZero.Funcs.OpenTrunk_Close(m.getIdentifier(), P)
                end
            end
        end
    )
end
xZero.Funcs.Store_ClearEmptyDataFromDB = function()
    local Q =
        MySQL.Sync.execute(
        ([[
        DELETE FROM %s WHERE (accounts = '[]' or accounts = '{}') AND (items = '[]' or items = '{}') AND (weapons = '[]' or weapons = '{}')
    ]]):format(
            Config.Store_Table_Name
        )
    )
    collectgarbage()
    pr(("Store Empty Clear - ^1%s^7"):format(Q))
end
xZero.Funcs.Store_ClearNPCFromDB = function()
    if Config.Vehicle_NPC and Config.Vehicle_NPC.DB_Clear_Hour > 0 then
        local Q =
            MySQL.Sync.execute(
            ([[
            DELETE FROM %s WHERE is_owner = 0 AND time_last_update <= date_sub(now(), interval @hour hour)
        ]]):format(
                Config.Store_Table_Name
            ),
            {["@hour"] = Config.Vehicle_NPC.DB_Clear_Hour}
        )
        collectgarbage()
        pr(("Store NPC Clear - ^1%s^7"):format(Q))
    end
end
xZero.Funcs.Store_LoadedFromDB = function()
    local R = 0
    local S = MySQL.Sync.fetchAll(("SELECT * FROM %s"):format(Config.Store_Table_Name))
    local T = S and #S or 0
    if T > 0 then
        Store = {}
        for U = 1, T do
            local O = S[U]
            local V = xZero.C.Store(O.plate)
            V.IsOwner = O.is_owner
            V.time_last_update = math.ceil(O.time_last_update / 1000)
            V.InventoryData["accounts"] = json.decode(O.accounts)
            V.InventoryData["items"] = json.decode(O.items)
            V.InventoryData["weapons"] = json.decode(O.weapons)
            V.InDB = true
            V.DB_Save = true
            Store[O.plate] = V
            R = R + 1
        end
        S = nil
    end
    collectgarbage()
    pr(("Store Loaded - ^3%s^7"):format(R))
end
xZero.Funcs.OwnerVehicles_GetByPlate = function(W, P)
    local X = StoreOwnerVehicles[P] or nil
    if X and not X.TimeUpdateCheck(Config.Owner_Vehicles_TimeCheckUpdate) then
        W(X.Owner_Iden)
    else
        xZero.Funcs.OwnerVehicles_GetByPlateFromDB(
            function(Y)
                W(Y)
            end,
            P
        )
    end
end
xZero.Funcs.OwnerVehicles_GetByPlateFromDB = function(W, P)
    MySQL.Async.fetchAll(
        ("SELECT owner FROM %s WHERE plate = @plate"):format(Config.Owner_Vehicles_Table_Name),
        {["@plate"] = P},
        function(Z)
            if Z and #Z > 0 then
                local Y = Z[1].owner
                StoreOwnerVehicles[P] = xZero.C.OwnerVehicles(P, Y)
                W(Y)
            else
                if StoreOwnerVehicles[P] then
                    StoreOwnerVehicles[P] = nil
                end
                W(nil)
            end
        end
    )
end
xZero.Funcs.Store_GetByPlate = function(P, _, a0)
    if Store[P] then
        Store[P].Owner_Iden = a0
        return Store[P]
    else
        local a1 = xZero.C.Store(P, _, a0)
        a1.time_last_update = os.time()
        a1.InventoryData["accounts"] = {}
        a1.InventoryData["items"] = {}
        a1.InventoryData["weapons"] = {}
        Store[P] = a1
        if _ or Config.Vehicle_NPC == nil or Config.Vehicle_NPC and Config.Vehicle_NPC.DB_Save then
            Store[P].DB_Save = true
            MySQL.Async.execute(
                ([[
                INSERT INTO %s (plate, is_owner, accounts, items, weapons) 
                VALUES (@plate, @is_owner, @accounts, @items, @weapons)
            ]]):format(
                    Config.Store_Table_Name
                ),
                {["@plate"] = P, ["@is_owner"] = _, ["@accounts"] = "{}", ["@items"] = "{}", ["@weapons"] = "{}"},
                function(a2)
                    if a2 ~= nil and a2 > 0 then
                        Store[P].InDB = true
                        pr(("Insert Store | ^3%s^7 | is_owner:^3%s^7"):format(P, _))
                    else
                        pr(("^1Insert Store Error | %s | is_owner:%s^7"):format(P, _))
                    end
                end
            )
        end
        return Store[P]
    end
end
xZero.Funcs.VCFG_Get = function(s)
    local a3 = s.VHASH
    if VCFG_DATA[a3] then
        return VCFG_DATA[a3]
    else
        VCFG_DATA[a3] = C_VCFG(s.plate, s.class_name:lower(), s.displayname:lower(), tostring(s.model))
        return VCFG_DATA[a3]
    end
end
xZero.Funcs.OpenTrunk_Update = function(a4, P)
    local r = Store[P]
    if r then
        r.OpenTrunk_Add(a4)
    end
end
xZero.Funcs.OpenTrunk_Close = function(a4, P)
    local r = Store[P]
    if r then
        r.OpenTrunk_Remove(a4)
    end
end
xZero.C.PlayerAccounts = function(a5)
    local self = {}
    self.xPlayer = a5
    self.Get = function(a6)
        if a6 == "money" then
            return self.xPlayer.getMoney()
        end
        return self.xPlayer.getAccount(a6).money
    end
    self.Add = function(a6, a7)
        if a6 == "money" then
            self.xPlayer.addMoney(a7)
            return
        end
        self.xPlayer.addAccountMoney(a6, a7)
    end
    self.Remove = function(a6, a7)
        if a6 == "money" then
            self.xPlayer.removeMoney(a7)
            return
        end
        self.xPlayer.removeAccountMoney(a6, a7)
    end
    return self
end
xZero.C.Store = function(P, _, a0)
    local self = {}
    self.plate = P
    self.Is_Owner = _
    self.Owner_Iden = a0
    self.time_last_update = nil
    self.Vaild = false
    self.Prograss = false
    self.InDB = false
    self.DB_Save = false
    self.OpenTrunk_PlayerList = {}
    self.slotsCurrent = nil
    self.weightCurrent = nil
    self.InventoryData = {["accounts"] = {}, ["items"] = {}, ["weapons"] = {}}
    self.TimeOutCB = {["accounts"] = {}, ["items"] = {}, ["weapons"] = {}}
    self.IsVaild = function()
        if
            self.InventoryData and self.InventoryData["accounts"] and self.InventoryData["items"] and
                self.InventoryData["weapons"] and
                (self.InDB or not self.DB_Save)
         then
            self.Vaild = true
            return self.Vaild
        end
        self.Vaild = false
        return self.Vaild
    end
    self.OpenTrunk_GetPlayer = function(a4)
        local a8 = #self.OpenTrunk_PlayerList
        if a8 > 0 then
            for a9 = 1, a8 do
                local O = self.OpenTrunk_PlayerList[a9]
                if O.Iden == a4 then
                    return a9, O
                end
            end
        end
        return nil, nil
    end
    self.OpenTrunk_Add = function(a4)
        local aa, ab = self.OpenTrunk_GetPlayer(a4)
        local ac = aa ~= nil and self.OpenTrunk_PlayerList[aa] or nil
        if ac then
            ac.time = GetGameTimer()
        else
            local a8 = #self.OpenTrunk_PlayerList
            self.OpenTrunk_PlayerList[a8 + 1] = {Iden = a4, time = GetGameTimer()}
        end
    end
    self.OpenTrunk_Remove = function(a4)
        local aa, ab = self.OpenTrunk_GetPlayer(a4)
        if aa then
            table.remove(self.OpenTrunk_PlayerList, aa)
        end
    end
    self.OpenTrunk_Check = function(ad)
        local ae = #self.OpenTrunk_PlayerList
        if ae < ad then
            return true
        end
        local af = 0
        local ag = {}
        local ah = 0
        for aa = 1, ae do
            local O = self.OpenTrunk_PlayerList[aa]
            if GetGameTimer() - O.time >= _openTrunkCheckTime then
                af = af + 1
                ag[af] = aa
            else
                ah = ah + 1
            end
        end
        self.OpenTrunk_TimeOutClear(ag)
        return ah < ad and true or false
    end
    self.OpenTrunk_TimeOutClear = function(ag)
        local ai = #ag
        if ai > 0 and #self.OpenTrunk_PlayerList > 0 then
            for U = 1, ai do
                local aa = ag[U]
                if self.OpenTrunk_PlayerList[aa] then
                    table.remove(self.OpenTrunk_PlayerList, aa)
                end
            end
        end
    end
    self.Items_Get = function(aj)
        return self.InventoryData["items"][aj] or 0
    end
    self.Items_Add = function(aj, w)
        self.InventoryData["items"][aj] = self.Items_Get(aj) + w
        self.Save("items")
        return true
    end
    self.Items_Remove = function(aj, w)
        local ak = self.Items_Get(aj)
        if ak > 0 and ak >= w then
            local al = ak - w
            local x = al > 0 and al or nil
            self.InventoryData["items"][aj] = x
            self.Save("items")
            return true
        end
        return false
    end
    self.Accounts_Get = function(am)
        return self.InventoryData["accounts"][am] or 0
    end
    self.Accounts_Add = function(am, w)
        self.InventoryData["accounts"][am] = self.Accounts_Get(am) + w
        self.Save("accounts")
        return true
    end
    self.Accounts_Remove = function(am, w)
        local an = self.Accounts_Get(am)
        if an > 0 and an >= w then
            local al = an - w
            local x = al > 0 and al or nil
            self.InventoryData["accounts"][am] = x
            self.Save("accounts")
            return true
        end
        return false
    end
    self.Weapons_Get = function(ao)
        return self.InventoryData["weapons"][ao] or nil
    end
    self.Weapons_GetCount = function(ap)
        local a8 = 0
        for aq, ar in pairs(self.InventoryData["weapons"]) do
            if ar.name == ap then
                a8 = a8 + 1
            end
        end
        return a8
    end
    self.Weapons_GenwKey = function()
        local aq = nil
        while true do
            aq = tostring(math.random(10000000, 99999999))
            if self.Weapons_Get(aq) == nil then
                return aq
            end
        end
    end
    self.Weapons_Add = function(ap, M, as)
        local ao = self.Weapons_GenwKey()
        local at = {name = ap, ammo = M ~= nil and M > 0 and M or 0, components = as ~= nil and #as > 0 and as or nil}
        self.InventoryData["weapons"][ao] = at
        self.Save("weapons")
        return true
    end
    self.Weapons_Remove = function(ao)
        if self.Weapons_Get(ao) then
            self.InventoryData["weapons"][ao] = nil
            self.Save("weapons")
            return true
        end
        return false
    end
    self.Save = function(au, av)
        self.time_last_update = os.time()
        if self.DB_Save and self.InDB and au then
            if self.TimeOutCB and self.TimeOutCB[au] and #self.TimeOutCB[au] > 0 then
                for N, O in ipairs(self.TimeOutCB[au]) do
                    ESX.ClearTimeout(self.TimeOutCB[au][N])
                    self.TimeOutCB[au][N] = nil
                end
            end
            av = av ~= nil and av or _timeOutSaveDBdefault
            local aw =
                ESX.SetTimeout(
                av,
                function()
                    MySQL.Async.execute(
                        ([[
                    UPDATE %s SET %s = @%s WHERE plate = @plate
                ]]):format(
                            Config.Store_Table_Name,
                            au,
                            au
                        ),
                        {["@" .. au] = json.encode(self.InventoryData[au]), ["@plate"] = self.plate}
                    )
                end
            )
            table.insert(self.TimeOutCB[au], aw)
            return true
        end
        return false
    end
    self.SlotsAndWeightCurrent = function()
        local ax = 0
        local ay = 0
        for ab, au in ipairs({"accounts", "items"}) do
            if self.InventoryData[au] then
                for az, aA in pairs(self.InventoryData[au]) do
                    ax = ax + 1
                    ay = ay + aA * getItemInfoWeight(az)
                end
            end
        end
        if self.InventoryData["weapons"] then
            for ab, aB in pairs(self.InventoryData["weapons"]) do
                ax = ax + 1
                ay = ay + getItemInfoWeight(aB.name)
            end
        end
        self.slotsCurrent = ax
        self.weightCurrent = funcs.getNumFormat(ay)
        return self.slotsCurrent, self.weightCurrent
    end
    self.getNewCountSlotsWeight = function(aC, v, w)
        local x = 0
        local y = self.slotsCurrent
        local z = self.weightCurrent
        local aD = storeItemGetNameFunc[v.type] or nil
        if aD then
            if v.type == "item_weapon" then
                w = 1
            end
            local aE = self[aD](v.name)
            x = aC == "PUT" and w + aE or aE - w
            if aE <= 0 and x > 0 then
                y = y + 1
            elseif x <= 0 then
                y = y - 1
            end
            if aC == "PUT" then
                z = z + w * getItemInfoWeight(v.name)
            else
                z = z - w * getItemInfoWeight(v.name)
            end
        end
        return x, y, funcs.getNumFormat(z)
    end
    return self
end
storeItemGetNameFunc = {
    ["item_standard"] = "Items_Get",
    ["item_account"] = "Accounts_Get",
    ["item_weapon"] = "Weapons_GetCount"
}
xZero.C.OwnerVehicles = function(P, Y)
    local self = {}
    self.plate = P
    self.Owner_Iden = Y
    self.timeLast = GetGameTimer()
    self.TimeUpdateCheck = function(aF)
        aF = aF ~= nil and aF or 60
        return GetGameTimer() - self.timeLast >= aF * 1000 and true or false
    end
    return self
end
Notify = function(i, aG, aH, aI)
    TriggerClientEvent(events.cl["OnNotify"], i, aG, aH, aI)
end
NotifyT = function(i, aJ, aK, aL, aM)
    local aN = CT[aJ] or nil
    if aN then
    end
    if aN ~= nil then
        Notify(i, aN:format(table.unpack(aK or {})), aL, aM)
    end
end
function DC_Log(m, s, aO, aj, aP, aQ, C)
    Citizen.CreateThread(
        function()
            local aR = {
                embeds = {
                    {
                        color = C.color,
                        title = C.title,
                        description = C.description:format(
                            s.plate,
                            ("%s | %s (%s)"):format(s.displayname, s.model, s.class_name),
                            aO,
                            m.getIdentifier(),
                            m.getName(),
                            aj,
                            aP,
                            aQ
                        ),
                        footer = {text = ("เวลา: %s"):format(os.date("%d/%m/%Y | %H:%M:%S", os.time()))}
                    }
                }
            }
            PerformHttpRequest(
                C.URL_Webhook,
                function(d, e, f)
                end,
                "POST",
                json.encode(aR),
                {["Content-Type"] = "application/json"}
            )
        end
    )
end
function DC_CFG_Vaild(aS, aT)
    if Config.DC and Config.DC[aS] then
        local aU = Config.DC[aS][aT]
        if aU and aU.Enabled and aU.URL_Webhook and aU.Template then
            return true
        end
        return false
    end
    return false
end
VersionInit = function()
    if version_lasted ~= nil and tonumber(version_current) < tonumber(version_lasted) then
        pr(string.format("Inited - version_current:^1%s^7 (version_lasted:^3%s^7)", version_current, version_lasted))
    else
        pr(string.format("Inited - version_current:^3%s^7", version_current))
    end
end
_TSC = {}
_TSC.Callbacks = {}
RSC = function(aV, aW)
    _TSC.Callbacks[aV] = aW
end
_TSC.Callback = function(aV, aX, i, aW, ...)
    if _TSC.Callbacks[aV] then
        _TSC.Callbacks[aV](i, aW, ...)
    end
end
RegisEvent(
    true,
    events.sv["TSC_Request"],
    function(aV, aX, ...)
        local i = source
        _TSC.Callback(
            aV,
            aX,
            i,
            function(...)
                TriggerClientEvent(events.cl["TSC_Receive"], i, aX, ...)
            end,
            ...
        )
    end
)
