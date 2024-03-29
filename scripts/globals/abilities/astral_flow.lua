-----------------------------------
-- Ability: Astral Flow
-- Allows avatars to use their full strength and allows summmoning of Odin and Alexander.
-- Obtained: Summoner Level 1
-- Recast Time: 1:00:00
-- Duration: 0:03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    local timer = player:getVar("1HR_Recast")
    timer = timer * 90
    ability:setRecast(ability:getRecast() - timer)
    return 0,0
end

function onUseAbility(player,target,ability)
    player:addStatusEffect(dsp.effect.ASTRAL_FLOW,1,0,180)

    return dsp.effect.ASTRAL_FLOW
end