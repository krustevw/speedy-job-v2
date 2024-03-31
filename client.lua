local QBCore = exports['qb-core']:GetCoreObject()
local onDuty = false
-- Events
local function jobCheck()
	canDo = true
	if not onDuty then TriggerEvent('QBCore:Notify', "Излязал си от смяна!", 'error') canDo = false end
	return canDo
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then if PlayerData.job.name == "speedy" then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate') AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end) 
RegisterNetEvent('QBCore:Client:SetDuty') AddEventHandler('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(resource)
	installCheck()
    if GetCurrentResourceName() == resource then
		QBCore.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
			if PlayerData.job.name == "speedy" then onDuty = PlayerJob.onduty end 
		end)
    end
end)


exports['qb-target']:AddBoxZone("Duty", vector3(-587.4, -1059.6, 23.45), 2.0, 2.5, { name="duty", heading = 270.0, debugPoly=Config.Debug, minZ=21.45, maxZ=23.45 }, 
		{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-clock", label = "Влез на смяна", job = "speedy" }, }, distance = 2.0 })

RegisterNetEvent('kk-speedyjob:client:PedirEntrega', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"argue"})
    QBCore.Functions.Progressbar('falar_empregada', 'Оточняваш детайли за доставката', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    QBCore.Functions.Notify('Ти поиска пратка <br> Изчакай навънка за да ти я подготвият', 'primary', 7500)
    
    Wait(Config.DeliveryWait)

    QBCore.Functions.Notify('Заявката за доставка е получена, сега отидете на място на gps-a и я дайте на клиента', 'primary', 7500)
    TriggerServerEvent('kk-speedyjob:server:AddItem')
    ExportDeliveryTarget()
    end)
end)

RegisterNetEvent('kk-speedyjob:client:BaterPorta', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
    QBCore.Functions.Progressbar('falar_empregada', 'Чукаш...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    QBCore.Functions.Notify('Ти достави пратката върни се до офиса и си вземи парите!', 'primary', 7500)

    TriggerServerEvent('kk-speedyjob:server:DeliverBox')
    end)
end)

RegisterNetEvent('kk-speedyjob:client:ReceivePayment', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('falar_empregada', 'Вземаш надника...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()

        TriggerServerEvent('kk-speedyjob:server:ReceivePayment')
    end)
end)

-- Funções

function ExportDeliveryTarget()
    local prob = math.random(1, 10)

    if prob == 1 then
        SetNewWaypoint(Config.DeliveryLoc1)
        ExportDeliveryTarget1()
    elseif prob == 2 then
        SetNewWaypoint(Config.DeliveryLoc2)
        ExportDeliveryTarget2()
    elseif prob == 3 then
        SetNewWaypoint(Config.DeliveryLoc3)
        ExportDeliveryTarget3()
    elseif prob == 4 then
        SetNewWaypoint(Config.DeliveryLoc4)
        ExportDeliveryTarget4()
    elseif prob == 5 then
        SetNewWaypoint(Config.DeliveryLoc5)
        ExportDeliveryTarget5()
    elseif prob == 6 then
        SetNewWaypoint(Config.DeliveryLoc6)
        ExportDeliveryTarget6()
    elseif prob == 7 then
        SetNewWaypoint(Config.DeliveryLoc7)
        ExportDeliveryTarget7()
    elseif prob == 8 then
        SetNewWaypoint(Config.DeliveryLoc8)
        ExportDeliveryTarget8()
    elseif prob == 9 then
        SetNewWaypoint(Config.DeliveryLoc9)
        ExportDeliveryTarget9()
    elseif prob == 10 then
        SetNewWaypoint(Config.DeliveryLoc10)
        ExportDeliveryTarget10()
    end
end

function ExportDeliveryTarget1()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc1, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "kk-speedyjob:client:BaterPorta",
            icon = "far fa-box",
            label = "Почукай",
            item = "delivery_box",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget2()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc2, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "kk-speedyjob:client:BaterPorta",
            icon = "far fa-box",
            label = "Почукай",
            item = "delivery_box",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget3()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc3, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "kk-speedyjob:client:BaterPorta",
            icon = "far fa-box",
            label = "Почукай",
            item = "delivery_box",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget4()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc4, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "kk-speedyjob:client:BaterPorta",
            icon = "far fa-box",
            label = "Почукай",
            item = "delivery_box",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget5()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc5, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "kk-speedyjob:client:BaterPorta",
            icon = "far fa-box",
            label = "Почукай",
            item = "delivery_box",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget6()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc6, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "kk-speedyjob:client:BaterPorta",
            icon = "far fa-box",
            label = "Почукай",
            item = "delivery_box",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget7()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc7, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "kk-speedyjob:client:BaterPorta",
            icon = "far fa-box",
            label = "Почукай",
            item = "delivery_box",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget8()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc8, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "kk-speedyjob:client:BaterPorta",
            icon = "far fa-box",
            label = "Почукай",
            item = "delivery_box",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget9()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc9, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "kk-speedyjob:client:BaterPorta",
            icon = "far fa-box",
            label = "Почукай",
            item = "delivery_box",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget10()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc10, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "kk-speedyjob:client:BaterPorta",
            icon = "far fa-box",
            label = "Почукай",
            item = "delivery_box",
            },
        },
        distance = 2.5
    })
end
