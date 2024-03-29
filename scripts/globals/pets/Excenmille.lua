-------------------------------------------------
--  TRUST: Excenmille
--  Magic: Flash, Cure I - IV
--  JA: Sentinel
--  WS: Double Thrust, Leg Sweep, Penta Thrust
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onMobSpawn(mob)
    local lvl = mob:getMainLvl()
    local hpp = mob:getHPP()
    local weaponskill = 0
	local jumpCooldown = 60
	local highJumpCooldown = 120
    local superJumpCooldown = 180
    local angle = getAngle(mob)

	local master = mob:getMaster()
	local excenmille = mob:getID()
    local wsCooldown = 4
    mob:setLocalVar("wsTime",0)
	mob:setLocalVar("jumpTime",0)
	mob:setLocalVar("highJumpTime",0)
	mob:setLocalVar("superJumpTime",0)
    mob:setLocalVar("angonTime",0)
    mob:setLocalVar("angonCooldown",180)

    set2HStats(mob)
    excenmilleTrustPoints(mob)

	mob:addListener("COMBAT_TICK", "EXCENMILLE_JUMP_TICK", function(mob, player, target)
	    local battletime = os.time()
		local jumpTime = mob:getLocalVar("jumpTime")

        if (lvl >= 10 and mob:getTP() >= 300) then
		    if (battletime > jumpTime + jumpCooldown) then
		        mob:useJobAbility(50, target)
			    mob:setLocalVar("jumpTime",battletime)
		    end
        end
	end)

	mob:addListener("COMBAT_TICK", "EXCENMILLE_HIGH_JUMP_TICK", function(mob, player, target)
	    local battletime = os.time()
		local highJumpTime = mob:getLocalVar("highJumpTime")

        if (lvl >= 35 and mob:getTP() >= 500) then
		    if (battletime > highJumpTime + highJumpCooldown) then
		        mob:useJobAbility(51, target)
			    mob:setLocalVar("highJumpTime",battletime)
		    end
        end
	end)

	mob:addListener("COMBAT_TICK", "EXCENMILLE_SUPER_JUMP_TICK", function(mob, player, target)
	    local battletime = os.time()
		local superJumpTime = mob:getLocalVar("superJumpTime")

        if (lvl >= 50 and hpp <= 30) then
		    if (battletime > superJumpTime + superJumpCooldown) then
		        mob:useJobAbility(52, target)
			    mob:setLocalVar("superJumpTime",battletime)
		    end
        end
	end)

	mob:addListener("COMBAT_TICK", "EXCENMILLE_ANGON_TICK", function(mob, player, target)
	    local battletime = os.time()
		local angonTime = mob:getLocalVar("angonTime")
        local angonCooldown = mob:getLocalVar("angonCooldown")

        if (lvl >= 75 and mob:getLocalVar("[TRUST]EXCENMILLE_ANGON") == 1) then
		    if (battletime > angonTime + angonCooldown) then
		        mob:useJobAbility(154, target)
			    mob:setLocalVar("angonTime",battletime)
		    end
        end
	end)

	mob:addListener("COMBAT_TICK", "EXCENMILLE_COMBAT_TICK", function(mob, player, target)
	    trustMeleeMove(mob, player, target, angle)
	    local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (mob:getTP() > 1000 and (battletime > weaponSkillTime + wsCooldown) and mob:getBattleTime() > player:getVar("TrustWSTime") + 30 and not mob:hasPreventActionEffect()) then
		    weaponskill = doExcenmilleWeaponskill(mob)
            mob:setLocalVar("WS_TP",mob:getTP())
			mob:useMobAbility(weaponskill)
            mob:setLocalVar("wsTime",battletime)
            mob:updateHealth()
		end
	end)

end

function onTrade(player, mob, trade)
    printf("Trying trade");
    if (trade:hasItemQty(17701,1)) then
        printf("Good Trade!!!!")
    end
end

function doExcenmilleWeaponskill(mob)
    local wsList = {{60,119}, {49,116}, {40,115}, {1,112}}
    if (mob:getLocalVar("[TRUST]EXCENMILLE_WS") == 1) then
        wsList = {{65,120}, {60,119}, {49,116}, {40,115}, {1,112}}
    end
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