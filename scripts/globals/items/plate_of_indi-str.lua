-----------------------------------------
-- ID: 6076
-- Teaches the spell Indi-STR
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(772)
end

function onItemUse(target)
    target:addSpell(772)
end