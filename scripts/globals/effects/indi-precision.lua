-----------------------------------
--
--  dsp.effect.INDI_PRECISION
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(dsp.mod.ACC, effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    target:forMembersInRange(10, function(member)
        if not member:hasStatusEffect(dsp.effect.INDI_PRECISION) then
            member:addStatusEffect(dsp.effect.ACCURACY_BOOST_II, effect:getPower(), 0, 3)
        end
    end)

end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(dsp.mod.ACC, effect:getPower());
end;