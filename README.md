BIG THANKS TO SEXAGON2
@discord:sexagon2



1. add this to qb-core/shared/items
```
	--kk-speedyjob
	["delivery_box"]     = {["name"] = "delivery_box", 				    ["label"] = "Delivery Box", 					["weight"] = 1000, 		["type"] = "item", 			["image"] = "delivery_box.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["delivery_recive"]     = {["name"] = "delivery_recive", 				    ["label"] = "Delivery Recive", 					["weight"] = 0, 		["type"] = "item", 			["image"] = "delivery_recive.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

```

Add to qb-target/init.lua:

At Config.Peds:
```
    { --kk-speedyjob
        model = 'a_f_y_rurmeth_01',
        coords = vector4(10.18, -1604.18, 28.37, 221.03),
        gender = 'female',
        freeze = true,
        invincible = false,
        blockevents = false,
    },
```

At Config.TargetModels:
```
    ["deliveryped"] = {
        models = {
            "a_f_y_rurmeth_01",
        },
        options = {
            {
                type = "client",
                event = "kk-speedyjob:client:PedInt",
                icon = "fas fa-envelope", 
                label = "Направи заявка",
            },
            {
                type = "client",
                event = "kk-speedyjob:client:ReceivePayment",
                icon = "fas fa-dolar", 
                label = "Получи надника",
                item = "delivery_recive",
            }
        },
        distance = 2.5,
    },
    ```
    
    # Dependicies
    
    - qb-core - https://github.com/qbcore-framework/qb-core
    - qb-target - https://github.com/qbcore-framework/qb-target
