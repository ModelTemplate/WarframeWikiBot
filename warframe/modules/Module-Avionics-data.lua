--Database for Module:Avionics --
--Some Descriptions at [[Module:Avionics/data/desc]]
--[=[
    ["Avionic Name"] = {
        Image = "AvionicImage.png",
        Link (optional) = "Avionic Name (Avionic)"
        House (optional, defaults to 'none') = "house",
        Rarity = Common, Uncommon, Rare, (Unknown/blank),
        Type (optional, defaults to 'Integrated') = "type"
        Slot = 1,2,3; Defense,Offense,Super
        Flux (optional, defaults to 25/50/100) = "flux"
        Intro (optional, defaults to 27) = "update number",
        Desc = "short description",
        Description (optional, implementing) = "long description, copied from game, with (max + 3) stats and all"
    },
]=]--

local AvionicData = {
["IgnoreInCount"] = {},
["Avionics"] = {
    ["Blackout Pulse"] = {
        Image = "BlackoutPulseAvi.png",
        Rarity = "Rare",
        Type = "Battle",
        Slot = 1,
        Desc = "Emit a pulse that disables and damages ships",
    },
    ["Countermeasures"] = {
        Image = "CountermeasuresAvi.png",
        Rarity = "Rare",
        Type = "Battle",
        Slot = 1,
        Desc = "Deploys flares to destract enemy projectiles",
    },
    ["Munitions Vortex"] = {
        Image = "MunitionsVortexAvi.png",
        Rarity = "Rare",
        Type = "Battle",
        Slot = 1,
        Desc = "Deploys a bubble that absorbs damage and projectiles",
    },
    ["Particle Ram"] = {
        Image = " ParticleRamAvi.png",
        Rarity = "Rare",
        Type = "Battle",
        Slot = 2,
        Desc = "Creates a damaging shield-like projection",
    },
    ["Shatter Burst"] = {
        Image = "ShatterBurstAvi.png",
        Rarity = "Rare",
        Type = "Battle",
        Slot = 2,
        Desc = "Deploys an explosive area of effect",
    },
    ["Tether"] = {
        Image = "TetherAvi.png",
        Rarity = "Rare",
        Type = "Battle",
        Slot = 2,
        Desc = "Emits a field that restricts movement of nearby ships",
    },
    ["Fiery Phoenix"] = {
        Image = "FieryPhoenixAvi.png",
        Rarity = "Rare",
        Type = "Battle",
        Slot = 3,
        Flux = "50 to activate\n2.5 per second while active",
        Desc = "Enhances the Railjack, leaving a trail of damaging fire",
    },
    ["Seeker Volley"] = {
        Image = "SeekerVolleyAvi.png",
        Rarity = "Rare",
        Type = "Battle",
        Slot = 3,
        Desc = "Deploys a volley of homing missiles",
    },
    ["Void Hole"] = {
        Image = "VoidHoleAvi.png",
        Rarity = "Rare",
        Type = "Battle",
        Slot = 3,
        Desc = "Creates a field that draws enemies to its center",
    },
    ["Battle Forge"] = {
        Image = "BattleForgeAvi.png",
        Rarity = "Rare",
        Type = "Tactical",
        Desc = "Reduces Resource Forge cooldown time",
    },
    ["Breach Quanta"] = {
        Image = "BreachQuantaAvi.png",
        Rarity = "Rare",
        Type = "Tactical",
        Desc = "Temporarily stalls a hull breach",
    },
    ["Fire Suppression"] = {
        Image = "FireSuppressionAvi.png",
        Rarity = "Rare",
        Type = "Tactical",
        Desc = "Fixes a single fire hazard",
    },
    ["Flow Burn"] = {
        Image = "FlowBurnAvi.png",
        Rarity = "Rare",
        Type = "Tactical",
        Desc = "Temporarily increases Railjack speed and boost speed",
    },
    ["Void Cloak"] = {
        Image = "VoidCloakAvi.png",
        Rarity = "Rare",
        Type = "Tactical",
        Desc = "Makes the Railjack invisible at the expense of engine speed",
    },
    ["Battle Stations"] = {
        Image = "BattleStationsAvi.png",
        Rarity = "Rare",
        Type = "Tactical",
        Desc = "Temporarily boosts turret damage",
    },
    ["Death Blossom"] = {
        Image = "DeathBlossomAvi.png",
        Rarity = "Rare",
        Type = "Tactical",
        Desc = "Temporarily prevents turrets from overheating",
    },
    ["Form Up"] = {
        Image = "FormUpAvi.png",
        Rarity = "Rare",
        Type = "Tactical",
        Desc = "Recalls all teammates to the Railjack and heals them",
    },
    ["Squad Renew"] = {
        Image = "SquadRenewAvi.png",
        Rarity = "Rare",
        Type = "Tactical",
        Desc = "Heals all Railjack squad members",
    },
    ["Intruder Stasis"] = {
        Image = "IntruderStasisAvi.png",
        Rarity = "Rare",
        Type = "Tactical",
        Desc = "Temporarily freezes all enemy boarding parties",
    },
    ["Bulkhead"] = {
        Image = "BulkheadAvi.png",
        House = "Vidar",
        Rarity = "Uncommon",
        Desc = "Increases Railjack health",
    },
    ["Hull Weave"] = {
        Image = "HullWeaveAvi.png",
        House = "Vidar",
        Rarity = "Uncommon",
        Desc = "Increases Railjack armor",
    },
    ["Hardened Casing"] = {
        Image = "HardenedCasingAvi.png",
        House = "Lavan",
        Rarity = "Rare",
        Desc = "Reduces the chance of a hull breach",
    },
    ["Anode Cell"] = {
        Image = "AnodeCellAvi.png",
        House = "Zetki",
        Rarity = "Rare",
        Desc = "Increases Railjack shield recharge rate",
    },
    ["Maxima"] = {
        Image = "MaximaAvi.png",
        House = "Zetki",
        Rarity = "Rare",
        Desc = "Increases Railjack shield",
    },
    ["Sentient Fortitude"] = {
        Image = "SentientFortitudeAvi.png",
        House = "Lavan",
        Rarity = "Rare",
        Desc = "Reduces damage done to Railjack shields by Sentient enemies",
    },
    ["Breach Adrenaline"] = {
        Image = "BreachAdrenalineAvi.png",
        House = "Lavan",
        Rarity = "Rare",
        Desc = "Increases Railjack shield recharge rate during a hull breach",
    },
    ["Ablative Shell"] = {
        Image = "AblativeShellAvi.png",
        House = "Lavan",
        Rarity = "Common",
        Desc = "Reduces Chem damage taken by Railjack",
    },
    ["Heat Sink"] = {
        Image = "HeatSinkAvi.png",
        House = "Lavan",
        Rarity = "Common",
        Desc = "Reduces Incendiary damage taken by Railjack",
    },
    ["Phasic Weave"] = {
        Image = "PhasicWeaveAvi.png",
        House = "Lavan",
        Rarity = "Common",
        Desc = "Reduces Ionic damage taken by Railjack",
    },
    ["Thermatic"] = {
        Image = "ThermaticAvi.png",
        House = "Lavan",
        Rarity = "Common",
        Desc = "Reduces Frost damage taken by Railjack",
    },
    ["Conic Nozzle"] = {
        Image = "ConicNozzleAvi.png",
        House = "Zetki",
        Rarity = "Rare",
        Desc = "Increases Railjack base speed",
    },
    ["Cruising Speed"] = {
        Image = "CruisingSpeedAvi.png",
        House = "Zetki",
        Rarity = "Rare",
        Intro = "27.4",
        Desc = "Increases Railjack base speed when no enemies are nearby",
    },
    ["Ion Burn"] = {
        Image = "IonBurnAvi.png",
        House = "Zetki",
        Rarity = "Rare",
        Desc = "Increases Railjack boost speed",
    },
    ["Hyperstrike"] = {
        Image = "HyperstrikeAvi.png",
        House = "Vidar",
        Rarity = "Rare",
        Desc = "Increases turret damage",
    },
    ["Last Stand"] = {
        Image = "LastStandAvi.png",
        House = "Zetki",
        Rarity = "Uncommon",
        Desc = "Increases turret damage when Railjack health is low",
    },
    ["Polar Coil"] = {
        Image = "PolarCoilAvi.png",
        House = "Vidar",
        Rarity = "Common",
        Desc = "Increases turret heat capacity",
    },
    ["Predator"] = {
        Image = "PredatorAvi.png",
        House = "Vidar",
        Rarity = "Rare",
        Desc = "Increases turret critical chance",
    },
    ["Section Density"] = {
        Image = "SectionDensityAvi.png",
        House = "Vidar",
        Rarity = "Rare",
        Desc = "Increases turret critical damage",
    },
    ["Sentient Scalpel"] = {
        Image = "SentientScalpelAvi.png",
        House = "Vidar",
        Rarity = "Rare",
        Desc = "Increases turret damage against Sentient enemies",
    },
    ["Turret Velocity"] = {
        Image = "TurretVelocityAvi.png",
        House = "Vidar",
        Rarity = "Rare",
        Intro = "27.4",
        Desc = "Increases turret range and projectile speed",
    },
    ["Ordnance Cheap Shot"] = {
        Image = "OrdnanceCheapShotAvi.png",
        House = "Lavan",
        Rarity = "Common",
        Intro = "27.4",
        Desc = "Gives Ordnance a chance not to consume Munitions when used",
    },
    ["Ordnance Velocity"] = {
        Image = "OrdnanceVelocityAvi.png",
        House = "Lavan",
        Rarity = "Rare",
        Desc = "Increases Ordnance projectile speed",
    },
    ["Overloader"] = {
        Image = "OverloaderAvi.png",
        House = "Lavan",
        Rarity = "Common",
        Desc = "Increases maximum Munitions capacity",
    },
    ["Quicklock"] = {
        Image = "QuicklockAvi.png",
        House = "Lavan",
        Rarity = "Common",
        Intro = "27.4",
        Desc = "Decreases Ordnance lock-on time",
    },
    ["Ripload"] = {
        Image = "RiploadAvi.png",
        House = "Lavan",
        Rarity = "Common",
        Desc = "Decreases Ordnance reload time",
    },
    ["Warhead"] = {
        Image = "WarheadAvi.png",
        Link = true,
        House = "Lavan",
        Rarity = "Uncommon",
        Desc = "Increases Ordnance damage",
    },
    ["Artillery Cheap Shot"] = {
        Image = "ArtilleryCheapShotAvi.png",
        House = "Zetki",
        Rarity = "Common",
        Intro = "27.4",
        Desc = "Gives Forward Artillery a chance not to consume Dome Charges",
    },
    ["Forward Artillery"] = {
        Image = "ForwardArtilleryAvi.png",
        House = "Zetki",
        Rarity = "Rare",
        Desc = "Increases Forward Artillery damage",
    },
    ["Deep Hold"] = {
        Image = "DeepHoldAvi.png",
        House = "Lavan",
        Rarity = "Rare",
        Intro = "27.4",
        Desc = "Increases Resource Forge maximum capacity",
    },
    ["Hyperflux"] = {
        Image = "HyperfluxAvi.png",
        House = "Lavan",
        Rarity = "Rare",
        Desc = "Increases Railjack Flux Energy capacity",
    },
    ["Revo Reducer"] = {
        Image = "RevoReducerAvi.png",
        House = "Lavan",
        Rarity = "Rare",
        Desc = "Reduces Revolite usage",
    },
    ["Winged Cyclone"] = {
        Image = "WingedCycloneAvi.png",
        House = "Zetki",
        Rarity = "Rare",
        Desc = "Increases nearby Archwings' speed",
    },
    ["Winged Force"] = {
        Image = "WingedForceAvi.png",
        House = "Zetki",
        Rarity = "Uncommon",
        Desc = "Increases nearby Archwings' shields",
    },
    ["Winged Steel"] = {
        Image = "WingedSteelAvi.png",
        House = "Zetki",
        Rarity = "Uncommon",
        Desc = "Increases nearby Archwings' armor",
    },
    ["Winged Storm"] = {
        Image = "WingedStormAvi.png",
        House = "Zetki",
        Rarity = "Rare",
        Desc = "Increases nearby Archwings' damage",
    },
},
}

local desc = require [[Module:Avionics/data/desc]]
local ver
for avionicName, Avionic in pairs(AvionicData.Avionics) do
    Avionic.Name = avionicName
    Avionic.Image = Avionic.Image or "Avionic.png"
    Avionic.Link = 
        (type(Avionic.Link)=='boolean' and Avionic.Name..' (Avionic)') or 
        (type(Avionic.Link)=='string' and Avionic.Link) or avionicName
    
    Avionic.House = Avionic.House or "None"
    Avionic.Houseicon = ({
        Sigma = 'HouseSigma.png', 
        Lavan = 'HouseLavan.png', 
        Vidar = 'HouseVidar.png', 
        Zetki = 'HouseZetki.png', 
        None  = 'Avionics_dark.png' })[Avionic.House or 'None']
        
    Avionic.Rarity = Avionic.Rarity or "Unknown"
    Avionic.Tradetax = require( [[Module:Icon]] )._Item("Credits")..
        (Avionic.Tradetax or 
            ({Common=" 2,000",Uncommon=" 4,000",Rare=" 8,000",Unknown=' ?'})[Avionic.Rarity] )
        
    Avionic.Desc = Avionic.Desc or ""
    Avionic.Intro = not Avionic.Intro and '[[Update 27#Update 27.0|Update 27.0]]' 
        or (function()if not ver then ver=require"Module:Version" end return ver end)().getVersionLink{args={Avionic.Intro}}
    
    Avionic.Type = Avionic.Type or "Integrated"
    Avionic.Slot = Avionic.Slot and 
        ({"Defense","Offense","Super"})[Avionic.Slot] or Avionic.Slot
    Avionic.Flux = Avionic.Flux or 
        (Avionic.Slot and ({Defense=25,Offense=50,Super=100})[Avionic.Slot])

    Avionic.Description = Avionic.Description or desc[avionicName].Description
        if Avionic.Description=='' then Avionic.Description = "''No description''"
        elseif desc[avionicName].Cooldown then
            Avionic.Description = Avionic.Description .. '\nCooldown: ' .. desc[avionicName].Cooldown
        --end
        elseif desc[avionicName].Flux then
            Avionic.Description = Avionic.Description .. '\nFlux Cost: ' .. desc[avionicName].Flux
        --end
        elseif Avionic.Flux then
            Avionic.Description = Avionic.Description .. '\nFlux Cost: ' .. Avionic.Flux
        end
end

return AvionicData

--       1         2         3         4         5         6         7         8         9        10        11        12        13         14        15
--34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123
--3456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456
--34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012
--34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890