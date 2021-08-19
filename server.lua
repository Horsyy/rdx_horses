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

RDX.RegisterUsableItem('apple', function(source)
	TriggerClientEvent('rdx_horses:ConsumeFood', source, 'apple', 'p_apple02x', Config.Apple)
end)

RDX.RegisterUsableItem('wildcarrot', function(source)
	TriggerClientEvent('rdx_horses:ConsumeFood', source, 'wildcarrot', 'p_carrots_03x', Config.WildCarrot)
end)

RDX.RegisterUsableItem('corn', function(source)
	TriggerClientEvent('rdx_horses:ConsumeFood', source, 'corn', 'p_corn02x', Config.Corn)
end)

RDX.RegisterUsableItem('ginseng', function(source)
	TriggerClientEvent('rdx_horses:ConsumeFood', source, 'ginseng', 's_inv_alaskanginseng01cx', Config.Ginseng)
end)

RDX.RegisterUsableItem('beet', function(source)
	TriggerClientEvent('rdx_horses:ConsumeFood', source, 'beet', 'p_beet_01x', Config.Beet)
end)

RDX.RegisterUsableItem('peach', function(source)
	TriggerClientEvent('rdx_horses:ConsumeFood', source, 'peach', 's_peach01x', Config.Peach)
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
