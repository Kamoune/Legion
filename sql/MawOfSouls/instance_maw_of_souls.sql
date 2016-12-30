UPDATE instance_template SET script = 'instance_maw_of_souls' WHERE map = 1492;
INSERT INTO game_tele (`position_x`, `position_y`, `position_z`, `orientation`, `map`, `name`) VALUES (7186.82, 7319.46, 23.5025, 6.18178, 1492, 'mawofsouls');

DELETE FROM `instance_encounters` WHERE entry IN (1822, 1823, 1824);
INSERT INTO `instance_encounters` (`entry`, `creditType`, `creditEntry`, `lastEncounterDungeon`, `comment`) VALUES
(1822, 0, 96756, 0, "Ymiron, The Fallen King"),
(1823, 0, 96754, 0, "Harbaron"),
(1824, 0, 96759, 1192, "Helya");

DELETE FROM graveyard_zone WHERE id IN (5101, 5102);
INSERT INTO graveyard_zone(`ID`, `GhostZone`, `Faction`, `Comment`) VALUES
(5102, 7812, 0, "Maw of Souls - Instance Entrance"),
(5101, 7811, 0, "Maw of Souls - The Naglfar - Lower Deck");

DELETE FROM `creature_template` WHERE (entry = 600000);
INSERT INTO creature_template VALUES ('600000', '0', '0', '0', '0', '0', '1126', '11686', '0', '0', 'Maw Players Resurrector Stalker', '', '', '', '0', '110', '110', '6', '0', '0', '35', '0', '1', '0.992063', '1', '0', '0', '0', '0', '1', '1', '1', '131330', '0', '0', '0', '0', '0', '0', '10', '1024', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', 'maw_players_resurrector', '23222');

SET @OGUID := 600000;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+13;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@OGUID+0, 252145, 1220, 0, 0, 3, 0, 0, 3431.081, 1985.104, 20.36966, 3.272695, 0, 0, -0.9978523, 0.06550389, 7200, 255, 1, 23222), -- Instance Portal (Area: -Unknown-)
(@OGUID+1, 252330, 1220, 0, 0, 3, 0, 0, 3387.289, 1972.415, 2.807562, 3.412122, -0.04659319, 0.04033756, -0.9892349, 0.1327261, 7200, 255, 1, 23222), -- Meeting Stone (Area: -Unknown-)
(@OGUID+2, 252145, 1492, 0, 0, 8388870, 0, 0, 7162.329, 7317.961, 20.86309, 0.2037807, 0, 0, 0.1017141, 0.9948137, 7200, 255, 1, 23222), -- Instance Portal (Area: -Unknown-)
(@OGUID+3, 245065, 1492, 0, 0, 8388870, 0, 0, 7260.633, 7284.174, 25.8094, 0.4974239, 0, 0, 0.2461557, 0.9692303, 7200, 255, 1, 23222), -- Kvaldir Cage (Area: -Unknown-)
(@OGUID+4, 246779, 1492, 0, 0, 8388870, 0, 0, 7189.398, 7318.07, 23.68542, 2.962996, 0, 0, 0.9960155, 0.08917986, 7200, 255, 1, 23222), -- -Unknown- (Area: -Unknown-)
(@OGUID+5, 252145, 1492, 0, 0, 8388870, 0, 0, 7162.329, 7317.961, 20.86309, 0.2037807, 0, 0, 0.1017141, 0.9948137, 7200, 255, 1, 23222), -- Instance Portal (Area: -Unknown-)
(@OGUID+6, 245062, 1492, 0, 0, 8388870, 0, 0, 7355.401, 7315.599, 47.93732, 4.424408, 0, 0, -0.8012543, 0.598324, 7200, 255, 1, 23222), -- Kvaldir Cage (Area: -Unknown-)
(@OGUID+7, 245063, 1492, 0, 0, 8388870, 0, 0, 7273.168, 7287.924, 33.72406, 2.286379, 0, 0, 0.9099607, 0.4146944, 7200, 255, 1, 23222), -- Kvaldir Cage (Area: -Unknown-)
(@OGUID+8, 245066, 1492, 0, 0, 8388870, 0, 0, 7362.204, 7316.752, 43.68834, 4.276065, -0.02543831, 0.01067924, -0.8432598, 0.5367976, 7200, 255, 1, 23222), -- Kvaldir Cage (Area: -Unknown-)
(@OGUID+9, 245067, 1492, 0, 0, 8388870, 0, 0, 7348.616, 7314.836, 43.69791, 4.633855, 0, 0, -0.7343206, 0.6788027, 7200, 255, 1, 23222), -- Kvaldir Cage (Area: -Unknown-)
(@OGUID+10, 245064, 1492, 0, 0, 8388870, 0, 0, 7266.36, 7283.658, 26.68779, 1.003559, 0, 0, 0.4809866, 0.8767279, 7200, 255, 1, 23222), -- Kvaldir Cage (Area: -Unknown-)
(@OGUID+11, 247041, 1492, 0, 0, 8388870, 0, 0, 7420.499, 7245.048, 53.57076, 5.139995, -0.01649523, -0.03176975, -0.5405283, 0.840564, 7200, 255, 1, 23222), -- Echoing Horn of the Damned (Area: -Unknown-)
(@OGUID+12, 253001, 1492, 0, 0, 8388870, 0, 0, 7509.893, 7286.906, -6.652445, 4.255993, -0.04124069, -0.03155231, -0.8474579, 0.5283169, 7200, 255, 1, 23222), -- Rune-etched Archway (Area: -Unknown-)
(@OGUID+13, 246919,	1492, 0, 0,	8388870, 0, 0, 2932.86, 805.797, 500.333, 3.15972, 2.5924e-43, 0, 0.999959, -0.00906364, 300, 255, 1, 23222); -- The Naglfar Ship


SET @CGUID := 600000;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+80;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES (@CGUID+0, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7229.134, 7267.433, 46.96513, 1.432974, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+1, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7247.713, 7290.722, 26.01199, 3.969555, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+2, 97043, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7272.672, 7307.914, 30.79326, 4.214231, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Slaver (Area: -Unknown-)
(@CGUID+3, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7232.36, 7286.83, 22.35869, 0.3233142, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+4, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7302.258, 7304.413, 54.85698, 4.612476, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+5, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7295.563, 7298.828, 44.8317, 0.3612094, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+6, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7265.573, 7271.24, 19.56293, 0.3090581, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+7, 102896, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7272.857, 7288.393, 33.83196, 2.237862, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Enslaved Shieldmaiden (Area: -Unknown-)
(@CGUID+8, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7235.708, 7268.249, 23.21821, 4.723187, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+9, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7236.272, 7291.563, 22.61807, 5.71005, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+10, 102108, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7266.526, 7283.823, 27.31654, 1.75255, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Captured Shieldmaiden (Area: -Unknown-) (Auras: )
(@CGUID+11, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7261.846, 7275.809, 30.06504, 4.145046, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+12, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7304.203, 7278.18, 48.78083, 1.937044, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+13, 97200, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7308.38, 7305.241, 38.95266, 3.825749, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Soulkeeper (Area: -Unknown-) (Auras: )
(@CGUID+14, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7316.836, 7244.78, 18.60527, 5.505509, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+15, 114712, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7387.009, 7299.402, 43.86743, 5.835454, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Runecarver Slave (Area: -Unknown-) (Auras: )
(@CGUID+16, 101013, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7355.518, 7315.785, 48.01328, 4.297879, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Captured Runecarver (Area: -Unknown-)
(@CGUID+17, 114712, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7386.745, 7292.162, 43.86743, 0.05482224, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Runecarver Slave (Area: -Unknown-) (Auras: )
(@CGUID+18, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7349.78, 7260.906, 69.42625, 1.482801, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+19, 102375, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7370.083, 7273.213, 44.02735, 2.03835, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Runecarver Slave (Area: -Unknown-) (Auras: )
(@CGUID+20, 114712, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7390.375, 7285.93, 43.86743, 0.328258, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Runecarver Slave (Area: -Unknown-) (Auras: )
(@CGUID+21, 97043, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7356.292, 7300.133, 43.56019, 2.470122, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Slaver (Area: -Unknown-) (Auras: )
(@CGUID+22, 97043, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7352.41, 7300.069, 43.32479, 1.267673, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Slaver (Area: -Unknown-) (Auras: )
(@CGUID+23, 102896, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7348.624, 7315.28, 43.86743, 5.018372, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Enslaved Shieldmaiden (Area: -Unknown-)
(@CGUID+24, 102375, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7374.147, 7275.221, 43.88184, 2.03835, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Runecarver Slave (Area: -Unknown-) (Auras: )
(@CGUID+25, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7333.237, 7251.394, 59.53788, 3.762645, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+26, 97200, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7371.015, 7282.063, 43.86824, 4.821636, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Soulkeeper (Area: -Unknown-) (Auras: )
(@CGUID+27, 102104, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7366.313, 7275.135, 43.95937, 2.03835, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Enslaved Shieldmaiden (Area: -Unknown-) (Auras: )
(@CGUID+28, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7345.139, 7266.312, 70.70763, 1.111571, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+29, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7386.795, 7289.05, 64.94066, 0.279971, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+30, 114712, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7393.052, 7312.54, 43.86743, 5.583257, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Runecarver Slave (Area: -Unknown-) (Auras: )
(@CGUID+31, 102894, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7362.337, 7317.049, 43.86743, 4.486273, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Runecarver Slave (Area: -Unknown-)
(@CGUID+32, 114712, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7386.509, 7304.949, 43.923, 5.692231, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Runecarver Slave (Area: -Unknown-) (Auras: )
(@CGUID+33, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7361.366, 7193.775, 26.34376, 1.695675, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+34, 96756, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7407.954, 7265.255, 51.08705, 5.549542, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Ymiron, the Fallen King (Area: -Unknown-)
(@CGUID+35, 114712, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7393.358, 7306.038, 43.91209, 5.583257, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Runecarver Slave (Area: -Unknown-) (Auras: )
(@CGUID+36, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7396.699, 7181.069, 40.50397, 4.511701, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-) (Auras: 191889 - Dive)
(@CGUID+37, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7394.725, 7186.672, 40.58971, 6.126225, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+38, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7401.088, 7306.69, 46.89287, 0.3380832, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+39, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7415.908, 7272.69, 73.29677, 0.3381512, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-)
(@CGUID+40, 97043, 1492, 0, 0, 8388870, '0', 0, 0, 0, 7363.89, 7278.892, 43.87113, 6.018615, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Slaver (Area: -Unknown-) (Auras: )
(@CGUID+41, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2902.226, 817.1215, 515.2433, 1.342426, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-) (Auras: 191889 - Dive)
(@CGUID+42, 99188, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2930.449, 840.1702, 515.119, 4.658661, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Waterlogged Soul Guard (Area: -Unknown-) (Auras: )
(@CGUID+43, 97365, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2905.726, 831.0504, 515.2433, 2.246976, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Mistmender (Area: -Unknown-)
(@CGUID+44, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2903.607, 821.2344, 515.2433, 4.086382, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-) (Auras: 191889 - Dive)
(@CGUID+45, 97097, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2937.976, 677.8143, 527.9267, 1.7316, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Helarjar Champion (Area: -Unknown-) (Auras: 42459 - Dual Wield)
(@CGUID+46, 96754, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2934.488, 715.757, 554.2856, 1.552549, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Harbaron (Area: -Unknown-) (Auras: )
(@CGUID+47, 99188, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2911.404, 784.1945, 515.2433, 0.7950303, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Waterlogged Soul Guard (Area: -Unknown-) (Auras: 203602 - Blocking)
(@CGUID+48, 102769, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2923.126, 819.7518, 515.2433, 4.333765, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Decrepit Runecarver (Area: -Unknown-) (Auras: 203058 - Fallen Vrykul)
(@CGUID+49, 97119, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2948.273, 796.6548, 515.3503, 3.050961, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Shroud Hound (Area: -Unknown-) (Auras: )
(@CGUID+50, 99188, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2935.376, 840.2309, 515.0275, 4.738481, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Waterlogged Soul Guard (Area: -Unknown-) (Auras: )
(@CGUID+51, 102769, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2964.29, 837.8594, 515.2433, 4.118559, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Decrepit Runecarver (Area: -Unknown-) (Auras: 203058 - Fallen Vrykul)
(@CGUID+52, 99188, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2921.481, 780.441, 515.2433, 1.812805, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Waterlogged Soul Guard (Area: -Unknown-) (Auras: 203602 - Blocking)
(@CGUID+53, 102830, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2904.111, 820.0347, 515.2433, 3.710789, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Deceased Sorcerer (Area: -Unknown-) (Auras: 70628 - Permanent Feign Death)
(@CGUID+54, 97119, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2911.791, 748.0426, 515.0735, 4.124866, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Shroud Hound (Area: -Unknown-) (Auras: )
(@CGUID+55, 98919, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2903.462, 825.8333, 515.2433, 2.370274, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Swiftblade (Area: -Unknown-) (Auras: 195219 - Eye Patch, 197227 - Kneeling, 42459 - Dual Wield)
(@CGUID+56, 98919, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2962.839, 833.3246, 515.2433, 1.265842, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Swiftblade (Area: -Unknown-) (Auras: 195219 - Eye Patch, 42459 - Dual Wield)
(@CGUID+57, 97182, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2957.563, 754.1064, 515.3503, 4.956388, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Night Watch Mariner (Area: -Unknown-) (Auras: 203605 - Fencing)
(@CGUID+58, 97119, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2918.049, 780.9871, 515.3503, 4.47607, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Shroud Hound (Area: -Unknown-) (Auras: )
(@CGUID+59, 97163, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2898.324, 817.125, 519.0612, 5.937058, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Cursed Falke (Area: -Unknown-) (Auras: 191889 - Dive)
(@CGUID+60, 102742, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2900.484, 832.3768, 515.2433, 0.3137651, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Fallen Shieldmaiden (Area: -Unknown-) (Auras: 203038 - Fallen Vrykul)
(@CGUID+61, 97119, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2953.309, 805.0903, 515.0328, 3.291466, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Shroud Hound (Area: -Unknown-) (Auras: 145953 - Cosmetic - Sleep Zzz)
(@CGUID+62, 97097, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2929.48, 678.6545, 527.9267, 1.430155, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Helarjar Champion (Area: -Unknown-) (Auras: 42459 - Dual Wield)
(@CGUID+63, 104906, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2944.066, 720.743, 555.2134, 3.97919, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Captured Val'kyr (Area: -Unknown-)
(@CGUID+64, 97097, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2949.207, 798.0052, 535.4015, 5.090273, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Helarjar Champion (Area: -Unknown-) (Auras: 42459 - Dual Wield)
(@CGUID+65, 97097, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2957.076, 744.3143, 538.6071, 5.072854, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Helarjar Champion (Area: -Unknown-) (Auras: 42459 - Dual Wield)
(@CGUID+66, 99307, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2933.65, 874.5573, 537.3766, 4.651583, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Skjal (Area: -Unknown-)
(@CGUID+67, 97097, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2906.97, 745.7726, 538.636, 4.463347, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Helarjar Champion (Area: -Unknown-) (Auras: 194414 - Soul Cage)
(@CGUID+68, 99033, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2925.457, 919.1545, 512.6249, 5.169266, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Helarjar Mistcaller (Area: -Unknown-) (Auras: 194414 - Soul Cage)
(@CGUID+69, 98919, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2940.283, 918.507, 512.6249, 4.373073, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Swiftblade (Area: -Unknown-) (Auras: 42459 - Dual Wield)
(@CGUID+70, 97365, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2940.283, 918.507, 512.6249, 4.290603, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Mistmender (Area: -Unknown-) (Auras: 194414 - Soul Cage)
(@CGUID+71, 98919, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2925.457, 919.1545, 512.6249, 4.683666, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Swiftblade (Area: -Unknown-) (Auras: 42459 - Dual Wield)
(@CGUID+72, 97200, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2940.283, 918.507, 512.6249, 4.709257, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Soulkeeper (Area: -Unknown-) (Auras: 194414 - Soul Cage)
(@CGUID+73, 97365, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2925.457, 919.1545, 512.6249, 4.740427, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Mistmender (Area: -Unknown-) (Auras: 194414 - Soul Cage)
(@CGUID+74, 99033, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2940.283, 918.507, 512.6249, 4.300092, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Helarjar Mistcaller (Area: -Unknown-) (Auras: 194414 - Soul Cage)
(@CGUID+75, 97200, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2925.457, 919.1545, 512.6249, 4.683666, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Soulkeeper (Area: -Unknown-) (Auras: 194414 - Soul Cage)
(@CGUID+76, 98919, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2926.383, 886.1268, 537.3608, 4.3069, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Swiftblade (Area: -Unknown-) (Auras: )
(@CGUID+77, 98919, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2928.784, 885.9288, 537.3597, 4.812201, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Seacursed Swiftblade (Area: -Unknown-) (Auras: )
(@CGUID+78, 99033, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2942.498, 884.4861, 537.5312, 3.040136, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Helarjar Mistcaller (Area: -Unknown-)
(@CGUID+79, 99033, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2928.784, 885.9288, 537.3597, 4.373073, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222), -- Helarjar Mistcaller (Area: -Unknown-) (Auras: )
(@CGUID+80, 96759, 1492, 0, 0, 8388870, '0', 0, 0, 0, 2933.499, 1055.943, 510.5183, 4.799655, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 23222); -- Helya (Area: -Unknown-) (Auras: 194603 - Soulless Scream)


UPDATE creature_template SET faction = 16, minlevel = 110, maxlevel = 110, VerifiedBuild = 23222 WHERE entry IN 
(97163, 97043, 102896, 102108, 97200, 114712, 101013, 102375, 102104, 102894, 99188, 97365, 97097, 102769, 97119, 102830, 98919, 97182, 102742, 104906, 99307, 99033);
UPDATE creature_template SET faction = 16, minlevel = 112, maxlevel = 112, VerifiedBuild = 23222, ScriptName = 'boss_ymiron_maw' WHERE entry = 96756;
UPDATE creature_template SET faction = 16, minlevel = 112, maxlevel = 112, VerifiedBuild = 23222, ScriptName = 'boss_harbaron_maw' WHERE entry = 96754;
UPDATE creature_template SET faction = 16, minlevel = 112, maxlevel = 112, VerifiedBuild = 23222, ScriptName = 'boss_helya_maw' WHERE entry = 96759;

DELETE FROM `creature_addon` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+79;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(@CGUID+0, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+1, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+2, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Seacursed Slaver
(@CGUID+3, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+4, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+5, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+6, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+7, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Enslaved Shieldmaiden
(@CGUID+8, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+9, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+10, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Captured Shieldmaiden
(@CGUID+11, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+12, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+13, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Seacursed Soulkeeper
(@CGUID+14, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+15, 0, 0, 8, 1, 0, 0, 0, 0, ''), -- Runecarver Slave
(@CGUID+16, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Captured Runecarver
(@CGUID+17, 0, 0, 8, 1, 0, 0, 0, 0, ''), -- Runecarver Slave
(@CGUID+18, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+19, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Runecarver Slave
(@CGUID+20, 0, 0, 8, 1, 0, 0, 0, 0, ''), -- Runecarver Slave
(@CGUID+21, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Seacursed Slaver
(@CGUID+22, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Seacursed Slaver
(@CGUID+23, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Enslaved Shieldmaiden
(@CGUID+24, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Runecarver Slave
(@CGUID+25, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+26, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Seacursed Soulkeeper
(@CGUID+27, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Enslaved Shieldmaiden
(@CGUID+28, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+29, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+30, 0, 0, 8, 1, 0, 0, 0, 0, ''), -- Runecarver Slave
(@CGUID+31, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Runecarver Slave
(@CGUID+32, 0, 0, 8, 1, 0, 0, 0, 0, ''), -- Runecarver Slave
(@CGUID+33, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+34, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Ymiron, the Fallen King
(@CGUID+35, 0, 0, 8, 1, 0, 0, 0, 0, ''), -- Runecarver Slave
(@CGUID+36, 0, 0, 50331648, 1, 0, 0, 0, 0, '191889'), -- Cursed Falke - 191889 - Dive
(@CGUID+37, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+38, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+39, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Cursed Falke
(@CGUID+40, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Seacursed Slaver
(@CGUID+41, 0, 0, 50331648, 1, 0, 0, 0, 0, '191889'), -- Cursed Falke - 191889 - Dive
(@CGUID+42, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Waterlogged Soul Guard
(@CGUID+43, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- Seacursed Mistmender
(@CGUID+44, 0, 0, 50331648, 1, 0, 0, 0, 0, '191889'), -- Cursed Falke - 191889 - Dive
(@CGUID+45, 0, 0, 0, 1, 0, 0, 0, 0, '42459'), -- Helarjar Champion - 42459 - Dual Wield
(@CGUID+46, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- Harbaron
(@CGUID+47, 0, 0, 0, 1, 0, 0, 0, 0, '203602'), -- Waterlogged Soul Guard - 203602 - Blocking
(@CGUID+48, 0, 0, 0, 1, 0, 0, 0, 0, '203058'), -- Decrepit Runecarver - 203058 - Fallen Vrykul
(@CGUID+49, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Shroud Hound
(@CGUID+50, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Waterlogged Soul Guard
(@CGUID+51, 0, 0, 0, 1, 0, 0, 0, 0, '203058'), -- Decrepit Runecarver - 203058 - Fallen Vrykul
(@CGUID+52, 0, 0, 0, 1, 0, 0, 0, 0, '203602'), -- Waterlogged Soul Guard - 203602 - Blocking
(@CGUID+53, 0, 0, 0, 1, 0, 0, 0, 0, '70628'), -- Deceased Sorcerer - 70628 - Permanent Feign Death
(@CGUID+54, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Shroud Hound
(@CGUID+55, 0, 0, 0, 1, 0, 0, 0, 0, '195219 197227 42459'), -- Seacursed Swiftblade - 195219 - Eye Patch, 197227 - Kneeling, 42459 - Dual Wield
(@CGUID+56, 0, 0, 0, 1, 0, 0, 0, 0, '195219 42459'), -- Seacursed Swiftblade - 195219 - Eye Patch, 42459 - Dual Wield
(@CGUID+57, 0, 0, 0, 1, 0, 0, 0, 0, '203605'), -- Night Watch Mariner - 203605 - Fencing
(@CGUID+58, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Shroud Hound
(@CGUID+59, 0, 0, 50331648, 1, 0, 0, 0, 0, '191889'), -- Cursed Falke - 191889 - Dive
(@CGUID+60, 0, 0, 0, 1, 0, 0, 0, 0, '203038'), -- Fallen Shieldmaiden - 203038 - Fallen Vrykul
(@CGUID+61, 0, 0, 0, 1, 0, 0, 0, 0, '145953'), -- Shroud Hound - 145953 - Cosmetic - Sleep Zzz
(@CGUID+62, 0, 0, 0, 1, 0, 0, 0, 0, '42459'), -- Helarjar Champion - 42459 - Dual Wield
(@CGUID+63, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- Captured Val'kyr
(@CGUID+64, 0, 0, 0, 1, 0, 0, 0, 0, '42459'), -- Helarjar Champion - 42459 - Dual Wield
(@CGUID+65, 0, 0, 0, 1, 0, 0, 0, 0, '42459'), -- Helarjar Champion - 42459 - Dual Wield
(@CGUID+66, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Skjal
(@CGUID+67, 0, 0, 0, 1, 0, 0, 0, 0, '194414'), -- Helarjar Champion - 194414 - Soul Cage
(@CGUID+68, 0, 0, 0, 1, 0, 0, 0, 0, '194414'), -- Helarjar Mistcaller - 194414 - Soul Cage
(@CGUID+69, 0, 0, 0, 1, 0, 0, 0, 0, '42459'), -- Seacursed Swiftblade - 42459 - Dual Wield
(@CGUID+70, 0, 0, 0, 1, 0, 0, 0, 0, '194414'), -- Seacursed Mistmender - 194414 - Soul Cage
(@CGUID+71, 0, 0, 0, 1, 0, 0, 0, 0, '42459'), -- Seacursed Swiftblade - 42459 - Dual Wield
(@CGUID+72, 0, 0, 0, 1, 0, 0, 0, 0, '194414'), -- Seacursed Soulkeeper - 194414 - Soul Cage
(@CGUID+73, 0, 0, 0, 1, 0, 0, 0, 0, '194414'), -- Seacursed Mistmender - 194414 - Soul Cage
(@CGUID+74, 0, 0, 0, 1, 0, 0, 0, 0, '194414'), -- Helarjar Mistcaller - 194414 - Soul Cage
(@CGUID+75, 0, 0, 0, 1, 0, 0, 0, 0, '194414'), -- Seacursed Soulkeeper - 194414 - Soul Cage
(@CGUID+76, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Seacursed Swiftblade
(@CGUID+77, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Seacursed Swiftblade
(@CGUID+78, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Helarjar Mistcaller
(@CGUID+79, 0, 0, 0, 1, 0, 0, 0, 0, ''); -- Helarjar Mistcaller

DELETE FROM `creature_equip_template` WHERE (`CreatureID`=105748 AND `ID`=1) OR (`CreatureID`=105746 AND `ID`=1) OR (`CreatureID`=114289 AND `ID`=1) OR (`CreatureID`=114288 AND `ID`=1) OR (`CreatureID`=99033 AND `ID`=1) OR (`CreatureID`=99307 AND `ID`=1) OR (`CreatureID`=98919 AND `ID`=1) OR (`CreatureID`=96754 AND `ID`=1) OR (`CreatureID`=97097 AND `ID`=1) OR (`CreatureID`=102326 AND `ID`=1) OR (`CreatureID`=97365 AND `ID`=1) OR (`CreatureID`=99188 AND `ID`=1) OR (`CreatureID`=98291 AND `ID`=1) OR (`CreatureID`=97182 AND `ID`=1) OR (`CreatureID`=96756 AND `ID`=1) OR (`CreatureID`=102894 AND `ID`=1) OR (`CreatureID`=102375 AND `ID`=1) OR (`CreatureID`=114712 AND `ID`=1) OR (`CreatureID`=102104 AND `ID`=1) OR (`CreatureID`=97200 AND `ID`=1) OR (`CreatureID`=102896 AND `ID`=1) OR (`CreatureID`=97043 AND `ID`=1);
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`) VALUES
(105748, 1, 128100, 0, 0), -- Helarjar Mistcaller
(105746, 1, 33544, 0, 33544), -- Helarjar Berserker
(114289, 1, 129723, 0, 115802), -- Skeletal Sorcerer
(114288, 1, 106837, 0, 106837), -- Skeletal Warrior
(99033, 1, 35942, 0, 0), -- Helarjar Mistcaller
(99307, 1, 1925, 0, 130101), -- Skjal
(98919, 1, 77076, 0, 75009), -- Seacursed Swiftblade
(96754, 1, 88793, 0, 0), -- Harbaron
(97097, 1, 76287, 0, 107823), -- Helarjar Champion
(102326, 1, 81357, 0, 0), -- Seacursed Rower
(97365, 1, 35942, 0, 0), -- Seacursed Mistmender
(99188, 1, 113562, 0, 56173), -- Waterlogged Soul Guard
(98291, 1, 81357, 0, 0), -- Seacursed Rower
(97182, 1, 118083, 0, 6341), -- Night Watch Mariner
(96756, 1, 129189, 0, 0), -- Ymiron, the Fallen King
(102894, 1, 130196, 0, 0), -- Runecarver Slave
(102375, 1, 61297, 0, 0), -- Runecarver Slave
(114712, 1, 61297, 0, 0), -- Runecarver Slave
(102104, 1, 127346, 0, 77408), -- Enslaved Shieldmaiden
(97200, 1, 132557, 0, 0), -- Seacursed Soulkeeper
(102896, 1, 127346, 0, 77408), -- Enslaved Shieldmaiden
(97043, 1, 81357, 0, 0); -- Seacursed Slaver