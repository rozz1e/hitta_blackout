ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem(Config.Item, function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('hitta_bo:ON-SERVER', source)
	xPlayer.removeInventoryItem(Config.Item, 1)
end)

RegisterNetEvent('hitta_bo:ON-SERVER')
AddEventHandler('hitta_bo:ON-SERVER', function(source)
    if Config.UseVsync then
        TriggerClientEvent('hitta_bo:animation', source)
        Wait(12000)
        ExecuteCommand('blackout')
        Wait(200)
        TriggerEvent('vSync:requestSync')
        TriggerClientEvent('hitta_bo:ON-CLIENT', source)
        Wait(Config.Duration * 1000)
        ExecuteCommand('blackout')
        Wait(200)
        TriggerEvent('vSync:requestSync')
    else
        TriggerClientEvent('hitta_bo:animation', source)
        Wait(12000)
        TriggerClientEvent('hitta_bo:ON-CLIENT', source)
    end
end)

if Config.Debug then
    RegisterCommand('ON', function(source)
        if Config.UseVsync then
            ExecuteCommand('blackout')
            Wait(200)
            TriggerEvent('vSync:requestSync')
        else
            TriggerClientEvent('hitta_bo:ON-CLIENT', source)
        end
    end)

    RegisterCommand('OFF', function(source)
        if Config.UseVsync then
            ExecuteCommand('blackout')
            Wait(200)
            TriggerEvent('vSync:requestSync')
        else
            TriggerClientEvent('hitta_bo:OFF-CLIENT', source)
        end
    end)
end