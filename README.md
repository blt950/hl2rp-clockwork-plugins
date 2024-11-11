# HL2RP and Clockwork Plugins
My 10+ year old HL2RP and Clockwork plugins for anyone to use as long it's used according to the [license](LICENSE).

## I highly recommend reading fully through this document to get everything working

⚠️ **Please note no support is given for these plugins anymore.**\
In this pack, you have ten plugins, I will guide you on how to install and use them.

All the plugins are installed into you schema plugins folder found in
“garrysmod/gamemodes/cwhl2rp/plugins” for example. Simply copy the folder and drop it in there.

## HL2RP Only

### Diseases

This plugin creates three types of diseases. Cough, fever and colour blindness. All three are curable
by having the right items. Cough makes you emit a cough occasionally, and fever makes your head
dizzy.

In addition to this, there are two poisons added and one antidote for the MPF. A "Green Liquid" and
"Fast Green Liquid". The difference between those two is that the antidote only works on the normal
Green Liquid. The fast green liquid kills the target faster. Maybe for torture and amputations. Maybe
it will be some kind of dark MPF secret?

**Important**
The Green liquids do not kill if Health Regeneration setting is enabled. Please make sure to disable it
to make it work properly. To purchase items from this plugin in Business menu, a player would need
q and Q flags. Where Q is more heavy medication. The Green liquid triggers Perma kill!

**Configuration**
You find the configuration variables in the sv_hooks.lua file.

### Combine Assistant

This a quick-menu that helps combines a lot in performances and radio calling. It includes functions
such as quickly radioing a backup need in a district, add a patrol buddy and quickly radio your patrol
group, performances which are often used, so you don’t need to bind keys or write long sentences.

If you enable the first menu button with the flag, it will also enable some automatic /me
performances such as (un)holstering stunstick and pushing citizens.

**Important**
The menu ONLY opens if you are an MPF, not Overwatch.
Bind your key to "+CA_Menu" to use this assistant.

If your MPF faction is renamed to something else, edit the code in the cl_ file to be correct in order to
make it work. The menu only pops up for MPF, else nothing happens or no errors.

**Configuration**
You find the configuration in the combineassistant/plugin/cl_plugin.lua
If you want to configure which ranks are able to use Dispatch, do it in
combineassistant/plugin/sv_plugin.lua

### Combine Chatter

This plugin is a plugin which emits combine radio chatter for MPF and Overwatch.
The MPF chatter is emitted to the player and players around it, so citizens might hear it. The
Overwatch chatter is only emitted locally for the player itself, as Overwatch is ment to be more
stealth.

**Configuration**
There is no configuration file for this plugin.

### Vortiguant Language

With this plugin the Vortiguants can finally speak to each other without having anyone else
understanding them. To speak in Vortessence use /v <text>.

**Important**
Vortiguants are not included by default in HL2RP. In the folder “extra”, you find two folders,
“Factions” and “Classes”. Copy them both inside “cwhl2rp/schema”, to create the vortiguant faction.

**Configuration**
There is no configuration file for this plugin.

## All Schemas

### AFK Kicker

This is a small plugin which kicks everyone who is AFK. Staff members are excluded from this kicker.
You may adjust peak time, where you can decrease the AFK time limit when there is many players on
the server, and decrease when there is few. It’s also implemented a bit other type of checker which
isn’t effected by simple console commands, for bypassing kickers.

**Configuration**
You find the configuration for this plugin in afkkicker/plugin/sv_hooks.lua

### My Notes

This plugin is character based, each character can have their notes saved with /mynotes command.
Perfect way to write down codes to closets and maybe a draft to a future report.

**Configuration**
This plugin doesn’t have any configuration.

### Pins

Very simple plugin featuring an item, which can be purchased and used on a paper to make it hang
on the wall. Perfect thing, so you do not need to scream for admins when you need them to freeze a paper.

**Configuration**
This plugin doesn’t have any configuration.

### Spelling

We always get people on the servers who cannot write with capital letters at start, and period stops.
This plugin does it for you. Making the chat look nice, tidy and professional.

**Configuration**
This plugin doesn’t have any configuration.

### Trash Bins

Teach your players to recycle! Now when you touch papers or notepads on the trash bins you have
spawned around the server, and it will delete it! Use /trashadd to add trashbins!

**Configuration**
This plugin doesn’t have any configuration.

### Wall Clock

With this plugin you can create clocks on the walls which can display the local in game time. Useful
maybe inside a CWU or when planning a meeting? Use /clockadd and /clockremove commands to
add or remove clocks.

**Configuration**
This plugin doesn’t have any configuration.
