--[[
    Launches a ProNav guided missile from HS rocket launcher
]]
function launchSAM(creator)
    if not creator or not isElement(creator) or not getElementType(creator) == "player" then return false end

    local projectile = source
    local target = getProjectileTarget(projectile)
    local vehicle = getPedOccupiedVehicle(creator)

    -- This assumes that since the player is out of the vehicle and the projectile has a target,
    -- the user must've shot with a HS rocket launcher. Results may vary.

    if not vehicle and target then
        local x, y, z = getElementPosition(projectile)
        setElementPosition(projectile, 0, 0, 100)   -- Switch the old one out for the new & better one.
        createMissile(creator, target, x, y, z)
    end
end

addEventHandler("onClientProjectileCreation", root, launchSAM)
