Update 0.1.4: MOD NOW HAS OPTIONAL SETTINGS
These settings can be found in the Sandbox Options

In SP: When you create a save, you must check Custom Sandbox, there will be the options. Or changing an already created save. I found this:
HOW TO CHANGE SANDBOX SETTINGS IN AN ACTIVE SAVEFILE?[theindiestone.com]

In MP (Hosted or dedicated): In order to save, and always have the settings when ever you do changes in the server settings, you must have the mod activated in the MODS menu in the main menu. This way, when ever you are going to create or edit a server setting, under the Sandbox Options page, this and other mods will display the settings, if they have them.

So in here:


You activate the mod:


Then you edit your server settings:






Or if you rather add it by hand each time you can go to: C:\Users\*user*\Zomboid\Server\*servername*_SandboxVars.lua
and add at the end of the code

FitnessIsALifestyle = {
Hardcore = false,
XPMultiplier = 3.0,
},

Like this:

Default settings:

Hardcore mode = Dissabled

XP Multiplier = 3.0 (x3)

What does this mod do?

Gives an XP Multiplier to the both passive skills (Strength and Fitness) based on the amount of regularity you have in each exercise.
Note: When you do exercise it will give you the XP Multiplier based on the regularity of that exercise.

If you are not doing exercise it will give you the average of all regularities of all exercise as the XP Multiplier.

 Example (Easy mode) x3: 

Sum of all regularities will be, in %, (25+50+2+15+0+0+0) = 92/7 = 13,14*3 = 39,42/100 = 0,39+1 = 1,39 XP Multiplier

XP Multiplier is granted on each level, meaning that if the multiplier is 3, each level the new Max XP Multiplier will be added 3 more XP Multiplier.

👉At level 0 you get, at 100% regularity, XP Multiplier x3
👉At level 5 you get, at 100% regularity, XP Multiplier x15
👉At level 10 you get, at 100% regularity, XP Multiplier x30

(It will show x4 as x1 gives the same number and does not add any new XP)

Easy Mode will give the XP Multiplier in a linear way.

Hardcore Mode (if active in the sandbox options) gives the XP Multiplier in a exponential way. Meaning that at 70% of Regularity you only gain a 25% of the XP Multiplier. At 100% Regularity you get the 100% XP Multiplier.


🛑WARNING🛑

I doubt this will work with skill books that affect the passive xp multipliers such as: All Skill Books

But does work with others that don't give an xp multiplier to passive skills, such as: Additional Skill Books 2 (41 build)

🟦Permissions🟦

✅ You are allowed, of course, to add this mod to a Steam Collection.
✅ You are allowed to add this mod to a Mod Collection, with credit and a direct link of this mod in the description
🚫 You are not allowed to upload variants of this mod, neither copy it, without permission of the owner/s. Not in the Steam Workshop nor any other mod websites.
🤝 If broken by any case because of updates, please contact the owner/s to get the permission to fix and upload it.


Workshop ID: 2704980483
Mod ID: FitnessIsALifestyle
