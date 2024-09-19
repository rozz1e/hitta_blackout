ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('hitta_bo:animation')
AddEventHandler('hitta_bo:animation',function()
	lib.progressCircle({
		duration = 10000,
		position = 'bottom',
		label = Strings.hacking,
		useWhileDead = false,
		canCancel = true,
		disable = {
			car = true,
		},
		anim = {
			dict = 'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a',
			clip = 'idle_a'
		},
		prop = {
			model = `prop_cs_tablet`,
			pos = vec3(-0.05, 0.0, 0.0),
			rot = vec3(0.0, 0.0, 0.0)
		},
	})
end)

RegisterNetEvent('hitta_bo:ON-CLIENT')
AddEventHandler('hitta_bo:ON-CLIENT', function()

    if not Config.UseVsync then
        SetArtificialLightsState(true)
    end
	if Config.ShowVehicleLights then
		SetArtificialLightsStateAffectsVehicles(false)
	end
	if Config.SoundEffects then 
		PlaySoundFrontend(-1, "Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
	end

	Wait(Config.Duration * 1000)

	if not Config.UseVsync then
        SetArtificialLightsState(false)
    end
	if Config.ShowVehicleLights then
		SetArtificialLightsStateAffectsVehicles(true)
	end
	if Config.SoundEffects then
		PlaySoundFrontend(-1, "police_notification", "DLC_AS_VNT_Sounds", 1)
	end

end)

RegisterNetEvent('hitta_bo:OFF-CLIENT')
AddEventHandler('hitta_bo:OFF-CLIENT', function()
	if not Config.UseVsync then
        SetArtificialLightsState(false)
    end
	
	if Config.ShowVehicleLights then
		SetArtificialLightsStateAffectsVehicles(true)
	end
	if Config.SoundEffects then
		PlaySoundFrontend(-1, "police_notification", "DLC_AS_VNT_Sounds", 1)
	end

end)