local QRCore = exports['qr-core']:GetCoreObject()

QRCore.Functions.CreateUseableItem("goldpanner", function(source, item)
    local src = source
    local Player = QRCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem('goldpanner', 0, item.slot) then
        TriggerClientEvent('qr-GoldPanner:StartPaning', src)
    end
end)

RegisterNetEvent("qr-search")
AddEventHandler("qr-search", function()
    local item = "gold_ore"
    local r = math.random(1,10)
    local src = source
    local Player = QRCore.Functions.GetPlayer(src)
    if r < 1 then
        Player.Functions.AddItem(item, math.random(1,3))
        print("fund")
        TriggerClientEvent("QRCore:Notify", src, 'You fund Gold Ore', 'success')

    else
        TriggerClientEvent("QRCore:Notify", src, 'You don\'t fund Gold Ore', 'error')
    end
end)

