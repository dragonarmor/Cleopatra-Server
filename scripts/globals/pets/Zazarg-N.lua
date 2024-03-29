-------------------------------------------------
--  TRUST: Zazarg
--  Subjob:NIN
--  JA: Dodge, Focus, Chakra
--  WS: Combo, Raging Fists, Howling Fists, Dragon Kick
--      Meteoric Impact
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local lvl = mob:getMainLvl()
    local hp = mob:getHPP()
	local focusCooldown = 120
	local dodgeCooldown = 120
	local chakraCooldown = 180
    local utsuIchiCooldown = 30
    local utsuNiCooldown = 45
    local angle = getAngle(mob)
    local wsCooldown = 4

	mob:setLocalVar("focusTime",0)
	mob:setLocalVar("dodgeTime",0)
	mob:setLocalVar("chakraTime",0)
    mob:setLocalVar("utsuIchiTime",0)
    mob:setLocalVar("utsuNiTime",0)
    mob:setLocalVar("wsTime",0)


    mob:addListener("COMBAT_TICK", "ZAZARG_DISTANCE_TICK", function(mob, player, target)
        trustMeleeMove(mob, player, target, angle)
	    local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown)) then
		    weaponskill = doZazargWeaponskill(mob)
			mob:useMobAbility(weaponskill)
            mob:setLocalVar("wsTime",battletime)
		end
    end)

    mob:addListener("COMBAT_TICK", "ZAZARG_UTSU_TICK", function(mob, player, target)
        local battletime = os.time()
        local utsuIchi = mob:getLocalVar("utsuIchiTime")
        local utsuNi = mob:getLocalVar("utsuNiTime")
        local shadows = mob:getStatusEffect(dsp.effect.COPY_IMAGE)
        local count = 0
        if (shadows ~= nil) then
            count = shadows:getPower()
        else
            count = 0
        end

        if ((battletime > utsuNi + utsuNiCooldown) and lvl >= 37 and (count == nil or count <= 1)) then
            mob:castSpell(339, mob)
            mob:setLocalVar("utsuNiTime",battletime)
        elseif ((battletime > utsuIchi + utsuIchiCooldown) and lvl >= 12 and (count == nil)) then
            mob:castSpell(338, mob)
            mob:setLocalVar("utsuIchiTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "ZAZARG_FOCUS_TICK", function(mob, player, target)
        local battletime = os.time()
        local focusTime = mob:getLocalVar("focusTime")
        if (lvl >= 25) then
            if (battletime > focusTime + focusCooldown) then
                mob:useJobAbility(20, mob)
                mob:setLocalVar("focusTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "ZAZARG_DODGE_TICK", function(mob, player, target)
        local battletime = os.time()
        local dodgeTime = mob:getLocalVar("dodgeTime")
        local hate = enmityCalc(mob, player, target)
        if (lvl >= 15 and hate == 0) then
            if (battletime > dodgeTime + dodgeCooldown) then
                mob:useJobAbility(21, mob)
                mob:setLocalVar("dodgeTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "ZAZARG_CHAKRA_TICK", function(mob, player, target)
        local battletime = os.time()
        local chakraTime = mob:getLocalVar("chakraTime")
        if (lvl >= 35 and hp < 35) then
            if (battletime > chakraTime + chakraCooldown) then
                mob:useJobAbility(20, mob)
                mob:setLocalVar("chakraTime",battletime)
            end
        end
    end)

end

function doZazargWeaponskill(mob)
    local wsList = {{75,2137}, {65,8}, {60,7}, {44,5}, {1,1}}
    local newWsList = {}
	local maxws = 3 -- Maximum number of weaponskills to choose from randomly
	local wscount = 0
	local lvl = mob:getMainLvl()
	local finalWS = 0

	for i = 1, #wsList do
		if (lvl >= wsList[i][1]) then
			table.insert(newWsList, wscount + 1, wsList[i][2])
			wscount = wscount + 1
			if (wscount >= maxws) then
				break
			end
		end
	end

	finalWS = newWsList[math.random(1,#newWsList)]
	return finalWS
end