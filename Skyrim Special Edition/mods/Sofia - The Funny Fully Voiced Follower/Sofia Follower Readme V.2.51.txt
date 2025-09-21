Installation
Either use a mod manager or install manually by dropping the files into "C:Program Files (x86)SteamSteamAppscommonskyrimData" and then make sure you activate the mod in Data Files in the Skyrim launcher or your mod manager. Put Sofia below any follower enhancement mods such as AFT, UFO and EFF in your load order.

How To Start
Go to the Whiterun stables, wake her up and agree to invite her along with you. Bring some clothing for her (don't worry she's not fully nude). Note: when I say the stables I mean where the horses are kept and not the building. She will be laying in the hay.

Credits
John Jarvis – Creator, writer, developer, scripting.
Christine Slagman (finalCrystine) – Voice of Sofia, audio editing, additional writing, beta testing and additional help.

Other Cast
Josh Griffiths - Crooked Priest of Mara
Temperance10 - Whiterun Guard

Special thanks to Cydiza for fixing the subtitle squares glitch and Zonteck for beta testing a wedding fix.

Used Resources
DIMONIZED UNP female body by dimon99: http://www.nexusmods.com/skyrim/mods/6709/?
SG Female Textures Renewal by Hello Santa: http://www.nexusmods.com/skyrim/mods/35267/?
Apachii Skyhair by Apachii: http://www.nexusmods.com/skyrim/mods/10168/?
Apachii Skyhair Natural Re-texture by Aron: http://www.nexusmods.com/skyrim/mods/35092/?
Enhanced Character Edit by ECE team: http://www.nexusmods.com/skyrim/mods/12951/?
UNP Female Armors by Exeter: http://www.nexusmods.com/skyrim/mods/7305/?

You may not redistribute any part of this mod without my permission. If you want to release an edit for this mod then you must make it so that the original mod is required and inform me first.

FAQ
Make sure to update to the latest version before reporting problems!

I dismissed Sofia but didn't set a location. Where is she?
By default she will be at the Whiterun stables laying in some hay where the horses are.

I can't find Sofia!
Use her summon spell in the spell menu or tracking marker found in the quest journal under miscellaneous quests which can be toggled. If neither of these show up then it is very likely that Sofia is not installed or activated correctly in your game.

I gave Sofia alcohol and now she's glitched out.
Type stopquest jjsofiadrunk into the command console. Sofia should now be out of drunk mode although you may need to do startquest jjsofiadrunk to get it working again.

Sofia is unresponsive/Sofia is totally bugged out and behaving crazy.
Try clicking on Sofia with the command console open in game and use the command resetai . If this doesn't work try the disable command and then enable right after. If that doesn't work and you wish to keep your save then you will need to fully reset Sofia.

Full reset instructions: Take all your belongings from Sofia (see below if you are unable to retrieve your belongings), dismiss her then make a save far away from her, then go out of the game and deactivate the esp plugin SofiaFollower.esp. Load up the same save and save again. Now go back out of the game again and reactivate the esp plugin and then load up the previous save and she will be back at the stables.

If you are unable to retrieve your belongings due to her glitched out state then open the console, click on Sofia and then use this command: "openactorcontainer 1" (without the quotes) to force her inventory to appear. To get to her storage items you will need to do "coc jjsofiastore" which will take you to a room where her storage container is kept.

Can I marry Sofia?
Yes. Get her relationship to 100 via giving her gifts and talking to her, clear 5 dungeons and get 100 kills with her present and spend 30 days with her. You should now be able to ask her to marry you via the "Can I talk to you for a bit?" dialogue option.

Do I need SKSE?
No. Only if you want to use her MCM menu although I may use SKSE for other features in future. I will always keep compatibility for those who don't use SKSE however.

Do I need any other mods?
No. Sofia is totally standalone and already has all the required files.

There are some strange square blocks in the subtitles/there are some silent lines.
This is something I am aware of so just point out the affected lines and I will correct them.

I don’t like Sofia’s appearance/combat style.
Feel free to change it for your personal use by loading up the esp plugin in the CK. Don’t ask me how though. I don’t have time to explain to everyone. Most things in the CK related to Sofia will either start with the prefix “JJ” or have “Sofia” in the name.

I don’t like Sofia’s dialogue/voice/this mod.
I don't caaarrre! Just leave already.

Is Sofia lore friendly?
She is designed to be but don’t get all anal about it if it’s not 100 percent in your eyes. Opinions will always differ.

I have a problem.
Message me on Nexus Mods. Do not PM Christine with your concerns, she doesn’t do the technical stuff.

Change Log:
V2.51
Fixed wedding glitch

V2.5
Fixed NPCs responding when Sofia isn't around.
Fixed stuck drunk glitch
Fixed "stop being drunk" dialogue option
Alcohol now increases relationship.
Fixed Braith orphan glitch (may require new game)
Removed left over debug message boxes
Sofia now follows closer
Fixed certain quest dialogue not triggering
Sofia will follow whilst singing
Removed some unused content
General optimisation

V2.4
Added more comments
Added Daedric quest aware dialogue
Added more NPC comment responses
Added player multiple choice questions
Fixed squares in subtitles bug
Minor tweaks and small bug fixes

V2.03
Fixed take all player items when changing combat style bug
Fixed CTD and script log spam
Fixed quest dialogue not triggering
Removed follow beside feature until errors are resolved

V2.02
Basic outfit management system which will correct the removing clothes glitch.
Marriage interaction dialogue.
Full underwear mesh. No more silly beach bikini
Option to follow beside the player (from Followers as Companions mod by IsharaMeradin)
Some small script optimisation tweaks.
Removed the clunky message box for the marriage money system in favour of a small notification and it also only happens at a sensible moment.
Fixed some broken dialogue entries.
Actual finally working combat/class change in MCM menu. No silly console command workarounds required this time.
Remove all spells option in MCM menu which does as it says.
Reset Sofia option in MCM menu. This will reset any quests and scripts that are controlling her in case of a glitch (e.g stuck being drunk).

V2.01
Upgraded follower system
Fixed relationship system
Fixed werewolf/vampire dialogue conditions
Fixed new nude bug
Removed unnecessary files from download

V2.0
Marriage and relationship system
If married Sofia has the possibility of either earning or spending money
More random comments
Companions and College of Winterhold quest comments
Player vampirism and lycanthropy comments
Player clothing comments
New enemy specific combat taunts
Functioning gift system with comments
Nude Bomb special ability
Sandboxing
Two new bard songs (one original)
Improved stability and bug fixes
Black face bug fix/optimised textures
Drastically reduced number of script files using TES5Edit hack
Adjustable stats (SkyUI users only)
Spell tome learning (SKSE users only)
Fixed the nude bug when she is dismissed
Perhaps other stuff I may have forgotten
Class selection has been disabled until a fully working alternative can be found.
Note: SKSE and SkyUI are entirely optional and are not a requirement except for the specified features.

V1.05
*Added the ability to set Sofia's horse
*Added missing set dismiss location dialogue
*Sofia will now properly mount and dismount her horse
*Fixed animation glitch when drinking alcohol
*Added MCM menu change combat style & class
*Fixed broken stable introduction
*Sofia will stop combat automatically against player or followers
*Player is blocked from getting on Sofia's set horse

V1.04
*A brand new song from Christine
*I need you to do something dialogue added
*Added a summon spell for Sofia
*Added a tracking marker for Sofia
*Sofia will ignore all friendly fire
*Drunk mode bugs fixed and will be forced to terminate automatically after a time so she doesn't get stuck that way
*If you wait it will count towards the time Sofia has been drunk so waiting will skip it
*Fast travelling disabled whilst Sofia is drunk and drawing your weapon will no longer affect her drunk animation
*Fixed up some of the issues to do with horse riding and she should mount and dismount a bit faster
*Sofia's horse is unaffected by all kinds of friendly fire and will flee from combat
*Sofia stables disappearance fixed

V1.03
Fixed some serious CTD bugs including one which caused a CTD whilst talking to non-human NPCs such as the Augar of Dunlain (for real this time)
Added new conversation dialogue (Can I talk to for a bit)
Added the ability to disable Sofia's horse summoning and riding
Fixed the set dismiss location feature
Removed the non functioning combat options from the SKSE menu until they are done

V1.02
Failed bug fix release.

V1.01
Added missing audio for line about people of Whiterun
Disabled find Sofia quest
Disabled SKSE message
Disabled Clothing message
Cleaned mod with TES5Edit
Fixed spell bug