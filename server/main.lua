QRCore.Functions.CreateUseableItem("goldpanner", function(source, item)
    local src = source
    local player = QRCore.Functions.GetPlayer(src)
	if player.Functions.RemoveItem('goldpanner', 0, item.slot) then
        TriggerClientEvent('qr-goldpanning:StartPanning', src)
    end
end)

RegisterNetEvent("qr-goldpanning:Search", function()
    local src = source
    local player = QRCore.Functions.GetPlayer(src)

    local chance = math.random(1, 10)
    if chance < 1 then
        for i = 1, #Config.ItemReceiveTable do
            if Config.Debug then print(Config.ItemReceiveTable[i].name, Config.ItemReceiveTable[i].amount) return end

            player.Functions.AddItem(Config.ItemReceiveTable[i].name, Config.ItemReceiveTable[i].amount)
            TriggerClientEvent("QRCore:Notify", src, 'You found something!', 'success')
        end
    else
        TriggerClientEvent("QRCore:Notify", src, 'You didn\'t find anything', 'error')
    end
end)

