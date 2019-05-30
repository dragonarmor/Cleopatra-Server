-----------------------------------
--
-- dsp.effect.AGI_BOOST_III
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AGI,effect:getPower())
end

function onEffectTick(target,effect)

end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.AGI,effect:getPower())
end
