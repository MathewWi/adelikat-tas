--TODO
--Female characters
--Non-hero spells

local heroBattleSpells = { };
heroBattleSpells[0] = "Blaze";
heroBattleSpells[1] = "Heal";
heroBattleSpells[2] = "Expel";
heroBattleSpells[3] = "Ironize";
heroBattleSpells[4] = "Firebal";
heroBattleSpells[5] = "Return";
heroBattleSpells[6] = "StopSpell";
heroBattleSpells[7] = "Sleep";
heroBattleSpells[8] = "Zap";
heroBattleSpells[9] = "Healmore";
heroBattleSpells[10] = "Firebane";
heroBattleSpells[11] = "Healall";
heroBattleSpells[12] = "Boom";
heroBattleSpells[13] = "Vivify";
heroBattleSpells[14] = "Lightning";
heroBattleSpells[15] = "Healusall";

local heroFieldSpells = { };
heroFieldSpells[0] = "Heal";
heroFieldSpells[1] = "Return";
heroFieldSpells[2] = "Outside";
heroFieldSpells[3] = "Repel";
heroFieldSpells[4] = "Healmore";
heroFieldSpells[5] = "Healall";
heroFieldSpells[6] = "Vivify";
heroFieldSpells[7] = "Healusall";

local heroBattleSpellsLv = { };
heroBattleSpellsLv[0] = 2; --Blaze
heroBattleSpellsLv[1] = 4; --Heal
heroBattleSpellsLv[2] = 6; --Expel
heroBattleSpellsLv[3] = 12; --Ironize
heroBattleSpellsLv[4] = 10; --Firebal
heroBattleSpellsLv[5] = 7; --Return
heroBattleSpellsLv[6] = 18; --StopSpell
heroBattleSpellsLv[7] = 16; --Sleep
heroBattleSpellsLv[8] = 26; --Zap
heroBattleSpellsLv[9] = 29; --Healmore
heroBattleSpellsLv[10] = 23; --Firebane
heroBattleSpellsLv[11] = 33; --Healall
heroBattleSpellsLv[12] = 31; --Boom
heroBattleSpellsLv[13] = 35; --Vivify
heroBattleSpellsLv[14] = 41; --Lightning
heroBattleSpellsLv[15] = 38; --Healusall

local heroFieldSpellsLv = { };
heroFieldSpellsLv[0] = 4; --Heal
heroFieldSpellsLv[1] = 7; --Return
heroFieldSpellsLv[2] = 15; --Outside
heroFieldSpellsLv[3] = 16; --Repel
heroFieldSpellsLv[4] = 29; --Healmore
heroFieldSpellsLv[5] = 33; --Healall
heroFieldSpellsLv[6] = 35; --Vivify
heroFieldSpellsLv[7] = 38; --Healusall

local xpLookup = { }
--Hero
xpLookup[1] = 0;
xpLookup[2] = 29;
xpLookup[3] = 87;
xpLookup[4] = 174;
xpLookup[5] = 304;
xpLookup[6] = 499;
xpLookup[7] = 792;
xpLookup[8] = 1232;
xpLookup[9] = 1891;
xpLookup[10] = 2880;
xpLookup[11] = 4364;
xpLookup[12] = 6218;
xpLookup[13] = 8534;
xpLookup[14] = 11428;
xpLookup[15] = 15045;
xpLookup[16] = 19114;
xpLookup[17] = 23690;
xpLookup[18] = 28837;
xpLookup[19] = 34627;
xpLookup[20] = 41141;
xpLookup[21] = 48468;
xpLookup[22] = 56711;
xpLookup[23] = 65983;
xpLookup[24] = 76413;
xpLookup[25] = 88147;
xpLookup[26] = 101347;
xpLookup[27] = 116196;
xpLookup[28] = 132901;
xpLookup[29] = 151694;
xpLookup[30] = 172836;
xpLookup[31] = 196621;
xpLookup[32] = 223378;
xpLookup[33] = 253450;
xpLookup[34] = 287344;
xpLookup[35] = 325440;
xpLookup[36] = 368298;
xpLookup[37] = 416512;
xpLookup[38] = 470752;
xpLookup[39] = 531771;
xpLookup[40] = 600417;
xpLookup[41] = 677644;
xpLookup[42] = 764524;
xpLookup[43] = 862262;
xpLookup[44] = 960001;
xpLookup[45] = 1057740;
xpLookup[46] = 1155478;
xpLookup[47] = 1253219;
xpLookup[48] = 1350956;
xpLookup[49] = 1448696;
xpLookup[50] = 1546435;
xpLookup[51] = 1644174;
xpLookup[52] = 1741913;
xpLookup[53] = 1839652;
xpLookup[54] = 1937391;
xpLookup[55] = 2035130;
xpLookup[56] = 2132869;
xpLookup[57] = 2230608;
xpLookup[58] = 2328347;
xpLookup[59] = 2426086;
xpLookup[60] = 2523825;
xpLookup[61] = 2621564;
xpLookup[62] = 2719303;
xpLookup[63] = 2817042;
xpLookup[64] = 2914781;
xpLookup[65] = 3012520;
xpLookup[66] = 3110259;
xpLookup[67] = 3207998;
xpLookup[68] = 3305737;
xpLookup[69] = 3403476;
xpLookup[70] = 3501215;
xpLookup[71] = 3598954;
xpLookup[72] = 3696693;
xpLookup[73] = 3794432;
xpLookup[74] = 3892171;
xpLookup[75] = 3989910;
xpLookup[76] = 4087649;
xpLookup[77] = 4185388;
xpLookup[78] = 4283127;
xpLookup[79] = 4380866;
xpLookup[80] = 4478605;
xpLookup[81] = 4576344;
xpLookup[82] = 4674083;
xpLookup[83] = 4771822;
xpLookup[84] = 4869561;
xpLookup[85] = 4967300;
xpLookup[86] = 5065039;
xpLookup[87] = 5162778;
xpLookup[88] = 5260517;
xpLookup[89] = 5358256;
xpLookup[90] = 5455995;
xpLookup[91] = 5553734;
xpLookup[92] = 5651473;
xpLookup[93] = 5749212;
xpLookup[94] = 5846951;
xpLookup[95] = 5944690;
xpLookup[96] = 6042249;
xpLookup[97] = 6140168;
xpLookup[98] = 6237907;
xpLookup[99] = 6335646;
xpLookup[100] = 9999999;

--Wizard
xpLookup[1+100] = 0;
xpLookup[2+100] = 15;
xpLookup[3+100] = 45;
xpLookup[4+100] = 105;
xpLookup[5+100] = 195;
xpLookup[6+100] = 330;
xpLookup[7+100] = 532;
xpLookup[8+100] = 835;
xpLookup[9+100] = 1290;
xpLookup[10+100] = 1973;
xpLookup[11+100] = 2997;
xpLookup[12+100] = 4533;
xpLookup[13+100] = 6453;
xpLookup[14+100] = 8853;
xpLookup[15+100] = 11853;
xpLookup[16+100] = 15603;
xpLookup[17+100] = 20290;
xpLookup[18+100] = 25563;
xpLookup[19+100] = 31495;
xpLookup[20+100] = 38169;
xpLookup[21+100] = 45676;
xpLookup[22+100] = 54121;
xpLookup[23+100] = 63622;
xpLookup[24+100] = 74310;
xpLookup[25+100] = 86334;
xpLookup[26+100] = 99861;
xpLookup[27+100] = 115078;
xpLookup[28+100] = 132197;
xpLookup[29+100] = 151456;
xpLookup[30+100] = 173121;
xpLookup[31+100] = 197494;
xpLookup[32+100] = 224913;
xpLookup[33+100] = 255758;
xpLookup[34+100] = 290458;
xpLookup[35+100] = 329495;
xpLookup[36+100] = 373412;
xpLookup[37+100] = 422818;
xpLookup[38+100] = 478399;
xpLookup[39+100] = 540927;
xpLookup[40+100] = 611271;
xpLookup[41+100] = 690408;
xpLookup[42+100] = 779437;
xpLookup[43+100] = 879592;
xpLookup[44+100] = 992268;
xpLookup[45+100] = 1119028;
xpLookup[46+100] = 1245788;
xpLookup[47+100] = 1372548;
xpLookup[48+100] = 1499308;
xpLookup[49+100] = 1626068;
xpLookup[50+100] = 1752828;
xpLookup[51+100] = 1879588;
xpLookup[52+100] = 2006348;
xpLookup[53+100] = 2133108;
xpLookup[54+100] = 2259868;
xpLookup[55+100] = 2386628;
xpLookup[56+100] = 2513388;
xpLookup[57+100] = 2640148;
xpLookup[58+100] = 2766908;
xpLookup[59+100] = 2893668;
xpLookup[60+100] = 3020428;
xpLookup[61+100] = 3147188;
xpLookup[62+100] = 3273948;
xpLookup[63+100] = 3400708;
xpLookup[64+100] = 3527468;
xpLookup[65+100] = 3654228;
xpLookup[66+100] = 3780988;
xpLookup[67+100] = 3907748;
xpLookup[68+100] = 4034508;
xpLookup[69+100] = 4161268;
xpLookup[70+100] = 4288028;
xpLookup[71+100] = 4414788;
xpLookup[72+100] = 4541548;
xpLookup[73+100] = 4668308;
xpLookup[74+100] = 4795068;
xpLookup[75+100] = 4921828;
xpLookup[76+100] = 5048588;
xpLookup[77+100] = 5175348;
xpLookup[78+100] = 5302108;
xpLookup[79+100] = 5428868;
xpLookup[80+100] = 5555628;
xpLookup[81+100] = 5682388;
xpLookup[82+100] = 5809148;
xpLookup[83+100] = 5935908;
xpLookup[84+100] = 6062668;
xpLookup[85+100] = 6189428;
xpLookup[86+100] = 6316188;
xpLookup[87+100] = 6442948;
xpLookup[88+100] = 6569708;
xpLookup[89+100] = 6696468;
xpLookup[90+100] = 6823228;
xpLookup[91+100] = 6949988;
xpLookup[92+100] = 7076748;
xpLookup[93+100] = 7203508;
xpLookup[94+100] = 7330268;
xpLookup[95+100] = 7457028;
xpLookup[96+100] = 7583788;
xpLookup[97+100] = 7710548;
xpLookup[98+100] = 7837308;
xpLookup[99+100] = 7964068;
xpLookup[100+100] = 9999999;

--Pilgram
xpLookup[1+200] = 0;
xpLookup[2+200] = 14;
xpLookup[3+200] = 42;
xpLookup[4+200] = 98;
xpLookup[5+200] = 182;
xpLookup[6+200] = 308;
xpLookup[7+200] = 497;
xpLookup[8+200] = 780;
xpLookup[9+200] = 1205;
xpLookup[10+200] = 1842;
xpLookup[11+200] = 2798;
xpLookup[12+200] = 4232;
xpLookup[13+200] = 6024;
xpLookup[14+200] = 8264;
xpLookup[15+200] = 11064;
xpLookup[16+200] = 14564;
xpLookup[17+200] = 18939;
xpLookup[18+200] = 24407;
xpLookup[19+200] = 30559;
xpLookup[20+200] = 37479;
xpLookup[21+200] = 45263;
xpLookup[22+200] = 54020;
xpLookup[23+200] = 63872;
xpLookup[24+200] = 74955;
xpLookup[25+200] = 87423;
xpLookup[26+200] = 101450;
xpLookup[27+200] = 117229;
xpLookup[28+200] = 134981;
xpLookup[29+200] = 154952;
xpLookup[30+200] = 177419;
xpLookup[31+200] = 202694;
xpLookup[32+200] = 231128;
xpLookup[33+200] = 263116;
xpLookup[34+200] = 299102;
xpLookup[35+200] = 339585;
xpLookup[36+200] = 385128;
xpLookup[37+200] = 436364;
xpLookup[38+200] = 494004;
xpLookup[39+200] = 558849;
xpLookup[40+200] = 631799;
xpLookup[41+200] = 713867;
xpLookup[42+200] = 806194;
xpLookup[43+200] = 910061;
xpLookup[44+200] = 1026912;
xpLookup[45+200] = 1143763;
xpLookup[46+200] = 1260614;
xpLookup[47+200] = 1377465;
xpLookup[48+200] = 1494316;
xpLookup[49+200] = 1611167;
xpLookup[50+200] = 1728018;
xpLookup[51+200] = 1844869;
xpLookup[52+200] = 1961720;
xpLookup[53+200] = 2078571;
xpLookup[54+200] = 2195422;
xpLookup[55+200] = 2312273;
xpLookup[56+200] = 2429124;
xpLookup[57+200] = 2545975;
xpLookup[58+200] = 2662826;
xpLookup[59+200] = 2779677;
xpLookup[60+200] = 2896528;
xpLookup[61+200] = 3013379;
xpLookup[62+200] = 3130230;
xpLookup[63+200] = 3247081;
xpLookup[64+200] = 3363932;
xpLookup[65+200] = 3480783;
xpLookup[66+200] = 3597634;
xpLookup[67+200] = 3714485;
xpLookup[68+200] = 3831336;
xpLookup[69+200] = 3948187;
xpLookup[70+200] = 4065038;
xpLookup[71+200] = 4181889;
xpLookup[72+200] = 4298740;
xpLookup[73+200] = 4415991;
xpLookup[74+200] = 4532442;
xpLookup[75+200] = 4649293;
xpLookup[76+200] = 4766144;
xpLookup[77+200] = 4882995;
xpLookup[78+200] = 4999846;
xpLookup[79+200] = 5116697;
xpLookup[80+200] = 5233548;
xpLookup[81+200] = 5350399;
xpLookup[82+200] = 5467250;
xpLookup[83+200] = 5584101;
xpLookup[84+200] = 5700952;
xpLookup[85+200] = 5817803;
xpLookup[86+200] = 5934654;
xpLookup[87+200] = 6051505;
xpLookup[88+200] = 6186356;
xpLookup[89+200] = 6285207;
xpLookup[90+200] = 6402058;
xpLookup[91+200] = 6518909;
xpLookup[92+200] = 6635760;
xpLookup[93+200] = 6752611;
xpLookup[94+200] = 6869462;
xpLookup[95+200] = 6986313;
xpLookup[96+200] = 7103164;
xpLookup[97+200] = 7220015;
xpLookup[98+200] = 7336866;
xpLookup[99+200] = 7453717;
xpLookup[100+200] = 9999999;

--Sage
xpLookup[1+300] = 0;
xpLookup[2+300] = 20;
xpLookup[3+300] = 60;
xpLookup[4+300] = 140;
xpLookup[5+300] = 260;
xpLookup[6+300] = 440;
xpLookup[7+300] = 710;
xpLookup[8+300] = 1115;
xpLookup[9+300] = 1722;
xpLookup[10+300] = 2633;
xpLookup[11+300] = 3999;
xpLookup[12+300] = 6047;
xpLookup[13+300] = 8607;
xpLookup[14+300] = 11807;
xpLookup[15+300] = 15808;
xpLookup[16+300] = 20807;
xpLookup[17+300] = 27057;
xpLookup[18+300] = 34869;
xpLookup[19+300] = 43657;
xpLookup[20+300] = 53543;
xpLookup[21+300] = 64664;
xpLookup[22+300] = 77175;
xpLookup[23+300] = 91250;
xpLookup[24+300] = 107083;
xpLookup[25+300] = 124895;
xpLookup[26+300] = 144933;
xpLookup[27+300] = 167475;
xpLookup[28+300] = 192835;
xpLookup[29+300] = 221365;
xpLookup[30+300] = 253461;
xpLookup[31+300] = 289568;
xpLookup[32+300] = 330188;
xpLookup[33+300] = 375885;
xpLookup[34+300] = 427294;
xpLookup[35+300] = 485126;
xpLookup[36+300] = 550188;
xpLookup[37+300] = 623383;
xpLookup[38+300] = 705726;
xpLookup[39+300] = 798362;
xpLookup[40+300] = 902577;
xpLookup[41+300] = 1019818;
xpLookup[42+300] = 1151714;
xpLookup[43+300] = 1300096;	
xpLookup[44+300] = 1448478;	
xpLookup[45+300] = 1596860;		
xpLookup[46+300] = 1745242;		
xpLookup[47+300] = 1893624;			
xpLookup[48+300] = 2042006;			
xpLookup[49+300] = 2190388;			
xpLookup[50+300] = 2338770;			
xpLookup[51+300] = 2487152;			
xpLookup[52+300] = 2635534;			
xpLookup[53+300] = 2783916;			
xpLookup[54+300] = 2932298;			
xpLookup[55+300] = 3080680;			
xpLookup[56+300] = 3229062;			
xpLookup[57+300] = 3377444;			
xpLookup[58+300] = 3525826;			
xpLookup[59+300] = 3674208;			
xpLookup[60+300] = 3822590;			
xpLookup[61+300] = 3970972;			
xpLookup[62+300] = 4119354;			
xpLookup[63+300] = 4267736;			
xpLookup[64+300] = 4416118;				
xpLookup[65+300] = 4564500;				
xpLookup[66+300] = 4712882;			
xpLookup[67+300] = 4861264;			
xpLookup[68+300] = 5009646;			
xpLookup[69+300] = 5158028;				
xpLookup[70+300] = 5306410;			
xpLookup[71+300] = 5454792;			
xpLookup[72+300] = 5603174;			
xpLookup[73+300] = 5751556;			
xpLookup[74+300] = 5899938;			
xpLookup[75+300] = 6048320;			
xpLookup[76+300] = 6196702;			
xpLookup[77+300] = 6345084;			
xpLookup[78+300] = 6493466;			
xpLookup[79+300] = 6641848;			
xpLookup[80+300] = 6790230;			
xpLookup[81+300] = 6938612;			
xpLookup[82+300] = 7086994;			
xpLookup[83+300] = 7235376;			
xpLookup[84+300] = 7383758;			
xpLookup[85+300] = 7532140;			
xpLookup[86+300] = 7680522;			
xpLookup[87+300] = 7828904;			
xpLookup[88+300] = 7977286;			
xpLookup[89+300] = 8125668;			
xpLookup[90+300] = 8274050;			
xpLookup[91+300] = 8422432;
xpLookup[92+300] = 8570814;				
xpLookup[93+300] = 8719196;			
xpLookup[94+300] = 8867578;				
xpLookup[95+300] = 9015960;				
xpLookup[96+300] = 9164342;			
xpLookup[97+300] = 9312724;			
xpLookup[98+300] = 9461106;			
xpLookup[99+300] = 9609488;
xpLookup[100+300] = 9999999;	

--Solider
xpLookup[1+400] = 0;
xpLookup[2+400] = 12;
xpLookup[3+400] = 36;
xpLookup[4+400] = 84;
xpLookup[5+400] = 156;
xpLookup[6+400] = 264;
xpLookup[7+400] = 426;
xpLookup[8+400] = 669;
xpLookup[9+400] = 1053;
xpLookup[10+400] = 1579;
xpLookup[11+400] = 2398;
xpLookup[12+400] = 3627;
xpLookup[13+400] = 5163;
xpLookup[14+400] = 7083;
xpLookup[15+400] = 9483;
xpLookup[16+400] = 12483;
xpLookup[17+400] = 16233;
xpLookup[18+400] = 20920;
xpLookup[19+400] = 26779;
xpLookup[20+400] = 34102;
xpLookup[21+400] = 42340;
xpLookup[22+400] = 51608;
xpLookup[23+400] = 62034;
xpLookup[24+400] = 73763;
xpLookup[25+400] = 86957;
xpLookup[26+400] = 101801;
xpLookup[27+400] = 118500;
xpLookup[28+400] = 137286;
xpLookup[29+400] = 158421;
xpLookup[30+400] = 182197;
xpLookup[31+400] = 208945;
xpLookup[32+400] = 239036;
xpLookup[33+400] = 272988;
xpLookup[34+400] = 310972;
xpLookup[35+400] = 353816;
xpLookup[36+400] = 402015;
xpLookup[37+400] = 456239;
xpLookup[38+400] = 517241;
xpLookup[39+400] = 585868;
xpLookup[40+400] = 663073;
xpLookup[41+400] = 749928;
xpLookup[42+400] = 847639;
xpLookup[43+400] = 945350;
xpLookup[44+400] = 1043060;
xpLookup[45+400] = 1140771;
xpLookup[46+400] = 1238482;
xpLookup[47+400] = 1336192;
xpLookup[48+400] = 1433902;
xpLookup[49+400] = 1531612;
xpLookup[50+400] = 1629322;
xpLookup[51+400] = 1727032;
xpLookup[52+400] = 1824742;
xpLookup[53+400] = 1922452;
xpLookup[54+400] = 2020162;
xpLookup[55+400] = 2117872;
xpLookup[56+400] = 2215582;
xpLookup[57+400] = 2313292;
xpLookup[58+400] = 2411002;
xpLookup[59+400] = 2508712;
xpLookup[60+400] = 2606422;
xpLookup[61+400] = 2704132;
xpLookup[62+400] = 2801842;
xpLookup[63+400] = 2899552;
xpLookup[64+400] = 2997262;
xpLookup[65+400] = 3094972;
xpLookup[66+400] = 3192682;
xpLookup[67+400] = 3290392;
xpLookup[68+400] = 3388102;
xpLookup[69+400] = 3485812;
xpLookup[70+400] = 3583522;
xpLookup[71+400] = 3681232;
xpLookup[72+400] = 3778942;
xpLookup[73+400] = 3876652;
xpLookup[74+400] = 3974362;
xpLookup[75+400] = 4072072;
xpLookup[76+400] = 4169782;
xpLookup[77+400] = 4267492;
xpLookup[78+400] = 4365202;
xpLookup[79+400] = 4462912;
xpLookup[80+400] = 4560622;
xpLookup[81+400] = 4658332;
xpLookup[82+400] = 4756042;
xpLookup[83+400] = 4853752;
xpLookup[84+400] = 4951462;
xpLookup[85+400] = 5049172;
xpLookup[86+400] = 5146882;
xpLookup[87+400] = 5244592;
xpLookup[88+400] = 5342302;
xpLookup[89+400] = 5440012;
xpLookup[90+400] = 5537722;
xpLookup[91+400] = 5635432;
xpLookup[92+400] = 5733142;
xpLookup[93+400] = 5830852;
xpLookup[94+400] = 5928562;
xpLookup[95+400] = 6026272;
xpLookup[96+400] = 6123982;
xpLookup[97+400] = 6221692;
xpLookup[98+400] = 6319402;
xpLookup[99+400] = 6417166;
xpLookup[100+400] = 9999999;

--Merchant
xpLookup[0+500] = 0;
xpLookup[0+500] = 10;
xpLookup[0+500] = 30;
xpLookup[0+500] = 70;
xpLookup[0+500] = 130;
xpLookup[0+500] = 220;
xpLookup[0+500] = 355;
xpLookup[0+500] = 557;
xpLookup[0+500] = 860;
xpLookup[0+500] = 1315;
xpLookup[0+500] = 1998;
xpLookup[0+500] = 3022;
xpLookup[0+500] = 4302;
xpLookup[0+500] = 5902;
xpLookup[0+500] = 7902;
xpLookup[0+500] = 10402;
xpLookup[0+500] = 13527;
xpLookup[0+500] = 17433;
xpLookup[0+500] = 22315;
xpLookup[0+500] = 27807;
xpLookup[0+500] = 33985;
xpLookup[0+500] = 40935;
xpLookup[0+500] = 48754;
xpLookup[0+500] = 57550;
xpLookup[0+500] = 67445;
xpLookup[0+500] = 78577;
xpLookup[0+500] = 91100;
xpLookup[0+500] = 105188;
xpLookup[0+500] = 121037;
xpLookup[0+500] = 138867;
xpLookup[0+500] = 158925;
xpLookup[0+500] = 181490;
xpLookup[0+500] = 206876;
xpLookup[0+500] = 235435;
xpLookup[0+500] = 267563;
xpLookup[0+500] = 303707;
xpLookup[0+500] = 344368;
xpLookup[0+500] = 390112;
xpLookup[0+500] = 441573;
xpLookup[0+500] = 499467;
xpLookup[0+500] = 564597;
xpLookup[0+500] = 637868;
xpLookup[0+500] = 720298;
xpLookup[0+500] = 813032;
xpLookup[0+500] = 905766;
xpLookup[0+500] = 998500;
xpLookup[0+500] = 1091234;
xpLookup[0+500] = 1183968;
xpLookup[0+500] = 1276702;
xpLookup[0+500] = 1369436;
xpLookup[0+500] = 1426170;
xpLookup[0+500] = 1554904;
xpLookup[0+500] = 1647638;
xpLookup[0+500] = 1740372;
xpLookup[0+500] = 1833106;
xpLookup[0+500] = 1925840;
xpLookup[0+500] = 2018574;
xpLookup[0+500] = 2111308;
xpLookup[0+500] = 2204042;
xpLookup[0+500] = 2296776;
xpLookup[0+500] = 2389510;
xpLookup[0+500] = 2482244;
xpLookup[0+500] = 2574978;
xpLookup[0+500] = 2667712;
xpLookup[0+500] = 2760446;
xpLookup[0+500] = 2853180;
xpLookup[0+500] = 2945914;
xpLookup[0+500] = 3038648;
xpLookup[0+500] = 3131382;
xpLookup[0+500] = 3224116;
xpLookup[0+500] = 3316850;
xpLookup[0+500] = 3409584;
xpLookup[0+500] = 3502318;
xpLookup[0+500] = 3595052;
xpLookup[0+500] = 3687786;
xpLookup[0+500] = 3780520;
xpLookup[0+500] = 3873254;
xpLookup[0+500] = 3965988;
xpLookup[0+500] = 4058722;
xpLookup[0+500] = 4151456;
xpLookup[0+500] = 4244190;
xpLookup[0+500] = 4336924;
xpLookup[0+500] = 4429658;
xpLookup[0+500] = 4522392;
xpLookup[0+500] = 4615126;
xpLookup[0+500] = 4708860;
xpLookup[0+500] = 4800594;
xpLookup[0+500] = 4893328;
xpLookup[0+500] = 4986062;
xpLookup[0+500] = 5078796;
xpLookup[0+500] = 5171530;
xpLookup[0+500] = 5264264;
xpLookup[0+500] = 5356998;
xpLookup[0+500] = 5449732;
xpLookup[0+500] = 5542466;
xpLookup[0+500] = 5635200;
xpLookup[0+500] = 5727934;
xpLookup[0+500] = 5820668;
xpLookup[0+500] = 5913402;
xpLookup[100+500] = 9999999;

--Fighter
xpLookup[1+600] = 0;
xpLookup[2+600] = 18;
xpLookup[3+600] = 54;
xpLookup[4+600] = 126;
xpLookup[5+600] = 234;
xpLookup[6+600] = 396;
xpLookup[7+600] = 639;
xpLookup[8+600] = 1003;
xpLookup[9+600] = 1549;
xpLookup[10+600] = 2369;
xpLookup[11+600] = 3598;
xpLookup[12+600] = 5441;
xpLookup[13+600] = 7745;
xpLookup[14+600] = 10625;
xpLookup[15+600] = 14225;
xpLookup[16+600] = 18725;
xpLookup[17+600] = 24350;
xpLookup[18+600] = 30678;
xpLookup[19+600] = 37797;
xpLookup[20+600] = 45805;
xpLookup[21+600] = 54814;
xpLookup[22+600] = 64949;
xpLookup[23+600] = 76350;
xpLookup[24+600] = 89176;
xpLookup[25+600] = 103605;
xpLookup[26+600] = 119837;
xpLookup[27+600] = 138098;
xpLookup[28+600] = 158641;
xpLookup[29+600] = 181751;
xpLookup[30+600] = 207749;
xpLookup[31+600] = 236996;
xpLookup[32+600] = 269898;
xpLookup[33+600] = 306912;
xpLookup[34+600] = 348552;
xpLookup[35+600] = 395397;
xpLookup[36+600] = 448097;
xpLookup[37+600] = 507384;
xpLookup[38+600] = 574081;
xpLookup[39+600] = 649115;
xpLookup[40+600] = 733528;
xpLookup[41+600] = 828492;
xpLookup[42+600] = 935326;
xpLookup[43+600] = 1055514;
xpLookup[44+600] = 1190725;
xpLookup[45+600] = 1325936;
xpLookup[46+600] = 1461147;
xpLookup[47+600] = 1596358;
xpLookup[48+600] = 1731569;
xpLookup[49+600] = 1866780;
xpLookup[50+600] = 2001991;
xpLookup[51+600] = 2137202;
xpLookup[52+600] = 2272413;
xpLookup[53+600] = 2407624;
xpLookup[54+600] = 2542835;
xpLookup[55+600] = 2678046;
xpLookup[56+600] = 2813257;
xpLookup[57+600] = 2948468;
xpLookup[58+600] = 3083679;
xpLookup[59+600] = 3218890;
xpLookup[60+600] = 3354101;
xpLookup[61+600] = 3489312;
xpLookup[62+600] = 3624523;
xpLookup[63+600] = 3759734;
xpLookup[64+600] = 3894945;
xpLookup[65+600] = 4030156;
xpLookup[66+600] = 4165367;
xpLookup[67+600] = 4300578;
xpLookup[68+600] = 4435789;
xpLookup[69+600] = 4571000;
xpLookup[70+600] = 4706211;
xpLookup[71+600] = 4841422;
xpLookup[72+600] = 4976633;
xpLookup[73+600] = 5111844;
xpLookup[74+600] = 5247055;
xpLookup[75+600] = 5382266;
xpLookup[76+600] = 5517477;
xpLookup[77+600] = 5652688;
xpLookup[78+600] = 5787899;
xpLookup[79+600] = 5923110;
xpLookup[80+600] = 6058321;
xpLookup[81+600] = 6193532;
xpLookup[82+600] = 6328743;
xpLookup[83+600] = 6463954;
xpLookup[84+600] = 6599165;
xpLookup[85+600] = 6734376;
xpLookup[86+600] = 6869587;
xpLookup[87+600] = 7004798;
xpLookup[88+600] = 7140009;
xpLookup[89+600] = 7275220;
xpLookup[90+600] = 7410431;
xpLookup[91+600] = 7545642;
xpLookup[92+600] = 7680853;
xpLookup[93+600] = 7816064;
xpLookup[94+600] = 7951275;
xpLookup[95+600] = 8086486;
xpLookup[96+600] = 8221697;
xpLookup[97+600] = 8356908;
xpLookup[98+600] = 8492119;
xpLookup[99+600] = 8627330;
xpLookup[100+600] = 9999999;

--Goof-off
xpLookup[1+700] = 0;
xpLookup[2+700] = 11;
xpLookup[3+700] = 33;
xpLookup[4+700] = 77;
xpLookup[5+700] = 143;
xpLookup[6+700] = 242;
xpLookup[7+700] = 390;
xpLookup[8+700] = 612;
xpLookup[9+700] = 946;
xpLookup[10+700] = 1447;
xpLookup[11+700] = 2198;
xpLookup[12+700] = 3324;
xpLookup[13+700] = 4732;
xpLookup[14+700] = 6492;
xpLookup[15+700] = 8692;
xpLookup[16+700] = 11442;
xpLookup[17+700] = 14879;
xpLookup[18+700] = 19175;
xpLookup[19+700] = 24545;
xpLookup[20+700] = 31258;
xpLookup[21+700] = 38810;
xpLookup[22+700] = 47306;
xpLookup[23+700] = 56863;
xpLookup[24+700] = 67614;
xpLookup[25+700] = 79709;
xpLookup[26+700] = 93317;
xpLookup[27+700] = 108623;
xpLookup[28+700] = 125844;
xpLookup[29+700] = 145217;
xpLookup[30+700] = 167012;
xpLookup[31+700] = 191532;
xpLookup[32+700] = 219114;
xpLookup[33+700] = 250145;
xpLookup[34+700] = 285055;
xpLookup[35+700] = 324329;
xpLookup[36+700] = 368512;
xpLookup[37+700] = 418216;
xpLookup[38+700] = 474134;
xpLookup[39+700] = 537042;
xpLookup[40+700] = 607813;
xpLookup[41+700] = 687430;
xpLookup[42+700] = 776998;
xpLookup[43+700] = 877762;
xpLookup[44+700] = 991121;
xpLookup[45+700] = 1104480;
xpLookup[46+700] = 1217839;
xpLookup[47+700] = 1331198;
xpLookup[48+700] = 1444557;
xpLookup[49+700] = 1557916;
xpLookup[50+700] = 1671275;
xpLookup[51+700] = 1784634;
xpLookup[52+700] = 1897993;
xpLookup[53+700] = 2011352;
xpLookup[54+700] = 2124711;
xpLookup[55+700] = 2238070;
xpLookup[56+700] = 2351429;
xpLookup[57+700] = 2464788;
xpLookup[58+700] = 2578147;
xpLookup[59+700] = 2691506;
xpLookup[60+700] = 2804865;
xpLookup[61+700] = 2918224;
xpLookup[62+700] = 3031583;
xpLookup[63+700] = 3144942;
xpLookup[64+700] = 3258301;
xpLookup[65+700] = 3371660;
xpLookup[66+700] = 3485019;
xpLookup[67+700] = 3598378;
xpLookup[68+700] = 3711737;
xpLookup[69+700] = 3825096;
xpLookup[70+700] = 3938455;
xpLookup[71+700] = 4051814;
xpLookup[72+700] = 4165173;
xpLookup[73+700] = 4278532;
xpLookup[74+700] = 4391891;
xpLookup[75+700] = 4505250;
xpLookup[76+700] = 4618609;
xpLookup[77+700] = 4731698;
xpLookup[78+700] = 4845327;
xpLookup[79+700] = 4958686;
xpLookup[80+700] = 5072045;
xpLookup[81+700] = 5185404;
xpLookup[82+700] = 5298763;
xpLookup[83+700] = 5412122;
xpLookup[84+700] = 5525481;
xpLookup[85+700] = 5638840;
xpLookup[86+700] = 5752199;
xpLookup[87+700] = 5865558;
xpLookup[88+700] = 5978917;
xpLookup[89+700] = 6092276;
xpLookup[90+700] = 6205635;
xpLookup[91+700] = 6318994;
xpLookup[92+700] = 6432353;
xpLookup[93+700] = 6545712;
xpLookup[94+700] = 6659071;
xpLookup[95+700] = 6772430;
xpLookup[96+700] = 6885789;
xpLookup[97+700] = 6999148;
xpLookup[98+700] = 7112507;
xpLookup[99+700] = 7225866;
xpLookup[100+700] = 9999999;

local lookup = { }
local classLookup = { }

function Setup()
	lookup[0x0]  = "Cypress Stick";
	lookup[0x01] = "Club";
	lookup[0x02] = "Copper Sword";
	lookup[0x03] = "Magic Knife";
	lookup[0x04] = "Iron Spear";
	lookup[0x05] = "Battle Axe";
	lookup[0x06] = "Broad Sword";
	lookup[0x07] = "Wizard's Wand";
	lookup[0x08] = "Poison Needle";
	lookup[0x09] = "Iron Claw";
	lookup[0x0A] = "Thorn Whip";
	lookup[0x0B] = "Giant Shears";
	lookup[0x0C] = "Chain Sickle";
	lookup[0x0D] = "Thor's Sword";
	lookup[0x0E] = "Snowblast Sword";
	lookup[0x0F] = "Demon Axe";
	lookup[0x10] = "Staff of Rain";
	lookup[0x11] = "Sword of Gaia"; 
	lookup[0x12] = "Staff of Reflection";
	lookup[0x13] = "Sword of Destruction";
	lookup[0x14] = "Multi-Edge Sword";
	lookup[0x15] = "Staff of Force";
	lookup[0x16] = "Sword of Illusion";
	lookup[0x17] = "Zombie Slasher";
	lookup[0x18] = "Falcon Sword";
	lookup[0x19] = "Sledge Hammer";
	lookup[0x1A] = "Thunder Sword";
	lookup[0x1B] = "Staff of Thunder";
	lookup[0x1C] = "Sword of Kings";
	lookup[0x1D] = "Orochi Sword";
	lookup[0x1E] = "Dragon Killer";
	lookup[0x1F] = "Staff of Judgement";
	lookup[0x20] = "Clothes";
	lookup[0x21] = "Training Suit";
	lookup[0x22] = "Leather Armor";
	lookup[0x23] = "Flashy Clothes";
	lookup[0x24] = "Half Plate Armor";
	lookup[0x25] = "Full Plate Armor";
	lookup[0x26] = "Magic Armor";
	lookup[0x27] = "Cloak of Evasion";
	lookup[0x28] = "Armor of Radiance";
	lookup[0x29] = "Iron Apron";
	lookup[0x2A] = "Animal Suit";
	lookup[0x2B] = "Fighting Suit";
	lookup[0x2C] = "Sacred Robe";
	lookup[0x2D] = "Armor of Hades";
	lookup[0x2E] = "Water Flying Cloth";
	lookup[0x2F] = "Chain Mail";
	lookup[0x30] = "Wayfarer's Clothes";
	lookup[0x31] = "Revealing Swimsuit";
	lookup[0x32] = "Magic Bikini";
	lookup[0x33] = "Shell Armor";
	lookup[0x34] = "Armor of Terrafirma";
	lookup[0x35] = "Dragon Mail";
	lookup[0x36] = "Swordedge Armor";
	lookup[0x37] = "Angel's Robe";
	lookup[0x38] = "Leather Shield";
	lookup[0x39] = "Iron Shield";
	lookup[0x3A] = "Shield of Strength";
	lookup[0x3B] = "Shield of Heroes";
	lookup[0x3C] = "Shield of Sorrow";
	lookup[0x3D] = "Bronze Shield";
	lookup[0x3E] = "Silver Shield";
	lookup[0x3F] = "Golden Crown";
	lookup[0x40] = "Iron Helmet";
	lookup[0x41] = "Mysterious Hat";
	lookup[0x42] = "Unlucky Helmet";
	lookup[0x43] = "Turban";
	lookup[0x44] = "Noh Mask";
	lookup[0x45] = "Leather Helmet";
	lookup[0x46] = "Iron Mask";
	lookup[0x47] = "Sacred Amulet";
	lookup[0x48] = "Ring of Life";
	lookup[0x49] = "Shoes of Happiness";
	lookup[0x4A] = "Golden Claw";
	lookup[0x4B] = "Meteorite Armband";
	lookup[0x4C] = "Book of Satori";
	lookup[0x4D] = "(blank)";
	lookup[0x4E] = "Wizard's Ring";
	lookup[0x4F] = "Black Pepper";
	lookup[0x50] = "Sage's Stone";
	lookup[0x51] = "Mirror of Ra";
	lookup[0x52] = "Vase of Drought";
	lookup[0x53] = "Lamp of Darkness";
	lookup[0x54] = "Staff of Change";
	lookup[0x55] = "Stone of Light";
	lookup[0x56] = "Invisibility Herb";
	lookup[0x57] = "Magic Ball";
	lookup[0x58] = "Thief's Key";
	lookup[0x59] = "Magic Key";
	lookup[0x5A] = "Final Key";
	lookup[0x5B] = "Dream Ruby";
	lookup[0x5C] = "Wake Up Powder";
	lookup[0x5D] = "Royal Scroll";
	lookup[0x5E] = "Oricon";
	lookup[0x5F] = "Strength Seed";
	lookup[0x60] = "Agility Seed";
	lookup[0x61] = "Vitality Seed";
	lookup[0x62] = "Luck Seed";
	lookup[0x63] = "Intelligence Seed";
	lookup[0x64] = "Acorns of Life";
	lookup[0x65] = "Medical Herb";
	lookup[0x66] = "Antidote Herb";
	lookup[0x67] = "Fairy Water";
	lookup[0x68] = "Wing of Wyvern";
	lookup[0x69] = "Leaf of World Tree";
	lookup[0x6A] = "(blank)";
	lookup[0x6B] = "Locket of Love";
	lookup[0x6C] = "Full Moon Herb";
	lookup[0x6D] = "Water Blaster";
	lookup[0x6E] = "Sailor's Thigh Bone";
	lookup[0x6F] = "Echoing Flute";
	lookup[0x70] = "Fairy Flute";
	lookup[0x71] = "Silver Harp";
	lookup[0x72] = "Sphere of Light";
	lookup[0x73] = "Poison Moth Powder";
	lookup[0x74] = "Spider's Web";
	lookup[0x75] = "Stones of Sunlight";
	lookup[0x76] = "Rainbow Drop";
	lookup[0x77] = "Silver Orb";
	lookup[0x78] = "Red Orb";
	lookup[0x79] = "Yellow Orb";
	lookup[0x7A] = "Purple Orb";
	lookup[0x7B] = "Blue Orb";
	lookup[0x7C] = "Green Orb";
	lookup[0x7D] = "Stick Slime";
	lookup[0x7E] = "Black Raven";
	lookup[0x7F] = "Sword Horned";
	lookup[0x80] = "eCypress Stick";
	lookup[0x81] = "eClub";
	lookup[0x82] = "eCopper Sword";
	lookup[0x83] = "eMagic Knife";
	lookup[0x84] = "eIron Spear";
	lookup[0x85] = "eBattle Axe";
	lookup[0x86] = "eBroad Sword";
	lookup[0x87] = "eWizard's Wand";
	lookup[0x88] = "ePoison Needle";
	lookup[0x89] = "eIron Claw";
	lookup[0x8A] = "eThorn Whip";
	lookup[0x8B] = "eGiant Shears";
	lookup[0x8C] = "eChain Sickle";
	lookup[0x8D] = "eThor's Sword";
	lookup[0x8E] = "eSnowblast Sword";
	lookup[0x8F] = "eDemon Axe";
	lookup[0x90] = "eStaff of Rain";
	lookup[0x91] = "eSword of Gaia";
	lookup[0x92] = "eStaff of Reflection";
	lookup[0x93] = "eSword of Destruction";
	lookup[0x94] = "eMulti-Edge Sword";
	lookup[0x95] = "eStaff of Force";
	lookup[0x96] = "eSword of Illusion";
	lookup[0x97] = "eZombie Slasher";
	lookup[0x98] = "eFalcon Sword";
	lookup[0x99] = "eSledge Hammer";
	lookup[0x9A] = "eThunder Sword";
	lookup[0x9B] = "eStaff of Thunder";
	lookup[0x9C] = "eSword of Kings";
	lookup[0x9D] = "eOrochi Sword";
	lookup[0x9E] = "eDragon Killer";
	lookup[0x9F] = "eStaff of Judgement";
	lookup[0xA0] = "eClothes";
	lookup[0xA1] = "eTraining Suit";
	lookup[0xA2] = "eLeather Armor";
	lookup[0xA3] = "eFlashy Clothes";
	lookup[0xA4] = "eHalf Plate Armor";
	lookup[0xA5] = "eFull Plate Armor";
	lookup[0xA6] = "eMagic Armor";
	lookup[0xA7] = "eCloak of Evasion";
	lookup[0xA8] = "eArmor of Radiance";
	lookup[0xA9] = "eIron Apron";
	lookup[0xAA] = "eAnimal Suit";
	lookup[0xAB] = "eFighting Suit";
	lookup[0xAC] = "eSacred Robe";
	lookup[0xAD] = "eArmor of Hades";
	lookup[0xAE] = "eWater Flying Cloth";
	lookup[0xAF] = "eChain Mail";
	lookup[0xB0] = "eWayfarer's Clothes";
	lookup[0xB1] = "eRevealing Swimsuit";
	lookup[0xB2] = "eMagic Bikini";
	lookup[0xB3] = "eShell Armor";
	lookup[0xB4] = "eArmor of Terrafirma";
	lookup[0xB5] = "eDragon Mail";
	lookup[0xB6] = "eSwordedge Armor";
	lookup[0xB7] = "eAngel's Robe";
	lookup[0xB8] = "e Leather Shield";
	lookup[0xB9] = "eIron Shield";
	lookup[0xBA] = "eShield of Strength";
	lookup[0xBB] = "eShield of Heroes";
	lookup[0xBC] = "eShield of Sorrow";
	lookup[0xBD] = "eBronze Shield";
	lookup[0xBE] = "eSilver Shield";
	lookup[0xBF] = "eGolden Crown";
	lookup[0xC0] = "eIron Helmet";
	lookup[0xC1] = "eMysterious Hat";
	lookup[0xC2] = "eUnlucky Helmet";
	lookup[0xC3] = "eTurban";
	lookup[0xC4] = "eNoh Mask";
	lookup[0xC5] = "eLeather Helmet";
	lookup[0xC6] = "eIron Mask";
	lookup[0xC7] = "eSacred Amulet";
	lookup[0xC8] = "eRing of Life";
	lookup[0xC9] = "eShoes of Happiness";
	lookup[0xCA] = "eGolden Claw";
	lookup[0xCB] = "eMeteorite Armband";
	lookup[0xCC] = "eBook of Satori";
	lookup[0xCD] = "e(blank)";
	lookup[0xCE] = "eWizard's Ring";
	lookup[0xCF] = "eBlack Pepper";
	lookup[0xD0] = "eSage's Stone";
	lookup[0xD1] = "eMirror of Ra";
	lookup[0xD2] = "eVase of Drought";
	lookup[0xD3] = "eLamp of Darkness";
	lookup[0xD4] = "eStaff of Change";
	lookup[0xD5] = "eStone of Light";
	lookup[0xD6] = "eInvisibility Herb";
	lookup[0xD7] = "eMagic Ball";
	lookup[0xD8] = "eThief's Key";
	lookup[0xD9] = "eMagic Key";
	lookup[0xDA] = "eFinal Key";
	lookup[0xDB] = "eDream Ruby";
	lookup[0xDC] = "eWake Up Powder";
	lookup[0xDD] = "eRoyal Scroll";
	lookup[0xDE] = "eOricon";
	lookup[0xDF] = "eStrength Seed";
	lookup[0xE0] = "eAgility Seed";
	lookup[0xE1] = "eVitality Seed";
	lookup[0xE2] = "eLuck Seed";
	lookup[0xE3] = "eIntelligence Seed";
	lookup[0xE4] = "eAcorns of Life";
	lookup[0xE5] = "eMedical Herb";
	lookup[0xE6] = "eAntidote Herb";
	lookup[0xE7] = "eFairy Water";
	lookup[0xE8] = "eWing of Wyvern";
	lookup[0xE9] = "eLeaf of World Tree";
	lookup[0xEA] = "e(blank)";
	lookup[0xEB] = "eLocket of Love";
	lookup[0xEC] = "eFull Moon Herb";
	lookup[0xED] = "eWater Blaster";
	lookup[0xEE] = "eSailor's Thigh Bone";
	lookup[0xEF] = "eEchoing Flute";
	lookup[0xF0] = "eFairy Flute";
	lookup[0xF1] = "eSilver Harp";
	lookup[0xF2] = "eSphere of Light";
	lookup[0xF3] = "ePoison Moth Powder";
	lookup[0xF4] = "eSpider's Web";
	lookup[0xF5] = "eStones of Sunlight";
	lookup[0xF6] = "eRainbow Drop";
	lookup[0xF7] = "eSilver Orb";
	lookup[0xF8] = "eRed Orb";
	lookup[0xF9] = "eYellow Orb";
	lookup[0xFA] = "ePurple Orb";
	lookup[0xFB] = "eBlue Orb";
	lookup[0xFC] = "eGreen Orb";
	lookup[0xFD] = "eStick Slime";
	lookup[0xFE] = "eBlack Raven";
	lookup[0xFF] = "(empty)";

	weaponPowerLookup = { };
	weaponPowerLookup[0x08] = 1;
	weaponPowerLookup[0x00] = 2;
	weaponPowerLookup[0x18] = 5;
	weaponPowerLookup[0x01] = 7;
	weaponPowerLookup[0x02] = 12;
	weaponPowerLookup[0x03] = 14;
	weaponPowerLookup[0x07] = 15;
	weaponPowerLookup[0x0A] = 18;
	weaponPowerLookup[0x0C] = 24;
	weaponPowerLookup[0x04] = 28;
	weaponPowerLookup[0x09] = 30;
	weaponPowerLookup[0x1B] = 30;
	weaponPowerLookup[0x06] = 33;
	weaponPowerLookup[0x12] = 33;
	weaponPowerLookup[0x1F] = 35;
	weaponPowerLookup[0x05] = 40;
	weaponPowerLookup[0x0B] = 48;
	weaponPowerLookup[0x0C] = 48;
	weaponPowerLookup[0x16] = 50;
	weaponPowerLookup[0x4A] = 55;
	weaponPowerLookup[0x19] = 55;
	weaponPowerLookup[0x15] = 55;
	weaponPowerLookup[0x1D] = 63;
	weaponPowerLookup[0x17] = 65;
	weaponPowerLookup[0x1E] = 77;
	weaponPowerLookup[0x0E] = 80;
	weaponPowerLookup[0x1A] = 85;
	weaponPowerLookup[0x0F] = 90;
	weaponPowerLookup[0x0D] = 95;
	weaponPowerLookup[0x14] = 100;
	weaponPowerLookup[0x13] = 110;
	weaponPowerLookup[0x1C] = 120;

	classLookup[0x00] = "Hero, Male";
	classLookup[0x01] = "Wizard, Male";
	classLookup[0x02] = "Pilgrim, Male";
	classLookup[0x03] = "Sage, Male";
	classLookup[0x04] = "Soldier, Male";
	classLookup[0x05] = "Merchant, Male";
	classLookup[0x06] = "Fighter, Male";
	classLookup[0x07] = "Goof-off, Male";
	classLookup[0x08] = "Hero, Female";
	classLookup[0x09] = "Wizard, Female";
	classLookup[0x0A] = "Pilgrim, Female";
	classLookup[0x0B] = "Sage, Female";
	classLookup[0x0C] = "Soldier, Female";
	classLookup[0x0D] = "Merchant, Female";
	classLookup[0x0E] = "Fighter, Female";
	classLookup[0x0F] = "Goof-off, Female";
end

Setup();

p1Window = forms.newform(350, 600, "Character 1")

forms.label(p1Window, "HP:",     10, 20,  30, 19);
forms.label(p1Window, "MP:",    110, 20,  30, 19);
forms.label(p1Window, "XP:",    110, 40,  30, 19);
forms.label(p1Window, "Gold:",  210, 20,  33, 19);
forms.label(p1Window, "Lv:",     10, 40,  30, 19);
forms.label(p1Window, "To go:", 210, 40,  38, 19);
forms.label(p1Window, "Str:",    10, 60,  30, 19);
forms.label(p1Window, "Attack:", 70, 60,  42, 19);
forms.label(p1Window, "Ag:",    145, 60,  23, 19);

p1HPLabel     = forms.label(p1Window, "0", 41,  20, 100, 19)
p1MPLabel     = forms.label(p1Window, "0", 141, 20, 100, 19)
p1XPLabel     = forms.label(p1Window, "0", 141, 40,  50, 19)
p1GoldLabel   = forms.label(p1Window, "0", 245, 20, 150, 19)
p1LevelLabel  = forms.label(p1Window, "0", 41,  40, 150, 19)
p1XpToGoLabel = forms.label(p1Window, "0", 245, 40,  45, 19)
p1StrLabel    = forms.label(p1Window, "0",  41, 60,  45, 19)
p1AttackLabel = forms.label(p1Window, "0", 110, 60,  50, 19)
p1AgLabel     = forms.label(p1Window, "0", 165, 60,  45, 19)

forms.label(p1Window, "Inventory", 10, 100, 100, 19)
forms.label(p1Window, "Slot 1:", 20, 120, 50, 19)
forms.label(p1Window, "Slot 2:", 20, 140, 50, 19)
forms.label(p1Window, "Slot 3:", 20, 160, 50, 19)
forms.label(p1Window, "Slot 4:", 20, 180, 50, 19)
forms.label(p1Window, "Slot 5:", 180, 120, 50, 19)
forms.label(p1Window, "Slot 6:", 180, 140, 50, 19)
forms.label(p1Window, "Slot 7:", 180, 160, 50, 19)
forms.label(p1Window, "Slot 8:", 180, 180, 50, 19)

p1Slot1Label = forms.label(p1Window, "xxx", 70, 120, 150, 19)
p1Slot2Label = forms.label(p1Window, "xxx", 70, 140, 150, 19)
p1Slot3Label = forms.label(p1Window, "xxx", 70, 160, 150, 19)
p1Slot4Label = forms.label(p1Window, "xxx", 70, 180, 150, 19)
p1Slot5Label = forms.label(p1Window, "xxx", 230, 120, 150, 19)
p1Slot6Label = forms.label(p1Window, "xxx", 230, 140, 150, 19)
p1Slot7Label = forms.label(p1Window, "xxx", 230, 160, 150, 19)
p1Slot8Label = forms.label(p1Window, "xxx", 230, 180, 150, 19)

forms.label(p1Window, "Return List", 10, 220, 100, 19);
p1r01Label = forms.label(p1Window, "Aliahan",    10, 240, 70, 19);
p1r02Label = forms.label(p1Window, "Reeve",      10, 260, 70, 19);
p1r03Label = forms.label(p1Window, "Romaly",     10, 280, 70, 19);
p1r04Label = forms.label(p1Window, "Kanave",     10, 300, 70, 19);
p1r05Label = forms.label(p1Window, "Noaniels",   10, 320, 70, 19);

p1r06Label = forms.label(p1Window, "Assaram",    80, 240, 70, 19);
p1r07Label = forms.label(p1Window, "Isis",       80, 260, 70, 19);
p1r08Label = forms.label(p1Window, "Portoga",    80, 280, 70, 19);
p1r09Label = forms.label(p1Window, "Baharata",   80, 300, 70, 19);
p1r10Label = forms.label(p1Window, "Dhama",      80, 320, 70, 19);

p1r11Label = forms.label(p1Window, "Lancel",    150, 240, 70, 19);
p1r12Label = forms.label(p1Window, "Jipang",    150, 260, 70, 19);
p1r13Label = forms.label(p1Window, "Eginbear",  150, 280, 70, 19);
p1r14Label = forms.label(p1Window, "Samanao",   150, 300, 70, 19);
p1r15Label = forms.label(p1Window, "Soo",       150, 320, 70, 19);

p1r16Label = forms.label(p1Window, "Tantegel",  230, 240, 70, 19);
p1r17Label = forms.label(p1Window, "Hauksness", 230, 260, 70, 19);
p1r18Label = forms.label(p1Window, "Cantlin",   230, 280, 70, 19);
p1r19Label = forms.label(p1Window, "Kol",       230, 300, 70, 19);
p1r20Label = forms.label(p1Window, "Rimuldar",  230, 320, 70, 19);

forms.label(p1Window, "Spells", 10, 350, 100, 19);
p1fieldSpell0  = forms.label(p1Window, "*",  10, 370, 70, 19);
p1fieldSpell1  = forms.label(p1Window, "*",  10, 390, 70, 19);
p1fieldSpell2  = forms.label(p1Window, "*",  10, 410, 70, 19);
p1fieldSpell3  = forms.label(p1Window, "*",  10, 430, 70, 19);
p1fieldSpell4  = forms.label(p1Window, "*",  10, 450, 70, 19);
p1fieldSpell5  = forms.label(p1Window, "*",  10, 470, 70, 19);
p1fieldSpell6  = forms.label(p1Window, "*",  10, 490, 70, 19);
p1fieldSpell7  = forms.label(p1Window, "*",  10, 510, 70, 19);

p1battleSpell0  = forms.label(p1Window, "*",  80, 370, 70, 19);
p1battleSpell1  = forms.label(p1Window, "*",  80, 390, 70, 19);
p1battleSpell2  = forms.label(p1Window, "*",  80, 410, 70, 19);
p1battleSpell3  = forms.label(p1Window, "*",  80, 430, 70, 19);
p1battleSpell4  = forms.label(p1Window, "*",  80, 450, 70, 19);
p1battleSpell5  = forms.label(p1Window, "*",  80, 470, 70, 19);
p1battleSpell6  = forms.label(p1Window, "*",  80, 490, 70, 19);
p1battleSpell7  = forms.label(p1Window, "*",  80, 510, 70, 19);

p1battleSpell8  = forms.label(p1Window, "*", 150, 370, 70, 19);
p1battleSpell9  = forms.label(p1Window, "*", 150, 390, 70, 19);
p1battleSpell10 = forms.label(p1Window, "*", 150, 410, 70, 19);
p1battleSpell11 = forms.label(p1Window, "*", 150, 430, 70, 19);
p1battleSpell12 = forms.label(p1Window, "*", 150, 450, 70, 19);
p1battleSpell13 = forms.label(p1Window, "*", 150, 470, 70, 19);
p1battleSpell14 = forms.label(p1Window, "*", 150, 490, 70, 19);
p1battleSpell15 = forms.label(p1Window, "*", 150, 510, 70, 19);

p1battleSpell16 = forms.label(p1Window, "*", 230, 370, 70, 19);
p1battleSpell17 = forms.label(p1Window, "*", 230, 390, 70, 19);
p1battleSpell18 = forms.label(p1Window, "*", 230, 410, 70, 19);
p1battleSpell19 = forms.label(p1Window, "*", 230, 430, 70, 19);
p1battleSpell20 = forms.label(p1Window, "*", 230, 450, 70, 19);
p1battleSpell21 = forms.label(p1Window, "*", 230, 470, 70, 19);
p1battleSpell22 = forms.label(p1Window, "*", 230, 490, 70, 19);
p1battleSpell23 = forms.label(p1Window, "*", 230, 510, 70, 19);


function UpdateVars()
	p1Slot1Val = mainmemory.readbyte(0x077C);
	p1Slot1 = lookup[p1Slot1Val]; 
	
	p1Slot2Val = mainmemory.readbyte(0x077D);
	p1Slot2 = lookup[p1Slot2Val]; 

	p1Slot3Val = mainmemory.readbyte(0x077E);
	p1Slot3 = lookup[p1Slot3Val]; 

	p1Slot4Val = mainmemory.readbyte(0x077F);
	p1Slot4 = lookup[p1Slot4Val]; 

	p1Slot5Val = mainmemory.readbyte(0x0780);
	p1Slot5 = lookup[p1Slot5Val]; 

	p1Slot6Val = mainmemory.readbyte(0x0781);
	p1Slot6 = lookup[p1Slot6Val];

	p1Slot7Val = mainmemory.readbyte(0x0782);
	p1Slot7 = lookup[p1Slot7Val]; 
	
	p1Slot8Val = mainmemory.readbyte(0x0783);
	p1Slot8 = lookup[p1Slot8Val];

	p1HP = mainmemory.read_u16_le(0x071C);
	p1MaxHP = mainmemory.read_u16_le(0x0724);
	p1MP = mainmemory.read_u16_le(0x072C); 
	p1MaxMP = mainmemory.read_u16_le(0x0734);
	p1XP = mainmemory.read_u24_le(0x0744);
	p1ClassVal = mainmemory.readbyte(0x0718);
	p1Class = classLookup[p1ClassVal];
	p1Level = mainmemory.readbyte(0x0700);
	p1Str = mainmemory.readbyte(0x0704);
	p1Ag = mainmemory.readbyte(0x0708);
	gold = mainmemory.read_u24_le(0x07BC);

	p1returnbytes = mainmemory.read_u32_le(0x0750);
	p1spellBytes = mainmemory.read_u32_le(0x079C); 

	--TODO: support female classes
	p1XpToGo = xpLookup[(p1Level + 1) + (p1ClassVal * 100)] - p1XP;

	p1isHero = p1ClassVal == 0 or p1ClassVal == 8;
end

function UpdateForm()
	forms.settext(p1Window, "P1 - " .. p1Class)
	forms.settext(p1HPLabel, p1HP .. "/" .. p1MaxHP);
	forms.settext(p1MPLabel, p1MP .. "/" .. p1MaxMP);
	forms.settext(p1XPLabel, p1XP);
	forms.settext(p1GoldLabel, gold);
	forms.settext(p1LevelLabel, p1Level);
	forms.settext(p1XpToGoLabel, p1XpToGo);
	forms.settext(p1StrLabel, p1Str);
	forms.settext(p1AgLabel, p1Ag);

	forms.settext(p1Slot1Label, p1Slot1);
	forms.settext(p1Slot2Label, p1Slot2);
	forms.settext(p1Slot3Label, p1Slot3);
	forms.settext(p1Slot4Label, p1Slot4);
	forms.settext(p1Slot5Label, p1Slot5);
	forms.settext(p1Slot6Label, p1Slot6);
	forms.settext(p1Slot7Label, p1Slot7);
	forms.settext(p1Slot8Label, p1Slot8);
	forms.settext(p1AttackLabel, p1AttackPower);
end

function UpdateReturnList()
	if (bit.check(p1returnbytes, 0)) then
		forms.settext(p1r01Label, "Aliahan");
	else
		forms.settext(p1r01Label, "*");
	end

	if (bit.check(p1returnbytes, 1)) then
		forms.settext(p1r02Label, "Reeve");
	else
		forms.settext(p1r02Label, "*");
	end

	if (bit.check(p1returnbytes, 2)) then
		forms.settext(p1r03Label, "Romaly");
	else
		forms.settext(p1r03Label, "*");
	end

	if (bit.check(p1returnbytes, 3)) then
		forms.settext(p1r04Label, "Kanave");
	else
		forms.settext(p1r04Label, "*");
	end

	if (bit.check(p1returnbytes, 4)) then
		forms.settext(p1r05Label, "Noaniels");
	else
		forms.settext(p1r05Label, "*");
	end

	if (bit.check(p1returnbytes, 5)) then
		forms.settext(p1r06Label, "Assaram");
	else
		forms.settext(p1r06Label, "*");
	end

	if (bit.check(p1returnbytes, 6)) then
		forms.settext(p1r07Label, "Isis");
	else
		forms.settext(p1r07Label, "*");
	end

	if (bit.check(p1returnbytes, 7)) then
		forms.settext(p1r08Label, "Portoga");
	else
		forms.settext(p1r08Label, "*");
	end

	if (bit.check(p1returnbytes, 8)) then
		forms.settext(p1r09Label, "Baharata");
	else
		forms.settext(p1r09Label, "*");
	end

	if (bit.check(p1returnbytes, 9)) then
		forms.settext(p1r10Label, "Dhama");
	else
		forms.settext(p1r10Label, "*");
	end

	if (bit.check(p1returnbytes, 10)) then
		forms.settext(p1r11Label, "Lancel");
	else
		forms.settext(p1r11Label, "*");
	end

	if (bit.check(p1returnbytes, 11)) then
		forms.settext(p1r12Label, "Jipang");
	else
		forms.settext(p1r12Label, "*");
	end

	if (bit.check(p1returnbytes, 12)) then
		forms.settext(p1r13Label, "Eginbear");
	else
		forms.settext(p1r13Label, "*");
	end

	if (bit.check(p1returnbytes, 13)) then
		forms.settext(p1r14Label, "Samanao");
	else
		forms.settext(p1r14Label, "*");
	end

	if (bit.check(p1returnbytes, 14)) then
		forms.settext(p1r15Label, "Soo");
	else
		forms.settext(p1r15Label, "*");
	end

	if (bit.check(p1returnbytes, 15)) then
		forms.settext(p1r16Label, "Tantegel");
	else
		forms.settext(p1r16Label, "*");
	end

	if (bit.check(p1returnbytes, 16)) then
		forms.settext(p1r17Label, "Hauksness");
	else
		forms.settext(p1r17Label, "*");
	end

	if (bit.check(p1returnbytes, 17)) then
		forms.settext(p1r18Label, "Cantlin");
	else
		forms.settext(p1r18Label, "*");
	end

	if (bit.check(p1returnbytes, 18)) then
		forms.settext(p1r19Label, "Kol");
	else
		forms.settext(p1r19Label, "*");
	end

	if (bit.check(p1returnbytes, 19)) then
		forms.settext(p1r20Label, "Rimuldar");
	else
		forms.settext(p1r20Label, "*");
	end
end

function UpdateSpellList()
	if (p1isHero) then
		if (bit.check(p1spellBytes, 24)) then
			forms.settext(p1fieldSpell0, heroFieldSpells[0]);
		else
			forms.settext(p1fieldSpell0, "(" .. heroFieldSpellsLv[0] .. ")");
		end

		if (bit.check(p1spellBytes, 25)) then
			forms.settext(p1fieldSpell1, heroFieldSpells[1]);
		else
			forms.settext(p1fieldSpell1, "(" .. heroFieldSpellsLv[1] .. ")");
		end

		if (bit.check(p1spellBytes, 26)) then
			forms.settext(p1fieldSpell2, heroFieldSpells[2]);
		else
			forms.settext(p1fieldSpell2, "(" .. heroFieldSpellsLv[2] .. ")");
		end

		if (bit.check(p1spellBytes, 27)) then
			forms.settext(p1fieldSpell3, heroFieldSpells[3]);
		else
			forms.settext(p1fieldSpell3, "(" .. heroFieldSpellsLv[3] .. ")");
		end

		if (bit.check(p1spellBytes, 28)) then
			forms.settext(p1fieldSpell4, heroFieldSpells[4]);
		else
			forms.settext(p1fieldSpell4, "(" .. heroFieldSpellsLv[4] .. ")");
		end

		if (bit.check(p1spellBytes, 29)) then
			forms.settext(p1fieldSpell5, heroFieldSpells[5]);
		else
			forms.settext(p1fieldSpell5, "(" .. heroFieldSpellsLv[5] .. ")");
		end

		if (bit.check(p1spellBytes, 30)) then
			forms.settext(p1fieldSpell6, heroFieldSpells[6]);
		else
			forms.settext(p1fieldSpell6, "(" .. heroFieldSpellsLv[6] .. ")");
		end

		if (bit.check(p1spellBytes, 31)) then
			forms.settext(p1fieldSpell7, heroFieldSpells[7]);
		else
			forms.settext(p1fieldSpell7, "(" .. heroFieldSpellsLv[7] .. ")");
		end

		if (bit.check(p1spellBytes, 0)) then
			forms.settext(p1battleSpell0, heroBattleSpells[0]);
		else
			forms.settext(p1battleSpell0, "(" .. heroBattleSpellsLv[0] .. ")");
		end

		if (bit.check(p1spellBytes, 1)) then
			forms.settext(p1battleSpell1, heroBattleSpells[1]);
		else
			forms.settext(p1battleSpell1, "(" .. heroBattleSpellsLv[1] .. ")");
		end

		if (bit.check(p1spellBytes, 2)) then
			forms.settext(p1battleSpell2, heroBattleSpells[2]);
		else
			forms.settext(p1battleSpell2, "(" .. heroBattleSpellsLv[2] .. ")");
		end

		if (bit.check(p1spellBytes, 3)) then
			forms.settext(p1battleSpell3, heroBattleSpells[3]);
		else
			forms.settext(p1battleSpell3, "(" .. heroBattleSpellsLv[3] .. ")");
		end

		if (bit.check(p1spellBytes, 4)) then
			forms.settext(p1battleSpell4, heroBattleSpells[4]);
		else
			forms.settext(p1battleSpell4, "(" .. heroBattleSpellsLv[4] .. ")");
		end

		if (bit.check(p1spellBytes, 5)) then
			forms.settext(p1battleSpell5, heroBattleSpells[5]);
		else
			forms.settext(p1battleSpell5, "(" .. heroBattleSpellsLv[5] .. ")");
		end

		if (bit.check(p1spellBytes, 6)) then
			forms.settext(p1battleSpell6, heroBattleSpells[6]);
		else
			forms.settext(p1battleSpell6, "(" .. heroBattleSpellsLv[6] .. ")");
		end

		if (bit.check(p1spellBytes, 7)) then
			forms.settext(p1battleSpell7, heroBattleSpells[7]);
		else
			forms.settext(p1battleSpell7, "(" .. heroBattleSpellsLv[7] .. ")");
		end

		if (bit.check(p1spellBytes, 8)) then
			forms.settext(p1battleSpell8, heroBattleSpells[8]);
		else
			forms.settext(p1battleSpell8, "(" .. heroBattleSpellsLv[8] .. ")");
		end

		if (bit.check(p1spellBytes, 9)) then
			forms.settext(p1battleSpell9, heroBattleSpells[9]);
		else
			forms.settext(p1battleSpell9, "(" .. heroBattleSpellsLv[9] .. ")");
		end

		if (bit.check(p1spellBytes, 10)) then
			forms.settext(p1battleSpell10, heroBattleSpells[10]);
		else
			forms.settext(p1battleSpell10, "(" .. heroBattleSpellsLv[10] .. ")");
		end

		if (bit.check(p1spellBytes, 11)) then
			forms.settext(p1battleSpell11, heroBattleSpells[11]);
		else
			forms.settext(p1battleSpell11, "(" .. heroBattleSpellsLv[11] .. ")");
		end

		if (bit.check(p1spellBytes, 12)) then
			forms.settext(p1battleSpell12, heroBattleSpells[12]);
		else
			forms.settext(p1battleSpell12, "(" .. heroBattleSpellsLv[12] .. ")");
		end

		if (bit.check(p1spellBytes, 13)) then
			forms.settext(p1battleSpell13, heroBattleSpells[13]);
		else
			forms.settext(p1battleSpell13, "(" .. heroBattleSpellsLv[13] .. ")");
		end

		if (bit.check(p1spellBytes, 14)) then
			forms.settext(p1battleSpell14, heroBattleSpells[14]);
		else
			forms.settext(p1battleSpell14, "(" .. heroBattleSpellsLv[14] .. ")");
		end

		if (bit.check(p1spellBytes, 15)) then
			forms.settext(p1battleSpell15, heroBattleSpells[15]);
		else
			forms.settext(p1battleSpell15, "(" .. heroBattleSpellsLv[15] .. ")");
		end

		forms.settext(p1battleSpell16, "");
		forms.settext(p1battleSpell17, "");
		forms.settext(p1battleSpell18, "");
		forms.settext(p1battleSpell19, "");

		forms.settext(p1battleSpell20, "");
		forms.settext(p1battleSpell21, "");
		forms.settext(p1battleSpell22, "");
		forms.settext(p1battleSpell23, "");
	end
end

function CalculateAttackPower()
	p1AttackPower = p1Str;

	if (p1Slot1Val >= 0x80 and weaponPowerLookup[p1Slot1Val - 0x80] ~= nil) then
		p1AttackPower = p1AttackPower + weaponPowerLookup[p1Slot1Val - 0x80];
	elseif (p1Slot2Val >= 0x80 and weaponPowerLookup[p1Slot2Val - 0x80] ~= nil) then
		p1AttackPower = p1AttackPower + weaponPowerLookup[p1Slot2Val - 0x80];
	elseif (p1Slot3Val >= 0x80 and weaponPowerLookup[p1Slot3Val - 0x80] ~= nil) then
		p1AttackPower = p1AttackPower + weaponPowerLookup[p1Slot3Val - 0x80];
	elseif (p1Slot4Val >= 0x80 and weaponPowerLookup[p1Slot4Val - 0x80] ~= nil) then
		p1AttackPower = p1AttackPower + weaponPowerLookup[p1Slot4Val - 0x80];
	elseif (p1Slot5Val >= 0x80 and weaponPowerLookup[p1Slot5Val - 0x80] ~= nil) then
		p1AttackPower = p1AttackPower + weaponPowerLookup[p1Slot5Val - 0x80];
	elseif (p1Slot6Val >= 0x80 and weaponPowerLookup[p1Slot6Val - 0x80] ~= nil) then
		p1AttackPower = p1AttackPower + weaponPowerLookup[p1Slot6Val - 0x80];
	elseif (p1Slot7Val >= 0x80 and weaponPowerLookup[p1Slot7Val - 0x80] ~= nil) then
		p1AttackPower = p1AttackPower + weaponPowerLookup[p1Slot7Val - 0x80];
	elseif (p1Slot8Val >= 0x80 and weaponPowerLookup[p1Slot8Val - 0x80] ~= nil) then
		p1AttackPower = p1AttackPower + weaponPowerLookup[p1Slot8Val - 0x80];
	end
end

while true do
	UpdateVars();
	CalculateAttackPower();
	UpdateForm();
	UpdateReturnList();
	UpdateSpellList();
	emu.frameadvance();
end