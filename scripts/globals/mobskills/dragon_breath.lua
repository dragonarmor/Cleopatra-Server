---------------------------------------------
--  Dragon Breath
--
--  Description: Deals Fire damage to enemies within a fan-shaped area.
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Used only by Fafnir, Nidhogg, Cynoprosopi, and Wyrm. Because of the high damage output from Fafnir/Nidhogg/Wyrm, it is usually avoided by
--        standing on (or near) the wyrm's two front feet. Cynoprosopi's breath attack is much less painful.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:isBehind(mob, 48) == true) then
        return 1
    elseif (mob:AnimationSub() ~= 0) then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local size = mob:getLocalVar("PartySize")
    local amount = 1400
    if (size == 0) then
       amount = 1400
    elseif (size < 5) then
        amount = 375
    elseif (size < 11) then
        amount = 500
    elseif (size < 14) then
        amount = 900
    end

    local dmgmod = MobBreathMove(mob, target, 0.2, 1.25, dsp.magic.ele.FIRE, amount)
    local angle = mob:getAngle(target)

    angle = mob:getRotPos() - angle
    dmgmod = dmgmod * ((128-math.abs(angle))/128)
    dmgmod = utils.clamp(dmgmod, 50, amount)

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,dsp.attackType.BREATH,dsp.damageType.FIRE,MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.BREATH, dsp.damageType.FIRE)
    return dmg
end
