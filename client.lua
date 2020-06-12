--[[
    Launches a ProNav guided missile from HS rocket launcher
]]
function launchSAM(creator)
    local projectile = source
    local projectileType = getProjectileType(projectile)
    
    if not creator or not isElement(creator) or not getElementType(creator) == "player" or projectileType ~= 20 then return false end

    local target = getProjectileTarget(projectile)
    local vehicle = getPedOccupiedVehicle(creator)

    if not vehicle and target then
        --local x, y, z = getElementPosition(projectile)
        --setElementPosition(projectile, 0, 0, 100)   -- Switch the old one out for the new & better one.
        if getElementModel(target) == 425 then return false end
        createMissile(creator, target, projectile)
    end
end

addEventHandler("onClientProjectileCreation", root, launchSAM)
