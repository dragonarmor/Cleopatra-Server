---------------------------------------------------
-- Ranged Attack
-- Deals a ranged attack to a single target.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/trust_utils")

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
        local basemod = 1
        local numhits = 1
        local attmod = 1
        local accmod = 1
        local str_wsc = 0.20
        local dex_wsc = 0
        local agi_wsc = 0.50
        local vit_wsc = 0
        local mnd_wsc = 0



    	local info = TrustPhysicalRangedMove(mob,target,skill,basemod,numhits,attmod,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_ACC_VARIES,1.0,1.5,2.1);

        local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded)

        target:delHP(dmg);
        return dmg;
end
