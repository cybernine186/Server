MonkACBonusWeight              = RuleI.Get(Rule.MonkACBonusWeight);
NPCACFactor                    = RuleR.Get(Rule.NPCACFactor);
OldACSoftcapRules              = RuleB.Get(Rule.OldACSoftcapRules);
ClothACSoftcap                 = RuleI.Get(Rule.ClothACSoftcap);
LeatherACSoftcap               = RuleI.Get(Rule.LeatherACSoftcap);
MonkACSoftcap                  = RuleI.Get(Rule.MonkACSoftcap);
ChainACSoftcap                 = RuleI.Get(Rule.ChainACSoftcap);
PlateACSoftcap                 = RuleI.Get(Rule.PlateACSoftcap);
AAMitigationACFactor           = RuleR.Get(Rule.AAMitigationACFactor);
WarriorACSoftcapReturn         = RuleR.Get(Rule.WarriorACSoftcapReturn);
KnightACSoftcapReturn          = RuleR.Get(Rule.KnightACSoftcapReturn);
LowPlateChainACSoftcapReturn   = RuleR.Get(Rule.LowPlateChainACSoftcapReturn);
LowChainLeatherACSoftcapReturn = RuleR.Get(Rule.LowChainLeatherACSoftcapReturn);
CasterACSoftcapReturn          = RuleR.Get(Rule.CasterACSoftcapReturn);
MiscACSoftcapReturn            = RuleR.Get(Rule.MiscACSoftcapReturn);
WarACSoftcapReturn             = RuleR.Get(Rule.WarACSoftcapReturn);
ClrRngMnkBrdACSoftcapReturn    = RuleR.Get(Rule.ClrRngMnkBrdACSoftcapReturn);
PalShdACSoftcapReturn          = RuleR.Get(Rule.PalShdACSoftcapReturn);
DruNecWizEncMagACSoftcapReturn = RuleR.Get(Rule.DruNecWizEncMagACSoftcapReturn);
RogShmBstBerACSoftcapReturn    = RuleR.Get(Rule.RogShmBstBerACSoftcapReturn);
SoftcapFactor                  = RuleR.Get(Rule.SoftcapFactor);
ACthac0Factor                  = RuleR.Get(Rule.ACthac0Factor);
ACthac20Factor                 = RuleR.Get(Rule.ACthac20Factor);
BaseHitChance                  = RuleR.Get(Rule.BaseHitChance);
NPCBonusHitChance              = RuleR.Get(Rule.NPCBonusHitChance);
HitFalloffMinor                = RuleR.Get(Rule.HitFalloffMinor);
HitFalloffModerate             = RuleR.Get(Rule.HitFalloffModerate);
HitFalloffMajor                = RuleR.Get(Rule.HitFalloffMajor);
HitBonusPerLevel               = RuleR.Get(Rule.HitBonusPerLevel);
AgiHitFactor                   = RuleR.Get(Rule.AgiHitFactor);
WeaponSkillFalloff             = RuleR.Get(Rule.WeaponSkillFalloff);
ArcheryHitPenalty              = RuleR.Get(Rule.ArcheryHitPenalty);
UseOldDamageIntervalRules      = RuleB.Get(Rule.UseOldDamageIntervalRules);
CriticalMessageRange           = RuleI.Get(Rule.CriticalDamage);


MeleeBaseCritChance            = 0.0;
ClientBaseCritChance           = 0.0;
BerserkBaseCritChance          = 6.0;
WarBerBaseCritChance           = 3.0;
RogueCritThrowingChance        = 25;
RogueDeadlyStrikeChance        = 80;
RogueDeadlyStrikeMod           = 2;

-- Source Function: Mob::MeleeMitigation()
-- Partial: Rest happens in DoMeleeMitigation
function MeleeMitigation(e)
	if (e.self:IsClient() and e.other:IsClient()) then
		e.IgnoreDefault = true;
		return e;
	end
end

-- Source Function: Mob::MeleeMitigation()
function DoMeleeMitigation(defender, attacker, hit, opts)
	if (defender:IsClient() and attacker:IsClient()) then
		if hit.damage_done <= 0 then
			return hit;
		end

		local aabonuses         = defender:GetAABonuses();
		local itembonuses       = defender:GetItemBonuses();
		local spellbonuses      = defender:GetSpellBonuses();

		local aa_mit            = (aabonuses:CombatStability() + itembonuses:CombatStability() + spellbonuses:CombatStability()) / 100.0;
		local softcap           = (defender:GetSkill(15) + defender:GetLevel()) * SoftcapFactor * (1.0 + aa_mit);
		local mitigation_rating = 0.0;
		local attack_rating     = 0.0;
		local shield_ac         = 0;
		local armor             = 0;
		local weight            = 0.0;
		local monkweight        = MonkACBonusWeight;

		eq.log_combat(
				string.format("[%s] [Mob::MeleeMitigation] Stability Bonuses | AA [%i] Item [%i] Spell [%i]",
						defender:GetCleanName(),
						aabonuses:CombatStability(),
						itembonuses:CombatStability(),
						spellbonuses:CombatStability()
				)
		);

		eq.log_combat(
				string.format("[%s] [Mob::MeleeMitigation] Soft Cap [%i]",
						defender:GetCleanName(),
						softcap
				)
		);

		if defender:IsClient() then
			armor, shield_ac = GetRawACNoShield(defender);
			weight           = defender:CastToClient():CalcCurrentWeight() / 10;
		elseif defender:IsNPC() then
			armor            = defender:CastToNPC():GetRawAC();
			local PetACBonus = 0;

			if not defender:IsPet() then
				armor = armor / NPCACFactor;
			end

			local owner = Mob();
			if defender:IsPet() then
				owner = defender:GetOwner();
			elseif defender:CastToNPC():GetSwarmOwner() ~= 0 then
				local entity_list = eq.get_entity_list();
				owner             = entity_list:GetMobID(defender:CastToNPC():GetSwarmOwner());
			end

			if owner.valid then
				PetACBonus = owner:GetAABonuses():PetMeleeMitigation() + owner:GetItemBonuses():PetMeleeMitigation() + owner:GetSpellBonuses():PetMeleeMitigation();
			end

			armor = armor + defender:GetSpellBonuses():AC() + defender:GetItemBonuses():AC() + PetACBonus + 1;
		end

		if (opts ~= nil) then
			armor = armor * (1.0 - opts.armor_pen_percent);
			armor = armor - opts.armor_pen_flat;
		end

		local defender_class = defender:GetClass();
		if OldACSoftcapRules then
			if defender_class == Class.WIZARD or defender_class == Class.MAGICIAN or defender_class == Class.NECROMANCER or defender_class == Class.ENCHANTER then
				softcap = ClothACSoftcap;
			elseif defender_class == Class.MONK and weight <= monkweight then
				softcap = MonkACSoftcap;
			elseif defender_class == Class.DRUID or defender_class == Class.BEASTLORD or defender_class == Class.MONK then
				softcap = LeatherACSoftcap;
			elseif defender_class == Class.SHAMAN or defender_class == Class.ROGUE or defender_class == Class.BERSERKER or defender_class == Class.RANGER then
				softcap = ChainACSoftcap;
			else
				softcap = PlateACSoftcap;
			end
		end

		softcap = softcap + shield_ac;
		armor   = armor + shield_ac;

		if OldACSoftcapRules then
			softcap = softcap + (softcap * (aa_mit * AAMitigationACFactor));
		end

		if armor > softcap then
			local softcap_armor = armor - softcap;
			if OldACSoftcapRules then
				if defender_class == Class.WARRIOR then
					softcap_armor = softcap_armor * WarriorACSoftcapReturn;
				elseif defender_class == Class.SHADOWKNIGHT or defender_class == Class.PALADIN or (defender_class == Class.MONK and weight <= monkweight) then
					softcap_armor = softcap_armor * KnightACSoftcapReturn;
				elseif defender_class == Class.CLERIC or defender_class == Class.BARD or defender_class == Class.BERSERKER or defender_class == Class.ROGUE or defender_class == Class.SHAMAN or defender_class == Class.MONK then
					softcap_armor = softcap_armor * LowPlateChainACSoftcapReturn;
				elseif defender_class == Class.RANGER or defender_class == Class.BEASTLORD then
					softcap_armor = softcap_armor * LowChainLeatherACSoftcapReturn;
				elseif defender_class == Class.WIZARD or defender_class == Class.MAGICIAN or defender_class == Class.NECROMANCER or defender_class == Class.ENCHANTER or defender_class == Class.DRUID then
					softcap_armor = softcap_armor * CasterACSoftcapReturn;
				else
					softcap_armor = softcap_armor * MiscACSoftcapReturn;
				end
			else
				if defender_class == Class.WARRIOR then
					softcap_armor = softcap_armor * WarACSoftcapReturn;
				elseif defender_class == Class.PALADIN or defender_class == Class.SHADOWKNIGHT then
					softcap_armor = softcap_armor * PalShdACSoftcapReturn;
				elseif defender_class == Class.CLERIC or defender_class == Class.RANGER or defender_class == Class.MONK or defender_class == Class.BARD then
					softcap_armor = softcap_armor * ClrRngMnkBrdACSoftcapReturn;
				elseif defender_class == Class.DRUID or defender_class == Class.NECROMANCER or defender_class == Class.WIZARD or defender_class == Class.ENCHANTER or defender_class == Class.MAGICIAN then
					softcap_armor = softcap_armor * DruNecWizEncMagACSoftcapReturn;
				elseif defender_class == Class.ROGUE or defender_class == Class.SHAMAN or defender_class == Class.BEASTLORD or defender_class == Class.BERSERKER then
					softcap_armor = softcap_armor * RogShmBstBerACSoftcapReturn;
				else
					softcap_armor = softcap_armor * MiscACSoftcapReturn;
				end
			end

			armor = softcap + softcap_armor;
		end

		local mitigation_rating;
		if defender_class == Class.WIZARD or defender_class == Class.MAGICIAN or defender_class == Class.NECROMANCER or defender_class == Class.ENCHANTER then
			mitigation_rating = ((defender:GetSkill(Skill.Defense) + defender:GetItemBonuses():HeroicAGI() / 10) / 4.0) + armor + 1;
		else
			mitigation_rating = ((defender:GetSkill(Skill.Defense) + defender:GetItemBonuses():HeroicAGI() / 10) / 3.0) + (armor * 1.333333) + 1;
		end

		mitigation_rating = mitigation_rating * 0.847;

		local attack_rating;
		if attacker:IsClient() then
			attack_rating = (attacker:CastToClient():CalcATK() + ((attacker:GetSTR() - 66) * 0.9) + (attacker:GetSkill(Skill.Offense) * 1.345));
		else
			attack_rating = (attacker:GetATK() + (attacker:GetSkill(Skill.Offense) * 1.345) + ((attacker:GetSTR() - 66) * 0.9));
		end

		eq.log_combat(
				string.format("[%s] [Mob::MeleeMitigation] Attack Rating [%02f] Mitigation Rating [%02f] Damage [%i]",
						defender:GetCleanName(),
						attack_rating,
						mitigation_rating,
						hit.damage_done
				)
		);

		hit.damage_done = hit.damage_done;

		if hit.damage_done < 0 then
			hit.damage_done = 0;
		end

		eq.log_combat(
				string.format("[%s] [Mob::MeleeMitigation] Final Damage [%i]",
						defender:GetCleanName(),
						hit.damage_done
				)
		);

		return hit;
	end
end

function CheckHitChance(e)
	local other       = e.self;
	local self        = e.other;
	local attacker    = self;
	local defender    = other;
	local owner    = Mob();
	e.IgnoreDefault   = true;
	if (self:IsClient() and other:IsClient()) then
		return CheckHitChancePvP(e);
	end
	if (other:IsClient() and attacker:IsPet()) then
	owner = attacker:GetOwner();
	end
	if (owner.valid and owner:IsClient()) then
		return CheckHitChancePvPPet(e);
	end
	-- PvE and EvE checkhitchance logic here
end

function CheckHitChancePvPPet(e)
	local chancetohit = BaseHitChance;
	local defender    = other;
	local attacker    = self;
	local owner       = Mob();
	local other = e.self;
	local self = e.other;
	local hitBonus       = 0;
	e.IgnoreDefault   = true;

	if (self:IsPet()) then
		chancetohit = 60;
	end

	if (other:CastToClient():IsSitting()) then
		chancetohit = 100;
	end

	local tohit_roll = Random.Real(0, 100);

	eq.log_combat(
			string.format("[%s] [CheckHitChancePvPPet] Chance [%i] ToHitRoll [%i] Hit? [%s]",
					e.self:GetCleanName(),
					chancetohit,
					tohit_roll,
					(tohit_roll <= chancetohit) and "true" or "false"
			)
	);

	if (chancetohit > 1000 or chancetohit < -1000) then
	elseif (chancetohit > 95) then
		chancetohit = 95;
	elseif (chancetohit < 5) then
		chancetohit = 5;
	end

	if (tohit_roll <= chancetohit) then
		e.ReturnValue = true;
	else
		e.ReturnValue = false;
	end
	return e;
end

function CheckHitChancePvP(e)
	local chancetohit = BaseHitChance;
	local defender    = other;
	local attacker    = self;
	local other = e.self;
	local self = e.other;
	local hitBonus       = 0;
	local agi = other:CastToClient():GetAGI();
	local dex = self:CastToClient():GetDEX();
	local atk = self:CastToClient():GetATK();
	e.IgnoreDefault   = true;

	--Agi hardcap, agility does not help above 185.
	if (agi > 185) then
		agi = 185;
	end

	--Dex hardcap, dexterity does not help hit rate above 225.
	if (dex > 225) then
		dex = 225;
	end

	--Pure Melee PvP Hit chance
	if ((self:GetClass() == Class.WARRIOR or self:GetClass() == Class.ROGUE or self:GetClass() == Class.RANGER or self:GetClass() == Class.MONK) and self:GetLevel() <= 25) then
		chancetohit = 75 + ((self:CastToClient():GetSkill(e.hit.skill)) / 10) + (dex /10) - (agi /10)  - ((other:CastToClient():GetSkill(Skill.Defense)) / 10);
	elseif ((self:GetClass() == Class.WARRIOR or self:GetClass() == Class.ROGUE or self:GetClass() == Class.RANGER or self:GetClass() == Class.MONK) and self:GetLevel() <= 35) then
		chancetohit = 65 + ((self:CastToClient():GetSkill(e.hit.skill)) / 10) + (dex /10) - (agi /10) - ((other:CastToClient():GetSkill(Skill.Defense)) / 10);
	elseif ((self:GetClass() == Class.WARRIOR or self:GetClass() == Class.ROGUE or self:GetClass() == Class.RANGER or self:GetClass() == Class.MONK) and self:GetLevel() <= 60) then
		chancetohit = 65 + ((self:CastToClient():GetSkill(e.hit.skill)) / 10) + (dex /10) - (agi /10) - ((other:CastToClient():GetSkill(Skill.Defense)) / 10);
	end

	--Hybrid and Bard PvP Hit chance
	if ((self:GetClass() == Class.SHADOWKNIGHT or self:GetClass() == Class.PALADIN or self:GetClass() == Class.BARD) and self:GetLevel() <= 25) then
		chancetohit = 65 + ((self:CastToClient():GetSkill(e.hit.skill)) / 10) + (dex /10) - (agi /10)  - ((other:CastToClient():GetSkill(Skill.Defense)) / 10);
	elseif ((self:GetClass() == Class.SHADOWKNIGHT or self:GetClass() == Class.PALADIN or self:GetClass() == Class.BARD) and self:GetLevel() <= 35) then
		chancetohit = 55 + ((self:CastToClient():GetSkill(e.hit.skill)) / 10) + (dex /10) - (agi /10) - ((other:CastToClient():GetSkill(Skill.Defense)) / 10);
	elseif ((self:GetClass() == Class.SHADOWKNIGHT or self:GetClass() == Class.PALADIN or self:GetClass() == Class.BARD) and self:GetLevel() <= 60) then
		chancetohit = 55 + ((self:CastToClient():GetSkill(e.hit.skill)) / 10) + (dex /10) - (agi /10) - ((other:CastToClient():GetSkill(Skill.Defense)) / 10);
	end

	--Priests hit chance
	if ((self:GetClass() == Class.CLERIC or self:GetClass() == Class.SHAMAN or self:GetClass() == Class.DRUID) and self:GetLevel() <= 25) then
		chancetohit = 55 + ((self:CastToClient():GetSkill(e.hit.skill)) / 10) + (dex /10) - (agi /10)  - ((other:CastToClient():GetSkill(Skill.Defense)) / 10);
	elseif ((self:GetClass() == Class.CLERIC or self:GetClass() == Class.SHAMAN or self:GetClass() == Class.DRUID) and self:GetLevel() <= 35) then
		chancetohit = 45 + ((self:CastToClient():GetSkill(e.hit.skill)) / 10) + (dex /10) - (agi /10) - ((other:CastToClient():GetSkill(Skill.Defense)) / 10);
	elseif ((self:GetClass() == Class.CLERIC or self:GetClass() == Class.SHAMAN or self:GetClass() == Class.DRUID) and self:GetLevel() <= 60) then
		chancetohit = 45 + ((self:CastToClient():GetSkill(e.hit.skill)) / 10) + (dex /10) - (agi /10) - ((other:CastToClient():GetSkill(Skill.Defense)) / 10);
	end

	--Int Caster PvP Hit chance
	if ((self:GetClass() == Class.MAGICIAN or self:GetClass() == Class.NECROMANCER or self:GetClass() == Class.ENCHANTER or self:GetClass() == Class.WIZARD) and self:GetLevel() <= 25) then
		chancetohit = 45 + ((self:CastToClient():GetSkill(e.hit.skill)) / 10) + (dex /10) - (agi /10)  - ((other:CastToClient():GetSkill(Skill.Defense)) / 10);
	elseif ((self:GetClass() == Class.MAGICIAN or self:GetClass() == Class.NECROMANCER or self:GetClass() == Class.ENCHANTER or self:GetClass() == Class.WIZARD) and self:GetLevel() <= 35) then
		chancetohit = 35 + ((self:CastToClient():GetSkill(e.hit.skill)) / 10) + (dex /10) - (agi /10) - ((other:CastToClient():GetSkill(Skill.Defense)) / 10);
	elseif ((self:GetClass() == Class.MAGICIAN or self:GetClass() == Class.NECROMANCER or self:GetClass() == Class.ENCHANTER or self:GetClass() == Class.WIZARD) and self:GetLevel() <= 60) then
		chancetohit = 35 + ((self:CastToClient():GetSkill(e.hit.skill)) / 10) + (dex /10) - (agi /10) - ((other:CastToClient():GetSkill(Skill.Defense)) / 10);
	end

	chancetohit = chancetohit + (atk /30);

	local tohit_roll = Random.Real(0, 100);

	if (self:FindBuff(4505) or self:FindBuff(4501) or self:FindBuff(4672)) then
		chancetohit = chancetohit + 20;
	end

	if (other:FindBuff(4503) or other:FindBuff(4670) or other:FindBuff(4515) or other:FindBuff(4515)) then
		chancetohit = chancetohit - 25;
	end

	eq.log_combat(
			string.format("[%s] [CheckHitChancePvP] Chance [%i] ToHitRoll [%i] Hit? [%s]",
					e.self:GetCleanName(),
					chancetohit,
					tohit_roll,
					(tohit_roll <= chancetohit) and "true" or "false"
			)
	);

	if (chancetohit > 1000 or chancetohit < -1000) then
		elseif (chancetohit > 95) then
		chancetohit = 95;
		elseif (chancetohit < 5) then
			chancetohit = 5;
	end

	if (other:FindBuff(4502)) then
		chancetohit = chancetohit - 1000;
	end

	--If a player is sitting in PvP they will be hit 100% of the time.
	if (other:CastToClient():IsSitting()) then
		chancetohit = 100;
	end

	if (tohit_roll <= chancetohit) then
		e.ReturnValue = true;
	else
		e.ReturnValue = false;
	end
	return e;
end

-- Source Function: Mob::TryCriticalHit()
function TryCriticalHit(e)
	e.IgnoreDefault = true;

	local self      = e.self;
	local defender  = e.other;

	if (e.hit.damage_done < 1 or defender.null) then
		return e;
	end

	if ((self:IsPet() and self:GetOwner():IsClient()) or (self:IsNPC() and self:CastToNPC():GetSwarmOwner() ~= 0)) then
		e.hit = TryPetCriticalHit(self, defender, e.hit);
		return e;
	end

	if (self:IsPet() and self:GetOwner().valid and self:GetOwner():IsBot()) then
		e.hit = TryPetCriticalHit(self, defender, e.hit);
		return e;
	end

	local critChance   = 0.0;
	local IsBerskerSPA = false;
	local aabonuses    = self:GetAABonuses();
	local itembonuses  = self:GetItemBonuses();
	local spellbonuses = self:GetSpellBonuses();
	local entity_list  = eq.get_entity_list();

	if (defender:GetBodyType() == BT.Undead or defender:GetBodyType() == BT.SummonedUndead or defender:GetBodyType() == BT.Vampire) then
		local SlayRateBonus = aabonuses:SlayUndead(0) + itembonuses:SlayUndead(0) + spellbonuses:SlayUndead(0);
		if (SlayRateBonus > 0) then
			local slayChance = SlayRateBonus / 10000.0;
			if (Random.RollReal(slayChance)) then
				local SlayDmgBonus = aabonuses:SlayUndead(1) + itembonuses:SlayUndead(1) + spellbonuses:SlayUndead(1);
				e.hit.damage_done  = (e.hit.damage_done * SlayDmgBonus * 2.25) / 100;

				if (self:GetGender() == 1) then
					entity_list:FilteredMessageClose(self, false, CriticalMessageRange, MT.CritMelee, Filter.MeleeCrits, string.format('%s\'s holy blade cleanses her target! (%d)', self:GetCleanName(), e.hit.damage_done));
				else
					entity_list:FilteredMessageClose(self, false, CriticalMessageRange, MT.CritMelee, Filter.MeleeCrits, string.format('%s\'s holy blade cleanses his target! (%d)', self:GetCleanName(), e.hit.damage_done));
				end

				return e;
			end
		end
	end

	critChance = critChance + MeleeBaseCritChance;

	if (self:IsClient()) then
		critChance = critChance + ClientBaseCritChance;

		if (spellbonuses:BerserkSPA() or itembonuses:BerserkSPA() or aabonuses:BerserkSPA()) then
			IsBerskerSPA = true;
		end

		if (((self:GetClass() == Class.WARRIOR or self:GetClass() == Class.BERSERKER) and self:GetLevel() >= 12) or IsBerskerSPA) then
			if (self:IsBerserk() or IsBerskerSPA) then
				critChance = critChance + BerserkBaseCritChance;
			else
				critChance = critChance + WarBerBaseCritChance;
			end
		end
	end

	local deadlyChance = 0;
	local deadlyMod    = 0;
	if (e.hit.skill == Skill.Archery and self:GetClass() == Class.RANGER and self:GetSkill(Skill.Archery) >= 65) then
		critChance = critChance + 6;
	end

	if (e.hit.skill == Skill.Throwing and self:GetClass() == Class.ROGUE and self:GetSkill(Skill.Throwing) >= 65) then
		critChance   = critChance + RogueCritThrowingChance;
		deadlyChance = RogueDeadlyStrikeChance;
		deadlyMod    = RogueDeadlyStrikeMod;
	end

	local CritChanceBonus = GetCriticalChanceBonus(self, e.hit.skill);

	if (CritChanceBonus > 0 or critChance > 0) then
		if (self:GetDEX() <= 255) then
			critChance = critChance + (self:GetDEX() / 125.0);
		elseif (self:GetDEX() > 255) then
			critChance = critChance + ((self:GetDEX() - 255) / 500.0) + 2.0;
		end
		critChance = critChance + (critChance * CritChanceBonus / 100.0);
	end

	if (opts ~= nil) then
		critChance = critChance * opts.crit_percent;
		critChance = critChance + opts.crit_flat;
	end

	eq.log_combat(
			string.format("[%s] [Mob::TryCriticalHit] CritChance [%i] CritChanceBonus [%i] Dex [%i] Post-Dex-Block",
					e.self:GetCleanName(),
					critChance,
					CritChanceBonus,
					e.self:GetDEX()
			)
	);

	if (critChance > 0) then

		critChance = critChance / 100;

		if (Random.RollReal(critChance)) then
			local critMod             = 200;
			local crip_success        = false;
			local CripplingBlowChance = GetCrippBlowChance(self);

			if (CripplingBlowChance > 0 or (self:IsBerserk() or IsBerskerSPA)) then
				if (not self:IsBerserk() and not IsBerskerSPA) then
					critChance = critChance * (CripplingBlowChance / 100.0);
				end

				if ((self:IsBerserk() or IsBerskerSPA) or Random.RollReal(critChance)) then
					critMod      = 400;
					crip_success = true;
				end
			end

			critMod = critMod + GetCritDmgMod(self, e.hit.skill) * 2;

			eq.log_combat(
					string.format("[%s] [Mob::TryCriticalHit] CritChance [%i] CritMod [%i] GetCritDmgMod [%i] CripSuccess [%s]",
							e.self:GetCleanName(),
							critChance,
							critMod,
							GetCritDmgMod(self, e.hit.skill),
							(crip_success) and "true" or "false"
					)
			);

			e.hit.damage_done   = e.hit.damage_done * critMod / 100;

			local deadlySuccess = false;
			if (deadlyChance > 0 and Random.RollReal(deadlyChance / 100.0)) then
				if (self:BehindMob(defender, self:GetX(), self:GetY())) then
					e.hit.damage_done = e.hit.damage_done * deadlyMod;
					deadlySuccess     = true;
				end
			end

			if (crip_success) then
				entity_list:FilteredMessageClose(self, false, CriticalMessageRange, MT.CritMelee, Filter.MeleeCrits, string.format('%s lands a Crippling Blow! (%d)', self:GetCleanName(), e.hit.damage_done));
				if (defender:GetLevel() <= 55 and not defender:GetSpecialAbility(SpecialAbility.unstunable)) then
					defender:Emote("staggers.");
					defender:Stun(0);
				end
			elseif (deadlySuccess) then
				entity_list:FilteredMessageClose(self, false, CriticalMessageRange, MT.CritMelee, Filter.MeleeCrits, string.format('%s scores a Deadly Strike! (%d)', self:GetCleanName(), e.hit.damage_done));
			else
				entity_list:FilteredMessageClose(self, false, CriticalMessageRange, MT.CritMelee, Filter.MeleeCrits, string.format('%s scores a critical hit! (%d)', self:GetCleanName(), e.hit.damage_done));
			end
		end
	end

	return e;
end

-- Source Function: Mob::TryPetCriticalHit()
function TryPetCriticalHit(self, defender, hit)
	if (hit.damage_done < 1) then
		return hit;
	end

	local owner      = Mob();
	local critChance = MeleeBaseCritChance;
	local critMod    = 163;

	if (self:IsPet()) then
		owner = self:GetOwner();
	elseif (self:IsNPC() and self:CastToNPC():GetSwarmOwner()) then
		local entity_list = eq.get_entity_list();
		owner             = entity_list:GetMobID(self:CastToNPC():GetSwarmOwner());
	else
		return hit;
	end

	if (owner.null) then
		return hit;
	end

	local CritPetChance   = owner:GetAABonuses():PetCriticalHit() + owner:GetItemBonuses():PetCriticalHit() + owner:GetSpellBonuses():PetCriticalHit();
	local CritChanceBonus = GetCriticalChanceBonus(self, hit.skill);

	eq.log_combat(
			string.format("[%s] [Mob::TryPetCriticalHit] CritPetChance [%i] CritChanceBonus [%i] | Bonuses AA [%i] Item [%i] Spell [%i]",
					self:GetCleanName(),
					CritPetChance,
					CritChanceBonus,
					owner:GetAABonuses():PetCriticalHit(),
					owner:GetItemBonuses():PetCriticalHit(),
					owner:GetSpellBonuses():PetCriticalHit()
			)
	);

	if (CritPetChance or critChance) then
		critChance = critChance + CritPetChance;
		critChance = critChance + (critChance * CritChanceBonus / 100.0);

		eq.log_combat(
				string.format("[%s] [Mob::TryPetCriticalHit] critChance [%i] PostCalcs",
						self:GetCleanName(),
						critChance
				)
		);

	end

	if (critChance > 0) then
		critChance = critChance / 100;

		if (Random.RollReal(critChance)) then
			local entity_list = eq.get_entity_list();
			critMod           = critMod + GetCritDmgMod(self, hit.skill) * 2;
			hit.damage_done   = (hit.damage_done * critMod) / 100;

			eq.log_combat(
					string.format("[%s] [Mob::TryPetCriticalHit] critMod [%i] DmgMod [%i] DamageDone [%i]",
							self:GetCleanName(),
							critMod,
							GetCritDmgMod(self, hit.skill),
							hit.damage_done
					)
			);

			entity_list:FilteredMessageClose(
					this,
					false,
					CriticalMessageRange,
					MT.CritMelee,
					Filter.MeleeCrits,
					string.format('%s scores a critical hit! (%d)', self:GetCleanName(), e.hit.damage_done)
			);
		end
	end

	return hit;
end

-- Source Function: Mob::GetCriticalChanceBonus()
function GetCriticalChanceBonus(self, skill)

	local critical_chance = 0;

	local aabonuses       = self:GetAABonuses();
	local itembonuses     = self:GetItemBonuses();
	local spellbonuses    = self:GetSpellBonuses();

	critical_chance       = critical_chance + itembonuses:CriticalHitChance(Skill.HIGHEST_SKILL + 1);
	critical_chance       = critical_chance + spellbonuses:CriticalHitChance(Skill.HIGHEST_SKILL + 1);
	critical_chance       = critical_chance + aabonuses:CriticalHitChance(Skill.HIGHEST_SKILL + 1);
	critical_chance       = critical_chance + itembonuses:CriticalHitChance(skill);
	critical_chance       = critical_chance + spellbonuses:CriticalHitChance(skill);
	critical_chance       = critical_chance + aabonuses:CriticalHitChance(skill);

	eq.log_combat(
			string.format("[%s] [Mob::GetCriticalChanceBonus] Bonuses | Item [%i] Spell [%i] AA [%i] | 2nd Item [%i] Spell [%i] AA [%i] Final Chance [%i]",
					self:GetCleanName(),
					itembonuses:CriticalHitChance(Skill.HIGHEST_SKILL + 1),
					spellbonuses:CriticalHitChance(Skill.HIGHEST_SKILL + 1),
					aabonuses:CriticalHitChance(Skill.HIGHEST_SKILL + 1),
					itembonuses:CriticalHitChance(skill),
					spellbonuses:CriticalHitChance(skill),
					aabonuses:CriticalHitChance(skill),
					critical_chance
			)
	);

	return critical_chance;
end

-- Source Function: Mob::GetCritDmgMob()
function GetCritDmgMod(self, skill)
	local critDmg_mod  = 0;

	local aabonuses    = self:GetAABonuses();
	local itembonuses  = self:GetItemBonuses();
	local spellbonuses = self:GetSpellBonuses();
	critDmg_mod        = critDmg_mod + itembonuses:CritDmgMod(Skill.HIGHEST_SKILL + 1);
	critDmg_mod        = critDmg_mod + spellbonuses:CritDmgMod(Skill.HIGHEST_SKILL + 1);
	critDmg_mod        = critDmg_mod + aabonuses:CritDmgMod(Skill.HIGHEST_SKILL + 1);
	critDmg_mod        = critDmg_mod + itembonuses:CritDmgMod(skill);
	critDmg_mod        = critDmg_mod + spellbonuses:CritDmgMod(skill);
	critDmg_mod        = critDmg_mod + aabonuses:CritDmgMod(skill);

	if (critDmg_mod < -100) then
		critDmg_mod = -100;
	end

	return critDmg_mod;
end

-- Source Function: Mob::GetCrippBlowChance()
function GetCrippBlowChance(self)
	local aabonuses    = self:GetAABonuses();
	local itembonuses  = self:GetItemBonuses();
	local spellbonuses = self:GetSpellBonuses();
	local crip_chance  = itembonuses:CrippBlowChance() + spellbonuses:CrippBlowChance() + aabonuses:CrippBlowChance();

	if (crip_chance < 0) then
		crip_chance = 0;
	end

	return crip_chance;
end

-- Source Function: Mob::GetDamageTable()
function GetDamageTable(attacker, skill)
	return e;
end

-- Source Function: N/A - Not used
function ApplyDamageTable(e)
	e.IgnoreDefault = true;
	return e;
end

function CommonOutgoingHitSuccess(e)

	eq.log_combat(
		string.format("[%s] [Mob::CommonOutgoingHitSuccess] Dmg [%i] SkillDmgTaken [%i] SkillDmgtAmt [%i] FcDmgAmtIncoming [%i] Post DmgCalcs",
				e.self:GetCleanName(),
				e.hit.damage_done,
				e.other:GetSkillDmgTaken(e.hit.skill),
				e.self:GetSkillDmgAmt(e.hit.skill),
				e.other:GetFcDamageAmtIncoming(e.self, 0, true, e.hit.skill)
		)
	);

	--kick and bash damage for NPCS
	if (e.self:IsNPC() or e.self:IsPet()) then
		if (e.hit.skill == 30 or e.hit.skill == 10) then
			mitigationac = e.other:GetAC() / 10;
			if (e.self:GetLevel() < 11) then
				bashdmg = Random.Real(1, 7);
				finaldmg = bashdmg - mitigationac;
				if finaldmg < 1 then
					finaldmg = 1;
				end

				e.hit.damage_done = finaldmg;
				e.IgnoreDefault = true;
				if (e.other:IsClient() and e.other:CastToClient():IsSitting()) then
					maxkick = 7;
					e.hit.damage_done = maxkick;
				end
				e = TryCriticalHit(e);
				return e;
			elseif (e.self:GetLevel() < 21) then
				bashdmg = Random.Real(7, 15);
				finaldmg = bashdmg - mitigationac;
				if finaldmg < 1 then
					finaldmg = 1;
				end

				e.hit.damage_done = finaldmg;
				e.IgnoreDefault = true;
				if (e.other:IsClient() and e.other:CastToClient():IsSitting()) then
					maxkick = 15;
					e.hit.damage_done = maxkick;
				end
				e = TryCriticalHit(e);
				return e;
			elseif (e.self:GetLevel() > 21) then
				bashdmg = Random.Real(7, 27);
				finaldmg = bashdmg - mitigationac;
				if finaldmg < 1 then
					finaldmg = 1;
				end

				e.hit.damage_done = finaldmg;
				e.IgnoreDefault = true;
				if (e.other:IsClient() and e.other:CastToClient():IsSitting()) then
					maxkick = 27;
					e.hit.damage_done = maxkick;
				end
				e = TryCriticalHit(e);
				return e;
			end
		end
	end

	--Client to NPC damage.
	if (e.self:IsClient() and e.other:IsNPC()) then
		if (e.hit.skill == 30 or e.hit.skill == 10) then
			mitigationac = e.other:GetAC() / 10;
			if (e.self:GetLevel() < 11) then
				bashdmg = Random.Real(1, 7);
				e.hit.damage_done = bashdmg - mitigationac;
				e.IgnoreDefault = true;
				if (e.other:IsClient() and e.other:CastToClient():IsSitting()) then
					maxkick = 7;
					e.hit.damage_done = maxkick;
				end
				e = TryCriticalHit(e);
				return e;
			elseif (e.self:GetLevel() < 21) then
				bashdmg = Random.Real(7, 15);
				e.hit.damage_done = bashdmg - mitigationac;
				e.IgnoreDefault = true;
				if (e.other:IsClient() and e.other:CastToClient():IsSitting()) then
					maxkick = 15;
					e.hit.damage_done = maxkick;
				end
				e = TryCriticalHit(e);
				return e;
			elseif (e.self:GetLevel() > 21) then
				bashdmg = Random.Real(7, 27);
				e.hit.damage_done = bashdmg - mitigationac;
				e.IgnoreDefault = true;
				if (e.other:IsClient() and e.other:CastToClient():IsSitting()) then
					maxkick = 27;
					e.hit.damage_done = maxkick;
				end
				e = TryCriticalHit(e);
				return e;
			end
		end

		self = e.self:CastToClient();
		other = e.other:CastToNPC();

		self_weapon = self:GetInventory():GetItem(Slot.Primary);
		off_hand = self:GetInventory():GetItem(Slot.Secondary);
		self_bow = self:GetInventory():GetItem(Slot.Range);
		self_ammo = self:GetInventory():GetItem(Slot.Ammo);
		boots = self:GetInventory():GetItem(Slot.Feet);
		bootsac = boots:GetItem():AC();
		rangedweapondamage = self_bow:GetItem():Damage()
		ammoweapondamage = self_ammo:GetItem():Damage()
		weapondamage = self_weapon:GetItem():Damage()
		offweapondamage = off_hand:GetItem():Damage()
		weaponatk = (self_weapon:GetItem():Attack() /10 )
		strbonus = (self:GetSTR() /12);
		dexbonus = (self:GetDEX() /12);
		playeratkbonus = (self:GetATK() /15);
		defenderac = (e.other:GetAC());
		mitigationac = (defenderac / 10);
		offensivemod = ((self:GetSkill(Skill.Offense) + self:GetSTR()) / 100);
		if (offensivemod < 2) then
			offensivemod = 2;
		end

		--delay and bonus
		wepdelay = self_weapon:GetItem():Delay()
		if (self:GetClass() == Class.WARRIOR or self:GetClass() == Class.ROGUE or self:GetClass() == Class.RANGER or self:GetClass() == Class.MONK or self:GetClass() == Class.SHADOWKNIGHT or self:GetClass() == Class.PALADIN or self:GetClass() == Class.BARD) then
			BasicBonus = ((self:GetLevel() - 25) / 3);
		else
			BasicBonus = 0;
		end
		itemtype = self_weapon:GetItem():ItemType()
		itemtypeoffhand = off_hand:GetItem():ItemType()
	
		--Str Bonus Cap
		if (self:GetLevel() < 11) then
			strbonus = (self:GetSTR() /40)
		elseif (self:GetLevel() > 11 and self:GetLevel() <= 21) then
			strbonus = (self:GetSTR() /25)
		elseif (self:GetLevel() > 21 and self:GetLevel() <= 60) then
			strbonus = (self:GetSTR() /14)
		end
	
		--Dex Bonus Cap
		if (self:GetLevel() < 11) then
			dexbonus = (self:GetDEX() /40)
		elseif (self:GetLevel() > 11 and self:GetLevel() <= 21) then
			dexbonus = (self:GetDEX() /25)
		elseif (self:GetLevel() > 21 and self:GetLevel() <= 60) then
			dexbonus = (self:GetDEX() /14)
		end
	
		--Weapondamage Caps
		if (self:GetLevel() < 11) then
			if (weapondamage > 10) then
				weapondamage = 10;
			end
		elseif (self:GetLevel() < 19) then
			if (weapondamage > 14) then
				weapondamage = 14;
			end
		elseif (self:GetLevel() < 29) then
			if (weapondamage > 30) then
				weapondamage = 30;
			end
		end
	
	
		--Backstab Damage
		if e.hit.skill == 8 then
			if self:GetSTR() > 200 then
				bstabstr = (((self:GetSTR() - 200) / 5) + 200);
			else
				bstabstr = self:GetSTR();
			end
			defenderac = defenderac ;
			attackmod = self:GetATK() / 5;
			backstabmod = 2 + (self:GetSkill(Skill.Backstab) * 0.02 );
			backstabmin = (((weapondamage * backstabmod) * bstabstr) / 100) + attackmod;
			backstabmax = (((self:GetSkill(Skill.Offense) + bstabstr) * (weapondamage * backstabmod)) / 70); 
			backstabdamage = Random.Real(backstabmin, backstabmax);
			e.hit.damage_done = backstabdamage - defenderac;

			if (other:CastToClient():IsSitting()) then
				e.hit.damage_done = backstabmax - defenderac;
			end

			if (self:FindBuff(4676)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
		end
	
		--throwing damage
		if e.hit.skill == 51 then
			bowmindmg = 1;
			bowmaxdmg = (rangedweapondamage * offensivemod)  - mitigationac;
			local damage_roll = Random.Real(bowmindmg, bowmaxdmg);
			local attack_roll = Random.Real(0, (playeratkbonus));
			local dex_roll = Random.Real(0, (dexbonus));
			final_damage = damage_roll + attack_roll + dex_roll;
			if (self:GetLevel() < 11) then
				if (final_damage > 20) then
					final_damage = 20;
				end
			end
			e.hit.damage_done = final_damage;

			if (self:FindBuff(4676)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4675)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4512)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end

		end
	
		--bow damage
		if e.hit.skill == 7 then
			bowmindmg = 1;
			bowmaxdmg = ((rangedweapondamage + ammoweapondamage) * offensivemod)  - mitigationac;
			local damage_roll = Random.Real(bowmindmg, bowmaxdmg);
			local attack_roll = Random.Real(0, (playeratkbonus));
			local dex_roll = Random.Real(0, (dexbonus));
			final_damage = damage_roll + attack_roll + dex_roll;
			if (self:GetLevel() < 11) then
				if (final_damage > 20) then
					final_damage = 20;
				end
			end
			e.hit.damage_done = final_damage;

			--damage discs
			if (self:FindBuff(4676)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4675)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4512)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
			if (self:FindBuff(4506)) then
				e.hit.damage_done = e.hit.damage_done * 2.05;
			end
			
		end
	
		--flying kick damage
		if e.hit.skill == 26 then
			flyingmindmg = 50 + bootsac;
			flyingmaxdmg = flyingmindmg + (self:GetSkill(Skill.FlyingKick) / 2);
			flyingdmg = Random.Real(flyingmindmg, flyingmaxdmg);
			e.hit.damage_done = flyingdmg - mitigationac;

			--damage discs
			if (self:FindBuff(4676)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4675)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4512)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
			
		end
			
		--kick and bash damage
		if e.hit.skill == 30 or e.hit.skill == 10 then
			if (self:CastToClient():GetSkill(Skill.Bash) <= 1 and e.hit.skill == 10) then
			bashdmg = 1;
			finaldmg = bashdmg - mitigationac;
			if finaldmg < 1 then
				finaldmg = 1;
			end
			e.hit.damage_done = finaldmg;
			e.IgnoreDefault = true;
			elseif (self:GetLevel() < 11) then
				bashdmg = Random.Real(1, 7);
				e.hit.damage_done = bashdmg - mitigationac;

				--damage discs
				if (self:FindBuff(4676)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4675)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4512)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4498)) then
					e.hit.damage_done = e.hit.damage_done * 1.35;
				end
				
			elseif (self:GetLevel() < 21) then
				bashdmg = Random.Real(7, 15);
				finaldmg = bashdmg - mitigationac;
				if finaldmg < 1 then
					finaldmg = 1;
				end

				e.hit.damage_done = finaldmg;

				--damage discs
				if (self:FindBuff(4676)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4675)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4512)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4498)) then
					e.hit.damage_done = e.hit.damage_done * 1.35;
				end
				
			elseif (self:GetLevel() > 21) then
				bashdmg = Random.Real(7, 27);
				finaldmg = bashdmg - mitigationac;
				if finaldmg < 1 then
					finaldmg = 1;
				end

				e.hit.damage_done = finaldmg;
				--damage discs
				if (self:FindBuff(4676)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4675)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4512)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4498)) then
					e.hit.damage_done = e.hit.damage_done * 1.35;
				end
				
			end
		end
	
	
		--Solves issue where BasicBonus is negative at lower levels lowering minimum damage.
		if BasicBonus < 0 then
			BasicBonus = 0;
		end
	
		--2h bonus calcs
		if (wepdelay <= 27) then
			dmg_bonus = BasicBonus + 1;
		elseif (wepdelay <= 59) then
			dmg_bonus = (BasicBonus * 2) + 1;
		elseif (wepdelay >= 70) then
			dmg_bonus = (BasicBonus * 3) + 1;
		end
	
		--Monk hand to hand damage
		if e.hit.skill == 28 and self:GetClass() == Class.MONK then
			if self:GetLevel() <= 4 then
				weapondamage = 4;
			elseif self:GetLevel() > 4 and self:GetLevel() <= 9 then
				weapondamage = 5;
			elseif self:GetLevel() > 9 and self:GetLevel() <= 14 then
				weapondamage = 6;
			elseif self:GetLevel() > 14 and self:GetLevel() <= 19 then
				weapondamage = 7;
			elseif self:GetLevel() > 19 and self:GetLevel() <= 24 then
				weapondamage = 8;
			elseif self:GetLevel() > 24 and self:GetLevel() <= 29 then
				weapondamage = 9;
			elseif self:GetLevel() > 29 and self:GetLevel() <= 34 then
				weapondamage = 10;
			elseif self:GetLevel() > 34 and self:GetLevel() <= 39 then
				weapondamage = 11;
			elseif self:GetLevel() > 39 and self:GetLevel() <= 44 then
				weapondamage = 12;
			elseif self:GetLevel() > 45 and self:GetLevel() <= 49 then
				weapondamage = 13;
			elseif self:GetLevel() > 49 and self:GetLevel() <= 60 then
				weapondamage = 14;
			end
		end

		if e.hit.skill == 0 or e.hit.skill == 1 or e.hit.skill == 28 or (e.hit.skill == 36 and itemtype ~= 35) then --1her
			minimumdamage = 1;
			maximumdamage = ((weapondamage * offensivemod) + dmg_bonus)  - mitigationac;

			local damage_roll = Random.Real(minimumdamage, maximumdamage);
			local attack_roll = Random.Real(0, playeratkbonus);
			local str_roll = Random.Real(0, strbonus);
			final_damage = damage_roll + attack_roll + str_roll;
			if (self:GetLevel() < 11) then
				if (final_damage > 20) then
					final_damage = 20;
				end
			end
			final_damage = final_damage;

			if final_damage < 1 then
				final_damage = 1;
			end
			e.hit.damage_done = final_damage;
			
			--damage discs
			if (self:FindBuff(4676)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4675)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4512)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
			
			--mitigation discs
			if (other:FindBuff(4510)) then
				e.hit.damage_done = e.hit.damage_done * .40;
			end
			if (other:FindBuff(4499)) then
				e.hit.damage_done = e.hit.damage_done * .65;
			end
			if (other:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
		end


		if e.hit.skill == 2 or e.hit.skill == 3 or (e.hit.skill == 36 and itemtype == 35) then --2her
			minimumdamage = 1;
			maximumdamage = ((weapondamage * offensivemod) + dmg_bonus)  - mitigationac;
			local damage_roll = Random.Real(minimumdamage, maximumdamage);
			local attack_roll = Random.Real(0, (playeratkbonus));
			local str_roll = Random.Real(0, (strbonus));
			final_damage = damage_roll + attack_roll + str_roll;

			if (self:GetLevel() < 11) then
				if (final_damage > 20) then
					final_damage = 20;
				end
			end
			final_damage = final_damage;
			if final_damage < 1 then
				final_damage = 1;
			end
			e.hit.damage_done = final_damage;
			
		
			--damage discs
			if (self:FindBuff(4676)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4675)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4512)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
			
			--mitigation discs
			if (other:FindBuff(4510)) then
				e.hit.damage_done = e.hit.damage_done * .40;
			end
			if (other:FindBuff(4499)) then
				e.hit.damage_done = e.hit.damage_done * .65;
			end
			if (other:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
		end
	e = TryCriticalHit(e);
	e.IgnoreDefault = true;
	return e;
	end

	--Client to Client Melee Damage
	if (e.self:IsClient() and e.other:IsClient()) then
		self = e.self:CastToClient();
		other = e.other:CastToClient();

		self_weapon = self:GetInventory():GetItem(Slot.Primary);
		off_hand = self:GetInventory():GetItem(Slot.Secondary);
		self_bow = self:GetInventory():GetItem(Slot.Range);
		self_ammo = self:GetInventory():GetItem(Slot.Ammo);
		boots = self:GetInventory():GetItem(Slot.Feet);
		bootsac = boots:GetItem():AC();
		rangedweapondamage = self_bow:GetItem():Damage()
		ammoweapondamage = self_ammo:GetItem():Damage()
		weapondamage = self_weapon:GetItem():Damage()
		offweapondamage = off_hand:GetItem():Damage()
		weaponatk = (self_weapon:GetItem():Attack() /10 )
		strbonus = (self:GetSTR() /12);
		dexbonus = (self:GetDEX() /12);
		playeratkbonus = (self:GetATK() /15);
		defenderac = (e.other:GetDisplayAC());
		mitigationac = (defenderac / 75);
		offensivemod = ((self:GetSkill(Skill.Offense) + self:GetSTR()) / 100);

		--delay and bonus
		wepdelay = self_weapon:GetItem():Delay()
		if (self:GetClass() == Class.WARRIOR or self:GetClass() == Class.ROGUE or self:GetClass() == Class.RANGER or self:GetClass() == Class.MONK or self:GetClass() == Class.SHADOWKNIGHT or self:GetClass() == Class.PALADIN or self:GetClass() == Class.BARD) then
			BasicBonus = ((self:GetLevel() - 25) / 3);
		else
			BasicBonus = 0;
		end
		itemtype = self_weapon:GetItem():ItemType()
		itemtypeoffhand = off_hand:GetItem():ItemType()
	
		--Str Bonus Cap
		if (self:GetLevel() < 11) then
			strbonus = (self:GetSTR() /40)
		elseif (self:GetLevel() > 11 and self:GetLevel() <= 21) then
			strbonus = (self:GetSTR() /25)
		elseif (self:GetLevel() > 21 and self:GetLevel() <= 60) then
			strbonus = (self:GetSTR() /14)
		end
	
		--Dex Bonus Cap
		if (self:GetLevel() < 11) then
			dexbonus = (self:GetDEX() /40)
		elseif (self:GetLevel() > 11 and self:GetLevel() <= 21) then
			dexbonus = (self:GetDEX() /25)
		elseif (self:GetLevel() > 21 and self:GetLevel() <= 60) then
			dexbonus = (self:GetDEX() /14)
		end
	
		--AC scaling by level (avoids twinking)
		if (self:GetLevel() < 11) then
			if (mitigationac > 2) then
				mitigationac = 2;
			end
		elseif (self:GetLevel() < 19) then
			if (mitigationac > 4) then
				mitigationac = 4;
			end
		elseif (self:GetLevel() < 29) then
			if (mitigationac > 6) then
				mitigationac = 6;
			end
		end
	
		--Weapondamage Caps
		if (self:GetLevel() < 11) then
			if (weapondamage > 10) then
				weapondamage = 10;
			end
		elseif (self:GetLevel() < 19) then
			if (weapondamage > 14) then
				weapondamage = 14;
			end
		elseif (self:GetLevel() < 29) then
			if (weapondamage > 30) then
				weapondamage = 30;
			end
		end
	
	
		--Backstab Damage
		if e.hit.skill == 8 then
			if self:GetSTR() > 200 then
				bstabstr = (((self:GetSTR() - 200) / 5) + 200);
			else
				bstabstr = self:GetSTR();
			end
			attackmod = self:GetATK() / 5;
			backstabmod = 2 + (self:GetSkill(Skill.Backstab) * 0.02 );
			backstabmin = (((weapondamage * backstabmod) * bstabstr) / 100) + attackmod;
			backstabmax = (((self:GetSkill(Skill.Offense) + bstabstr) * (weapondamage * backstabmod)) / 70); 
			backstabdamage = Random.Real(backstabmin, backstabmax);

			backstabac = defenderac / 75;
			e.hit.damage_done = backstabdamage - backstabac;

			if (other:CastToClient():IsSitting()) then
				e.hit.damage_done = backstabmax - backstabac;
			end

			if (self:FindBuff(4676)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end

			if (other:FindBuff(4510)) then
				e.hit.damage_done = e.hit.damage_done * .40;
			end

			if (other:FindBuff(4499)) then
				e.hit.damage_done = e.hit.damage_done * .65;
			end

			if (other:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
		end
	
		--throwing damage
		if e.hit.skill == 51 then
			bowmindmg = 1;
			bowmaxdmg = (rangedweapondamage * offensivemod)  - mitigationac;
			local damage_roll = Random.Real(bowmindmg, bowmaxdmg);
			local attack_roll = Random.Real(0, (playeratkbonus));
			local dex_roll = Random.Real(0, (dexbonus));
			final_damage = damage_roll + attack_roll + dex_roll;
			if (self:GetLevel() < 11) then
				if (final_damage > 20) then
					final_damage = 20;
				end
			end
			e.hit.damage_done = final_damage;

			if (other:CastToClient():IsSitting()) then
				e.hit.damage_done = bowmaxdmg;
			end

			if (self:FindBuff(4676)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4675)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4512)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end


			if (other:FindBuff(4510)) then
				e.hit.damage_done = e.hit.damage_done * .40;
			end

			if (other:FindBuff(4499)) then
				e.hit.damage_done = e.hit.damage_done * .65;
			end

			if (other:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
		end
	
		--bow damage
		if e.hit.skill == 7 then
			bowmindmg = 1;
			bowmaxdmg = ((rangedweapondamage + ammoweapondamage) * offensivemod)  - mitigationac;
			local damage_roll = Random.Real(bowmindmg, bowmaxdmg);
			local attack_roll = Random.Real(0, (playeratkbonus));
			local dex_roll = Random.Real(0, (dexbonus));
			final_damage = damage_roll + attack_roll + dex_roll;

			if (self:GetLevel() < 11) then
				if (final_damage > 20) then
					final_damage = 20;
				end
			end
			e.hit.damage_done = final_damage;
			if (other:CastToClient():IsSitting()) then
				e.hit.damage_done = bowmaxdmg;
			end

			--damage discs
			if (self:FindBuff(4676)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4675)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4512)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
			if (self:FindBuff(4506)) then
				e.hit.damage_done = e.hit.damage_done * 2.05;
			end
			
			--mitigation discs
			if (other:FindBuff(4510)) then
				e.hit.damage_done = e.hit.damage_done * .40;
			end
			if (other:FindBuff(4499)) then
				e.hit.damage_done = e.hit.damage_done * .65;
			end
			if (other:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
		end
	
		--flying kick damage
		if e.hit.skill == 26 then
			flyingmindmg = 50 + bootsac;
			flyingmaxdmg = flyingmindmg + (self:GetSkill(Skill.FlyingKick) / 2);
			flyingdmg = Random.Real(flyingmindmg, flyingmaxdmg);
			e.hit.damage_done = flyingdmg - mitigationac;

			if (other:CastToClient():IsSitting()) then
				e.hit.damage_done = flyingmaxdmg;
			end

			--damage discs
			if (self:FindBuff(4676)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4675)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4512)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
			
			--mitigation discs
			if (other:FindBuff(4510)) then
				e.hit.damage_done = e.hit.damage_done * .40;
			end
			if (other:FindBuff(4499)) then
				e.hit.damage_done = e.hit.damage_done * .65;
			end
			if (other:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
		end
			
		--kick and bash damage
		if e.hit.skill == 30 or e.hit.skill == 10 then
			if (self:CastToClient():GetSkill(Skill.Bash) <= 1 and e.hit.skill == 10) then
			bashdmg = 1;
			finaldmg = bashdmg - mitigationac;
			if finaldmg < 1 then
				finaldmg = 1;
			end
			e.hit.damage_done = finaldmg;
			e.IgnoreDefault = true;
			if (other:CastToClient():IsSitting()) then
				maxkick = 1;
				e.hit.damage_done = maxkick;
			end
			elseif (self:GetLevel() < 11) then
				bashdmg = Random.Real(1, 7);
				
				finaldmg = bashdmg - mitigationac;
				if finaldmg < 1 then
					finaldmg = 1;
				end

				e.hit.damage_done = finaldmg;

				if (other:CastToClient():IsSitting()) then
					maxkick = 7;
					e.hit.damage_done = maxkick;
				end

				--damage discs
				if (self:FindBuff(4676)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4675)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4512)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4498)) then
					e.hit.damage_done = e.hit.damage_done * 1.35;
				end
				
				--mitigation discs
				if (other:FindBuff(4510)) then
					e.hit.damage_done = e.hit.damage_done * .40;
				end
				if (other:FindBuff(4499)) then
					e.hit.damage_done = e.hit.damage_done * .65;
				end
				if (other:FindBuff(4498)) then
					e.hit.damage_done = e.hit.damage_done * 1.35;
				end
			elseif (self:GetLevel() < 21) then
				bashdmg = Random.Real(7, 15);
				
				finaldmg = bashdmg - mitigationac;
				if finaldmg < 1 then
					finaldmg = 1;
				end

				e.hit.damage_done = finaldmg;

				if (other:CastToClient():IsSitting()) then
					maxkick = 15;
					e.hit.damage_done = maxkick;
				end

				--damage discs
				if (self:FindBuff(4676)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4675)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4512)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4498)) then
					e.hit.damage_done = e.hit.damage_done * 1.35;
				end
				
				--mitigation discs
				if (other:FindBuff(4510)) then
					e.hit.damage_done = e.hit.damage_done * .40;
				end
				if (other:FindBuff(4499)) then
					e.hit.damage_done = e.hit.damage_done * .65;
				end
				if (other:FindBuff(4498)) then
					e.hit.damage_done = e.hit.damage_done * 1.35;
				end
			elseif (self:GetLevel() > 21) then
				bashdmg = Random.Real(7, 27);
				
				finaldmg = bashdmg - mitigationac;
				if finaldmg < 1 then
					finaldmg = 1;
				end

				e.hit.damage_done = finaldmg;

				if (other:CastToClient():IsSitting()) then
					maxkick = 27;
					e.hit.damage_done = maxkick;
				end

				--damage discs
				if (self:FindBuff(4676)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4675)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4512)) then
					e.hit.damage_done = e.hit.damage_done * 2;
				end
				if (self:FindBuff(4498)) then
					e.hit.damage_done = e.hit.damage_done * 1.35;
				end
				
				--mitigation discs
				if (other:FindBuff(4510)) then
					e.hit.damage_done = e.hit.damage_done * .40;
				end
				if (other:FindBuff(4499)) then
					e.hit.damage_done = e.hit.damage_done * .65;
				end
				if (other:FindBuff(4498)) then
					e.hit.damage_done = e.hit.damage_done * 1.35;
				end
			end
		end
	
	
		--Solves issue where BasicBonus is negative at lower levels lowering minimum damage.
		if BasicBonus < 0 then
			BasicBonus = 0;
		end
	
		--2h bonus calcs
		if (wepdelay <= 27) then
			dmg_bonus = BasicBonus + 1;
		elseif (wepdelay <= 59) then
			dmg_bonus = (BasicBonus * 2) + 1;
		elseif (wepdelay >= 70) then
			dmg_bonus = (BasicBonus * 3) + 1;
		end
	
		--Monk hand to hand damage
		if e.hit.skill == 28 and self:GetClass() == Class.MONK then
			if self:GetLevel() <= 4 then
				weapondamage = 4;
			elseif self:GetLevel() > 4 and self:GetLevel() <= 9 then
				weapondamage = 5;
			elseif self:GetLevel() > 9 and self:GetLevel() <= 14 then
				weapondamage = 6;
			elseif self:GetLevel() > 14 and self:GetLevel() <= 19 then
				weapondamage = 7;
			elseif self:GetLevel() > 19 and self:GetLevel() <= 24 then
				weapondamage = 8;
			elseif self:GetLevel() > 24 and self:GetLevel() <= 29 then
				weapondamage = 9;
			elseif self:GetLevel() > 29 and self:GetLevel() <= 34 then
				weapondamage = 10;
			elseif self:GetLevel() > 34 and self:GetLevel() <= 39 then
				weapondamage = 11;
			elseif self:GetLevel() > 39 and self:GetLevel() <= 44 then
				weapondamage = 12;
			elseif self:GetLevel() > 45 and self:GetLevel() <= 49 then
				weapondamage = 13;
			elseif self:GetLevel() > 49 and self:GetLevel() <= 60 then
				weapondamage = 14;
			end
		end

		if e.hit.skill == 0 or e.hit.skill == 1 or e.hit.skill == 28 or (e.hit.skill == 36 and itemtype ~= 35) then --1her
			minimumdamage = 1;
			maximumdamage = ((weapondamage * offensivemod) + dmg_bonus)  - mitigationac;

			local damage_roll = Random.Real(minimumdamage, maximumdamage);
			local attack_roll = Random.Real(0, playeratkbonus);
			local str_roll = Random.Real(0, strbonus);
			final_damage = damage_roll + attack_roll + str_roll;
			if (self:GetLevel() < 11) then
				if (final_damage > 20) then
					final_damage = 20;
				end
			end
			final_damage = final_damage;

			if final_damage < 1 then
				final_damage = 1;
			end
			e.hit.damage_done = final_damage;

			if (other:CastToClient():IsSitting()) then
				e.hit.damage_done = maximumdamage + playeratkbonus + strbonus;
			end
			
			--damage discs
			if (self:FindBuff(4676)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4675)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4512)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
			
			--mitigation discs
			if (other:FindBuff(4510)) then
				e.hit.damage_done = e.hit.damage_done * .40;
			end
			if (other:FindBuff(4499)) then
				e.hit.damage_done = e.hit.damage_done * .65;
			end
			if (other:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
		end


		if e.hit.skill == 2 or e.hit.skill == 3 or (e.hit.skill == 36 and itemtype == 35) then --2her

			minimumdamage = 1;
			maximumdamage = ((weapondamage * offensivemod) + dmg_bonus)  - mitigationac; 
			local damage_roll = Random.Real(minimumdamage, maximumdamage);
			local attack_roll = Random.Real(0, (playeratkbonus));
			local str_roll = Random.Real(0, (strbonus));
			final_damage = damage_roll + attack_roll + str_roll;

			if (self:GetLevel() < 11) then
				if (final_damage > 20) then
					final_damage = 20;
				end
			end

			if final_damage < 1 then
				final_damage = 1;
			end
			e.hit.damage_done = final_damage;
			
	
			if (other:CastToClient():IsSitting()) then
				e.hit.damage_done = maximumdamage + playeratkbonus + strbonus;
			end
		
			--damage discs
			if (self:FindBuff(4676)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4675)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4512)) then
				e.hit.damage_done = e.hit.damage_done * 2;
			end
			if (self:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end
			
			--mitigation discs
			if (other:FindBuff(4510)) then
				e.hit.damage_done = e.hit.damage_done * .40;
			end
			if (other:FindBuff(4499)) then
				e.hit.damage_done = e.hit.damage_done * .65;
			end
			if (other:FindBuff(4498)) then
				e.hit.damage_done = e.hit.damage_done * 1.35;
			end

		end
	e = TryCriticalHit(e);
	e.IgnoreDefault = true;
	return e;
	end
end