RegisterNetEvent("ammo:client:UseBox", function(boxItem, ammoItem, ammoCount)
    local ped = PlayerPedId()
    local dict = "amb@world_human_clipboard@male@idle_a"
    local clip = "idle_c"
    local propModel = `prop_ld_ammo_pack_01`

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end

    -- load model
    RequestModel(propModel)
    while not HasModelLoaded(propModel) do
        Wait(0)
    end

    local coords = GetEntityCoords(ped)
    local prop = CreateObject(propModel, coords.x, coords.y, coords.z + 0.2, true, true, true)
    AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 57005), 0.15, 0.02, -0.02, 250.0, 150.0, 60.0, true, true, false, true, 1, true)

    local success = lib.progressBar({
        duration = 10000,
        label = 'Opening Ammo Box...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = false,
            combat = true
        },
        anim = {
            dict = dict,
            clip = clip,
            flag = 49
        }
    })

    ClearPedTasks(ped)
    DeleteObject(prop)
    SetModelAsNoLongerNeeded(propModel)

    if success then
        TriggerServerEvent("ammo:server:OpenAmmoBox", boxItem, ammoItem, ammoCount)
    else
        lib.notify({
            title = "Ammo Box",
            description = "You canceled opening the box.",
            type = "error"
        })
    end
end)
