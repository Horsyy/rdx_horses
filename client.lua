RDX = nil
Citizen.CreateThread(function()
	while RDX == nil do
		TriggerEvent('rdx:getSharedObject', function(obj) RDX = obj end)
		Citizen.Wait(100)
	end
end)

RegisterNetEvent('rdx_horses:Brush')
AddEventHandler('rdx_horses:Brush', function()
    local player = PlayerPedId()
    local horse = GetLastMount(player)
    local coords = GetEntityCoords(player)
    local coordshorse = GetEntityCoords(horse)
    local distance = #(coords - coordshorse)        

    if distance < 2.0 then            
		Brush(player, horse)        
    elseif IsPedOnMount(player) then
		Brush(player, horse)
    end
end)

RegisterNetEvent('rdx_horses:Syringe')
AddEventHandler('rdx_horses:Syringe', function(increase)
    local player = PlayerPedId()
    local horse = GetLastMount(player)
    local coords = GetEntityCoords(player)
    local coordshorse = GetEntityCoords(horse)
    local distance = #(coords - coordshorse)

	if distance < 2.0 then
		Syringe(player, horse, increase)
    elseif IsPedOnMount(player) then
		Syringe(player, horse, increase)
    end
end)

RegisterNetEvent('rdx_horses:Ointment')
AddEventHandler('rdx_horses:Ointment', function(increase)
    local player = PlayerPedId()
    local horse = GetLastMount(player)
    local coords = GetEntityCoords(player)
    local coordshorse = GetEntityCoords(horse)
    local distance = #(coords - coordshorse)

	if distance < 2.0 then
		Ointment(player, horse, increase)
    elseif IsPedOnMount(player) then
		Ointment(player, horse, increase)
    end
end)

RegisterNetEvent('rdx_horses:ConsumeFood')
AddEventHandler('rdx_horses:ConsumeFood', function(item, increase)
    local player = PlayerPedId()
    local horse = GetLastMount(player)
    local coords = GetEntityCoords(player)
    local coordshorse = GetEntityCoords(horse)
    local distance = #(coords - coordshorse)

	if distance < 2.0 then        
		ConsumeFood(player, horse, item, increase)
    elseif IsPedOnMount(player) then
		ConsumeFood(player, horse, item, increase)
    end
end)

-----------------
--- FUNCTIONS ---
-----------------

function Brush(player, horse)
	Citizen.InvokeNative(0xCD181A959CFDD7F4, player, horse, GetHashKey('Interaction_Brush'), GetHashKey('p_brushHorse02x'), 1)
	Wait(8000)
	Citizen.InvokeNative(0xE3144B932DFDFF65, horse, 0.0, -1, 1, 1)
	ClearPedEnvDirt(horse)
	ClearPedDamageDecalByZone(horse ,10 ,'ALL')
	ClearPedBloodDamage(horse)
	Citizen.InvokeNative(0xD8544F6260F5F01E, horse, 10)
end

function Syringe(player, horse, increase)
	TriggerServerEvent('rdx_horses:ConsumeSyringe')
	Citizen.InvokeNative(0xCD181A959CFDD7F4, player, horse, GetHashKey('Interaction_Injection_Quick'), GetHashKey('p_cs_syringe01x'), 1)
    Wait(3000)
    PlaySoundFrontend('Core_Fill_Up', 'Consumption_Sounds', true, 0)
    local Health = GetAttributeCoreValue(horse, 0)
    local newHealth = Health + increase
	SetEntityHealth(horse, GetEntityMaxHealth(horse))
    Citizen.InvokeNative(0xC6258F41D86676E0, horse, 0, newHealth)
end

function Ointment(player, horse, increase)
	TriggerServerEvent('rdx_horses:ConsumeOintment')
	Citizen.InvokeNative(0xCD181A959CFDD7F4, player, horse, GetHashKey('Interaction_Ointment'), GetHashKey('s_horseointment01x'), 1)
    Wait(6000)
    PlaySoundFrontend('Core_Fill_Up', 'Consumption_Sounds', true, 0)
    local Stamina = GetAttributeCoreValue(horse, 0)
    local newStamina = Stamina + increase
    Citizen.InvokeNative(0xC6258F41D86676E0, horse, 1, newStamina)
end

function ConsumeFood(player, horse, item, increase)
    TriggerServerEvent('rdx_horses:ConsumeFood', item)
    Citizen.InvokeNative(0xCD181A959CFDD7F4, player, horse, -224471938, 0, 0)
    Wait(5000)
    PlaySoundFrontend('Core_Fill_Up', 'Consumption_Sounds', true, 0)
    local Health = GetAttributeCoreValue(horse, 0)
    local newHealth = Health + increase
    local Stamina = GetAttributeCoreValue(horse, 0)
    local newStamina = Stamina + increase
    Citizen.InvokeNative(0xC6258F41D86676E0, horse, 0, newHealth)
    Citizen.InvokeNative(0xC6258F41D86676E0, horse, 1, newStamina)
end

function GetLastMount(ped)
	return Citizen.InvokeNative(0x4C8B59171957BCF7, ped)
end