local QBCore = exports['qb-core']:GetCoreObject()

--- Events

RegisterNetEvent('kk-speedyjob:server:AddItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'delivery_box'
    local quantity = 1

    Player.Functions.AddItem(item, quantity)
end)

RegisterNetEvent('kk-speedyjob:server:DeliverBox', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = 'delivery_box'
    local item2 = 'delivery_recive'
    local quantity = 1

    Player.Functions.RemoveItem(item1, quantity)
    Player.Functions.AddItem(item2, quantity)
end)

RegisterNetEvent('kk-speedyjob:server:ReceivePayment', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local payment = Config.DeliveryPayment

    Player.Functions.RemoveItem('delivery_recive', 1)
    Player.Functions.AddMoney('cash', payment)
end)

RegisterNetEvent('kk-speedyjob:server:jobGarage', function(vehicle)
    local vehicle = Config.Vehicle
    local coords = Config.VehicleSpawn
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "SPEEDY"..tostring(math.random(1000, 9999)))
        SetEntityAsMissionEntity(veh, true, true)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = QBCore.Functions.GetPlate(veh)
        SetVehicleFuelLevel(veh, 100.0)
    end, coords, true)
end)

RegisterNetEvent('kk-speedyjob:server:jobGarage', function()
    local veh = QBCore.Functions.GetClosestVehicle()
        if veh == 'master2019':
          QBCore.Functions.DeleteVehicle(veh)
          QBCore.Functions.Notify("Ти върна колата", "success")
    else
        QBCore.Functions.Notify("Това не е фирмена кола", "error")
    end
end)
