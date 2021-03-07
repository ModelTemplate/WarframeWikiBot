local DamageTypes = 
{
["Types"] = {
--physical damage types
    ["Impact"] = {
        Positives = {
            {"Shield", 50},
            {"Machinery", 25},
            {"Proto Shield", 15},
            },
        Negatives = {
            {"Flesh", 25},
            {"Cloned Flesh", 25},
            {"Tenno Shield", 25},
            },
        Status = {"Stagger"},
        StatusNotes = {1, 2},
    },
    ["Puncture"] = {
        Positives = {
            {"Ferrite Armor", 50},
            {"Infested Sinew", 25},
            {"Robotic", 25},
            {"Alloy Armor", 15},
            },
        Negatives = {
            {"Proto Shield", 50},
            {"Shield", 20},
            {"Tenno Shield", 25},
            },
        Status = {"Weakened"},
    },
    ["Slash"] = {
        Positives = {
            {"Infested Flesh", 50},
            {"Infested", 25},
            {"Flesh", 25},
            {"Cloned Flesh", 25},
            {"Fossilized", 15},
            },
        Negatives = {
            {"Ferrite Armor", 15},
            {"Robotic", 25},
            {"Alloy Armor", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Bleed"},
    },
--elemental damage types
    ["Cold"] = {
        ColorBorder = "#11559a",
        ColorBackground = "#a3b8cc",
        Positives = {
            {"Shield", 50},
            {"Alloy Armor", 25},
            {"Infested Sinew", 25},
            },
        Negatives = {
            {"Fossilized", 25},
            {"Infested Flesh", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Slowdown"},
    },
    ["Electricity"] = {
        ColorBorder = "#5f04b4",
        ColorBackground = "#b8a3cc",
        Positives = {
            {"Machinery", 50},
            {"Robotic", 50},
            },
        Negatives = {
            {"Alloy Armor", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Tesla Chain", "Stun"},
        StatusNotes = {1,2},
    },
    ["Heat"] = {
        ColorBorder = "#991200",
        ColorBackground = "#cca8a3",
        Positives = {
            {"Infested Flesh", 50},
            {"Cloned Flesh", 25},
            {"Infested", 25},
            },
        Negatives = {
            {"Proto Shield", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Fire DoT", "Panic", "Armor Stripping"},
        StatusNotes = {1,3},
    },
    ["Toxin"] = {
        ColorBorder = "#578808",
        ColorBackground = "#bccca3",
        Positives = {
            {"Flesh", 50},
            },
        Negatives = {
            {"Machinery", 25},
            {"Robotic", 25},
            {"Fossilized", 50},
            },
        Bypass = {"Shield", "Proto Shield", "Tenno Shield"},
        BypassNotes = {5},
        Status = {"Poison DoT"},
    },
--combined element damage types
    ["Blast"] = {
        ColorBorder = "#b45f04",
        ColorBackground = "#ccb8a3",
        Types = {"Heat","Cold"},
        Positives = {
            {"Machinery", 75},
            {"Fossilized", 50},
            },
        Negatives = {
            {"Ferrite Armor", 25},
            {"Infested Sinew", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Accuracy Reduction"},
        --StatusNotes = {1,2},
    },
    ["Corrosive"] = {
        ColorBorder = "#009933",
        ColorBackground = "#a3ccb1",
        Types = {"Electricity","Toxin"},
        Positives = {
            {"Fossilized", 75},
            {"Ferrite Armor", 75},
            },
        Negatives = {
            {"Proto Shield", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Armor Stripping"},
    },
    ["Gas"] = {
        ColorBorder = "#71905e",
        ColorBackground = "#b3cca3",
        Types = {"Heat","Toxin"},
        Positives = {
            {"Infested", 75},
            {"Infested Flesh", 50},
            },
        Negatives = {
            {"Cloned Flesh", 50},
            {"Flesh", 25},
            {"Tenno Shield", 25},
            },
        Status = {"Toxin Cloud"},
    },
    ["Magnetic"] = {
        ColorBorder = "#0033cc",
        ColorBackground = "#a3adcc",
        Types = {"Cold","Electricity"},
        Positives = {
            {"Shield", 75},
            {"Proto Shield", 75},
            },
        Negatives = {
            {"Alloy Armor", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Additional Shield Damage"},
    },
    ["Radiation"] = {
        ColorBorder = "#088a85",
        ColorBackground = "#a3cccb",
        Types = {"Heat","Electricity"},
        Positives = {
            {"Alloy Armor", 75},
            {"Infested Sinew", 50},
            {"Robotic", 25},
            },
        Negatives = {
            {"Shield", 25},
            {"Fossilized", 75},
            {"Infested", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Friendly Fire"},
        StatusNotes = {1},
    },
    ["Viral"] = {
        ColorBorder = "#87223e",
        ColorBackground = "#d6bdc4",
        Types = {"Cold","Toxin"},
        Positives = {
            {"Cloned Flesh", 75},
            {"Flesh", 50},
            },
        Negatives = {
            {"Machinery", 25},
            {"Infested", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Increased Health Damage"},
    },
--unique damage types
    ["True"] = {
        Bypass = {"Ferrite Armor","Alloy Armor","Tenno Armor","Infested Sinew"},
        BypassNotes = {5},
    },
    ["Void"] = {
        ColorBorder = "#bab000",
        ColorBackground = "#cccaa3",
        Negatives = {
            {"Tenno Shield", 25},
            },
        Status = {"Bullet Attract"},
    },
    ["Tau"] = {
        ColorBorder = "#e8ab1e",
        ColorBackground = "#e1d7c0",
        Negatives = {
            {"Tenno Shield", 25},
            },
        Status = {""},
    },

--empyrean physical damage types
    ["Ballistic"] = {
        Positives = {
            {"Shield", 50},
            {"Machinery", 25},
            {"Proto Shield", 15},
            },
        Negatives = {
            {"Flesh", 25},
            {"Cloned Flesh", 25},
            {"Tenno Shield", 25},
            },
        Status = {"Concuss"},
    },
    ["Plasma"] = {
        Positives = {
            {"Ferrite Armor", 50},
            {"Infested Sinew", 25},
            {"Robotic", 25},
            {"Alloy Armor", 15},
            },
        Negatives = {
            {"Proto Shield", 50},
            {"Shield", 20},
            {"Tenno Shield", 25},
            },
        Status = {"Decompress", "Hull Rupture"},
    },
    ["Particle"] = {
        Positives = {
            {"Infested Flesh", 50},
            {"Infested", 25},
            {"Flesh", 25},
            {"Cloned Flesh", 25},
            {"Fossilized", 15},
            },
        Negatives = {
            {"Ferrite Armor", 15},
            {"Robotic", 25},
            {"Alloy Armor", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Tear"},
    },
--empyrean elemental damage types
    ["Frost"] = {
        ColorBorder = "#11559a",
        ColorBackground = "#a3b8cc",
        Positives = {
            {"Shield", 50},
            {"Alloy Armor", 25},
            {"Infested Sinew", 25},
            },
        Negatives = {
            {"Fossilized", 25},
            {"Infested Flesh", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Immobilize", "Frozen Doors"},
    },
    ["Ionic"] = {
        ColorBorder = "#5f04b4",
        ColorBackground = "#b8a3cc",
        Positives = {
            {"Machinery", 50},
            {"Robotic", 50},
            },
        Negatives = {
            {"Alloy Armor", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Scramble", "Electricity Hazard"},
    },
    ["Incendiary"] = {
        ColorBorder = "#990000",
        ColorBackground = "#cca3a3",
        Positives = {
            {"Infested Flesh", 50},
            {"Cloned Flesh", 25},
            {"Infested", 25},
            },
        Negatives = {
            {"Proto Shield", 50},
            {"Tenno Shield", 25},
            },
        Status = {"Sear", "Fire Hazard"},
    },
    ["Chem"] = {
        ColorBorder = "#578808",
        ColorBackground = "#bccca3",
        Positives = {
            {"Flesh", 50},
            },
        Negatives = {
            {"Machinery", 25},
            {"Robotic", 25},
            {"Fossilized", 50},
            },
        Status = {"Intoxicate"},
    },
},
["Notes"] = {
    --notes for status and bypass
    [1] = "Does not affect Bosses.",
    [2] = "Does not affect Rollers, Regulators, Latchers or Ospreys.",
    [3] = "Does not affect Rollers, Regulators, Latchers, Ospreys or MOAs.",
    [4] = "This Status Effect bypasses Shield protections as it consists of Toxin damage.",
    [5] = "The damage associated bypasses these secondary protections.",
},
["Health"] = {
--[==[creation script:
for k,v in pairs(p.Health) do print([=[
    ["]=]..k..[=["] = {
        Positives = {},]=]..(v.Bypass and '\n        Bypass = {},\n' or '\n')..[=[
        Negatives = {},
        Nickname = "",
        Faction = {""},
        Type = "",
        Color = "",
    },]=]) end
]==]
    ["Alloy Armor"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Nickname = "Alloy",
        Faction = {"Grineer"},
        Type = "Armor",
        Color = "90, 5%",
    },
    ["Infested Sinew"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Nickname = "Sinew",
        Faction = {"Infested"},
        Type = "Armor",
        Color = "310, 14%",
    },
    ["Tenno Shield"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Faction = {"Tenno"},
        Type = "Shield",
        Color = "228, 51%",
    },
    ["Tenno Armor"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Faction = {"Tenno"},
        Type = "Armor",
        Color = "60, 90%",
    },
    ["Tenno Flesh"] = {
        Positives = {},
        --Bypass = {},
        Negatives = {},
        Faction = {"Tenno"},
        Type = "Health",
        Color = "0, 85%",
    },
    ["Shield"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Faction = {"Corpus"},
        Type = "Shield",
        Color = "228, 51%",
    },
    ["Machinery"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Nickname = "Machine",
        Faction = {"Grineer"},
        Type = "Health",
        Color = "250, 10%",
    },
    ["Ferrite Armor"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Nickname = "Ferrite",
        Faction = {"Grineer"},
        Type = "Armor",
        Color = "30, 5%",
    },
    ["Robotic"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Faction = {"Corpus"},
        Type = "Health",
        Color = "220, 25%",
    },
    ["Infested"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Faction = {"Infested"},
        Type = "Health",
        Color = "180, 18%",
    },
    ["Cloned Flesh"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Nickname = "Cloned",
        Faction = {"Grineer"},
        Type = "Health",
        Color = "26, 31%",
    },
    ["Flesh"] = {
        Positives = {},
        Negatives = {},
        Faction = {"Corpus"},
        Type = "Health",
        Color = "13, 31%",
    },
    ["Fossilized"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Nickname = "Fossil",
        Faction = {"Infested"},
        Type = "Health",
        Color = "140, 12%",
    },
    ["Proto Shield"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Nickname = "Proto",
        Faction = {"Corpus"},
        Type = "Shield",
        Color = "238, 41%",
    },
    ["Infested Flesh"] = {
        Positives = {},
        Bypass = {},
        Negatives = {},
        Nickname = "I. Flesh",
        Faction = {"Infested"},
        Type = "Health",
        Color = "70, 12%",
    },
},
["total"] = {["Tenno Flesh"]={}},
["dictionary"] = {
    ["Health"] = {
        {'Impact', 73},
        {'Puncture', 73},
        {'Slash', 73},
        
        {'Cold', 78},
        {'Electricity', 78},
        {'Heat', 78},
        {'Toxin', 78},
        
        {'Blast', 83},
        {'Corrosive', 83},
        {'Gas', 83},
        {'Magnetic', 83},
        {'Radiation', 83},
        {'Viral', 83},
        
        {'True', 88},
        {'Void', 88},
        --{'Tau', 88},
    },
    ["Types"] = {
        {"Cloned Flesh", "Grineer"},
        {"Flesh", "Corpus"},
        {"Infested", "Infested"},
        
        {"Ferrite Armor", "Grineer"},
        {"Shield", "Corpus"},
        {"Infested Flesh", "Infested"},
        
        {"Alloy Armor", "Grineer"},
        {"Proto Shield", "Corpus"},
        {"Fossilized", "Infested"},
        
        {"Machinery", "Grineer"},
        {"Robotic", "Corpus"},
        {"Infested Sinew", "Infested"},
    },
    ["Factions"] = {
        Grineer     = {
            {"Cloned Flesh","Ferrite Armor","Alloy Armor","Machinery"}, 
            {"#FFC8C8","#FFE8E8"},
        },
        Corpus      = {
            {"Flesh","Shield","Proto Shield","Robotic"}, 
            {"#C8C8FF","#E8E8FF"},
        },
        Infested    = {
            {"Infested","Infested Flesh","Fossilized","Infested Sinew"}, 
            {"#C8FFC8","#E8FFE8"},
        },
    },
    ["FactionOrder"]={'Grineer','Corpus','Infested'},
},
}
--[= =[
for k, t in pairs(DamageTypes["Types"]) do--type name, type
    for _,n in ipairs{'Positives','Bypass','Negatives'} do--positive and negative
        mw.log(k..n)
    for i,v in ipairs(t[n] or {}) do--each attribute {'health type',#percent}
        if _==2 then v={v,0} end
        if not DamageTypes["Health"][v[1]] then
            DamageTypes["Health"][v[1]] = {
                Positives = {},
                Bypass = {},
                Negatives = {},
                Nickname = "Error",
                Faction = {"Grineer", "Corpus", "Infested"},
                Type = "Health",
                Color = "0, 100%",
            }
        end--health type patch creation
        table.insert(DamageTypes["Health"][v[1]][n], {k,v[2]})--add attribute {type name, #percent}
        for __,dsa in ipairs{k,v[1]} do--loop between damage and health
            if not DamageTypes["total"][dsa] then DamageTypes["total"][dsa]={} end--init
            DamageTypes["total"][dsa][({v[1],k})[__]] = (-_+2)*v[2]
        end
    end
    end
end
--]==]
return DamageTypes