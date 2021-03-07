local WFDefault = {
    {
        {Part = "Chassis Blueprint",    Chance = 0.3872},
        {Part = "Neuroptics Blueprint", Chance = 0.3872},
        {Part = "Systems Blueprint",    Chance = 0.2256},
    }
}
local AcqData = {
--------------------------------------- WARFRAMES ---------------------------------------
    ["ASH"] = {
        {
            {Part = "Chassis Blueprint", Chance = 0.3872/3, Unit = "kills"},
            {Part = "Neuroptics Blueprint", Chance = 0.3872/3, Unit = "kills"},
            {Part = "Systems Blueprint", Chance = 0.2256/3, Unit = "kills"},
        }
    },

    ["ATLAS"] = WFDefault,

    ["EQUINOX"] = {
        {  
            {Part = "Day Aspect Blueprint", Chance = 0.1128},
            {Part = "Day Chassis Blueprint", Chance = 0.1291},
            {Part = "Day Neuroptics Blueprint", Chance = 0.1291},
            {Part = "Day Systems Blueprint", Chance = 0.1291},
            {Part = "Night Aspect Blueprint", Chance = 0.1128},
            {Part = "Night Chassis Blueprint", Chance = 0.1291},
            {Part = "Night Neuroptics Blueprint", Chance = 0.1291},
            {Part = "Night Systems Blueprint", Chance = 0.1291},
        },
    },

    ["EMBER"] = WFDefault,

    ["EXCALIBUR"] = WFDefault,
    
    ["FROST"] = WFDefault,

    ["GARAA"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.0752, Desc = "Stage 2, lvl 5-15", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.3056, Desc = "Stage 3, lvl 5-15", Unit = "Bounties"},
        },
        {  
            {Part = "Neuroptics Blueprint", Chance = 0.0842, Desc = "Stage 2, lvl 20-40", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.0842, Desc = "Stage 3, lvl 20-40", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.2051, Desc = "Stage 4, lvl 20-40", Unit = "Bounties"},
        },
        {  
            {Part = "Systems Blueprint", Chance = 0.0952, Desc = "Stage 2, lvl 10-30", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.2182, Desc = "Stage 3, lvl 10-30", Unit = "Bounties"},
        },
    },
    ["GARAB"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.0752, Desc = "Stage 2, lvl 5-15", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.3056, Desc = "Stage 3, lvl 5-15", Unit = "Bounties"},
        },
        {  
            {Part = "Neuroptics Blueprint", Chance = 0.0860, Desc = "Stage 2, lvl 20-40", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.0860, Desc = "Stage 3, lvl 20-40", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.1951, Desc = "Stage 4, lvl 20-40", Unit = "Bounties"},
        },
        {  
            {Part = "Systems Blueprint", Chance = 0.0952, Desc = "Stage 2, lvl 10-30", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.2182, Desc = "Stage 3, lvl 10-30", Unit = "Bounties"},
        },
    },
    ["GARAC"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.0752, Desc = "Stage 2, lvl 5-15", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.3056, Desc = "Stage 3, lvl 5-15", Unit = "Bounties"},
        },
        {  
            {Part = "Neuroptics Blueprint", Chance = 0.0957, Desc = "Stage 2, lvl 20-40", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.0957, Desc = "Stage 3, lvl 20-40", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.2143, Desc = "Stage 4, lvl 20-40", Unit = "Bounties"},
        },
        {  
            {Part = "Systems Blueprint", Chance = 0.0952, Desc = "Stage 2, lvl 10-30", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.2182, Desc = "Stage 3, lvl 10-30", Unit = "Bounties"},
        },
    },

    ["GARUDAA"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.0752, Desc = "Stage 2, lvl 5-15", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.3056, Desc = "Stage 3, lvl 5-15", Unit = "Bounties"},
        },
        {  
            {Part = "Neuroptics Blueprint", Chance = 0.1250, Desc = "Stage 2, lvl 20-40", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.1250, Desc = "Stage 3, lvl 20-40", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.2500, Desc = "Stage 4, lvl 20-40", Unit = "Bounties"},
        },
        {  
            {Part = "Systems Blueprint", Chance = 0.0741, Desc = "Stage 2, lvl 10-30", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.2222, Desc = "Stage 3, lvl 10-30", Unit = "Bounties"},
        },
    },
    ["GARUDAB"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.0752, Desc = "Stage 2, lvl 5-15", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.3056, Desc = "Stage 3, lvl 5-15", Unit = "Bounties"},
        },
        {  
            {Part = "Neuroptics Blueprint", Chance = 0.1250, Desc = "Stage 2, lvl 20-40", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.1250, Desc = "Stage 3, lvl 20-40", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.2500, Desc = "Stage 4, lvl 20-40", Unit = "Bounties"},
        },
        {  
            {Part = "Systems Blueprint", Chance = 0.0741, Desc = "Stage 2, lvl 10-30", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.2222, Desc = "Stage 3, lvl 10-30", Unit = "Bounties"},
        },
    },
    ["GARUDAC"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.0752, Desc = "Stage 2, lvl 5-15", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.3056, Desc = "Stage 3, lvl 5-15", Unit = "Bounties"},
        },
        {  
            {Part = "Neuroptics Blueprint", Chance = 0.1250, Desc = "Stage 2, lvl 20-40", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.1250, Desc = "Stage 3, lvl 20-40", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.2500, Desc = "Stage 4, lvl 20-40", Unit = "Bounties"},
        },
        {  
            {Part = "Systems Blueprint", Chance = 0.0741, Desc = "Stage 2, lvl 10-30", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.2222, Desc = "Stage 3, lvl 10-30", Unit = "Bounties"},
        },
    },

    ["GAUSS"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.0784},
            {Part = "Neuroptics Blueprint", Chance = 0.0784},
            {Part = "Systems Blueprint", Chance = 0.0784},
        },
    },

    ["HARROW"] = {
        {
            {Part = "Chassis Blueprint", Chance = 0.0300, Unit = "kills"},
        },
        {
            {Part = "Neuroptics Blueprint", Chance = 0.1128, Unit = "C Rotations"},
        },
        {
            {Part = "Systems Blueprint", Chance = 0.0201, Desc = "Tier I&nbsp;&#124;&nbsp;Rot. B", Unit = "C Rotations"},
            {Part = "Systems Blueprint", Chance = 0.0752, Desc = "Tier I&nbsp;&#124;&nbsp;Rot. C", Unit = "C Rotations"},
        },
        {
            {Part = "Systems Blueprint", Chance = 0.0201, Desc = "Tier II & III&nbsp;&#124;&nbsp;Rot. B", Unit = "C Rotations"},
            {Part = "Systems Blueprint", Chance = 0.1128, Desc = "Tier II & III&nbsp;&#124;&nbsp;Rot. C", Unit = "C Rotations"},
        },
    },

    ["HILDRYN"] = {
        {
            {Part = "Chassis Blueprint", Chance = 0.3872, Unit = "kills"},
            {Part = "Neuroptics Blueprint", Chance = 0.3872, Unit = "kills"},
            {Part = "Systems Blueprint", Chance = 0.2256, Unit = "kills"},
        }
    },

    ["HYDROID"] = WFDefault,

    ["IVARA"] = {
        {
            {Part = "Chassis Blueprint", Chance = 0.0564, Desc = "Medium Tier", Unit = "C Rotations"},
        },
        {
            {Part = "Chassis Blueprint", Chance = 0.0737, Desc = "Pavlov, [[Lua]]", Unit = "C Rotations"},
        },
        {
            {Part = "Main Blueprint", Chance = 0.0752, Desc = "Hard Tier", Unit = "C Rotations"},
            {Part = "Neuroptics Blueprint", Chance = 0.0752, Desc = "Hard Tier", Unit = "C Rotations"},
        },
        {
            {Part = "Systems Blueprint", Chance = 0.0909, Desc = "Easy Tier", Unit = "C Rotations"},
        },
    },

    ["KHORA"] = {
        {
            {Part = "Chassis Blueprint", Chance = 0.0833, Unit = "A Rotations"},
        },
        {
            {Part = "Neuroptics Blueprint", Chance = 0.0909, Unit = "B Rotations"},
        },
        {
            {Part = "Main Blueprint", Chance = 0.1128, Unit = "C Rotations"},
            {Part = "Systems Blueprint", Chance = 0.1128, Unit = "C Rotations"},
        },
    },

    ["LAVOS"] = {
        {
            {Part = "Main Blueprint", Chance = 0.02, Desc = "Normal", Unit = "C Rotations"},
            {Part = "Chassis Blueprint", Chance = 0.02, Desc = "Normal", Unit = "C Rotations"},
            {Part = "Neuroptics Blueprint", Chance = 0.02, Desc = "Normal", Unit = "C Rotations"},
            {Part = "Systems Blueprint", Chance = 0.02, Desc = "Normal", Unit = "C Rotations"},
        },
        {
            {Part = "Main Blueprint", Chance = 0.03, Desc = "Advanced", Unit = "C Rotations"},
            {Part = "Chassis Blueprint", Chance = 0.03, Desc = "Advanced", Unit = "C Rotations"},
            {Part = "Neuroptics Blueprint", Chance = 0.03, Desc = "Advanced", Unit = "C Rotations"},
            {Part = "Systems Blueprint", Chance = 0.03, Desc = "Advanced", Unit = "C Rotations"},
        },
        {
            {Part = "Main Blueprint", Chance = 0.04, Desc = "Endurance", Unit = "A Rotations"},
            {Part = "Chassis Blueprint", Chance = 0.04, Desc = "Endurance", Unit = "A Rotations"},
            {Part = "Neuroptics Blueprint", Chance = 0.04, Desc = "Endurance", Unit = "A Rotations"},
            {Part = "Systems Blueprint", Chance = 0.04, Desc = "Endurance", Unit = "A Rotations"},
        },
    },

    ["LOKI"] = WFDefault,
    
    ["MAG"] = WFDefault,

    ["MESA"] = WFDefault,

    ["NEKROS"] = {
        {  
            {Part = "Chassis Blueprint", Chance = (1/3)},
            {Part = "Neuroptics Blueprint", Chance = (1/3)},
            {Part = "Systems Blueprint", Chance = (1/3)},
        },
    },

    ["NIDUS"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.1429, Unit = "C Rotations"},
            {Part = "Neuroptics Blueprint", Chance = 0.1429, Unit = "C Rotations"},
            {Part = "Systems Blueprint", Chance = 0.1429, Unit = "C Rotations"},
        },
    },

    ["NOVA"] = WFDefault,
    
    ["NYX"] = WFDefault,

    ["OBERON"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.003872, Unit = "kills"},
            {Part = "Neuroptics Blueprint", Chance = 0.003872, Unit = "kills"},
            {Part = "Systems Blueprint", Chance = 0.002256, Unit = "kills"},
        },
    },

    ["OCTAVIA"] = {
        {
            {Part = "Chassis Blueprint", Chance = 1},
        },
        {
            {Part = "Neuroptics Blueprint", Chance = 0.2256, Unit = "C Rotations"},
        },
        {
            {Part = "Systems Blueprint", Chance = 0.2256, Unit = "Rotation A Caches"},
        },
    },

    ["PROTEA"] = {
        {
            {Part = "Neuroptics Blueprint", Chance = 0.1111, Unit = "C Rotations"},
        },
        {
            {Part = "Chassis Blueprint", Chance = 0.1111, Desc = "Extended", Unit = "C Rotations"},
        },
        {
            {Part = "Systems Blueprint", Chance = 0.1111, Desc = "Nightmare", Unit = "C Rotations"},
        },
    },

    ["REVENANTA"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.0851, Desc = "Stage 2, lvl 30-50", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.0851, Desc = "Stage 3, lvl 30-50", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.0833, Desc = "Stage 4, lvl 30-50", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.1905, Desc = "Stage 5, lvl 30-50", Unit = "Bounties"},
        },
        {  
            {Part = "Neuroptics Blueprint", Chance = 0.0676, Desc = "Stage 4, lvl 40-60", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.1020, Desc = "Stage 5, lvl 40-60", Unit = "Bounties"},
        },
        {  
            {Part = "Systems Blueprint", Chance = 0.0842, Desc = "Stage 2, lvl 20-40", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.0842, Desc = "Stage 3, lvl 20-40", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.2051, Desc = "Stage 4, lvl 20-40", Unit = "Bounties"},
        },
    },
    ["REVENANTB"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.0851, Desc = "Stage 2, lvl 30-50", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.0851, Desc = "Stage 3, lvl 30-50", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.0833, Desc = "Stage 4, lvl 30-50", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.1905, Desc = "Stage 5, lvl 30-50", Unit = "Bounties"},
        },
        {  
            {Part = "Neuroptics Blueprint", Chance = 0.0676, Desc = "Stage 4, lvl 40-60", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.1020, Desc = "Stage 5, lvl 40-60", Unit = "Bounties"},
        },
        {  
            {Part = "Systems Blueprint", Chance = 0.0968, Desc = "Stage 2, lvl 20-40", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.0968, Desc = "Stage 3, lvl 20-40", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.2195, Desc = "Stage 4, lvl 20-40", Unit = "Bounties"},
        },
    },
    ["REVENANTC"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.0833, Desc = "Stage 2, lvl 30-50", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.0833, Desc = "Stage 3, lvl 30-50", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.0816, Desc = "Stage 4, lvl 30-50", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.2000, Desc = "Stage 5, lvl 30-50", Unit = "Bounties"},
        },
        {  
            {Part = "Neuroptics Blueprint", Chance = 0.0676, Desc = "Stage 4, lvl 40-60", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.1020, Desc = "Stage 5, lvl 40-60", Unit = "Bounties"},
        },
        {  
            {Part = "Systems Blueprint", Chance = 0.0851, Desc = "Stage 2, lvl 20-40", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.0851, Desc = "Stage 3, lvl 20-40", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.1905, Desc = "Stage 4, lvl 20-40", Unit = "Bounties"},
        },
    },

    ["RHINO"] = WFDefault,
    
    ["SARYN"] = WFDefault,
    
    ["TRINITY"] = WFDefault,
    
    ["VALKYR"] = WFDefault,

    ["WISP"] = {
        {
            {Part = "Main Blueprint", Chance = 0.2256},
            {Part = "Chassis Blueprint", Chance = 0.2581},
            {Part = "Neuroptics Blueprint", Chance = 0.2581},
            {Part = "Systems Blueprint", Chance = 0.2581},
        },
    },

    ["XAKUA"] = {
        {  
            {Part = "Chassis Blueprint", Chance = 0.0857, Desc = "Stage 2 & 3, lvl 40-60", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.0667, Desc = "Stage 4, lvl 40-60", Unit = "Bounties"},
            {Part = "Chassis Blueprint", Chance = 0.1304, Desc = "Stage 5, lvl 40-60", Unit = "Bounties"},
        },
        {  
            {Part = "Neuroptics Blueprint", Chance = 0.0750, Desc = "Stage 2, lvl 15-25", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.1000, Desc = "Stage 3, lvl 15-25", Unit = "Bounties"},
        },
        {  
            {Part = "Systems Blueprint", Chance = 0.0750, Desc = "Stage 2 & 3, lvl 30-40", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.0600, Desc = "Stage 4, lvl 30-40", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.1000, Desc = "Stage 5, lvl 30-40", Unit = "Bounties"},
        },
    },
    ["XAKUB"] = {
        {  
            {Part = "Neuroptics Blueprint", Chance = 0.0750, Desc = "Stage 2, lvl 15-25", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.1000, Desc = "Stage 3, lvl 15-25", Unit = "Bounties"},
        },
        {  
            {Part = "Systems Blueprint", Chance = 0.0750, Desc = "Stage 2 & 3, lvl 30-40", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.0600, Desc = "Stage 4, lvl 30-40", Unit = "Bounties"},
            {Part = "Systems Blueprint", Chance = 0.1000, Desc = "Stage 5, lvl 30-40", Unit = "Bounties"},
        },
    },
    ["XAKUC"] = {
        {  
            {Part = "Neuroptics Blueprint", Chance = 0.0750, Desc = "Stage 2, lvl 15-25", Unit = "Bounties"},
            {Part = "Neuroptics Blueprint", Chance = 0.1000, Desc = "Stage 3, lvl 15-25", Unit = "Bounties"},
        },
    },

---------------------------------------- WEAPONS ----------------------------------------
	-- A --
    ["ACCELTRA"] = {
        {  
            {Part = "Main Blueprint", Chance = 0.0125, Unit = "kills"},
        },
    },
	
    ["AKARIUS"] = {
        {  
            {Part = "Main Blueprint", Chance = 0.0125, Unit = "kills"},
        },
    },
    
    ["ARUM SPINOSA"] = {
		{
			{Part = "Main Blueprint", Chance = 0.18, Desc = "Stage 1, lvl 30-40", Unit = "Bounties"},
			{Part = "Guard", Chance = 0.1154, Desc = "Stage 2, Stage 3, lvl 40-50", Unit = "Bounties"},
			{Part = "Guard", Chance = 0.0882, Desc = "Stage 4, lvl 40-50", Unit = "Bounties"},
			{Part = "Guard", Chance = 0.1364, Desc = "Stage 5, lvl 40-50", Unit = "Bounties"},
			{Part = "Rivet", Chance = 0.0795, Desc = "Stage 4, lvl 40-50", Unit = "Bounties"},
			{Part = "Rivet", Chance = 0.1227, Desc = "Stage 5, lvl 40-50", Unit = "Bounties"},
		},
	},
	-- B --
    ["BOAR"] = {
        {
            {Part = "Main Blueprint", Chance = 0.005, Unit = "kills"},
        },
    },

    ["BRATON VANDAL"] = {
        {  
            {Part = "Main Blueprint", Chance = 0.0201, Unit = "C Rotations"},
            {Part = "Stock", Chance = 0.0201, Unit = "C Rotations"},
        },
        {
            {Part = "Barrel", Chance = 0.0442, Unit = "B Rotations"},
            {Part = "Receiver", Chance = 0.0442, Unit = "B Rotations"},
        },
    },

    ["BRAKK"] = {
        {
            {Part = "Main Blueprint", Chance = 0.125, Unit = "kills"},
            {Part = "Barrel", Chance = 0.25, Unit = "kills"},
            {Part = "Receiver", Chance = 0.25, Unit = "kills"},
        },
    },

    ["BROKEN WAR"] = {
        {
            {Part = "Main Blueprint", Chance = 0.02765, Unit = "kills"},
        },
        {
            {Part = "Hilt", Chance = 0.005, Unit = "kills"},
            {Part = "Blade", Chance = 0.005, Unit = "kills"},
        },
    },
    -- C --
    ["CEDO"] = {
        {
            {Part = "Main Blueprint", Chance = 0.02, Desc = "Normal", Unit = "B Rotations"},
            {Part = "Barrel", Chance = 0.02, Desc = "Normal", Unit = "B Rotations"},
            {Part = "Receiver", Chance = 0.02, Desc = "Normal", Unit = "B Rotations"},
            {Part = "Stock", Chance = 0.02, Desc = "Normal", Unit = "B Rotations"},
        },
        {
            {Part = "Main Blueprint", Chance = 0.03, Desc = "Advanced", Unit = "B Rotations"},
            {Part = "Barrel", Chance = 0.03, Desc = "Advanced", Unit = "B Rotations"},
            {Part = "Receiver", Chance = 0.03, Desc = "Advanced", Unit = "B Rotations"},
            {Part = "Stock", Chance = 0.03, Desc = "Advanced", Unit = "B Rotations"},
        },
        {
            {Part = "Main Blueprint", Chance = 0.04, Desc = "Endurance", Unit = "B Rotations"},
            {Part = "Barrel", Chance = 0.04, Desc = "Endurance", Unit = "B Rotations"},
            {Part = "Receiver", Chance = 0.04, Desc = "Endurance", Unit = "B Rotations"},
            {Part = "Stock", Chance = 0.04, Desc = "Endurance", Unit = "B Rotations"},
        },
    },

    ["CRONUS"] = {
        {
            {Part = "Main Blueprint", Chance = 0.05, Unit = "kills"},
        },
    },
	-- D --
    ["DESPAIR"] = {
        {
            {Part = "Main Blueprint", Chance = 0.0553, Unit = "kills"},
        },
    },

    ["DETRON"] = {
        {
            {Part = "Main Blueprint", Chance = 0.1765, Unit = "kills"},
            {Part = "Barrel", Chance = 0.3235, Unit = "kills"},
            {Part = "Receiver", Chance = 0.3235, Unit = "kills"},
        },
    },

    ["DREAD"] = {
        {
            {Part = "Main Blueprint", Chance = 0.3794, Unit = "kills"},
        },
    },
	-- F --
    ["FURAX WRAITH"] = {
        {
            {Part = "Left Gauntlet", Chance = 0.0541, Desc = "Stage 4, lvl 40-60", Unit = "Rotation A Bounties"},
            {Part = "Left Gauntlet", Chance = 0.0816, Desc = "Stage 5, lvl 40-60", Unit = "Rotation A Bounties"},
        },
        {
            {Part = "Right Gauntlet", Chance = 0.0541, Desc = "Stage 4, lvl 40-60", Unit = "Rotation B Bounties"},
            {Part = "Right Gauntlet", Chance = 0.0816, Desc = "Stage 5, lvl 40-60", Unit = "Rotation B Bounties"},
        },
        {
            {Part = "Main Blueprint", Chance = 0.0541, Desc = "Stage 4, lvl 40-60", Unit = "Rotation C Bounties"},
            {Part = "Main Blueprint", Chance = 0.0816, Desc = "Stage 5, lvl 40-60", Unit = "Rotation C Bounties"},
        },
    },
	-- G --
    ["GORGON"] = {
        {
            {Part = "Main Blueprint", Chance = 0.01, Unit = "kills"},
        },
    },

    ["GORGON WRAITH"] = {
        {
            {Part = "Main Blueprint", Chance = 0.1897, Unit = "kills"},
            {Part = "Barrel", Chance = 0.1897, Unit = "kills"},
            {Part = "Receiver", Chance = 0.1897, Unit = "kills"},
            {Part = "Stock", Chance = 0.1897, Unit = "kills"},
        },
    },
	-- H --
    ["HATE"] = {
        {
            {Part = "Main Blueprint", Chance = 0.0553, Unit = "kills"},
        },
    },
	-- I --
    ["IMPERATOR VANDAL"] = {
        {
            {Part = "Main Blueprint", Chance = 0.1000, Unit = "kills"},
            {Part = "Barrel", Chance = 0.1000, Unit = "kills"},
            {Part = "Receiver", Chance = 0.1000, Unit = "kills"},
        },
    },
	-- K --
    ["KORRUDO"] = {
        {
            {Part = "Main Blueprint", Chance = 0.0250, Desc = "Bull", Unit = "kills"},
            {Part = "Main Blueprint", Chance = 0.0500, Desc = "Doma", Unit = "kills"},
        },
    },
	-- L --
    ["LATO VANDAL"] = {
        {
            {Part = "Receiver", Chance = 0.0201, Unit = "A Rotation"},
        },
        {
            {Part = "Main Blueprint", Chance = 0.0201, Unit = "B Rotation"},
        },
        {
            {Part = "Barrel", Chance = 0.0201, Unit = "C Rotation"},
        },
    },
	-- M --
    ["MITER"] = {
        {
            {Part = "Main Blueprint", Chance = 0.1667, Unit = "kills"},
            {Part = "Barrel", Chance = 0.1667, Unit = "kills"},
            {Part = "Blade", Chance = 0.1667, Unit = "kills"},
            {Part = "Handle", Chance = 0.1667, Unit = "kills"},
            {Part = "Chassis", Chance = 0.1667, Unit = "kills"},
        },
    },
	-- P --
    ["PENNANT"] = {
        {
            {Part = "Main Blueprint", Chance = 0.0500, Unit = "kills"},
        },
    },
	-- Q --
    ["QUARTAKK"] = {
        {
            {Part = "Main Blueprint", Chance = 0.5000, Unit = "kills"},
        },
        {
            {Part = "Main Blueprint", Chance = 0.0469, Desc = "Stage 2, lvl 40-50", Unit = "Bounties"},
            {Part = "Main Blueprint", Chance = 0.0469, Desc = "Stage 3, lvl 40-50", Unit = "Bounties"},
            {Part = "Main Blueprint", Chance = 0.0412, Desc = "Stage 4, lvl 40-50", Unit = "Bounties"},
            {Part = "Main Blueprint", Chance = 0.0595, Desc = "Stage 5, lvl 40-50", Unit = "Bounties"},
        },
    },

    ["QUASSUS"] = {
        {
            {Part = "Main Blueprint", Chance = 0.2222, Desc = "Stage 4, lvl 40-60", Unit = "Bounties"},
            {Part = "Main Blueprint", Chance = 0.4348, Desc = "Stage 5, lvl 40-60", Unit = "Bounties"},
        },
    },
	
    ["QUELLOR"] = {
        {
            {Part = "Main Blueprint", Chance = 0.0500, Unit = "kills"},
        },
    },
	-- S --
    ["SEER"] = {
        {
            {Part = "Main Blueprint", Chance = 0.3872, Unit = "kills"},
            {Part = "Barrel", Chance = 0.3872, Unit = "kills"},
            {Part = "Receiver", Chance = 0.2256, Unit = "kills"},
        },
    },

    ["SHEDU"] = {
        {
            {Part = "Barrel", Chance = 0.0100, Unit = "kills"},
            {Part = "Chassis", Chance = 0.0100, Unit = "kills"},
            {Part = "Handle", Chance = 0.0100, Unit = "kills"},
            {Part = "Receiver", Chance = 0.0100, Unit = "kills"},
        },
    },
	
	["SPOROTHRIX"] = {
		{
			{Part = "Main Blueprint", Chance = 0.21, Desc = "Stage 1, lvl 50-60", Unit = "Bounties"},
			{Part = "Barrel", Chance = 0.0833, Desc = "Stage 2, Stage 3, lvl 50-60", Unit = "Bounties"},
			{Part = "Barrel", Chance = 0.0643, Desc = "Stage 4, lvl 50-60", Unit = "Bounties"},
			{Part = "Barrel", Chance = 0.09, Desc = "Stage 5, lvl 50-60", Unit = "Bounties"},
			{Part = "Receiver", Chance = 0.0833, Desc = "Stage 2, Stage 3, lvl 50-60", Unit = "Bounties"},
			{Part = "Receiver", Chance = 0.0643, Desc = "Stage 4, lvl 50-60", Unit = "Bounties"},
			{Part = "Receiver", Chance = 0.09, Desc = "Stage 5, lvl 50-60", Unit = "Bounties"},
			{Part = "Stock", Chance = 0.0714, Desc = "Stage 4, lvl 50-60", Unit = "Bounties"},
			{Part = "Stock", Chance = 0.1, Desc = "Stage 5, lvl 50-60", Unit = "Bounties"},
		},
	},

    ["STAHLTA"] = {
        {
            {Part = "Main Blueprint", Chance = 0.1500, Desc = "Jackal", Unit = "kills"},
        },
        {
            {Part = "Receiver", Chance = 0.2222, Unit = "C Rotations"},
        },
        {
            {Part = "Stock", Chance = 0.2963, Desc = "Extended", Unit = "C Rotations"},
        },
        {
            {Part = "Barrel", Chance = 0.2963, Desc = "Nightmare", Unit = "C Rotations"},
        },
    },

    ["STROPHA"] = {
        {
            {Part = "Main Blueprint", Chance = 0.1500, Desc = "Jackal", Unit = "kills"},
        },
        {
            {Part = "Barrel", Chance = 0.2222, Unit = "C Rotations"},
            {Part = "Blade", Chance = 0.2222, Unit = "C Rotations"},
        },
        {
            {Part = "Receiver", Chance = 0.2963, Desc = "Extended", Unit = "C Rotations"},
        },
        {
            {Part = "Stock", Chance = 0.2963, Desc = "Nightmare", Unit = "C Rotations"},
        },
    },

    ["STUBBA"] = {
        {
            {Part = "Main Blueprint", Chance = 0.5000, Unit = "kills"},
        },
        {
            {Part = "Main Blueprint", Chance = 0.0469, Desc = "Stage 2, lvl 15-25", Unit = "Bounties"},
            {Part = "Main Blueprint", Chance = 0.0469, Desc = "Stage 3, lvl 15-25", Unit = "Bounties"},
            {Part = "Main Blueprint", Chance = 0.0412, Desc = "Stage 4, lvl 15-25", Unit = "Bounties"},
            {Part = "Main Blueprint", Chance = 0.0595, Desc = "Stage 5, lvl 15-25", Unit = "Bounties"},
        },
    },
	-- T --
    ["TWIN GREMLINS"] = {
        {
            {Part = "Main Blueprint", Chance = 0.1667, Unit = "kills"},
        },
    },

    ["TWIN KOHMAK"] = {
        {
            {Part = "Main Blueprint", Chance = 0.2500, Unit = "kills"},
        },
    },
	-- V --
    ["VELOX"] = {
        {
            {Part = "Barrel", Chance = 0.2222, Unit = "C Rotations"},
        },
        {
            {Part = "Receiver", Chance = 0.2963, Desc = "Extended", Unit = "C Rotations"},
        },
    },
    -- W --
    ["WAR"] = {
        {
            {Part = "Main Blueprint", Chance = 0.02765, Unit = "kills"},
        },
    },

    ["WOLF SLEDGE"] = {
        {
            {Part = "Main Blueprint", Chance = 0.0395, Unit = "kills"},
            {Part = "Handle", Chance = 0.1355, Unit = "kills"},
            {Part = "Head", Chance = 0.1355, Unit = "kills"},
            {Part = "Motor", Chance = 0.0395, Unit = "kills"},
        },
    },
	-- Y --
	-- Z --

---------------------------------------- ARCANES ----------------------------------------

    ["ARCANE ACCELERATION"] = {
        {
            {Part = "Arcane", Chance = 0.1020, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.0925, Unit = "captures"},
        },
    },

    ["ARCANE AEGIS"] = {
        {
            {Part = "Arcane", Chance = 0.0592, Unit = "captures"},
        },
    },

    ["ARCANE AGILITY"] = {
        {
            {Part = "Arcane", Chance = 0.1020, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.0925, Unit = "captures"},
        },
    },

    ["ARCANE ARACHNE"] = {
        {
            {Part = "Arcane", Chance = 0.1376, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1274, Unit = "captures"},
        },
    },

    ["ARCANE AVENGER"] = {
        {
            {Part = "Arcane", Chance = 0.1170, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1124, Unit = "captures"},
        },
    },

    ["ARCANE AWAKENING"] = {
        {
            {Part = "Arcane", Chance = 0.1825, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1463, Unit = "captures"},
        },
    },

    ["ARCANE BARRIER"] = {
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "captures"},
        },
    },

    ["ARCANE BLADE CHARGER"] = {
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "B Rotations"},
        },
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "C Rotations"},
        },
    },

    ["ARCANE BODYGUARD"] = {
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "A Rotations"},
        },
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "B Rotations"},
        },
    },

    ["ARCANE CONSEQUENCE"] = {
        {
            {Part = "Arcane", Chance = 0.1495, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1205, Unit = "captures"},
        },
    },

    ["ARCANE DEFLECTION"] = {
        {
            {Part = "Arcane", Chance = 0.0602, Unit = "captures"},
        },
    },

    ["ARCANE ENERGIZE"] = {
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "captures"},
        },
    },

    ["ARCANE ERUPTION"] = {
        {
            {Part = "Arcane", Chance = 0.1020, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.0925, Unit = "captures"},
        },
    },

    ["ARCANE FURY"] = {
        {
            {Part = "Arcane", Chance = 0.1376, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1124, Unit = "captures"},
        },
    },

    ["ARCANE GRACE"] = {
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "captures"},
        },
    },

    ["ARCANE GUARDIAN"] = {
        {
            {Part = "Arcane", Chance = 0.1568, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1192, Unit = "captures"},
        },
    },

    ["ARCANE HEALING"] = {
        {
            {Part = "Arcane", Chance = 0.0602, Unit = "captures"},
        },
    },

    ["ARCANE ICE"] = {
        {
            {Part = "Arcane", Chance = 0.1495, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1205, Unit = "captures"},
        },
    },

    ["ARCANE MOMENTUM"] = {
        {
            {Part = "Arcane", Chance = 0.1495, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1205, Unit = "captures"},
        },
    },

    ["ARCANE NULLIFIER"] = {
        {
            {Part = "Arcane", Chance = 0.1495, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1205, Unit = "captures"},
        },
    },

    ["ARCANE PHANTASM"] = {
        {
            {Part = "Arcane", Chance = 0.1020, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.0952, Unit = "captures"},
        },
    },

    ["ARCANE PISTOLEER"] = {
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "A Rotations"},
        },
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "C Rotations"},
        },
    },

    ["ARCANE PRECISION"] = {
        {
            {Part = "Arcane", Chance = 0.0702, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.0592, Unit = "captures"},
        },
    },

    ["ARCANE PRIMARY CHARGER"] = {
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "B Rotations"},
        },
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "C Rotations"},
        },
    },

    ["ARCANE PULSE"] = {
        {
            {Part = "Arcane", Chance = 0.0529, Unit = "captures"},
        },
    },

    ["ARCANE RAGE"] = {
        {
            {Part = "Arcane", Chance = 0.1376, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1274, Unit = "captures"},
        },
    },

    ["ARCANE RESISTANCE"] = {
        {
            {Part = "Arcane", Chance = 0.0678, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.0602, Unit = "captures"},
        },
    },

    ["ARCANE STRIKE"] = {
        {
            {Part = "Arcane", Chance = 0.1825, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1463, Unit = "captures"},
        },
    },

    ["ARCANE TANKER"] = {
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "A Rotations"},
        },
        {
            {Part = "Arcane", Chance = 0.0500, Unit = "C Rotations"},
        },
    },

    ["ARCANE TEMPO"] = {
        {
            {Part = "Arcane", Chance = 0.1850, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1568, Unit = "captures"},
        },
    },

    ["ARCANE TRICKERY"] = {
        {
            {Part = "Arcane", Chance = 0.2478, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.2024, Unit = "captures"},
        },
    },

    ["ARCANE ULTIMATUM"] = {
        {
            {Part = "Arcane", Chance = 0.0529, Unit = "captures"},
        },
    },

    ["ARCANE VELOCITY"] = {
        {
            {Part = "Arcane", Chance = 0.2223, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1679, Unit = "captures"},
        },
    },

    ["ARCANE VICTORY"] = {
        {
            {Part = "Arcane", Chance = 0.0602, Unit = "captures"},
        },
    },

    ["ARCANE WARMTH"] = {
        {
            {Part = "Arcane", Chance = 0.1495, Unit = "kills"},
        },
        {
            {Part = "Arcane", Chance = 0.1205, Unit = "captures"},
        },
    },

	["RESIDUAL BOILS"] = {
        {  
            {Part = "Arcane", Chance = 0.0625, Desc = "Stage 1, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0313, Desc = "Stage 2 & 3, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.025, Desc = "Stage 4, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0833, Desc = "Stage 1, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0385, Desc = "Stage 2 & 3, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0294, Desc = "Stage 4, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.1, Desc = "Stage 1, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.037, Desc = "Stage 2 & 3, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0286, Desc = "Stage 4, lvl 50-60", Unit = "Bounties"},
        },
    },
    
    ["RESIDUAL MALODOR"] = {
        {  
            {Part = "Arcane", Chance = 0.0625, Desc = "Stage 1, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0313, Desc = "Stage 2 & 3, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.025, Desc = "Stage 4, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0833, Desc = "Stage 1, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0385, Desc = "Stage 2 & 3, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0294, Desc = "Stage 4, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.1, Desc = "Stage 1, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.037, Desc = "Stage 2 & 3, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0286, Desc = "Stage 4, lvl 50-60", Unit = "Bounties"},
        },
    },
    
    ["RESIDUAL SHOCK"] = {
        {  
            {Part = "Arcane", Chance = 0.0313, Desc = "Stage 2 & 3, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.025, Desc = "Stage 4, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0417, Desc = "Stage 5, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0385, Desc = "Stage 2 & 3, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0294, Desc = "Stage 4, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0455, Desc = "Stage 5, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0556, Desc = "Stage 2 & 3, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0429, Desc = "Stage 4, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.06, Desc = "Stage 5, lvl 50-60", Unit = "Bounties"},
        },
    },
    
    ["RESIDUAL VIREMIA"] = {
        {  
            {Part = "Arcane", Chance = 0.0313, Desc = "Stage 2 & 3, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.025, Desc = "Stage 4, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0417, Desc = "Stage 5, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0385, Desc = "Stage 2 & 3, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0294, Desc = "Stage 4, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0455, Desc = "Stage 5, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0556, Desc = "Stage 2 & 3, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0429, Desc = "Stage 4, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.06, Desc = "Stage 5, lvl 50-60", Unit = "Bounties"},
        },
    },
    
    ["THEOREM CONTAGION"] = {
        {  
            {Part = "Arcane", Chance = 0.0417, Desc = "Stage 4, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0382, Desc = "Stage 4, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0591, Desc = "Stage 5, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0429, Desc = "Stage 4, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0600, Desc = "Stage 5, lvl 50-60", Unit = "Bounties"},
        },
    },
    
    ["THEOREM DEMULCENT"] = {
        {  
            {Part = "Arcane", Chance = 0.0625, Desc = "Stage 1, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0313, Desc = "Stage 2 & 3, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.025, Desc = "Stage 4, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0833, Desc = "Stage 1, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0385, Desc = "Stage 2 & 3, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0294, Desc = "Stage 4, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.1, Desc = "Stage 1, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.037, Desc = "Stage 2 & 3, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0286, Desc = "Stage 4, lvl 50-60", Unit = "Bounties"},
        },
    },
    
    ["THEOREM INFECTION"] = {
        {  
            {Part = "Arcane", Chance = 0.0313, Desc = "Stage 2 & 3, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.025, Desc = "Stage 4, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0417, Desc = "Stage 5, lvl 30-40", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0385, Desc = "Stage 2 & 3, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0294, Desc = "Stage 4, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0455, Desc = "Stage 5, lvl 40-50", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0556, Desc = "Stage 2 & 3, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.0429, Desc = "Stage 4, lvl 50-60", Unit = "Bounties"},
            {Part = "Arcane", Chance = 0.06, Desc = "Stage 5, lvl 50-60", Unit = "Bounties"},
        },
    },

------------------------------------- LANDING CRAFT -------------------------------------

    ["MANTIS"] = {
        {
            {Part = "Fuselage Blueprint", Chance = 0.3000, Unit = "rare containers"},
            {Part = "Engines Blueprint", Chance = 0.3000, Unit = "rare containers"},
        },
        {
            {Part = "Avionics Blueprint", Chance = 1, Unit = "rare containers"},
        },
    },

    ["SCIMITAR"] = {
        {
            {Part = "Fuselage Blueprint", Chance = 0.1250, Unit = "[[Vem Tabook]] kills"},
        },
        {
            {Part = "Engines Blueprint", Chance = 0.01005, Unit = "([[Shadow Stalker|Shadow]]) [[Stalker]] kills"},
        },
        {
            {Part = "Avionics Blueprint", Chance = 0.1765, Unit = "[[Zanuka]] kills"},
        },
    },

    ["XIPHOS"] = {
        {
            {Part = "Fuselage Blueprint", Chance = 0.0050, Desc = "Tier I", Unit = "Rotation C Caches"},
        },
        {
            {Part = "Engines Blueprint", Chance = 0.0050, Desc = "Tier II", Unit = "Rotation C Caches"},
        },
        {
            {Part = "Engines Blueprint", Chance = 0.0050, Desc = "Jupiter", Unit = "Rotation C Caches"},
        },
        {
            {Part = "Engines Blueprint", Chance = 0.0129, Desc = "Lua", Unit = "Rotation C Caches"},
        },
        {
            {Part = "Avionics Blueprint", Chance = 0.0050, Desc = "Tier III", Unit = "Rotation C Caches"},
        },
        {
            {Part = "Avionics Blueprint", Chance = 0.0050, Desc = "Void II", Unit = "Rotation C Caches"},
        },
        {
            {Part = "Avionics Blueprint", Chance = 0.0101, Desc = "Void IV", Unit = "Rotation C Caches"},
        },
        {
            {Part = "Avionics Blueprint", Chance = 0.0050, Desc = "Kuva Fortress", Unit = "Rotation C Caches"},
        },
    },

-------------------------------------------------------- Other --------------------------------------------------------
    
    ["FORMA BLUEPRINT"] = {
        {
            {Mission = "Defense", Desc = "[[Derelict]]", Chance = 0.2256, Unit = "C Rotations"},
        },
        {
            {Mission = "Rathuum", Desc = "Easy", Chance = 0.0034, Unit = "A Rotations"},
        },
        {
            {Mission = "Rathuum", Desc = "Hard", Chance = 0.0050, Unit = "A Rotations"},
        },
        {
            {Mission = "Conclave", Desc = "Mission Reward", Chance = 0.0025, Unit = "B Rotations"},
        },
        {
            {Mission = "Sabotage", Desc = "[[Earth]]", Chance = 0.0200, Unit = "C Rotations"},
        },
        {
            {Mission = "Empyrean", Desc = "[[Saturn]]", Chance = 0.0250},
        },
        {
            {Mission = "Empyrean", Desc = "[[Veil Proxima]]", Chance = 0.0250},
        },
    },

    ["FORMA"] = {
        {
            {Mission = "Sortie", Chance = 0.0250},
        },
        {
            {Mission = "Sabotage", Desc = "[[Earth]]", Chance = 0.0050, Unit = "C Rotations"},
        },
        {
            {Mission = "Rare Orokin Storage Container", Desc = "Variant 1", Chance = 0.1250},
        },
        {
            {Mission = "Rare Orokin Storage Container", Desc = "Variant 2", Chance = 1},
        },
        {
            {Mission = "Reinforced Orokin Storage Container", Chance = 1},
        },
    },
}

return AcqData