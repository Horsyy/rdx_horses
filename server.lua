RDX = nil
TriggerEvent('rdx:getSharedObject', function(obj) RDX = obj end)

--------------------
--- USABLE ITEMS ---
--------------------

RDX.RegisterUsableItem('horse_brush', function(source)
	TriggerClientEvent('rdx_horses:Brush', source)
end)

RDX.RegisterUsableItem('horse_syringe', function(source)
	TriggerClientEvent('rdx_horses:Syringe', source, Config.Syringe)
end)

RDX.RegisterUsableItem('horse_ointment', function(source)
	TriggerClientEvent('rdx_horses:Ointment', source, Config.Ointment)
end)

RDX.RegisterUsableItem('wildcarrot', function(source)
	TriggerClientEvent('rdx_horses:ConsumeFood', source, 'wildcarrot', Config.WildCarrot)
end)

RDX.RegisterUsableItem('apple', function(source)
	TriggerClientEvent('rdx_horses:ConsumeFood', source, 'apple', Config.Apple)
end)

RDX.RegisterUsableItem('corn', function(source)
	TriggerClientEvent('rdx_horses:ConsumeFood', source, 'corn', Config.Corn)
end)

RDX.RegisterUsableItem('ginseng', function(source)
	TriggerClientEvent('rdx_horses:ConsumeFood', source, 'ginseng', Config.Ginseng)
end)

RDX.RegisterUsableItem('beets', function(source)
	TriggerClientEvent('rdx_horses:ConsumeFood', source, 'beets', Config.Beets)
end)

RDX.RegisterUsableItem('peach', function(source)
	TriggerClientEvent('rdx_horses:ConsumeFood', source, 'peach', Config.Peach)
end)

--------------------------
--- REMOVE ITEM EVENTS ---
--------------------------

RegisterServerEvent('rdx_horses:ConsumeSyringe')
AddEventHandler('rdx_horses:ConsumeSyringe', function()
	local xPlayer = RDX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('horse_syringe', 1)
end)

RegisterServerEvent('rdx_horses:ConsumeOintment')
AddEventHandler('rdx_horses:ConsumeOintment', function()
	local xPlayer = RDX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('horse_ointment', 1)
end)

RegisterServerEvent('rdx_horses:ConsumeFood')
AddEventHandler('rdx_horses:ConsumeFood', function(item)
	local xPlayer = RDX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, 1)
end)