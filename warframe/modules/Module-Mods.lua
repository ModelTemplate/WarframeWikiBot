local p = {}

local ModData = mw.loadData( 'Module:Mods/data' )
local Shared = require( "Module:Shared" )
local Icon = require( "Module:Icon" )
local Version = require("Module:Version")

local function getMod(name)
    local _mod = ModData["Mods"][name]
    if _mod ~= nil and _mod.Name == name then
        return _mod
    else
        for modName, Mod in pairs(ModData["Mods"]) do
            if modName == name or Mod.Name == name then
                return Mod
            end
        end
    end
end

local function ifModExists(name, _mod)
    if type(_mod) ~= table then
        _mod = ModData["Mods"][name]
    elseif _mod.Name == name then
        return true
    end
    
    if _mod ~= nil and _mod.Name == name then
        return true
    else
        for modName, Mod in pairs(ModData["Mods"]) do
            if modName == name or Mod.Name == name then
                return true
            end
        end
    end
    return false
end

function p.getValueRaw(frame)
    local ModName = frame.args[1]
    local ValName = frame.args[2]
    local Mod = getMod(ModName)
    if Mod ~= nil then
        return Mod[ValName]
    end
end

function p.getValue(frame)
    local ModName = frame.args[1]
    local ValName = frame.args[2]
    
    local Mod = getMod(ModName)
    
    if(ModName == nil) then
        error "No mod specified"
    elseif(ValName == nil) then
        error "No value specified"
    elseif ifModExists (ModName,Mod) == false then
        error "No such mod found (see [[Module:Mods/data]])"
    end
    
    local UpName = string.upper(ValName)
    if(UpName == "NAME") then
        return ModName
    elseif(UpName == "IMAGE") then
        if(Mod.Image ~= nil) then
            return Mod.Image
        else
            return "Mod.png"
        end
    elseif(UpName == "LINK") then
        if(Mod.Link ~= nil) then
            return Mod.Link
        else
            return Mod.Name
        end
    elseif(UpName == "INTRODUCED") then
        if(Mod.Introduced ~= nil) then
            local ver, num = Version.getVersion(Mod.Introduced)
            if(ver ~= nil) then
                return Version.getVersionLink(Mod.Introduced)
            else
                return "Unknown"
            end
        else
            return "Unknown"
        end
    elseif(UpName == "POLARITY") then
        if(Mod.Polarity ~= nil) then
            return Mod.Polarity
        else
            return "None"
        end
    elseif(UpName == "POLARITYICON") then
        if(Mod.Polarity ~= nil) then
            return Icon._Pol(Mod.Polarity)
        else
            return ""
        end
    elseif(UpName == "RARITY") then
        if(Mod.Rarity ~= nil) then
            return Mod.Rarity
        else
            return "Unknown"
        end
    elseif(UpName == "TRADETAX") then
        if(Mod.Rarity ~= nil) then
            if(Mod.Rarity == "Common") then
                return Icon._Item("Credits").." 2,000"
            elseif(Mod.Rarity == "Uncommon") then
                return Icon._Item("Credits").." 4,000"
            elseif(Mod.Rarity == "Rare") then
                return Icon._Item("Credits").." 8,000"
            elseif(Mod.Rarity == "Legendary") then
                return Icon._Item("Credits").." 1,000,000"
            elseif(Mod.Rarity == "Amalgam") then
                return Icon._Item("Credits").." 0"
            elseif(Mod.Rarity == "Peculiar") then
                return Icon._Item("Credits").." 4,000"
            else
                return nil
            end
        else
            return nil
        end
    elseif(UpName == "TRANSMUTABLE") then
        if(Mod.Transmutable ~= nil) then
            if(Mod.Transmutable) then
                return '[[Transmutation|<span style="color:green">Transmutable</span>]]'
            else
                return '[[Transmutation|<span style="color:red">Untransmutable</span>]]'
            end
        else
            return '[[Transmutation|<span style="color:green">Transmutable</span>]]'
        end
    elseif(UpName == "TRANSMUTE") then
        if(Mod.Transmutable ~= nil) then
            if(Mod.Transmutable == nil or Mod.Transmutable == true) then
                return true
            else
                return nil
            end
        else
            return '[[Transmutation|<span style="color:green">Transmutable</span>]]'
        end
    else
        return ModData["Mods"][ModName][ValName]
    end
end

function p.buildModTableByRarity()
    local buildLegendaryTable = ""
    local countLegendary = 0
    local buildRareTable = ""
    local countRare = 0
    local buildUncommonTable = ""
    local countUncommon = 0
    local buildCommonTable = ""
    local countCommon = 0

    for key, Mod in Shared.skpairs(ModData["Mods"]) do
        --mw.log(Mod.Rarity)
        if Mod.Rarity == "Legendary" then
            buildLegendaryTable = buildLegendaryTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Name .."]]"
            countLegendary = countLegendary + 1
        elseif Mod.Rarity == "Rare" then
            buildRareTable = buildRareTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Name .."]]"
            countRare = countRare + 1
        elseif Mod.Rarity == "Uncommon" then
            buildUncommonTable = buildUncommonTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Name .."]]"
            countUncommon = countUncommon + 1
        elseif Mod.Rarity == "Common" then
            buildCommonTable = buildCommonTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Name .."]]"
            countCommon = countCommon +1
        end
    end

    local countTotal = countLegendary + countRare + countUncommon + countCommon
    local buildTable = 
countTotal .. "\n" ..
"{| border=\"1\" cellpadding=\"1\" cellspacing=\"1\" class=\"article-table\"\n" ..
"|-\n" ..
"!Legendary\n" .. countLegendary .. "\n" ..
"| " .. buildLegendaryTable .. "\n" ..
"|-\n" ..
"! Rare\n" .. countRare .. "\n" ..
"| " .. buildRareTable .. "\n" ..
"|-\n" ..
"! Uncommon\n" .. countUncommon .. "\n" ..
"| " .. buildUncommonTable .. "\n" ..
"|-\n" ..
"! Common\n" .. countCommon .. "\n" ..
"| " .. buildCommonTable .. "\n" ..
"|}"

    return buildTable
end

function p.buildModTableByPolarity()
    local buildMaduraiTable = ""
    local buildVazarinTable = ""
    local buildNaramonTable = ""
    local buildZenurikTable = ""
    local buildPenjagaTable = "" --wtf is penjaga
    local buildUnairuTable = ""

    local countMadurai = 0
    local countVazarin = 0
    local countNaramon = 0
    local countZenurik = 0
    local countPenjaga = 0
    local countUnairu = 0

--Madurai "V" "Madurai"
--Vazarin "D"
--Naramon "Bar"
--Zenurik "Ability" "Zenurik"
--Penjaga "Sentinel"
-- Unairu Pol Unairu  - R - Introduced in Update 13.0 and used for certain Melee Stance Mods.

    for key, Mod in Shared.skpairs(ModData["Mods"]) do
        --mw.log(Mod.Polarity)
        if Mod.Polarity == "V" or Mod.Polarity == "Madurai" then
            buildMaduraiTable = buildMaduraiTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Name .."]]"
            countMadurai = countMadurai + 1
        elseif Mod.Polarity == "D" or Mod.Polarity == "Vazarin" then
            buildVazarinTable = buildVazarinTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Name .."]]"
            countVazarin = countVazarin + 1
        elseif Mod.Polarity == "Bar" or Mod.Polarity == "Dash" or Mod.Polarity == "Naramon" then
            buildNaramonTable = buildNaramonTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Name .."]]"
            countNaramon = countNaramon + 1
        elseif Mod.Polarity == "Ability" or Mod.Polarity == "Zenurik" or Mod.Polarity == "Scratch" then
            buildZenurikTable = buildZenurikTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Name .."]]"
            countZenurik = countZenurik + 1
        elseif Mod.Polarity == "Sentinel" or Mod.Polarity == "Penjaga" then
            buildPenjagaTable = buildPenjagaTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Name .."]]"
            countPenjaga = countPenjaga + 1
        elseif Mod.Polarity == "R" or Mod.Polarity == "Unairu" or Mod.Polarity == "Ward" then
            buildUnairuTable = buildUnairuTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Name .."]]"
            countUnairu = countUnairu + 1
        end
    end

    local countTotal = countMadurai + countVazarin + countNaramon + countZenurik + countPenjaga + countUnairu
    local buildTable = 
countTotal .. "\n" ..
"{| border=\"1\" cellpadding=\"1\" cellspacing=\"1\" class=\"article-table\"\n" ..
"|-\n" ..
"!Madurai\n" .. countMadurai .. "\n" ..
"| " .. buildMaduraiTable .. "\n" ..
"|-\n" ..
"! Vazarin\n" .. countVazarin .. "\n" ..
"| " .. buildVazarinTable .. "\n" ..
"|-\n" ..
"! Naramon\n" .. countNaramon .. "\n" ..
"| " .. buildNaramonTable .. "\n" ..
"|-\n" ..
"! Zenurik\n" .. countZenurik .. "\n" ..
"| " .. buildZenurikTable .. "\n" ..
"|-\n" ..
"! Penjaga\n" .. countPenjaga .. "\n" ..
"| " .. buildPenjagaTable .. "\n" ..
"|-\n" ..
"!Unairu\n" .. countUnairu .. "\n" ..
"| " .. buildUnairuTable .. "\n" ..
"|}"

    return buildTable
end

function p.getPolarityList()
    local pols = {}
    
    for name, Mod in Shared.skpairs(ModData["Mods"]) do
        if(pols[Mod.Polarity] == nil) then 
            pols[Mod.Polarity] = 1 
        else 
            pols[Mod.Polarity] = pols[Mod.Polarity] + 1 
        end
    end
    
    local result = "POLARITIES:"
    for key, trash in Shared.skpairs(pols) do
        result = result.."\n"..key.." ("..trash..")"
    end
    return result
end

function p.getRarityList()
    local pols = {}
    
    for name, Mod in Shared.skpairs(ModData["Mods"]) do
        if(pols[Mod.Rarity] == nil) then 
            pols[Mod.Rarity] = 1 
        else 
            pols[Mod.Rarity] = pols[Mod.Rarity] + 1 
        end
    end
    
    local result = "RARITIES:"
    for key, trash in Shared.skpairs(pols) do
        result = result.."\n"..key.." ("..trash..")"
    end
    return result
end

function p.tooltipText(frame)
    local Name = frame.args ~= nil and frame.args[1]
    local newName = frame.args ~= nil and frame.args[2]
    local Mod = nil
    if newName == '' then newName = nil end
    
    if Name == nil then
        error ('{{[[Template:M|Mod]]}} Insert a mod name[[Category:Mod Tooltip error]]')
    else
        Mod = getMod(Name)
    end
    
    if Mod == nil then
		error ('{{[[Template:M|Mod]]}} '..Name..'" not found[[Category:Mod Tooltip error]]')
    else
        local Link = Mod.Link ~= nil and Mod.Link or nil
        
        local linkText = ''
        if Link ~= nil and newName ~= nil then
            linkText = Link..'|'..newName
        elseif newName ~= nil then
            linkText = Name..'|'..newName
        elseif Link ~= nil then
            linkText = Link..'|'..Name
        else
            linkText = Name
        end
        
        --mw.log(Link)
        local tMod ={}
        table.insert(tMod,'<span class="mod-tooltip" data-param="'..Name..'">')
        table.insert(tMod,'[[File:Mod_TT_20px.png|link='..Name..']]'..'&thinsp;[[')
        table.insert(tMod,linkText..']]</span>')
        
        return table.concat(tMod)
    end
end

-- accepts three parameters: 
-- a string that represents mod rarity: 'Common', 'Uncommon', 'Rare', 'Legendary', 'Amalgam', 'Peculiar', 'Requiem', 'All', or ''
-- a string that represents polarity: 'Madurai', 'Naramon', 'Vazarin', 'Zenurik', 'Unairu', 'Penjaga', or nil
-- a string that represents transmutability: 'true', 'false', '', or nil (counting both transmutable and non-transmutable mods)
function p.getModCount(frame)
    local total = 0
    local rarity = frame.args[1]
    local polarity = frame.args[2]
    local transmutable = frame.args[3]
    
    if (rarity == '' or rarity == nil) then
       rarity = 'All' 
    end
    
    if (polarity == '' or polarity == nil) then
        polarity = 'All'
    end
    
    if (transmutable == 'true') then
        transmutable = true
    elseif (transmutable == 'false') then
        transmutable = false
    else
        transmutable = 'All'
    end
    
    -- treating mods without Transmutable attribute as transmutable
    for name, Mod in Shared.skpairs(ModData['Mods']) do
        if ((Mod['Rarity'] == rarity or rarity == 'All') and 
            (Mod['Polarity'] == polarity or polarity == 'All') and
            (Mod['Transmutable'] == nil or Mod['Transmutable'] == transmutable or transmutable == 'All') and
            not Shared.contains(ModData['IgnoreInCount'], name)) then
            
            total = total + 1
        end
    end
    
    return total
end

function p.SimpleModNameList(frame)
    local result= ""
    local modtable={}
    for name, Mod in pairs(ModData['Mods'])do
        --mw.log(name, Mod)
        table.insert(modtable, name)
    end
    table.sort(modtable)
    for i, name in ipairs(modtable)do
        --mw.log(name)
        result=result..name..'<br>'
    end
    return result
end

-- accepts many parameters; each param represents a mod that is to be displayed in gallery format
-- better than copy/pasting gallery tags and updating individual mod images if they were to change
function p.buildGallery(frame)
    local result = {'<gallery captionposition="below" captionalign="center" hideaddbutton="true" spacing="small" position="center" bordersize="none" bordercolor="#FFFFFF" navigation="true">'}
    for i, v in ipairs(frame.args or frame) do
        v = getMod(v)
        table.insert(result, table.concat {'\n\n', v["Image"], '|', p.tooltipText{args={v.Name}}, '|link=', v.Link or v.Name})
    end
    table.insert(result, '\n\n</gallery>')
    return table.concat(result)
end

return p