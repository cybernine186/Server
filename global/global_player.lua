function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	if(e.self:GetLevel() >= 15 and qglobals['Wayfarer'] == nil) then
		local zoneid = eq.get_zone_id();
		if(e.self:GetStartZone() ~= zoneid and (zoneid == 1 or zoneid == 2 or zoneid == 3 or zoneid == 8 or zoneid == 9 
		or zoneid == 10 or zoneid == 19 or zoneid == 22 or zoneid == 23 or zoneid == 24 or zoneid == 29 or zoneid == 30 
		or zoneid == 34 or zoneid == 35 or zoneid == 40 or zoneid == 41 or zoneid == 42 or zoneid == 45 or zoneid == 49 
		or zoneid == 52 or zoneid == 54 or zoneid == 55 or zoneid == 60 or zoneid == 61 or zoneid == 62 or zoneid == 67 
		or zoneid == 68 or zoneid == 75 or zoneid == 82 or zoneid == 106 or zoneid == 155 or zoneid == 202 or zoneid == 382 
		or zoneid == 383 or zoneid == 392 or zoneid == 393 or zoneid == 408)) then
			--e.self:Message(15, 
			--	"A mysterious voice whispers to you, \'If you can feel me in your thoughts, know this -- "
			--	.. "something is changing in the world and I reckon you should be a part of it. I do not know much, but I do know "
			--	.. "that in every home city and the wilds there are agents of an organization called the Wayfarers Brotherhood. They "
			--	.. "are looking for recruits . . . If you can hear this message, you are one of the chosen. Rush to your home city, or "
			--	.. "search the West Karanas and Rathe Mountains for a contact if you have been exiled from your home for your deeds, "
			--	.. "and find out more. Adventure awaits you, my friend.\'");
		end
	end
end

function event_combine_validate(e)
	-- e.validate_type values = { "check_zone", "check_tradeskill" }
	-- criteria exports:
	--	["check_zone"].         = e.zone_id
	--	["check_tradeskill"]    = e.tradeskill_id (not active)
	if (e.recipe_id == 10344) then
		if (e.validate_type:find("check_zone")) then
			if (e.zone_id ~= 289 and e.zone_id ~= 290) then
				return 1;
			end
		end
	end

	return 0;
end

function event_combine_success(e)
	if (e.recipe_id == 10904 or e.recipe_id == 10905 or e.recipe_id == 10906 or e.recipe_id == 10907) then
		e.self:Message(1,
		"The gem resonates with power as the shards placed within glow unlocking some of the stone's power. "
		.. "You were successful in assembling most of the stone but there are four slots left to fill, "
		.. "where could those four pieces be?"
		);
	elseif(e.recipe_id == 10903 or e.recipe_id == 10346 or e.recipe_id == 10334) then
		local reward = { };
		reward["melee"] =  { ["10903"] = 67665, ["10346"] = 67660, ["10334"] = 67653 };
		reward["hybrid"] = { ["10903"] = 67666, ["10346"] = 67661, ["10334"] = 67654 };
		reward["priest"] = { ["10903"] = 67667, ["10346"] = 67662, ["10334"] = 67655 };
		reward["caster"] = { ["10903"] = 67668, ["10346"] = 67663, ["10334"] = 67656 };

		local ctype = eq.ClassType(e.self:GetClass());
		e.self:SummonItem(reward[ctype][tostring(e.recipe_id)]);
		e.self:SummonItem(67704); -- Item: Vaifan's Clockwork Gemcutter Tools
		e.self:Message(1, "Success");
	--cleric 1.5
	elseif(e.recipe_id == 19460) then
		e.self:AddEXP(25000);
		e.self:AddAAPoints(5);
		e.self:Ding();
		e.self:Message(15,'You have gained 5 ability points!');
		eq.set_global("cleric_epic","7",5,"F");
	--rogue 1.5
	elseif(e.recipe_id == 13402 or e.recipe_id == 13403 or e.recipe_id == 13404 or e.recipe_id == 13405) then
		e.self:Message(15,"The piece of the metal orb fuses together with the blue diamonds under the intense heat of the forge. As it does, a flurry of images flash through your mind... A ranger and his bear side by side, stoic and unafraid, in a war-torn forest. A bitter tattooed woman with bluish skin wallowing in misery in a waterfront tavern. An endless barrage of crashing thunder and lightning illuminating a crimson brick ampitheater. Two halflings locked in a battle of wits using a checkered board. The images then fade from your mind");
	--ranger 1.5 tree
	elseif(e.recipe_id ==13412) then
		eq.set_global("ranger_epic","3",5,"F");
		if(eq.get_zone_short_name()=="jaggedpine") then
			e.self:Message(15,"The seed grows rapidly the moment you push it beneath the soil. It appears at first as a mere shoot, but within moments grows into a stout sapling and then into a gigantic tree. The tree is one you've never seen before. It is the coloration and thick bark of a redwood with the thick bole indicative of the species. The tree is, however, far too short and has spindly branches sprouting from it with beautiful flowers that you would expect on a dogwood. You take all of this in at a glance. It takes you a moment longer to realize that the tree is moving.");			
			eq.spawn2(181222, 0, 0, e.self:GetX()+3,e.self:GetY()+3,e.self:GetZ(),0); -- NPC: Red_Dogwood_Treant
		else
			e.self:Message(15,"The soil conditions prohibit the seed from taking hold");
			e.self:SummonItem(72091); -- Item: Fertile Earth
			e.self:SummonItem(62621); -- Item: Senvial's Blessing
			e.self:SummonItem(62622); -- Item: Grinbik's Blessing
			e.self:SummonItem(62844); -- Item: Red Dogwood Seed
		end
	--ranger 1.5 final
	elseif(e.recipe_id ==13413) then
		e.self:AddEXP(25000);
		e.self:AddAAPoints(5);
		e.self:Ding();
		e.self:Message(15,'You have gained 5 ability points!');
		eq.set_global("ranger_epic","5",5,"F");
	--ranger 2.0
	elseif(e.recipe_id ==19914 or e.recipe_id==19915) then
		e.self:Message(15,'Very Good. Now we must attune the cage to the specific element we wish to free. You will need two items, one must protect from the element and the other must be able to absorb an incredible amount of that element. This is not a simple task. You must first discover the nature of the spirit that you wish to free and then find such items that will allow you to redirect its power. You must know that each spirit represents a specific area within their element and that is what you must focus on, not their element specifically. For example, Grinbik was an earth spirit, but his area of power was fertility. Senvial was a spirit of Water, but his power was in mist and fog.');
		eq.set_global("ranger_epic","8",5,"F");
	elseif(e.recipe_id ==19916) then
		e.self:Message(15,"The Red Dogwood Treant speaks to you from within your sword. 'Well done. This should allow me to free a spirit with power over cold and ice. Now you need to find the power that binds the spirit and unleash it where that spirit is bound.'");	
	elseif(e.recipe_id ==19917) then
		if(eq.get_zone_short_name()=="anguish") then
			eq.spawn2(317113, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: #Oshimai_Spirit_of_the_High_Air
		end
	-- paladin 1.5 final
	elseif(e.recipe_id ==19880) then
		e.self:AddEXP(25000);
		e.self:AddAAPoints(5);
		e.self:Ding();
		e.self:Message(15,'You have gained 5 ability points!');	
		eq.set_global("paladin_epic","8",5,"F");
		e.self:Message(6,"As the four soulstones come together, a soft blue light eminates around the dark sword. The soulstones find themselves at home within the sword. A flash occurs and four voices in unison speak in your mind, 'Thank you for saving us and giving us a purpose again. You are truly our savior and our redeemer, and we shall serve you from now on. Thank you, noble knight!")
	--bard 1.5 final	
	elseif(e.recipe_id == 19882) then
		e.self:AddEXP(25000);
		e.self:AddAAPoints(5);
		e.self:Ding();
		e.self:Message(15,'You have gained 5 ability points!');	
		eq.set_global("bard15","6",5,"F");
	--druid 1.5 feerrott
	elseif(e.recipe_id == 19888) then
		if(eq.get_zone_short_name()=="feerrott") then
			eq.spawn2(47209, 0, 0, e.self:GetX()+10,e.self:GetY()+10,e.self:GetZ(),0); -- NPC: corrupted_spirit
			e.self:Message(0,"compelled spirit screams as his essences is forced back into the world of the living. 'What is this? Where am I? Who are you? What do you want from me?");
		else
			e.self:SummonItem(62827); -- Item: Mangled Head
			e.self:SummonItem(62828); -- Item: Animating Heads
			e.self:SummonItem(62836); -- Item: Soul Stone
		end
	-- druid 1.5 final
	elseif(e.recipe_id ==19892) then
		e.self:AddAAPoints(5);
		e.self:Ding();
		e.self:Message(15,'You have gained 5 ability points!');	
		eq.set_global("druid_epic","8",5,"F");	
		e.self:SendMarqueeMessage(15, 510, 1, 100, 10000, "You plant the Mind Crystal and the Seed of Living Brambles in the pot. The pot grows warm and immediately you see a vine sprouting from the soil. The vine continues to grow at a tremendous rate. Brambles grow into the heart of the crystal where the core impurity is and split it. They continue to grow at an astounding speed and soon burst the pot and form the Staff of Living Brambles");
	--druid 2.0 sub final
	elseif(e.recipe_id ==19908) then
		if(eq.get_zone_short_name()=="anguish") then
			eq.spawn2(317115, 0, 0, e.self:GetX()+3,e.self:GetY()+3,e.self:GetZ(),0); -- NPC: #Yuisaha
			e.self:SummonItem(62883); -- Item: Essence of Rainfall
			e.self:SummonItem(62876); -- Item: Insulated Container
		else
			e.self:Message(15,"The rain spirit cannot be reached here");
			e.self:SummonItem(47100); -- Item: Globe of Discordant Energy
			e.self:SummonItem(62876); -- Item: Insulated Container
			e.self:SummonItem(62878); -- Item: Frozen Rain Spirit
			e.self:SummonItem(62879); -- Item: Everburning Jagged Tree Limb
		end
	--druid 2.0 final
	elseif(e.recipe_id ==19909) then	
		e.self:AddEXP(50000);
		e.self:AddAAPoints(10);
		e.self:Ding();
		e.self:Message(15,'You have gained 10 ability points!');	
		eq.set_global("druid_epic","13",5,"F");	
		--e.self:SendMarqueeMessage(15, 510, 1, 100, 10000, "You plant the Mind Crystal and the Seed of Living Brambles in the pot. The pot grows warm and immediately you see a vine sprouting from the soil. The vine continues to grow at a tremendous rate. Brambles grow into the heart of the crystal where the core impurity is and split it. They continue to grow at an astounding speed and soon burst the pot and form the Staff of Living Brambles");
	--warrior 2.0
	elseif(e.recipe_id ==19902) then	
		e.self:AddEXP(50000);
		e.self:AddAAPoints(10);
		e.self:Ding();
		e.self:Message(15,'You have gained 10 ability points!');	
		eq.set_global("warrior_epic","21",5,"F");		
	-- CLR 2.0
	elseif (e.recipe_id == 19893) then
		e.self:Message(13, "Omat should probably see this.");
	--ench 2.0
	elseif (e.recipe_id == 19919) then
		eq.set_global("ench_epic","9",5,"F");
		e.self:Message(15,"Your Oculus of Persuasion gleams with a blinding light for a moment, dimming quickly to its previous understated beauty. The light has left an image burned into your mind, a strangely tattooed woman chanting by a waterfall.");
	--ench 2.0 final
	elseif (e.recipe_id == 19920) then
		e.self:Message(15,"The discordant energy shoots through the staff, sending a shower of sparks through the air. The crystal shatters before you, and as the sparks fade away you notice the changes in your staff.");
		e.self:AddEXP(50000);
		e.self:AddAAPoints(10);
		e.self:Ding();
		e.self:Message(15,'You have gained 10 ability points!');
		eq.set_global("ench_epic","10",5,"F");
	--pal 2.0 final
	elseif (e.recipe_id == 19925) then
		e.self:Message(15,"As you combine all six tokens in the scabbard with Redemption, you feel a tugging at your soul. An energy flows through you as you feel the virtues of your inner self being tugged and tempered into the weapon. For a second you feel drained, but now that feeling has subsided. A final flash of light occurs and a new sword is tempered; Nightbane, Sword of the Valiant");
		e.self:AddEXP(50000);
		e.self:AddAAPoints(10);
		e.self:Ding();
		e.self:Message(15,'You have gained 10 ability points!');
		eq.set_global("paladin_epic","11",5,"F");
		eq.delete_global("paladin_epic_mmcc");
		eq.delete_global("paladin_epic_hollowc");
	end
end

function event_command(e)
	return eq.DispatchCommands(e);
end

--[[ the main key is the ID of the AA
--   the first set is the age required in seconds
--   the second is if to ignore the age and grant anyways live test server style
--   the third is enabled
--]]
vet_aa = {
    [481]  = { 31536000, false, false}, -- Lesson of the Devote 1 yr
    [482]  = { 63072000, false, false}, -- Infusion of the Faithful 2 yr
    [483]  = { 94608000, false, false}, -- Chaotic Jester 3 yr
    [484]  = {126144000, false, false}, -- Expedient Recovery 4 yr
    [485]  = {157680000, false, false}, -- Steadfast Servant 5 yr
    [486]  = {189216000, false, false}, -- Staunch Recovery 6 yr
    [487]  = {220752000, false, false}, -- Intensity of the Resolute 7 yr
    [511]  = {252288000, false, false}, -- Throne of Heroes 8 yr
    [2000] = {283824000, false, false}, -- Armor of Experience 9 yr
    [8081] = {315360000, false, false}, -- Summon Resupply Agent 10 yr
    [8130] = {346896000, false, false}, -- Summon Clockwork Banker 11 yr
    [453]  = {378432000, false, false}, -- Summon Permutation Peddler 12 yr
    [182]  = {409968000, false, false}, -- Summon Personal Tribute Master 13 yr
    [600]  = {441504000, false, false}, -- Blessing of the Devoted 14 yr
}

function event_connect(e)
    local age = e.self:GetAccountAge();
    for aa, v in pairs(vet_aa) do
        if v[3] and (v[2] or age >= v[1]) then
            e.self:GrantAlternateAdvancementAbility(aa, 1)
        end
    end
end

--[[
0  /*13855*/ Skill1HBlunt = 0,
1  /*13856*/ Skill1HSlashing,
2  /*13857*/ Skill2HBlunt,
3  /*13858*/ Skill2HSlashing,
4  /*13859*/ SkillAbjuration,
5  /*13861*/ SkillAlteration,
6  /*13862*/ SkillApplyPoison, X
7  /*13863*/ SkillArchery, X
8  /*13864*/ SkillBackstab,
9  /*13866*/ SkillBindWound,
10 /*13867*/ SkillBash,
11 /*13871*/ SkillBlock,
12 /*13872*/ SkillBrassInstruments,
13 /*13874*/ SkillChanneling,
14 /*13875*/ SkillConjuration,
15 /*13876*/ SkillDefense,
16 /*13877*/ SkillDisarm,
17 /*13878*/ SkillDisarmTraps, 
18 /*13879*/ SkillDivination,
19 /*13880*/ SkillDodge,
20 /*13881*/ SkillDoubleAttack,
21 /*13882*/ SkillDragonPunch,
21 /*13924*/ SkillTailRake = SkillDragonPunch, // Iksar Monk equivilent
22 /*13883*/ SkillDualWield,
23 /*13884*/ SkillEagleStrike,
24 /*13885*/ SkillEvocation,
25 /*13886*/ SkillFeignDeath,
26 /*13888*/ SkillFlyingKick,
27 /*13889*/ SkillForage, X
28 /*13890*/ SkillHandtoHand,
29 /*13891*/ SkillHide,
30 /*13893*/ SkillKick,
31 /*13894*/ SkillMeditate,
32 /*13895*/ SkillMend,
33 /*13896*/ SkillOffense,
34 /*13897*/ SkillParry,
35 /*13899*/ SkillPickLock, X
36 /*13900*/ Skill1HPiercing,        // Changed in RoF2(05-10-2013)
37 /*13903*/ SkillRiposte,
38 /*13904*/ SkillRoundKick,
39 /*13905*/ SkillSafeFall, 
40 /*13906*/ SkillSenseHeading, X
41 /*13908*/ SkillSinging,
42 /*13909*/ SkillSneak,
43 /*13910*/ SkillSpecializeAbjure,      // No idea why they truncated this one..especially when there are longer ones...
44 /*13911*/ SkillSpecializeAlteration,
45 /*13912*/ SkillSpecializeConjuration,
46 /*13913*/ SkillSpecializeDivination,
47 /*13914*/ SkillSpecializeEvocation,
48 /*13915*/ SkillPickPockets, X
49 /*13916*/ SkillStringedInstruments,
50 /*13917*/ SkillSwimming, X
51 /*13919*/ SkillThrowing,
52 /*13920*/ SkillTigerClaw,
53 /*13921*/ SkillTracking, X
54 /*13923*/ SkillWindInstruments,
55 /*13854*/ SkillFishing, X
56 /*13853*/ SkillMakePoison, X
57 /*13852*/ SkillTinkering, X
58 /*13851*/ SkillResearch, X
59 /*13850*/ SkillAlchemy, X
60 /*13865*/ SkillBaking, X
61 /*13918*/ SkillTailoring, X
62 /*13907*/ SkillSenseTraps, X
63 /*13870*/ SkillBlacksmithing, X
64 /*13887*/ SkillFletching, X
65 /*13873*/ SkillBrewing, X
66 /*13860*/ SkillAlcoholTolerance, X
67 /*13868*/ SkillBegging, 
68 /*13892*/ SkillJewelryMaking, X
69 /*13901*/ SkillPottery, X
70 /*13898*/ SkillPercussionInstruments,
71 /*13922*/ SkillIntimidation,
72 /*13869*/ SkillBerserking,
73 /*13902*/ SkillTaunt,
74 /*05837*/ SkillFrenzy,
75 /*03670*/  SkillRemoveTraps,  X
76 /*13049*/  SkillTripleAttack,
]]--

function event_level_up(e)
  local free_skills =  {0,1,2,3,4,5,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,28,29,30,31,32,33,34,36,37,38,39,41,42,43,44,45,46,47,49,51,52,54,67,70,71,72,73,74,76};

  for k,v in ipairs(free_skills) do
    if ( e.self:MaxSkill(v) > 0 and e.self:GetRawSkill(v) < 1 and e.self:CanHaveSkill(v) ) then 
      e.self:SetSkill(v, 1);
    end
      
  end
end

sub Doors_Manipulation_EVENT_SAY{
	#::: Declare scope variables to be used... :::#
	my $text = plugin::val('$text');
	my $door = plugin::val('$door');
	my $client = plugin::val('$client');
	my $entity_list = plugin::val('$entity_list');
	my $zonesn = plugin::val('$zonesn');
	
	if($client->GetEntityVariable("EditDoorClick") > 0){ $Door = $entity_list->GetDoorsByDoorID($client->GetEntityVariable("EditDoorClick")); }
	elsif($client->GetEntityVariable("CreateEditDoor") > 0){ $Door = $entity_list->GetDoorsByID($client->GetEntityVariable("CreateEditDoor")); }
	
	@arg = split(' ', $text); 
	if($arg[0]=~/#door/i){
		if(!$arg[1]){
			$client->Message(15, "#door - OPTIONS");
			$client->Message(15, "#door setincline <incline> - sets selected door incline");
			$client->Message(15, "#door opentype <opentype> - sets selected door opentype");
			$client->Message(15, "#door model <modelname> - Changes door model for selected door");
			$client->Message(15, "#door save - Creates database entry for highlighted door");
			$client->Message(15, quest::saylink("#door list", 1) . " - lists doors in zone");
			$client->Message(15, quest::saylink("#door edit", 1) . " - Brings up editing interface for selected door");
		}
		if($arg[1] =~/save/i){
			$Door->CreateDatabaseEntry();
			$client->Message(15, "Door saved");
		}
		if($arg[1] =~/movetome/i){
			$Door->SetLocation($client->GetX(), $client->GetY(), $client->GetZ());
		}
		if($arg[1] =~/create/i){
			if($arg[2]){
				if($arg[3]){ $size = $arg[3]; } else { $size = 100; }
				$ID = quest::createdoor(uc($arg[2]), $client->GetX(), $client->GetY(), $client->GetZ(), $client->GetHeading(), 58, $size); 
				$client->SetEntityVariable("CreateEditDoor", $ID);
				$client->Message(15, "Created Door ID: " . $ID);
			} else { $client->Message(15, "Usage: #door create modelname [size=100]"); }
		}
		if($arg[1] =~/changemodelqueue/i){
			$client->Message(15, "Type name of new model, current model is " . $Door->GetModelName());
			$client->Message(15, "#door model <modelname> or select from " . quest::saylink("#door showmodelszone", 1, "Local Zone") . " " . quest::saylink("#door showmodelsglobal", 1, "Global"));
		}
		if($arg[1] =~/size/i){
			$Door->SetSize($arg[2]);
		}
		if($arg[1] =~/showmodelsglobal/i){
			$connect = plugin::LoadMysql();
			$ModelsToSelectFrom = "";
			$client->Message(15, "Loading files...");
			$query_handle = $connect->prepare("SELECT file_from FROM `cust_obj_data` WHERE `object_name` LIKE '%IT%' AND zoneid = 0 AND object_name NOT LIKE '%OBJ%' GROUP by file_from;"); $query_handle->execute();
			while(@row = $query_handle->fetchrow_array()){
				if(length($ModelsToSelectFrom) > 4000){
					$client->Message(15, $ModelsToSelectFrom); 
					$ModelsToSelectFrom = quest::saylink("#door showmodelsfromfile " . $row[0], 1, $row[0]) . "-";
				}else{
					$ModelsToSelectFrom .= quest::saylink("#door showmodelsfromfile " . $row[0], 1, $row[0]) . "-";
				}
			}
			$client->Message(15, $ModelsToSelectFrom);
		}
		if($arg[1] =~/showmodelsfromfile/i){
			$connect = plugin::LoadMysql();
			$ModelsToSelectFrom = "";
			$client->Message(15, "Loading models from " . $arg[2]);
			$query_handle = $connect->prepare("SELECT `object_name` FROM `cust_obj_data` WHERE `file_from` = '". $arg[2] . "';"); $query_handle->execute();
			while(@row = $query_handle->fetchrow_array()){
				if(length($ModelsToSelectFrom) > 4000){
					$client->Message(15, $ModelsToSelectFrom); $ModelsToSelectFrom = quest::saylink("#door model " . $row[0], 1, $row[0]) . "-";
				}else{
					$ModelsToSelectFrom .= quest::saylink("#door model " . $row[0], 1, $row[0]) . "-";
				}
			}
			$client->Message(15, $ModelsToSelectFrom);
		}
		if($arg[1] =~/showmodelszone/i){
			$connect = plugin::LoadMysql();
			$ModelsToSelectFrom = "";
			$client->Message(15, "Loading models from $zonesn");
			$query_handle = $connect->prepare("SELECT `object_name` FROM `cust_obj_data` WHERE `zonesn` = '". $zonesn . "';"); $query_handle->execute();
			while(@row = $query_handle->fetchrow_array()){
				if(length($ModelsToSelectFrom) > 4000){
					$client->Message(15, $ModelsToSelectFrom); 
					$ModelsToSelectFrom = quest::saylink("#door model " . $row[0], 1, $row[0]) . "-";
				}else{
					$ModelsToSelectFrom .= quest::saylink("#door model " . $row[0], 1, $row[0]) . "-";
				}
			}
			$client->Message(15, $ModelsToSelectFrom);
		}
		if($arg[1] =~/list/i){ @doors = $entity_list->GetDoorsList(); 
			foreach $door (@doors){ 
				$client->Message(15, "ID: " . $door->GetDoorID() . " " . quest::saylink("#gmgoto " . int($door->GetX()) . " " . int($door->GetY()) . " " . int($door->GetZ())	, 1, $door->GetModelName()) . " X: " . $door->GetX() . " Y: " . $door->GetY() . " Z: " . $door->GetZ() . " Size: " . $door->GetSize() . " Open Type: " . $door->GetOpenType()); 
			} 
		}
		if($arg[1] =~/model/i){ if($arg[2]){ $Door->SetModelName(uc($arg[2])); } }
		if($arg[1] =~/opentype/i){ if($arg[2]){ $Door->SetOpenType($arg[2]); } }
		if($arg[1] eq "setincline"){
			if($arg[2]){  $Door->SetIncline($arg[2]);  }
			return;
		}
		if($arg[1] eq "setinclineinc"){
			if($arg[2]){  $Door->SetIncline($Door->GetIncline() + $arg[2]);  }
			#::: Incline Options #::: 
			if(!$arg[2]){
				$InclineOptions = "";
				%IncOptions = (
					1 => [.01, "Upright"],
					2 => [130, "+ 90 Degrees"],
					3 => [255, "+ 180 Degrees"],
					4 => [385, "+ 270 Degrees"],
					5 => [512.5, "+ 360 Degrees"],
				);
				$n = 1;
				while($IncOptions{$n}[0]){ $InclineOptions .= quest::saylink("#door setincline " . $IncOptions{$n}[0], 1, $IncOptions{$n}[1]) . " | ";  $n++; }
				$InclineOptionsP = ""; $InclineOptionsM = "";
				for($i = 0; $i <= 100; $i+=10){ if($i == 0){ $Num = 1; }else{ $Num = $i } $InclineOptionsP .= quest::saylink("#door setinclineinc " . $Num, 1, " ". abs($Num)); }
				for($i = -100; $i <= 0; $i+=10){ if($i == 0){ $Num = -1; }else{ $Num = $i } $InclineOptionsM .= quest::saylink("#door setinclineinc " . $Num, 1, " ". abs($Num)); }
				$client->Message(15, "Incline: [" . $InclineOptions . "]");
				$client->Message(15, "Incline Increments: [" . $InclineOptionsM  . " - | + " . $InclineOptionsP . "]");
			}
		}
		if($arg[1] =~/invertstate/i){
			$connect = plugin::LoadMysql();
			$query = "UPDATE `doors` SET `invert_state` = " . $arg[2] . " WHERE `id` = " . $Door->GetDoorDBID();
			$query_handle = $connect->prepare($query); $query_handle->execute();
			$client->Message(15, $query);
			$client->Message(15, "Reload Doors? " . quest::saylink("#reloadstatic", 0, "#reloadstatic"));
		}
		if($arg[1] =~/edit/i){
			if($client->GetEntityVariable("EditDoorClick") > 0){ $Door = $entity_list->GetDoorsByDoorID($client->GetEntityVariable("EditDoorClick")); }
			elsif($client->GetEntityVariable("CreateEditDoor") > 0){ $Door = $entity_list->GetDoorsByID($client->GetEntityVariable("CreateEditDoor")); }
			else { $client->Message(15, "You don't have a door selected to edit!"); return; }
			if($Door->GetDoorID() > 0 && $Door->GetDoorID() < 255){ $InvertState = " Invertstate [" . quest::saylink("#door invertstate 0", 1, "0") . " - " . quest::saylink("#door invertstate 1", 1, "1") . "]"; } else{ $InvertState = ""; }
			if(!$arg[2] && !$arg[3]){ $client->Message(15 ,"Door Selected: ID:" . $Door->GetDoorID() . " NAME: " . $Door->GetModelName() . " Opentype: " . $Door->GetOpenType() . $InvertState); }
			@MoveOptions = ("MoveX", "MoveY", "MoveZ", "MoveH", "SetSize");
			if($arg[1] && !$arg[2]){
				$OptionsXP = ""; $OptionsXM = ""; $OptionsYP = ""; $OptionsYM = ""; $OptionsZP = ""; $OptionsZM = ""; $OptionsHP = ""; $OptionsHM = ""; $OptionsSP = ""; $OptionsSM = "";
				foreach $val (@MoveOptions){
					if($val eq "MoveX"){
						$OptionsXP .= quest::saylink("#door edit MoveX .25", 1, " .25");
						for($i = 0; $i <= 15; $i+=5){ if($i == 0){ $Num = 1; }else{ $Num = $i } $OptionsXP .= quest::saylink("#door edit MoveX " . $Num, 1, " ". abs($Num)); }
						for($i = -15; $i <= 0; $i+=5){ if($i == 0){ $Num = -1; }else{ $Num = $i } $OptionsXM .= quest::saylink("#door edit MoveX " . $Num, 1, " ". abs($Num)); }
						$OptionsXM .= quest::saylink("#door edit MoveX -.25", 1, " .25");
					}
					if($val eq "MoveY"){
						$OptionsYP .= quest::saylink("#door edit MoveY .25", 1, " .25");
						for($i = 0; $i <= 15; $i+=5){ if($i == 0){ $Num = 1; }else{ $Num = $i } $OptionsYP .= quest::saylink("#door edit MoveY " . $Num, 1, " ". abs($Num)); }
						for($i = -15; $i <= 0; $i+=5){ if($i == 0){ $Num = -1; }else{ $Num = $i } $OptionsYM .= quest::saylink("#door edit MoveY " . $Num, 1, " ". abs($Num)); }
						$OptionsYM .= quest::saylink("#door edit MoveY -.25", 1, " .25");
					}
					if($val eq "MoveZ"){
						$OptionsZP .= quest::saylink("#door edit MoveZ .25", 1, " .25");
						for($i = 0; $i <= 15; $i+=5){ if($i == 0){ $Num = 1; }else{ $Num = $i } $OptionsZP .= quest::saylink("#door edit MoveZ " . $Num, 1, " ". abs($Num)); }
						for($i = -15; $i <= 0; $i+=5){ if($i == 0){ $Num = -1; }else{ $Num = $i } $OptionsZM .= quest::saylink("#door edit MoveZ " . $Num, 1, " ". abs($Num)); }
						$OptionsZM .= quest::saylink("#door edit MoveZ -.25", 1, " .25");
					}
					if($val eq "MoveH"){
						for($i = 0; $i <= 50; $i+=5){ if($i == 0){ $Num = 1; }else{ $Num = $i } $OptionsHP .= quest::saylink("#door edit MoveH " . $Num, 1, " ". abs($Num)); }
						for($i = -50; $i <= 0; $i+=5){  if($i == 0){ $Num = -1; }else{ $Num = $i } $OptionsHM .= quest::saylink("#door edit MoveH " . $Num, 1, " ". abs($Num)); }
					}
					if($val eq "SetSize"){
						for($i = 0; $i <= 100; $i+=10){ if($i == 0){ $Num = 1; }else{ $Num = $i } $OptionsSP .= quest::saylink("#door edit SetSize " . $Num, 1, " ". abs($Num)); }
						for($i = 0; $i >= -100; $i-=10){ if($i == 0){ $Num = -1; }else{ $Num = $i } $OptionsSM .= quest::saylink("#door edit SetSize " . $Num, 1, " ". abs($Num)); }
					}
				}
				$client->Message(15, "NAME: [" . $Door->GetModelName() . "] [" . quest::saylink("#door save", 1, "SAVE") . "] [" . quest::saylink("#door changemodelqueue", 1, "Change Model") . "]" . " [" . quest::saylink("#door setinclineinc", 1, "Incline") . "]");
				$client->Message(15, "[". $OptionsXM . " - [X] +" . $OptionsXP . "]");
				$client->Message(15, "[". $OptionsYM . " - [Y] + " . $OptionsYP . "]");
				$client->Message(15, "[". $OptionsZM . " - [Z] + " . $OptionsZP . "]");
				$client->Message(15, "[". $OptionsHM . " - [H] + " . $OptionsHP . "]");
				$client->Message(15, "[". $OptionsSM . " - [SIZE] + " . $OptionsSP . "]");
			}
			if($arg[3]){
				$XM = 0; $YM = 0; $ZM = 0; $HM = 0; $Size = 0;
				if($arg[2] eq "MoveX"){ $XM = $arg[3]; }
				if($arg[2] eq "MoveY"){ $YM = $arg[3]; }
				if($arg[2] eq "MoveZ"){ $ZM = $arg[3]; }
				if($arg[2] eq "MoveH"){ $HM = $arg[3]; }
				if($arg[2] eq "SetSize"){ $Size = $arg[3]; }
				#quest::say("DEBUG $XM - $YM - $ZM - $HM");
				$Door->SetLocation($Door->GetX() + $XM, $Door->GetY() + $YM, $Door->GetZ()+ $ZM);
				$Door->SetHeading($Door->GetHeading() + $HM);
				$Door->SetSize($Door->GetSize() + $Size);
			}
			#::: Coordinate Helpers
			# REPLACE INTO `npc_types` (`id`, `name`, `lastname`, `level`, `race`, `class`, `bodytype`, `hp`, `mana`, `gender`, `texture`, `helmtexture`, `size`, `hp_regen_rate`, `mana_regen_rate`, `loottable_id`, `merchant_id`, `alt_currency_id`, `npc_spells_id`, `npc_faction_id`, `adventure_template_id`, `trap_template`, `mindmg`, `maxdmg`, `attack_count`, `npcspecialattks`, `aggroradius`, `face`, `luclin_hairstyle`, `luclin_haircolor`, `luclin_eyecolor`, `luclin_eyecolor2`, `luclin_beardcolor`, `luclin_beard`, `drakkin_heritage`, `drakkin_tattoo`, `drakkin_details`, `armortint_id`, `armortint_red`, `armortint_green`, `armortint_blue`, `d_meele_texture1`, `d_meele_texture2`, `prim_melee_type`, `sec_melee_type`, `runspeed`, `MR`, `CR`, `DR`, `FR`, `PR`, `Corrup`, `see_invis`, `see_invis_undead`, `qglobal`, `AC`, `npc_aggro`, `spawn_limit`, `attack_speed`, `findable`, `STR`, `STA`, `DEX`, `AGI`, `_INT`, `WIS`, `CHA`, `see_hide`, `see_improved_hide`, `trackable`, `isbot`, `exclude`, `ATK`, `Accuracy`, `slow_mitigation`, `version`, `maxlevel`, `scalerate`, `private_corpse`, `unique_spawn_by_name`, `underwater`, `isquest`, `emoteid`) VALUES (51, '-X', NULL, 1, 127, 1, 11, 31, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 'ZiGH', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 1.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 75, 75, 75, 80, 75, 75, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0);
			# REPLACE INTO `npc_types` (`id`, `name`, `lastname`, `level`, `race`, `class`, `bodytype`, `hp`, `mana`, `gender`, `texture`, `helmtexture`, `size`, `hp_regen_rate`, `mana_regen_rate`, `loottable_id`, `merchant_id`, `alt_currency_id`, `npc_spells_id`, `npc_faction_id`, `adventure_template_id`, `trap_template`, `mindmg`, `maxdmg`, `attack_count`, `npcspecialattks`, `aggroradius`, `face`, `luclin_hairstyle`, `luclin_haircolor`, `luclin_eyecolor`, `luclin_eyecolor2`, `luclin_beardcolor`, `luclin_beard`, `drakkin_heritage`, `drakkin_tattoo`, `drakkin_details`, `armortint_id`, `armortint_red`, `armortint_green`, `armortint_blue`, `d_meele_texture1`, `d_meele_texture2`, `prim_melee_type`, `sec_melee_type`, `runspeed`, `MR`, `CR`, `DR`, `FR`, `PR`, `Corrup`, `see_invis`, `see_invis_undead`, `qglobal`, `AC`, `npc_aggro`, `spawn_limit`, `attack_speed`, `findable`, `STR`, `STA`, `DEX`, `AGI`, `_INT`, `WIS`, `CHA`, `see_hide`, `see_improved_hide`, `trackable`, `isbot`, `exclude`, `ATK`, `Accuracy`, `slow_mitigation`, `version`, `maxlevel`, `scalerate`, `private_corpse`, `unique_spawn_by_name`, `underwater`, `isquest`, `emoteid`) VALUES (52, '+X', NULL, 1, 127, 1, 11, 31, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 'ZiGH', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 1.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 75, 75, 75, 80, 75, 75, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0);
			# REPLACE INTO `npc_types` (`id`, `name`, `lastname`, `level`, `race`, `class`, `bodytype`, `hp`, `mana`, `gender`, `texture`, `helmtexture`, `size`, `hp_regen_rate`, `mana_regen_rate`, `loottable_id`, `merchant_id`, `alt_currency_id`, `npc_spells_id`, `npc_faction_id`, `adventure_template_id`, `trap_template`, `mindmg`, `maxdmg`, `attack_count`, `npcspecialattks`, `aggroradius`, `face`, `luclin_hairstyle`, `luclin_haircolor`, `luclin_eyecolor`, `luclin_eyecolor2`, `luclin_beardcolor`, `luclin_beard`, `drakkin_heritage`, `drakkin_tattoo`, `drakkin_details`, `armortint_id`, `armortint_red`, `armortint_green`, `armortint_blue`, `d_meele_texture1`, `d_meele_texture2`, `prim_melee_type`, `sec_melee_type`, `runspeed`, `MR`, `CR`, `DR`, `FR`, `PR`, `Corrup`, `see_invis`, `see_invis_undead`, `qglobal`, `AC`, `npc_aggro`, `spawn_limit`, `attack_speed`, `findable`, `STR`, `STA`, `DEX`, `AGI`, `_INT`, `WIS`, `CHA`, `see_hide`, `see_improved_hide`, `trackable`, `isbot`, `exclude`, `ATK`, `Accuracy`, `slow_mitigation`, `version`, `maxlevel`, `scalerate`, `private_corpse`, `unique_spawn_by_name`, `underwater`, `isquest`, `emoteid`) VALUES (53, '-Y', NULL, 1, 127, 1, 11, 31, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 'ZiGH', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 1.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 75, 75, 75, 80, 75, 75, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0);
			# REPLACE INTO `npc_types` (`id`, `name`, `lastname`, `level`, `race`, `class`, `bodytype`, `hp`, `mana`, `gender`, `texture`, `helmtexture`, `size`, `hp_regen_rate`, `mana_regen_rate`, `loottable_id`, `merchant_id`, `alt_currency_id`, `npc_spells_id`, `npc_faction_id`, `adventure_template_id`, `trap_template`, `mindmg`, `maxdmg`, `attack_count`, `npcspecialattks`, `aggroradius`, `face`, `luclin_hairstyle`, `luclin_haircolor`, `luclin_eyecolor`, `luclin_eyecolor2`, `luclin_beardcolor`, `luclin_beard`, `drakkin_heritage`, `drakkin_tattoo`, `drakkin_details`, `armortint_id`, `armortint_red`, `armortint_green`, `armortint_blue`, `d_meele_texture1`, `d_meele_texture2`, `prim_melee_type`, `sec_melee_type`, `runspeed`, `MR`, `CR`, `DR`, `FR`, `PR`, `Corrup`, `see_invis`, `see_invis_undead`, `qglobal`, `AC`, `npc_aggro`, `spawn_limit`, `attack_speed`, `findable`, `STR`, `STA`, `DEX`, `AGI`, `_INT`, `WIS`, `CHA`, `see_hide`, `see_improved_hide`, `trackable`, `isbot`, `exclude`, `ATK`, `Accuracy`, `slow_mitigation`, `version`, `maxlevel`, `scalerate`, `private_corpse`, `unique_spawn_by_name`, `underwater`, `isquest`, `emoteid`) VALUES (54, '+Y', NULL, 1, 127, 1, 11, 31, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 'ZiGH', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 1.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 75, 75, 75, 80, 75, 75, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0);
			if(!$entity_list->GetNPCByNPCTypeID(51)){  quest::spawn2(51, 0, 0, ($Door->GetX() + $XM - 15), $Door->GetY() + $YM, $Door->GetZ()+ $ZM, 0); }else{ my $ent = $entity_list->GetNPCByNPCTypeID(51); $ent->GMMove(($Door->GetX() + $XM - 15), $Door->GetY() + $YM, $Door->GetZ() + $ZM + 5, 0); }
			if(!$entity_list->GetNPCByNPCTypeID(52)){  quest::spawn2(52, 0, 0, ($Door->GetX() + $XM + 15), $Door->GetY() + $YM, $Door->GetZ()+ $ZM, 0);  }else{ my $ent = $entity_list->GetNPCByNPCTypeID(52); $ent->GMMove(($Door->GetX() + $XM + 15), $Door->GetY() + $YM, $Door->GetZ() + $ZM + 5, 0); }
			if(!$entity_list->GetNPCByNPCTypeID(53)){  quest::spawn2(53, 0, 0, $Door->GetX() + $XM, ($Door->GetY() + $YM - 15), $Door->GetZ()+ $ZM, 0);  }else{ my $ent = $entity_list->GetNPCByNPCTypeID(53); $ent->GMMove($Door->GetX() + $XM, ($Door->GetY() + $YM - 15), $Door->GetZ() + $ZM + 5, 0); }
			if(!$entity_list->GetNPCByNPCTypeID(54)){  quest::spawn2(54, 0, 0, $Door->GetX() + $XM,  ($Door->GetY() + $YM + 15), $Door->GetZ()+ $ZM, 0);  }else{ my $ent = $entity_list->GetNPCByNPCTypeID(54); $ent->GMMove($Door->GetX() + $XM, ($Door->GetY() + $YM + 15), $Door->GetZ() + $ZM + 5, 0); }
		}
	}
}

sub Doors_Manipulation_EVENT_CLICKDOOR{
	my $doorid = plugin::val('$doorid');
	my $client = plugin::val('$client');
	$client->Message(15, "Door $doorid [" . quest::saylink("Close Door $doorid", 1, "Close Door") . "][" . quest::saylink("Open Door $doorid", 1, "Open Door") . "] [" . quest::saylink("#door edit", 1, "Edit Door") . "]");
	$client->SetEntityVariable("EditDoorClick", $doorid);
}