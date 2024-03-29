-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  Mandragora
-- Map1 Position: http://images2.wikia.nocookie.net/__cb20090312004752/ffxi/images/8/84/Win1.jpg
-- Map2 Position: http://images2.wikia.nocookie.net/__cb20090312004839/ffxi/images/6/61/Win2.jpg
-----------------------------------
local ID = require("scripts/zones/Dynamis-Jeuno/IDs")
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Jeuno/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
local fly = mob:getID()
GetMobByID(fly):setDropID(5040); -- Default Drop ID
mob:setMod(dsp.mod.ACC,260);
mob:setMod(dsp.mod.EVA,295);
mob:setMod(dsp.mod.DEF,220);



end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
local vanatime = VanadielHour();
if (vanatime >= 6 and vanatime < 12) then
mob:setMod(dsp.mod.ATTP,-20);
mob:setMod(dsp.mod.MATT,-20);
mob:setMod(dsp.mod.DELAY,-40);
elseif (vanatime >= 12 and vanatime < 18) then
-- Neutral
elseif (vanatime >= 18) then
mob:setMod(dsp.mod.ACC,-30);
mob:setMod(dsp.mod.ATTP,10);
end

end;


-----------------------------------
-- onWeaponskillHit
-----------------------------------
function onWeaponskillHit(mob, attacker, weaponskill)
    local stagger, white, red, blue, yellow = staggerRate(mob)


-- Staggering Function
	local isweak = mob:getLocalVar("WeakenedTrigger");
	local fly = mob:getID()
    if (stagger < math.random(1,100)) then
	    local wsweakness = math.random(1,100);
        if (wsweakness <= white) and (isweak ~= 1) then
            mob:weaknessTrigger(3); -- White Stagger drops 100's  5% of Triggers
            mob:addStatusEffect(dsp.effect.TERROR,1,0,10);
		    local extracurrency = math.random(1,3);
			if (extracurrency == 1) then
				GetMobByID(fly):setDropID(6081);	-- L.Jadeshell
			elseif (extracurrency == 2) then
				GetMobByID(fly):setDropID(6082); -- Montiont
			elseif (extracurrency == 3) then
				GetMobByID(fly):setDropID(6083); -- 100 Byne
			end
			mob:setLocalVar("WeakenedTrigger",1);
        elseif (wsweakness <= blue) and (isweak ~= 1) then
            mob:weaknessTrigger(1); -- Blue Stagger drops Memoirs which grants 4-8 currency
            mob:addStatusEffect(dsp.effect.TERROR,1,0,10);
            GetMobByID(fly):setDropID(6080); -- Miratetes Memoirs
            mob:setLocalVar("WeakenedTrigger",1);
        elseif (wsweakness <= red) and (isweak ~= 1) then
            mob:weaknessTrigger(2); -- Red Stagger drops Pop Items
            mob:addStatusEffect(dsp.effect.TERROR,1,0,10);
            local itemdrop = math.random(1,4);
            if (itemdrop == 1) then
                GetMobByID(fly):setDropID(6084); -- Fiendish Tome 17
            elseif (itemdrop == 2) then
                GetMobByID(fly):setDropID(6085); -- Fiendish Tome 18
            elseif (itemdrop == 3) then
                GetMobByID(fly):setDropID(6086); -- Fiendish Tome 19
            elseif (itemdrop == 4) then
                GetMobByID(fly):setDropID(6087); -- Fiendish Tome 20
            end
            mob:setLocalVar("WeakenedTrigger",1);
        elseif (wsweakness <= yellow) and (isweak ~= 1) then
            mob:weaknessTrigger(0); -- Yellow Stagger Increase Scyld
            mob:addStatusEffect(dsp.effect.TERROR,1,0,10);
            local randomscyld = math.random(10,20);
            if (attack:getObjType() == dsp.Type.TRUST) then
                local master = attacker:getMaster()
                local oldscyld = master:getVar("ScyldMultiplier");
                local newscyld = (randomscyld + oldscyld);
                master:setVar("ScyldMultiplier",newscyld);
                mob:setLocalVar("WeakenedTrigger",1);
                master:PrintToPlayer("You have flyn granted a "..randomscyld.."% scyld bonus.  Total Bonus: "..newscyld.."%.", 0x15);
            else
                local oldscyld = attacker:getVar("ScyldMultiplier");
                local newscyld = (randomscyld + oldscyld);
                attacker:setVar("ScyldMultiplier",newscyld);
                mob:setLocalVar("WeakenedTrigger",1);
                attacker:PrintToPlayer("You have flyn granted a "..randomscyld.."% scyld bonus.  Total Bonus: "..newscyld.."%.", 0x15);
	        end
        end
    end




return 0;


end;

-----------------------------------
-- onMobFight Action
-- Randomly change Resistance based on Time
-----------------------------------
function onMobFight(mob,target)
if (mob:hasStatusEffect(dsp.effect.TERROR)) then
mob:setMod(dsp.mod.SLASHRES,1500);
mob:setMod(dsp.mod.PIERCERES,1500);
mob:setMod(dsp.mod.HTHRES,1500);
elseif (not mob:hasStatusEffect(dsp.effect.TERROR)) then
mob:setMod(dsp.mod.SLASHRES,1000);
mob:setMod(dsp.mod.PIERCERES,1000);
mob:setMod(dsp.mod.HTHRES,1000);
end

local vanatime = VanadielHour();
if (vanatime >= 0 and vanatime < 6) then
local randomTime = math.random(10,25);
local changeTime = mob:getLocalVar("changeTime");
if (mob:getBattleTime() - changeTime > randomTime) then
local changeres = math.random(1,3);

if (changeres == 1) then
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("There is a change in the Monsters behavior.", 0x1C);
end
mob:setMod(dsp.mod.SLASHRES,300);
mob:setMod(dsp.mod.PIERCERES,1000);
mob:setMod(dsp.mod.HTHRES,1500);
mob:setLocalVar("changeTime", mob:getBattleTime());
elseif (changeres == 2) then
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("There is a change in the Monsters behavior.", 0x1C);
end
mob:setMod(dsp.mod.SLASHRES,1000);
mob:setMod(dsp.mod.PIERCERES,1500);
mob:setMod(dsp.mod.HTHRES,300);
mob:setLocalVar("changeTime", mob:getBattleTime());
else
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("There is a change in the Monsters behavior.", 0x1C);
end
mob:setMod(dsp.mod.SLASHRES,1500);
mob:setMod(dsp.mod.PIERCERES,300);
mob:setMod(dsp.mod.HTHRES,1000);
mob:setLocalVar("changeTime", mob:getBattleTime());
end
end
end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player)
	local scyldmult = player:getVar("ScyldMultiplier");
    local duration = 45;
	local attBoost = 15;
	local level = player:getMainLvl();
    local scyld = math.floor((level - 65) * (1 + (scyldmult/100)));
	local stagger = mob:getLocalVar("MonsterStagger");

	if (player:getObjType() == dsp.objType.PC) then
	local randombuff = math.random(1,100)
	if (randombuff >= 50) then
	player:addStatusEffect(dsp.effect.ATTACK_BOOST,attBoost,0,duration);
    player:PrintToPlayer("The monster has endowed you with a temporary Attack Bonus", 0xD);
	elseif (randombuff < 20) then
	local heal = player:getMaxHP();
	local healmp = player:getMaxMP();
	player:addHP(heal);
	player:addMP(healmp);
    player:PrintToPlayer(string.format("%s recovers HP and MP", player:getName()), 0x15);
	end
	player:addCurrency("scyld", scyld);
	player:PrintToPlayer(string.format("%s gains "..scyld.." scyld.", player:getName()), 0x15);
	end
end;
