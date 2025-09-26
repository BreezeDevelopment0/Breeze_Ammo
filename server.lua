local QBX = exports.qbx_core


RegisterNetEvent("ammo:server:OpenAmmoBox", function(boxItem, ammoItem, ammoCount)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end


    if Player.Functions.RemoveItem(boxItem, 1) then
        Player.Functions.AddItem(ammoItem, ammoCount)

        TriggerClientEvent("lib:notify", src, {
            title = "Ammo Box",
            description = ("You unpacked %sx %s"):format(ammoCount, ammoItem),
            type = "success"
        })
    else

        TriggerClientEvent("lib:notify", src, {
            title = "Ammo Box",
            description = "You do not have that ammo box.",
            type = "error"
        })
    end
end)


exports.qbx_core:CreateUseableItem("ammo-9-box", function(source, item)
    TriggerClientEvent("ammo:client:UseBox", source, "ammo-9-box", "ammo-9", 25)
end)

exports.qbx_core:CreateUseableItem("ammo-rifle-box", function(source, item)
    TriggerClientEvent("ammo:client:UseBox", source, "ammo-rifle-box", "ammo-rifle", 25)
end)

exports.qbx_core:CreateUseableItem("ammo-rifle2-box", function(source, item)
    TriggerClientEvent("ammo:client:UseBox", source, "ammo-rifle2-box", "ammo-rifle2", 25)
end)

exports.qbx_core:CreateUseableItem("ammo-shotgun-box", function(source, item)
    TriggerClientEvent("ammo:client:UseBox", source, "ammo-shotgun-box", "ammo-shotgun", 15)
end)
