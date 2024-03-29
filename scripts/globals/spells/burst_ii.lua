-----------------------------------------
-- Spell: Burst II
-- Deals lightning damage to an enemy and lowers its resistance against earth.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local spellParams = {}
    spellParams.hasMultipleTargetReduction = false
    spellParams.resistBonus = 1.0
    spellParams.V = 710
    spellParams.V0 = 800
    spellParams.V50 = 900
    spellParams.V100 = 1000
    spellParams.V200 = 1200
    spellParams.M = 2
    spellParams.M0 = 2
    spellParams.M50 = 2
    spellParams.M100 = 2
    spellParams.M200 = 2
    spellParams.I = 780

    if (caster:getMerit(dsp.merit.ANCIENT_MBD) ~= 0) then
        spellParams.AMIIburstBonus = (caster:getMerit(dsp.merit.ANCIENT_MBD) - 1) * 0.03
    end

    if (caster:getMerit(dsp.merit.ANCIENT_MAB) ~= 0) then
        spellParams.AMIImabBonus = (caster:getMerit(dsp.merit.ANCIENT_MAB) - 1) * 0.03
    end

    -- no point in making a separate function for this if the only thing they won't have in common is the name
    handleNinjutsuDebuff(caster,target,spell,30,10,dsp.mod.EARTHRES)

    return doElementalNuke(caster, spell, target, spellParams)
end
