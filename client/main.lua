local entity
local Panning = false

local function CrouchAnimAndAttach()
    local dict = "script_rc@cldn@ig@rsc2_ig1_questionshopkeeper"
    lib.requestAnimDict(dict)

    local coords = GetEntityCoords(cache.ped)
    local boneIndex = GetEntityBoneIndexByName(cache.ped, "SKEL_R_HAND")
    local modelHash = GetHashKey("P_CS_MININGPAN01X")
    lib.requestModel(modelHash)
    entity = CreateObject(modelHash, coords.x + 0.3, coords.y, coords.z, true, false, false)
    SetEntityVisible(entity, true)
    SetEntityAlpha(entity, 255, false)
    Citizen.InvokeNative(0x283978A15512B2FE, entity, true)
    SetModelAsNoLongerNeeded(modelHash)
    AttachEntityToEntity(entity, cache.ped, boneIndex, 0.2, 0.0, -0.2, -100.0, -50.0, 0.0, false, false, false, true, 2, true)

    TaskPlayAnim(cache.ped, dict, "inspectfloor_player", 1.0, 8.0, -1, 1, 0, false, false, false)
end

RegisterNetEvent('qr-goldpanning:StartPanning', function()
    if not Panning then
        Panning = true
        local coords = GetEntityCoords(cache.ped)
        local Water = Citizen.InvokeNative(0x5BA7A68A346A5A91, coords.x, coords.y, coords.z)
        local foundwater = false
        for k, _ in pairs(Config.WaterTypes) do
            if Water ~= Config.WaterTypes[k].waterhash then return end

            foundwater = true
            CrouchAnimAndAttach()
            Wait(6000)
            ClearPedTasks(cache.ped)

            if lib.progressCircle({
                label = 'Finding Gold...',
                duration = 5000,
                position = 'bottom',
                useWhileDead = false,
                canCancel = true,
                disable = { car = true, combat = true, move = true },
                anim = { dict = "script_re@gold_panner@gold_success", clip = "SEARCH02", flag = 16}
            }) then
                ClearPedTasks(cache.ped)
                DeleteObject(entity)
                DeleteEntity(entity)
                TriggerServerEvent("qr-goldpanning:Search")
                Panning = false
            end
        end
        if not foundwater then QRCore.Functions.Notify("You can\'t search here...", 'error') end
    end
end)