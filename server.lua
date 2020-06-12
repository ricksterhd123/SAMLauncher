local width = 442.49243 - 430.44125
local length = 2550.03564 - 2542.98430
local height = 19.12007 - 15.18750
--local col = createColSphere(437.04233, 2546.16992, 16.17970, 10)
local col = createColCuboid(430.44125, 2542.98430, 15.18750, width, length, height)
local weaponPickup = getElementsByType("pickup", resourceRoot)[1]

addEventHandler("onResourceStart", root, 
function ()
    
    setGarageOpen(43, true)

    addEventHandler("onPickupSpawn", weaponPickup, function()
        setGarageOpen(43, true)
    end)

    addEventHandler("onColShapeLeave", col, function (e, d)
        local players = getElementsWithinColShape(col, "player")
        if #players <= 0 and not isPickupSpawned(weaponPickup) then
            setGarageOpen(43, false)
        end
    end)

end)