local p = {}

local WarframeData = mw.loadData( 'Module:Warframes/data' )
local ConclaveData = mw.loadData( 'Module:Warframes/Conclave/data' )
local Version = require("Module:Version")
local Icon = require( "Module:Icon" )
local Weapons = require( "Module:Weapons" )
local Shared = require( "Module:Shared" )
local Ability = require( "Module:Ability" )
local UseDefaultList = {"AURAPOLARITY", "EXILUSPOLARITY", "MASTERY"}

function p.getWarframe(FrameName) --NOTE: Copied to Module:Ability. Apparently two modules can't `require` each other. That causes infinite loop.
    local warframe = WarframeData["Warframes"][FrameName]
    if warframe ~= nil and warframe.Name == FrameName then
        return warframe
    else
        for key, Warframe in Shared.skpairs(WarframeData["Warframes"]) do
            if(Warframe.Name == FrameName or key == FrameName) then
                return Warframe            
            end
        end
    end
    return nil
end

local function checkWarframe(warframe, wfName, conclave)
    if warframe == nil or type(warframe) ~= 'table' then
        if conclave then
            return p.getConclaveWarframe(wfName)
        else
            return p.getWarframe(wfName)
        end
    elseif type(warframe) == 'table' then
        return warframe
    end
end

function p.warframeExists(frame)
    local wfName = frame.args ~= nil and frame.args[1] or nil
    
    return p._warframeExists(wfName)
end

function p._warframeExists(wfName, warframe)
    local warframe = checkWarframe(warframe, wfName)
    if warframe then
        return true
    end
    if wfName == nil then
        return 'Enter warframe name.'
    elseif warframe == nil then
        return 'No warframe '..wfName..' found.'
    end
end

function p.getLink(wfName, warframe)
    local warframe = checkWarframe(warframe, wfName)
    local exists = p._warframeExists(wfName, warframe)
    if exists == true then
        local temp = warframe.Link
        if temp then
            return temp
        else
            return warframe.Name
        end
    elseif wfName == nil then
        return false
    else
        return false
    end
end

function p.getConclaveWarframe(FrameName)
    local warframe = ConclaveData["Warframes"][FrameName]
    if warframe ~= nil and warframe.Name == FrameName then
        return warframe
    else
        for key, Warframe in Shared.skpairs(ConclaveData["Warframes"]) do
            if(Warframe.Name == FrameName or key == FrameName) then
                return Warframe           
            end
        end
    end
    return nil
end

function p.isPrime(wframe)
    local frameName
    if(type(wframe) == "string") then frameName = wframe else frameName = wframe.Name end
    local baseName = string.gsub(frameName, ' Prime', '')
    if(Shared.contains(frameName, "Prime")) then
        return true, "Prime", baseName
    else
        return false, "Base", baseName
    end
end
 
function p.buildName(BaseName, Variant)
    if(Variant == nil or Variant == 'Base' or Variant == '') then
        return BaseName
    else
        return BaseName..' '..Variant
    end
end

function p.getWarframes(validateFunction)
    local wframes = {}
    for i, wframe in Shared.skpairs(WarframeData["Warframes"]) do
        if(validateFunction(wframe)) then
            table.insert(wframes, wframe)
        end
    end
    return wframes
end

--As above, but for the Conclave version
function p.getConclaveWarframes(validateFunction)
    local wframes = {}
    for i, wframe in Shared.skpairs(ConclaveData["Warframes"]) do
        if(validateFunction(wframe)) then
            table.insert(wframes, wframe)
        end
    end
    return wframes
end

--Based on the weapons version.
--The only actual variant possible is 'Prime', but should be pretty easy to fit in 'Umbra' later if needed by copying more code from the Module:Weapons equivalent.
function p.shortLinkList(Frames, tooltip)
    --First grabbing all the pieces and stashing them in a table
    local baseNames = {}
    for key, wf in Shared.skpairs(Frames) do
        local isVar, varType, baseName = p.isPrime(wf.Name)
        if(baseNames[baseName] == nil) then 
            baseNames[baseName] = {} 
        end
        table.insert(baseNames[baseName], varType)
    end
 
    --Then the fun part: Pulling the table together
    local result = {}
    for baseName, variants in Shared.skpairs(baseNames) do
        --So first, check if 'Base' is in the list
        --Because if it isn't, list all variants separately
        if(Shared.contains(variants, "Base")) then
            table.sort(variants)
            --First, get the basic version
            local thisRow = ''
            if(tooltip) then
                thisRow = '<span class="warframe-tooltip" data-param="'..baseName..'" style="white-space:pre">[['..baseName..']]</span>'
            else
                thisRow = '[['..baseName..']]'
            end
            --then, if there are variants...
            if(Shared.tableCount(variants) > 1) then
                --List them in parentheses one at a time
                thisRow = thisRow..' ('
                local count = 0
                for i, varName in pairs(variants) do
                    if(varName ~= 'Base') then
                        if(count > 0) then thisRow = thisRow..', ' end
                        if(tooltip) then
                            thisRow = thisRow..'<span class="warframe-tooltip" data-param="'..p.buildName(baseName, varName)..'" style="white-space:pre">[['..p.buildName(baseName, varName)..'|'..varName..']]</span>'
                        else
                            thisRow = thisRow..'[['..p.buildName(baseName, varName)..'|'..varName..']]'
                        end
                        count = count + 1
                    end
                end
                thisRow = thisRow..')'
            end
            table.insert(result, thisRow)
        else
            for i, varName in pairs(variants) do
                if(tooltip) then
                    table.insert(result, '<span class="warframe-tooltip" data-param="'..p.buildName(baseName, varName)..'" style="white-space:pre">[['..p.buildName(baseName, varName)..']]</span>')
                else
                    table.insert(result, '[['..p.buildName(baseName, varName)..']]')
                end
            end
        end
    end
    return result
end

local function getValue(Warframe, ValName, giveDefault, asString)
    if(giveDefault == nil) then giveDefault = false end
    if(asString == nil) then asString = false end

    if Warframe == nil then
        return nil
    end

    ValName = string.upper(ValName)
    if(ValName == "NAME") then
        if(Warframe.Name ~= nil) then
            return Warframe.Name
        else
            if (asString) then
                return ""
            else
                return nil
            end
        end
    elseif(ValName == "ARMORPLUS") then
        if(Warframe.Armor ~= nil) then
            if(asString) then
                local result = Shared.round(Warframe.Armor, 0)
                if(Warframe.ArmorRank30 ~= nil) then
                    result = result.." ("..Shared.round(Warframe.ArmorRank30, 0).." at rank 30)"
                end
                return result
            else
                return Warframe.Armor
            end
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return ""
            else
                return nil
            end
        end
    elseif(ValName == "ARMORPLUSMINIMAL") then
        if(Warframe.Armor ~= nil) then
            if(asString) then
                local result = Shared.round(Warframe.Armor, 0)
                if(Warframe.ArmorRank30 ~= nil) then
                    result = result.." ("..Shared.round(Warframe.ArmorRank30, 0)..")"
                end
                return result
            else
                return Warframe.Armor
            end
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return ""
            else
                return nil
            end
        end
    elseif(ValName == "ARMOR") then
        if(Warframe.Armor ~= nil) then
            return Warframe.Armor
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return "-"
            else
                return nil
            end
        end
    elseif(ValName == "ARMORRANK30") then
        if(Warframe.ArmorRank30 ~= nil) then
            return Warframe.ArmorRank30
        elseif(Warframe.Armor ~= nil) then
            return Warframe.Armor
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return "-"
            else
                return nil
            end
        end
    elseif(ValName == "AURAPOLARITY") then
        if(Warframe.AuraPolarity ~= nil) then
            if(asString and Warframe.AuraPolarity ~= "None") then
                return Icon._Pol(Warframe.AuraPolarity)
            else
                return Warframe.AuraPolarity
            end
        elseif giveDefault then
            return "None"
        else
            return nil
        end
    elseif(ValName == "CONCLAVE") then
        if(Warframe.Conclave ~= nil) then
            return Warframe.Conclave
        else
            if (asString) then
                return ""
            else
                return nil
            end
        end
    elseif(ValName == "ENERGYPLUS") then
        if(Warframe.Energy ~= nil) then
            if(asString) then
                local result = Shared.round(Warframe.Energy, 0)
                if(Warframe.EnergyRank30 ~= nil) then
                    result = result.." ("..Shared.round(Warframe.EnergyRank30, 0).." at rank 30)"
                else
                    result = result.." ("..Shared.round(Warframe.Energy * 1.5, 0).." at rank 30)"
                end
                return result
            else
                return Warframe.Energy
            end
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return ""
            else
                return nil
            end
        end
    elseif(ValName == "ENERGYPLUSMINIMAL") then
        if(Warframe.Energy ~= nil) then
            if(asString) then
                local result = Shared.round(Warframe.Energy, 0)
                if(Warframe.EnergyRank30 ~= nil) then
                    result = result.." ("..Shared.round(Warframe.EnergyRank30, 0)..")"
                else
                    result = result.." ("..Shared.round(Warframe.Energy * 1.5, 0)..")"
                end
                return result
            else
                return Warframe.Energy
            end
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return ""
            else
                return nil
            end
        end
    elseif(ValName == "ENERGY") then
        if(Warframe.Energy ~= nil) then
            return Warframe.Energy
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return "-"
            else
                return nil
            end
        end
    elseif(ValName == "ENERGYRANK30") then
        if(Warframe.EnergyRank30 ~= nil) then
            return Warframe.EnergyRank30
        elseif(Warframe.Energy ~= nil) then
            return Shared.round(Warframe.Energy * 1.5, 0)
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return "-"
            else
                return nil
            end
        end
    elseif(ValName == "HEALTHPLUS") then
        if(Warframe.Health ~= nil) then
            if(asString) then
                local result = Shared.round(Warframe.Health, 0)
                if(Warframe.HealthRank30 ~= nil) then
                    result = result.." ("..Shared.round(Warframe.HealthRank30, 0).." at rank 30)"
                else
                    result = result.." ("..Shared.round(Warframe.Health * 3, 0).." at rank 30)"
                end
                return result
            else
                return Warframe.Health
            end
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return "-"
            else
                return nil
            end
        end
    elseif(ValName == "HEALTHPLUSMINIMAL") then
        if(Warframe.Health ~= nil) then
            if(asString) then
                local result = Shared.round(Warframe.Health, 0)
                if(Warframe.HealthRank30 ~= nil) then
                    result = result.." ("..Shared.round(Warframe.HealthRank30, 0)..")"
                else
                    result = result.." ("..Shared.round(Warframe.Health * 3, 0)..")"
                end
                return result
            else
                return Warframe.Health
            end
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return "-"
            else
                return nil
            end
        end
    elseif(ValName == "HEALTH") then
        if(Warframe.Health ~= nil) then
            return Warframe.Health
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return "-"
            else
                return nil
            end
        end
    elseif(ValName == "HEALTHRANK30") then
        if(Warframe.HealthRank30 ~= nil) then
            return Warframe.HealthRank30
        elseif(Warframe.Health ~= nil) then
            return Warframe.Health * 3
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return "-"
            else
                return nil
            end
        end
    elseif(ValName == "EXILUSPOLARITY") then
        if(Warframe.ExilusPolarity ~= nil) then
            if(asString) then
                return Icon._Pol(Warframe.ExilusPolarity)
            else
                return Warframe.ExilusPolarity
            end
        elseif giveDefault then
            return "None"
        else
            return nil
        end
    elseif(ValName == "IMAGE") then
        if(Warframe.Image ~= nil) then
            return Warframe.Image
        elseif giveDefault then
            return "Panel.png"
        else
            return nil
        end
    elseif(ValName == "INTRODUCED") then
        if(Warframe.Introduced ~= nil) then
            local ver, num = Version.getVersion(Warframe.Introduced)
            if(ver ~= nil) then
                return Version.getVersionLink(Warframe.Introduced)
            else
                return "Unknown"
            end
        elseif giveDefault then
            return ""
        else
            return nil
        end
    elseif(ValName == "VERNUM") then
        if(Warframe.Introduced ~= nil) then
            local ver, num = Version.getVersion(Warframe.Introduced)
            if(num ~= nil) then
                return num
            else
                return -1
            end
        elseif giveDefault then
            return -1
        else
            return nil
        end
    elseif(ValName == "MASTERY") then
        if(Warframe.Mastery ~= nil) then
            return Warframe.Mastery
        elseif giveDefault then
            return 0
        else
            return nil
        end
    elseif(ValName == "MOBILITY") then
        if(Warframe.Mobility ~= nil) then
            if(asString) then
                return Shared.round(Warframe.Mobility, 2, 1)
            else
                return Warframe.Mobility
            end
        elseif giveDefault then
            return "1"
        else
            return 1
        end
    elseif(ValName == "POLARITIES") then
        if(Warframe.Polarities ~= nil) then
            if(asString) then
                return Weapons.GetPolarityString(Warframe)
            else
                return Warframe.Polarities
            end
        elseif giveDefault then
            if(asString) then
                return "None"
            else
                return {}
            end
        else
            return nil
        end
    elseif(ValName == "PORTRAIT") then
        if(Warframe.Portrait ~= nil) then
            return Warframe.Portrait
        elseif giveDefault then
            return "Panel.png"
        else
            return nil
        end
    elseif(ValName == "RELEASEDATE") then
        if(Warframe.Introduced ~= nil) then
            local relDate = Version.getVersionDate(Warframe.Introduced)
            if(relDate == nil) then 
                return "Unknown"
            else
                return relDate
            end
        else
            return "Unknown"
        end
    elseif(ValName == "SEX") then
        if(Warframe.Sex ~= nil) then
            return Warframe.Sex
        else
            return "Unknown"
        end
    elseif(ValName == "SHIELDPLUS") then
        if(Warframe.Shield ~= nil) then
            if(asString) then
                local result = Shared.round(Warframe.Shield, 0)
                if(Warframe.Shield > 0) then
                    if(Warframe.ShieldRank30 ~= nil) then
                        result = result.." ("..Shared.round(Warframe.ShieldRank30, 0).." at rank 30)"
                    else
                        result = result.." ("..Shared.round(Warframe.Shield * 3, 0).." at rank 30)"
                    end
                end
                return result
            else
                return Warframe.Shield
            end
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return ""
            else
                return nil
            end
        end
    elseif(ValName == "SHIELDPLUSMINIMAL") then
        if(Warframe.Shield ~= nil) then
            if(asString) then
                local result = Shared.round(Warframe.Shield, 0)
                if(Warframe.Shield > 0) then
                    if(Warframe.ShieldRank30 ~= nil) then
                        result = result.." ("..Shared.round(Warframe.ShieldRank30, 0)..")"
                    else
                        result = result.." ("..Shared.round(Warframe.Shield * 3, 0)..")"
                    end
                end
                return result
            else
                return Warframe.Shield
            end
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return ""
            else
                return nil
            end
        end
    elseif(ValName == "SHIELD") then
        if(Warframe.Shield ~= nil) then
            if(Warframe.Shield == 0 and asString) then
                return "-"
            else
                return Warframe.Shield
            end
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return "-"
            else
                return nil
            end
        end
    elseif(ValName == "SHIELDRANK30") then
        if(Warframe.ShieldRank30 ~= nil) then
            return Warframe.ShieldRank30
        elseif(Warframe.Shield ~= nil) then
            if(Warframe.Shield == 0 and asString) then
                return "-"
            else
                return Warframe.Shield * 3
            end
        elseif(giveDefault) then
            return 0
        else
            if (asString) then
                return "-"
            else
                return nil
            end
        end
    elseif(ValName == "SPRINT") then
        if(Warframe.Sprint ~= nil) then
            if(asString) then
                return Shared.round(Warframe.Sprint, 2, 1)
            else
                return Warframe.Sprint
            end
        elseif giveDefault then
            return ""
        else
            return nil
        end
    elseif(ValName == "THEMES") then
        if(Warframe.Themes ~= nil) then
            return Warframe.Themes
        elseif giveDefault then
            return ""
        else
            return nil
        end
    elseif(ValName == "VAULTED") then
        if(Warframe.Vaulted ~= nil) then
            if(asString) then
                if (Warframe.Vaulted == true) then return "Yes" 
                elseif (Warframe.Vaulted == false) then return "No"
                else return tostring(Warframe.Vaulted) 
                end
            else 
                return Warframe.Vaulted 
            end
        elseif giveDefault then
            return "No"
        else
            return nil
        end
    elseif(ValName == "SUBSUMED") then
        if(Warframe.Subsumed ~= nil) then
            return "[["..Warframe.Subsumed.."]]"
        end
    elseif(ValName == "SUBSUMEDTT") then --the tooltip of subsumed ability
        if(Warframe.Subsumed ~= nil) then
            return Ability._tooltipText(Warframe.Subsumed)
        end
    end
end

function p.getValue(frame)
    local FrameName = frame.args[1]
    local ValName = frame.args[2]
    if(FrameName == nil) then
        return ""
    elseif(ValName == nil) then
        return "ERROR: No value selected"
    end
 
    local theFrame = p.getWarframe(FrameName)
    if(theFrame == nil) then
        return ""
    end
 
    local vName = ValName
    local useDefault = Shared.contains(UseDefaultList, string.upper(ValName))
 
    return getValue(theFrame, vName, useDefault, true)
end

--The Conclave variant
function p.getConclaveValue(frame)
    local FrameName = frame.args[1]
    local ValName = frame.args[2]
    if(FrameName == nil) then
        return ""
    elseif(ValName == nil) then
        return "ERROR: No value selected"
    end
 
    local theFrame = p.getConclaveWarframe(FrameName)
    if(theFrame == nil) then
        return ""
    end
 
    local vName = ValName
    local useDefault = Shared.contains(UseDefaultList, string.upper(ValName))
 
    return getValue(theFrame, vName, useDefault, true)
end

local function getWarframeComparisonRow(wframe, useRank30)
    if(useRank30 == nil) then useRank30 = false end
    local addOn = ""
    if(useRank30) then addOn = "Rank30" end
    local styleString = ""--"border: 1px solid lightgray;"
    local td = '|| style = "'..styleString..'" |'
    local result = ''
    result = '\n|-\n| style = "'..styleString..'"|[['..wframe.Name.."]]"
    result = result..td..getValue(wframe, "Health"..addOn, false, true)
    result = result..td..getValue(wframe, "Shield"..addOn, false, true)
    result = result..td..getValue(wframe, "Energy"..addOn, false, true)
    result = result..td..getValue(wframe, "Armor"..addOn, false, true)
    result = result..td..getValue(wframe, "Sprint", false, true)
    return result
end

local function getWarframeComparisonTable(Warframes, useRank30)
    local styleString = "border: 1px solid black;border-collapse: collapse;"--"background-color:transparent;color:black;border: 1px solid black;border-collapse: collapse;"
    local tHeader = ""
    tHeader = tHeader..'\n{| cellpadding="1" cellspacing="0" class="listtable sortable" style="font-size:11px;"'-- style="margin:auto;text-align:center;border:1px solid black;font-size:11px;"'
    tHeader = tHeader..'\n!style="'..styleString..'"|Name'
    tHeader = tHeader..'\n! data-sort-type="number" style="'..styleString..'"|[[Attributes#Health|Health]]'
    tHeader = tHeader..'\n! data-sort-type="number" style="'..styleString..'"|[[Attributes#Shields|Shields]]'
    tHeader = tHeader..'\n! data-sort-type="number" style="'..styleString..'"|[[Attributes#Energy|Energy]]'
    tHeader = tHeader..'\n! data-sort-type="number" style="'..styleString..'"|[[Attributes#Armor|Armor]]'
    tHeader = tHeader..'\n! data-sort-type="number" style="'..styleString..'"|[[Maneuvers#Sprinting|Sprint]]'
    local tRows = ""
    for i, wframe in Shared.skpairs(Warframes) do
        local didWork, rowStr = pcall(getWarframeComparisonRow, wframe, useRank30)
        if(didWork)then
            tRows = tRows..rowStr
        else
            mw.log("Error trying to build row for "..wframe.Name..": "..rowStr)
        end
    end
 
    return tHeader..tRows.."\n|}[[Category:Automatic Comparison Table]]"
end

function p.getWarframeComparisonTable(frame)
    return getWarframeComparisonTable(WarframeData["Warframes"])
end

function p.getWarframeRank30ComparisonTable(frame)
    return getWarframeComparisonTable(WarframeData["Warframes"], true)
end

function p.getConclaveWarframeComparisonTable(frame)
    return getWarframeComparisonTable(ConclaveData["Warframes"])
end

function p.getConclaveWarframeRank30ComparisonTable(frame)
    return getWarframeComparisonTable(ConclaveData["Warframes"], true)
end

function p.getArmorChart(frame)
    --replicating the array templates that used to be on page "Armor/Chart". This will replace those
    --first the table's top rows
    local chart = {'{| border="1" cellpadding="3" width="100%" style="line-height: 90%; font-size:90%; border-collapse:collapse; text-align:center;"'}
    table.insert(chart, '! width="15%" style="line-height: 100%;" | Armor !! width="15%" style="line-height: 100%;" | Damage Reduction !! width="70%" style="line-height: 100%;" | Warframe\n|-')
    
    --then a local function to figure out the background color and damage reduction
    local function bgcolor(armor)
        --calculating the damage reduction from armor, and rounding it to two decimals
        local DR = tonumber(string.format("%.2f",(100*armor/(armor+300))))
        local color = 'E4BAD2'
        if DR > 90 then color = 'F26C4F'
        elseif DR > 80 then color = 'FF8878'
        elseif DR > 70 then color = 'F9AD81'
        elseif DR > 60 then color = 'FFC7A3'
        elseif DR > 50 then color = 'FFFFB3'
        elseif DR > 40 then color = 'D0F7BD'
        elseif DR > 30 then color = '98E5DA'
        elseif DR > 20 then color = '9ECFF6'
        elseif DR > 10 then color = 'C4ADCF'
        end
        --returning the background color's hexacode and DR
        return color, DR
    end
    
    --the table for collecting warframes under the armor values
    local armorTable ={}
    --next looping through the Warframes for that armor
    for i, warframe in Shared.skpairs(WarframeData["Warframes"]) do
        --if armor value exists, and rank 30 armor value doesn't
        if warframe.Armor ~= nil then
            --creating a table for armor value if doesn't exist
            if armorTable[warframe.Armor] == nil then
                armorTable[warframe.Armor] = {}
            end
            --checking if has rank 30 value. If yes, insert the "name (unranked)" link to unranked value's table. Else the regular link
            if warframe.ArmorRank30 ~= nil then
                table.insert(armorTable[warframe.Armor], '[['..warframe.Name..'|'..warframe.Name..' (Unranked)]]')
            else
                table.insert(armorTable[warframe.Armor], '[['..warframe.Name..']]')
            end
            --a second check whether the Warframe has rank 30 specific armor value, such as Nidus. If so, add the value again but this time "name (max rank)" to rank 30 value's table
            if warframe.ArmorRank30 ~= nil then
                --checking if the table for armor value exists, if not, create
                if armorTable[warframe.ArmorRank30] == nil then
                    armorTable[warframe.ArmorRank30] = {}
                end
                --inserting the value
                table.insert(armorTable[warframe.ArmorRank30], '[['..warframe.Name..'|'..warframe.Name..' (Max Rank)]]')
            end
        end
    end
    
    local armorRows ={}
    --looping through the armorTable with skpairs with the second argument as true, making its sorting reversed
    for armor, aTable in Shared.skpairs(armorTable,true)do
        --getting background color and damage reduction values based on the armor
        local color, dr = bgcolor(armor)
        local bgColor = 'style="background-color:#'..color..'"'
        --looping through the names of Warframe's with this armor value and inserting to tempList as links
        local tempList ={}
        for n, wfLink in pairs(aTable) do
            table.insert(tempList,wfLink)
        end
        --inserting the table's columns to armowRows, including list of Warframe links with "table.concat"
        table.insert(armorRows,'|'..bgColor..'|'..armor..'||'..bgColor..'|'..dr..'%||'..bgColor..'|'..table.concat(tempList,', '))
    end
    --filling the rows to the chart
    table.insert(chart, table.concat(armorRows,'\n|-\n'))
    --finishing the table by closing it
    table.insert(chart,'|}')

    return table.concat(chart, '\n')
end

function p.getTunaTestTable(frame)
    local iconSize = frame.args ~= nil and frame.args[1] or 64
    
    local result = '{| class="emodtable"'
    result = result..'\n|-'
    result = result..'\n! Warframe'
    result = result..'\n! x'..iconSize
    result = result..'\n! Resized Defaults'
    for i, wframe in Shared.skpairs(WarframeData["Warframes"]) do
        result = result..'\n|-'
        result = result..'\n| '..wframe.Name..' || [[File:'..string.gsub(wframe.Name, ' ', '')..'Icon'..iconSize..'.png|link=File:'..string.gsub(wframe.Name, ' ', '')..'Icon'..iconSize..'.png]]'
        if(wframe.Image ~= nil) then
            result = result..' || [[File:'..wframe.Image..'|'..iconSize..'x'..iconSize..'px|link=File:'..wframe.Image..']]'
        else
            result = result..' || <span style="color:red">No Default Image Found</span>' 
        end
    end
    result = result..'\n|}'
    return result
end
 
function p.getWarframeCount(frame)
    local count = 0
    for i, val in Shared.skpairs(WarframeData["Warframes"]) do
        if(not Shared.contains(WarframeData["IgnoreInCount"], i)) then
            count = count + 1
        end
    end
    return count
end

function p.getMasteryShortList(frame)
    local MasteryRank = tonumber(frame.args[1])
 
    local frameArray = p.getWarframes(function(x) 
                                    if(x.Mastery ~= nil) then
                                        return x.Mastery == MasteryRank
                                    else
                                        return MasteryRank == 0
                                    end
                                end)
 
    local result = ""
    local shortList = p.shortLinkList(frameArray, true)
    for i, pair in Shared.skpairs(shortList) do
        if(string.len(result) > 0) then result = result.." • " end
        result = result..pair
    end
    return result
end

function p.getConclaveList(frame)
    local frameArray = p.getWarframes(function(x) 
                                    if(x.Conclave ~= nil) then
                                        return x.Conclave
                                    else
                                        return false
                                    end
                                end)
 
    local result = ""
    local shortList = p.shortLinkList(frameArray, false)
    for i, pair in Shared.skpairs(shortList) do
        result = result..'\n* '..pair
    end
    return result
end

function p.getReleaseDateRow(warframe,prime)
    local result = '\n|-'
    result = result..'\n| [['..warframe.Name..']] || '..getValue(warframe, 'SEX')..' || '..getValue(warframe, 'RELEASEDATE')..' || '
    
    local ver, num = getValue(warframe, 'INTRODUCED')
    if(ver ~= nil) then
        result = result..'data-sort-value="'..getValue(warframe, "VERNUM")..'" | '..ver
    end
    
    if(prime) then
        result = result..' || '..getValue(warframe, "VAULTED", true, true)    
    end
    
    return result
end

function p.getReleaseDateTable(frame)
    local category = frame.args ~= nil and frame.args[1] or frame
    if(category ~= nil) then category = string.upper(category) end
    
    local prime=false
    
    local warframes = {}
    if(category == nil or category == "" or category == "ALL") then
        warframes = p.getWarframes(function(wf) return true end)
    elseif(category == "ORIGINAL") then
        warframes = p.getWarframes(function(wf) return not p.isPrime(wf) end)
    elseif(category == "PRIME") then
        warframes = p.getWarframes(function(wf) return p.isPrime(wf) end)
        prime = true
    elseif(category == "FEMALE") then
        warframes = p.getWarframes(function(wf) return wf.Sex == "Female" end)
    elseif(category == "MALE") then
        warframes = p.getWarframes(function(wf) return wf.Sex == "Male" end)
    end
    
    
    local result = '{| class="listtable sortable" style="width:100%; white-space:nowrap;" align="center"'
    result = result..'\n|-'
    result = result..'\n! data-sort-type="text" | Warframe Name<br>'
    result = result..'\n! data-sort-type="text" | Sex<br>'
    result = result..'\n! data-sort-type="date" | Release Date <small>(<i>mm-dd-yyyy</i>)</small><br>'
    result = result..'\n! data-sort-type="numeric" | Update Version<br>'
    if (prime) then result = result..'\n! data-sort-type="text" | Vaulted<br>' end
    
    for name, warframe in pairs(warframes) do
        result = result..p.getReleaseDateRow(warframe,prime)
    end
    
    result = result..'\n|}'
    return result
end

function p._tooltipText(wfName, wfDisplay, noIcon, conclave)
    local dConclave = '' --"data for conclave". If there's no data for it, don't link to conclave namespace
    local conclaveParam = '' --conclave
    local linkText = ''
    local namespace = ''
    
    local warframe = checkWarframe(nil, wfName, conclave)
    if warframe == nil and conclave == true then
        warframe = checkWarframe(warframe, wfName)
        dConclave = false
    end
    
    if warframe ~= nil then
        local link = p.getLink(wfName, warframe)
        
        if conclave == true then
            conclaveParam = ' data-param2="true"'
            if warframe.Conclave == true then
                namespace = 'Conclave:'
            end
            if dConclave == false then
                namespace = ''
            end
        end
        
        if link then
            linkText = '[['..namespace..link..'|'
        else
            linkText = '[['..namespace..wfName..'|'
        end
        
        if wfDisplay == nil or wfDisplay == "" then
            linkText = linkText..wfName..']]'
        else
            linkText = linkText..wfDisplay..']]'
        end
        
        if link ~= false then
            if not noIcon then 
                local image = warframe.Portrait
            
                if image == nil and conclave then --if no image found (not in conclave data), and conclave link -> try getting it from the regular data
                    local tempWF = checkWarframe(nil, wfName)
                    image = tempWF.Portrait
                end
                if image == nil then --yet another check for the image. Showing a default icon for legit warframes without a portrait icon.
                    image = 'Warframe Icon.png'
                end
            
                return '<span class="warframe-tooltip" data-param="'..wfName..'"'..conclaveParam..' style="white-space:pre">'..'[[File:'..image..'|x19px|link='..namespace..link..']] '..linkText..'</span>'
            else
                return '<span class="warframe-tooltip" data-param="'..wfName..'"'..conclaveParam..' style="white-space:pre">'..linkText..'</span>'
            end
        else
            return '<span style="color:red;">{{[[Template:WF|WF]]}}</span> "['..'['..wfName..']]" not found['..'[Category:Warframe Tooltip error]]'
        end
    else
        return '<span style="color:red;">{{[[Template:WF|WF]]}}</span> "['..'['..wfName..']]" not found['..'[Category:Warframe Tooltip error]]'
    end
end

function p.tooltipText(frame)
    local wfName = frame.args ~= nil and frame.args[1] or nil
    local wfDisplay = frame.args ~= nil and frame.args[2] or nil
    local noIcon = frame.args["noIcon"] == "true" and true
    local conclave = frame.args["Conclave"] == "true" and true
    
    return p._tooltipText(wfName, wfDisplay, noIcon, conclave)
end

function p.tooltip(frame)
    local wfName = frame.args ~= nil and frame.args[1]
    local conclave = frame.args[2] == "true" and true
    
    if wfName == nil then
        return nil
    end
    
    local warframe = nil
    local cAvailability = false
    if conclave then
        warframe = p.getConclaveWarframe(wfName)
        if warframe ~= nil then
            cAvailability = warframe.Conclave
        end
        if not cAvailability then
            warframe = p.getWarframe(wfName)
        end
    else
        warframe = p.getWarframe(wfName)
    end
    
    local conclaveNotice = ''
    if conclave and cAvailability == false then
        conclaveNotice = '\n{| class="Data" style="font-size:10px; white-space:normal;"\n|-\n|Note: Not available in Conclave, displaying Cooperative stats and Cooperative Link.\n|}'
    end
    
    if warframe == nil then
        return 'No warframe '..wfName..' found.'
    end
    
    local function Value(valueName, giveDefault, asString)
        if(giveDefault == nil) then giveDefault = true end
        if(asString == nil) then asString = false end
        return getValue(warframe, valueName, giveDefault, asString)
    end
    
    local function whitePols(valueName)
        local pols = Value(valueName)
        local polIcon = ''
        
        if type(pols) == "table" then
            local i = 0
            if pols[1] == nil then
                polIcon = 'None'
                return polIcon
            else
                while pols[i+1] ~= nil do
                    i = i + 1
                end
                for j = 1, i do
                    polIcon = polIcon..Icon._Pol(pols[j],'white','x16')
                end
                return polIcon
            end
        elseif pols ~= nil and type(pols) == "string" and pols ~= "None" then
            return Icon._Pol(pols,'white','x16')
        end
        return 'None'
    end
    
    local mRankIcon = ''
    local mRank = Value("Mastery")
    local mRankIconLoc = 'top:4px; left:9.5px;'
    if mRank then
        if string.len(mRank) >= 2 then
            mRankIconLoc = 'top:4px; left:5px;'
        end
        mRankIcon = '<div style="position:absolute;top:6px; left:4px; color:white; font-size:16px; font-weight:bold; text-shadow: 0 0 1px #0D1B1C, 0 0 4px #0D1B1C, 1px 1px 2px #0D1B1C, -1px 1px 2px #0D1B1C, 1px -1px 2px #0D1B1C, -1px -1px 2px #0D1B1C;">[[File:MasteryAffinity64.png|28px]]<div style="position:absolute;'..mRankIconLoc..'">'..mRank..'</div></div>'
    end
    
    local function infoHeader(infoName)
        local spanStart = '<span class=\"LinkText\">'
        local spanEnd = '</span>'
        return spanStart..infoName..spanEnd
    end
    
    local space = '&nbsp;'
    local zeroPadding = '\n| style=\"padding:0px;\" |'
    local newRow = '\n|-'
    local spacer = '\n| class=\"Spacer\" |'
    local halfTable = '\n| class=\"TableHalf\" |'
    local dataText = '\n{| class=\"Data\" style=\"font-size:12px;\"'
    local dataTextCenter = '\n{| class=\"Data\" style=\"font-size:12px; text-align:center;\"'
    local tableEnd = '\n|}'
    
    local portrait = warframe.Portrait
    if portrait == nil and conclave == true then
        local tempWF = p.getWarframe(wfName)
        portrait = tempWF.Portrait
    end
    if portrait == nil then
        portrait = 'Warframe Icon.png'
    end
    local image = '\n| class=\"Image\" style=\"height:120px; padding-bottom:0;\" | [[File:'..portrait..'|120px]]'
    
    --creating the table
    local result = '{| class="Tooltip"\n|-\n|style="padding:0;"|\n<div style="position:relative;">\n{| class=\"Sub\"'..newRow..image..mRankIcon..newRow..spacer..newRow..zeroPadding
    result = result..dataText..newRow
    result = result..halfTable..infoHeader("Health")..space..Value("HealthPlusMinimal",true,true)..halfTable..infoHeader("Armor")..space..Value("ArmorPlusMinimal",true,true)
    result = result..newRow..halfTable..infoHeader("Shield")..space..Value("ShieldPlusMinimal",true,true)..halfTable..infoHeader("Energy")..space..Value("EnergyPlusMinimal",true,true)
    result = result..newRow..'\n| style=\"text-align:center;\" colspan=2 |'..infoHeader("Polarities")..space..whitePols("AuraPolarity")..' | '..whitePols("ExilusPolarity")..' | '..whitePols("Polarities")..tableEnd
    result = result..newRow..spacer..newRow..zeroPadding
    result = result..dataText..newRow
    result = result..'\n| class="Data" style="padding:4px; text-align:left;"|'..Ability.getAbilityIconsList(wfName)
    result = result..tableEnd..conclaveNotice..tableEnd..'\n</div>\n|}'
    
    return result
end

function p.getWarframeReplaceList(frame)
    --local Type = frame.args ~= nil and frame.args[1] or frame
    local fullList = {}

    local function addToList(name)
        --local 6s = '      '
        --local 8s = '        '
        local temp = '      <Replacement>\n        <Find>&#91;&#91;'..name..']]</Find>\n        <Replace>{{WF|'..name..'}}</Replace>\n        <Comment />\n        <IsRegex>false</IsRegex>\n        <Enabled>true</Enabled>\n         <Minor>false</Minor>\n        <BeforeOrAfter>false</BeforeOrAfter>\n        <RegularExpressionOptions>IgnoreCase</RegularExpressionOptions>\n      </Replacement>'
        return table.insert(fullList,temp)
    end

    for i, val in Shared.skpairs(WarframeData["Warframes"]) do
        addToList(val.Name)
    end

    return table.concat(fullList, "\n")
end

function p.getSprintList(frame)
    local sprintTable ={'{| class="emodtable" style="border:1px solid black; width:100%; border-collapse:collapse; text-align:center;"\n|-\n! style="white-space:nowrap; width:20%;"|Sprint Speed\n!Warframes'} --beginning of the result
    local tempTable ={} -- for storing the sorted data
    
    for warframe, wfData in Shared.skpairs(WarframeData["Warframes"]) do --going through the Warframes in order with Shared.skpairs
        local speedTemp = wfData["Sprint"] --this just to make it more readable..
        if speedTemp and tempTable[speedTemp] == nil then --if sprint speed exists and a table for one this doesn't
            tempTable[speedTemp] = {} --create a table for this speed
            table.insert(tempTable[speedTemp], wfData["Name"]) --insert the warframe to this speed
        elseif speedTemp then
            table.insert(tempTable[speedTemp], wfData["Name"])
        end
    end

    for speed,speedData in Shared.skpairs(tempTable, true) do --going through the sorted data in order
        table.insert(sprintTable, '\n|-\n|'..speed..'\n|') --inserting the speed as the "header"
        for nn,fName in pairs(speedData) do
            table.insert(sprintTable,p._tooltipText(fName)) --inserting the Warframe's tooltip
            if (nn < #speedData) then --if table position is less than table's lenght, insert comma
                table.insert(sprintTable,', ')
            end
        end
    end
    table.insert(sprintTable,'\n|}') --ending the table
    return table.concat(sprintTable)
end

return p