UPDATE instance_template SET script = 'instance_maw_of_souls' WHERE map = 1492;


DELETE FROM `instance_encounters` WHERE entry IN (1822, 1823, 1824);
INSERT INTO `instance_encounters` (`entry`, `creditType`, `creditEntry`, `lastEncounterDungeon`, `comment`) VALUES
(1822, 0, 96756, 0, "Ymiron, The Fallen King"),
(1823, 0, 96754, 0, "Harbaron"),
(1824, 0, 96759, 1192, "Helya");