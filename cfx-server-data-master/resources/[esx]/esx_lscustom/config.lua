	Config = {}

-- Dodatkowe printy w konsoli
Config.DebugPrint = true

-- Pozycje mechanika (X, Y, Z, PRACA)
-- Praca == "none" -> możliwość tuningu dla wszystkich
Config.Shops = {
    {x = -336.5906677246, y = -137.515335083, z = 38.297771453858, h = 245.47393798828, job="mechanic"},
    {x = -211.91694641114, y = -1324.0732421875, z = 30.122175216674, h = 150.81541442872, job="mecano2"},
}

-- Zniżka ceny przy zakupie części przez pracę mechanika
Config.Discount = 0.7 -- (70% ceny w katalogu)

-- Ustawienia bazy danych
Config.Sql = {
	table = "vehicles", -- tabela z cenami i modelami pojazdów (salon samochodowy)
	model = "model", -- kolumna zawierająca model pojazdu (tekst)
	price = "price", -- kolumna z ceną pojazdu (liczba)
	garage = "owned_vehicles", -- tabela z prywatnymi samochodami
	plate = "plate", -- kolumna z tablicą prywatnego pojazdu
}

-- Zmiana kont dla poszczególnych prac (esx_addonaccount)
Config.Accounts = {
	{
		job = "mechanic",
		account = "society_mechanic"
	},
	-- {
	-- 	job = "mecano2",
	-- 	account = "society_mecano2_money"
	-- },
}

-- Odległość rysowania markerów
Config.DrawDistance = 55

-- Kolory markerów
Config.Markers = {
	active = {255, 41, 41, 50}, -- aktywny (po wjechaniu w marker)
	inactive = {147, 11, 11, 90} -- nieaktywny (z dala od markera)
}

-- Pozycja menu listy (esx_menu_default)
Config.MenuAlign = "left"

-- Cena pojazdu, jeśli dany model nie jest dostępny w sprzedaży
Config.DefaultCarPrice = 50000

-- Webhook Discord do wyświetlania logów z wykonywanych tuningów
-- Config.WebHook = "https://discord.com/api/webhooks/796132417492353054/vB1Ttq-9-mdzCQgU_mA41JaXlDVE0XDQ1aIr8ewv6F5imfEEGDe8_Fp6V49Wz6wXOMH1"
Config.WebHook = ""

-- Event do powiadomień. Możliwość zmiany na własny system
RegisterNetEvent("smx_mecano:clientNotify")
AddEventHandler("smx_mecano:clientNotify", function(data)
	if data ~= nil and data.text ~= nil then
		ESX.ShowNotification(tostring(data.text))
	end
end)

Config.Language = {
	-- Interakcja
	press = "Naciśnij",
	openShop = "aby otworzyć menu warsztatu",
	hornPreview = "aby wypróbować klakson",
	openDoors = "aby otworzyć wszystkie drzwi",
	closeDoors = "aby zamknąć wszystkie drzwi",
	changeCam = "aby przełączyć kamerę",
	-- Menu
	yes = "Tak",
	no = "Nie",
	price = "Cena",
	value = "Koszt",
	installPrompt = "Czy chcesz zainstalować konfigurację?",
	mainMenu = "Menu Warsztatu",
	openModsList = "Otwórz katalog",
	installMods = "Zainstaluj modyfikacje",
	leaveGarage = "Czy chcesz wyjść z katalogu?",
	-- Powiadomienia
	noSavedMods = "Ten pojazd nie ma zapisanej konfiguracji!",
	noModsChosen = "Obecna konfiguracja nie zawiera nowych modyfikacji!",
	partsSavedJob = "Zapisano konfigurację. Udaj się do mechanika aby zamontować ją w pojeździe",
	partsSavedNoJob = "Zapisano konfigurację. Możesz ją teraz zamontować w pojeździe",
	noMoney = "Nie posiadasz wystarczającej ilości gotówki!",
	noSocietyMoney = "Na koncie frakcji nie ma wystaczającej ilości pieniędzy!",
	paid = "Zapłacono",
	paidFor = "za instalację konfiguracji.",
	paidForSociety = "z konta frakcyjnego w zamian za instalację konfiguracji.",
	-- Części
	stock = "Fabryczne",
	notFoundInCdImages = "Niestandardowa część",
	-- Waluta
	currency = "$",
	-- Logi
	discordTitle = "Nowy Tuning",
	tuningBy = "Tuning pojazdu przez",
	oldParts = "Stara konfiguracja",
	newParts = "Nowa konfiguracja",
}