--Used for constructing tooltips for t:Icon's damage type icons

local p ={}

local DamageData = mw.loadData([[Module:DamageTypes/data]])
local Icon = require([[Module:Icon]])
local Shared = require([[Module:Shared]])

function p.tooltip(frame)
    local dType = DamageData["Types"][frame.args[1]]
    if dType == nil then return nil end

    local dName = frame.args[1] --since it has been established that the damage type exists, the first argument can be set as the name
    local pText = '' --text for positive damage types
    local nText = '' --text for negative damage types
    local cTypes = '' --"combo" damage types
    local bTypes = '' --bypass types
    local bNoteNumber = '' --bypass note number
    local bNotes = '' --bypass notes
    local bNAText = ' <span style=\"color:grey;\">N/A</span>' --grey "N/A" text for bypasses
    local sText = '' --status text
    local sNoteNumber = '' --status note number
    local sNoteText = '' --status notes
    --thank IE/Edge for this overly complex method of setting colors for border/background.. those scrubs don't understand alpha in hexcolors. Of course one could change to rgb/rgba but...... only ancient browsers benefit from that.
    local colorBorder = '#313234'
    local colorBorderT = 'cc' --transparency suffix
    local colorBackground = '#cccccc'
    local colorBackgroundT = 'e6' --transparency suffix
    local bgText = 'background-color:'
    
    
    if dType.ColorBorder then colorBorder = dType.ColorBorder end
    
    if dType.ColorBackground then colorBackground = dType.ColorBackground end
    
    --span locals
    local pSpan = '<span style=\"color:green;\">' --for positives (+)
    local nSpan = '<span style=\"color:red;\">' -- for negatives (-)
    local endSpan = '</span>' -- ought to be self-explanatory
    local supStart = '<div style=\"position:relative; display:inline-block; width:7px;\"><div style=\"position:absolute; font-size:10px;bottom: 0px;left: 0px;\">' --for note number superscript
    local supEnd = '</div></div>' --ending the previous one
    
    --table locals
    local newRow = '\n|-'
    local spacer = '\n| class=\"Spacer\" style=\"'..bgText..colorBorder..'; '..bgText..colorBorder..colorBorderT..'\"|'
    local dataRowStart = '\n| class=\"Data\" style=\"'..bgText..colorBackground..'; '..bgText..colorBackground..colorBackgroundT..';'
    local typeRow = dataRowStart..' font-size:16px; line-height:11px;\"|'
    local dataRow = dataRowStart..'\"|'
    local statusRow = dataRowStart..' font-size:12px; line-height:15px;\"|'
    local noteRow = dataRowStart..' font-size:10px; line-height:12px; padding:0; white-space:inherit;\"|'
    
    local result = '{| class=\"Damage Sub\" style=\"border:3px solid '..colorBorder..'; border:3px solid '..colorBorder..colorBorderT..';\"'..newRow
    
    
    
    if dType.Types then --if a combined element, add icons for the two elements
        cTypes = Icon._Proc(dType.Types[1],'text')..' + '..Icon._Proc(dType.Types[2],'text')
        result = result..typeRow..Icon._Proc(dName,'text')..newRow..typeRow..cTypes..newRow..spacer..newRow
    else
        result = result..typeRow..Icon._Proc(dName,'text')..newRow..spacer..newRow --only adding an icon for the damage type itself if not a combined element
    end
    if dType.Positives then --if deals increased damage to health types, show those
        local pLenght = Shared.tableCount(dType.Positives)
        local pCount = 0
        for key, pValue in pairs(dType.Positives) do
            pCount = pCount + 1
            pText = pText..pValue[1]..pSpan..' +'..pValue[2]..'%'..endSpan
            if pLenght > pCount then
                pText = pText..'<br>'
            end
        end
        result = result..dataRow..pText..newRow..spacer..newRow
    end
    if dType.Negatives then --if deals reduced damage to health types, show those
        local nLenght = Shared.tableCount(dType.Negatives)
        local nCount = 0
        for key, nValue in pairs(dType.Negatives) do
            nCount = nCount + 1
            nText = nText..nValue[1]..nSpan..' -'..nValue[2]..'%'..endSpan
            if nLenght > nCount then
                nText = nText..'<br>'
            end
        end
        result = result..dataRow..nText..newRow..spacer..newRow
    end
    if dType.Bypass then --if bypasses some protections, show them
        if dType.BypassNotes then
            for k, bNote in pairs(dType.BypassNotes) do
                bNoteNumber = bNoteNumber..k
                bNotes = bNotes..supStart..k..supEnd..(DamageData["Notes"][bNote])
            end
        end
        local bLenght = Shared.tableCount(dType.Bypass)
        for j, bName in pairs(dType.Bypass) do
            bTypes = bTypes..bName..bNAText..supStart..bNoteNumber..supEnd
            if bLenght > j then
                bTypes = bTypes..'<br>'
            end
        end
        result = result..dataRow..bTypes..newRow..spacer..newRow
    end
    if dType.Status then --show status effects
        local sLenght = Shared.tableCount(dType.Status)
        for f, sName in pairs(dType.Status) do
            sText = sText..sName
            if sLenght > f then
                sText = sText..'<br>'
            end
        end
        if dType.StatusNotes then
            for i, sNote in pairs(dType.StatusNotes) do
                sNoteNumber = sNoteNumber..i..' '
                sNoteText = sNoteText..supStart..i..supEnd..(DamageData["Notes"][sNote])..' '
            end
            sNoteNumber = supStart..sNoteNumber..supEnd
        end
        result = result..statusRow..sText..sNoteNumber
    end
    
    if bNotes ~= '' then --lastly, show either bypass or status notes. No damage type has both at the moment
        result = result..newRow..noteRow..bNotes
    elseif sNoteText ~= '' then
        result = result..newRow..noteRow..sNoteText
    end
    result = result..'\n|}'
    
    return result
end

function p.damagetable(frame)
    local dt = Shared.titleCase(frame.args and (frame.args[1] or frame.args) or frame)
    local dtb = DamageData["Types"][dt]
    local dtt = DamageData["total"][dt]
    local pc = Icon._Proc(dt,'text')
    body = {'{| style="width:100%; text-align:center; margin: 1em auto 1em auto; font-family:\'Roboto\'; "',insert=table.insert}
    for i,v in ipairs(DamageData["dictionary"]["FactionOrder"]) do
        body:insert(table.concat{
            '\n! style="background-color: ',
            DamageData["dictionary"]["Factions"][v][2][1],--header color
            ';" | ', 
            Icon.Faction{args={v,'text'}},
            ' Health',
            '\n! style="background-color: ',
            DamageData["dictionary"]["Factions"][v][2][1],
            ';" | ',
            pc,
            ' Modifier',
        })
    end--faction headers
    
    local count = 0
    for _,v in ipairs(DamageData["dictionary"]["Types"]) do --
        count=count%3+1
        if count==1 then body:insert '\n|-' end
        local val = dtt[v[1]]
        style = '\n| style="background-color: '..(DamageData["dictionary"]["Factions"][v[2]][2][2]..';" | ')
        body:insert(table.concat{style, '[[Damage/',v[1],'|',v[1],']]'})
        body:insert(style)
        if val then body:insert(table.concat{
            '<span style="color:', 
            val>0 and 'green;">+' or val<0 and 'red;">' or 'gray;" title="Bypasses">', 
            val==0 and 'N/A' or val, 
            val==0 and '' or '%', 
            '</span>'
        }) end
    end
    body:insert '\n|}'
    return table.concat(body)
end
function p.healthtable(frame)
    local ht = Shared.titleCase(frame.args and (frame.args[1] or frame.args) or frame)
    local htb = DamageData["Health"][ht]
    local htt = DamageData["total"][ht]
    local body = {'{| align="right" style="width:33.333%; text-align:center; font-family:\'Roboto\'; "\n! ! border="1" colspan="2" style="border-style: solid; border-color: #000000; background-color: #000000; " | [[Damage/', ht,'|<span style = "color: #FFFFFF; ">', ht,'</span>]]',insert=table.insert}
    for _,v in ipairs(DamageData["dictionary"]["Health"]) do --
        local val = htt[v[1]]
        body:insert(table.concat{
        '\n|-',
        '\n| style="background-color: hsl(', (htb.Color), ', ', v[2],'%);" | ', 
        Icon._Proc(v[1],'text'),
        '\n| style="background-color: hsl(', (htb.Color), ', ', v[2],'%);" | ', })
        if val then body:insert(table.concat{'<span style="color:', val>0 and 'green;">+' or val<0 and 'red;">' or 'gray;" title="Bypasses">', val==0 and 'N / A' or val, val==0 and '' or '%', '</span>'}) end
    end
    body:insert '\n|}'
    return table.concat(body)
end
function p.tabbertable(frame)
    local faction = Shared.titleCase(frame.args and (frame.args[1] or frame.args) or frame or 'All')
    return [=[{| class="wikitable" style="width:100%;text-align:center;"
! colspan="3" style="width:10px;" | Damage Type
![[Damage/Flesh|Flesh]]
![[Damage/Cloned Flesh|Cloned]]
![[Damage/Fossilized|Fossil]]
![[Damage/Infested|Infested]]
![[Damage/Infested Flesh|{{nowrap|I. Flesh}}]]
![[Damage/Infested Sinew|Sinew]]
![[Damage/Machinery|Machine]]
![[Damage/Robotic|Robotic]]
![[Damage/Object|Object]]
![[Damage/Shield|Shield]]
![[Damage/Proto Shield|Proto]]
![[Damage/Ferrite Armor|Ferrite]]
![[Damage/Alloy Armor|Alloy]]
!Status
|-
| rowspan="3" style="border-bottom: 4px solid #777777;" |<div class="text_rotate-270">Physical<br />Damage</div>
| colspan="2" | {{Icon|Proc|Impact|text}}
| {{text|red|-25%}}
| {{text|red|-25%}}
|
|
|
|
| {{text|green|+25%}}
|
|
| {{text|green|+50%}}
| {{text|green|+15%}}
|
|
| <sup>1)2)</sup>Stagger
|-
| colspan="2" | {{Icon|Proc|Puncture|text}}
|
|
|
|
|
| {{text|green|+25%}}
|
| {{text|green|+25%}}
|
| {{text|red|-20%}}
| {{text|red|-50%}}
| {{text|green|+50%}}
| {{text|green|+15%}}
| –Damage
|- style="border-bottom: 4px solid #777777;"
| colspan="2" | {{Icon|Proc|Slash|text}}
| {{text|green|+25%}}
| {{text|green|+25%}}
| {{text|green|+15%}}
| {{text|green|+25%}}
| {{text|green|+50%}}
|
|
| {{text|red|-25%}}
|
|
|
| {{text|red|-15%}}
| {{text|red|-50%}}
| Bleed
|-
| rowspan="4" style="border-bottom: 4px solid #777777;"|<div class="text_rotate-270">Elemental<br />Damage</div>
| colspan="2" | {{Icon|Proc|Cold|text}}
|
|
| {{text|red|-25%}}
|
| {{text|red|-50%}}
| {{text|green|+25%}}
|
|
|
| {{text|green|+50%}}
|
|
| {{text|green|+25%}}
| Slowdown
|-
| colspan="2" | {{Icon|Proc|Electricity|text}}
|
|
|
|
|
|
| {{text|green|+50%}}
| {{text|green|+50%}}
|
|
|
|
| {{text|red|-50%}}
| Tesla Chain<br /><sup>1)2)</sup>Stun
|-
| colspan="2" | {{Icon|Proc|Heat|text}}
|
| {{text|green|+25%}}
|
| {{text|green|+25%}}
| {{text|green|+50%}}
|
|
|
|
|
| {{text|red|-50%}}
|
|
| Burn DoT<br /><sup>1)2)3)</sup>Panic
|- style="border-bottom: 4px solid #777777;"
| colspan="2" | {{Icon|Proc|Toxin|text}}
| {{text|green|+50%}}
|
| {{text|red|-50%}}
|
|
|
| {{text|red|-25%}}
| {{text|red|-25%}}
|
| <sup>4)</sup>{{text|grey|N/A}}
| <sup>4)</sup>{{text|grey|N/A}}
| 
|
| Poison DoT
|-
| rowspan="6" style="border-bottom: 4px solid #777777;"|<div class="text_rotate-270">Combined<br />Elements</div>
| {{Icon|Proc|Blast|text}}
| {{Icon|Proc|Heat|text}}<br />
{{Icon|Proc|Cold|text}}
|
|
| {{text|green|+50%}}
|
|
| {{text|red|-50%}}
| {{text|green|+75%}}
|
|
|
|
| {{text|red|-25%}}
|
| <sup>1)2)</sup>–Accuracy
|-
| {{nowrap|{{Icon|Proc|Corrosive|text}}}}
| {{nowrap|{{Icon|Proc|Electric|text}}}}<br />
{{Icon|Proc|Toxin|text}}
|
|
| {{text|green|+75%}}
|
|
|
|
|
|
|
| {{text|red|-50%}}
| {{text|green|+75%}}
|
| –Armor
|-
| {{Icon|Proc|Gas|text}}
| {{Icon|Proc|Heat|text}}<br />
{{Icon|Proc|Toxin|text}}
| {{text|red|-25%}}
| {{text|red|-50%}}
|
| {{text|green|+75%}}
| {{text|green|+50%}}
|
|
|
|
|
|
|
|
| Gas Cloud
|-
| {{nowrap|{{Icon|Proc|Magnetic|text}}}}
| {{Icon|Proc|Cold|text}}<br />
{{nowrap|{{Icon|Proc|Electric|text}}}}
|
|
|
|
|
|
|
|
|
| {{text|green|+75%}}
| {{text|green|+75%}}
|
| {{text|red|-50%}}
| Amplified damage to shields<br />Stops shield regen
|-
| {{nowrap|{{Icon|Proc|Radiation|text}}}}
| {{Icon|Proc|Heat|text}}<br />
{{nowrap|{{Icon|Proc|Electric|text}}}}
|
|
| {{text|red|-75%}}
| {{text|red|-50%}}
|
| {{text|green|+50%}}
|
| {{text|green|+25%}}
|
| {{text|red|-25%}}
|
|
| {{text|green|+75%}}
| <sup>1)</sup>Friendly Fire<br />More damage to allies
|- style="border-bottom: 4px solid #777777;"
| {{Icon|Proc|Viral|text}}
| {{Icon|Proc|Cold|text}}<br />
{{Icon|Proc|Toxin|text}}
| {{text|green|+50%}}
| {{text|green|+75%}}
|
| {{text|red|-50%}}
|
|
| {{text|red|-25%}}
|
|
|
|
|
|
| Amplified damage to health
|-
| rowspan="2" |<div class="text_rotate-270">Unique Types</div>
| colspan="2" | {{Icon|Proc|True|text}}
|
|
|
|
|
|
|
|
|
|
|
|<sup>4)</sup>{{text|grey|N/A}}
|<sup>4)</sup>{{text|grey|N/A}}
| -
|-
| colspan="2" | {{Icon|Proc|Void|text}}
|
|
|
|
|
|
|
|
|
|
|
|
|
| Bullet Attract
|}

</div>

*'''Flesh: '''Possessed by all [[Corpus]] humanoids, including humanoid [[Corpus]] bosses, [[Warframe]]s, [[Specter (Tenno)]], [[Specter (Enemy)]] and [[Stalker]]. It is most damaged by the [[Infested]] faction.
*'''Cloned Flesh: '''Possessed by all humanoid [[Grineer]] and [[Corrupted]] of Grineer origin, including [[Corrupted Vor]], all [[Grineer#Archwing|Grineer Archwing]] enemies and [[Locust Drone]].
*'''Infested Flesh:''' Possessed by [[Undying Flyer]]s, [[Volatile Runner]]s, [[Mutalist Osprey]], and [[Crawler]]-type enemies.
*'''Infested:''' Possessed by [[Juggernaut]]s, [[Charger]]s, [[Runner]]s, [[Leaping Thrasher]]s, [[Leaper]]s, and [[Deimos Therid]]s.
*'''Infested Sinew:''' An Infested armor class possessed by the [[Hemocyte]], most [[Deimos]] Infested enemies, and some Zealot enemies such as the [[Zealot Herald]].
*'''Fossilized:''' Possessed by [[Ancient Disruptor]]s, [[Ancient Healer]]s, [[Toxic Ancient]]s, [[Swarm-Mutalist MOA]]s, [[Tar-Mutalist MOA]]s, [[Boiler]]s, [[Brood Mother]]s, [[Phorid]], [[Lephantis]], and [[Jordas Golem]].
*'''Object: '''Possessed by [[Arc Trap]], [[Explosive Barrel]], [[Fan]], [[Grate]], [[Heat Generator]], [[Infested Tumor]], [[Mining Machine]], [[Sensor Bar]] and [[Storage Containers]].
*'''Alloy Armor: '''Possessed by [[Elite Lancer]]s, [[Eviscerator]]s, [[Bombard]]s, [[Napalm]]s, Grineer bosses, [[Corrupted Vor]], [[Corrupted Lancer]]s, [[Robotic]] [[Corpus]] bosses, [[Warframe]]s and [[Stalker]]. It is most damaged by the [[Corpus]] faction.
*'''Ferrite Armor: '''Possessed by [[Lancer]]s, [[Trooper]]s, [[Seeker]]s, [[Heavy Gunner]]s, [[Commander]]s, all Grineer Archwing enemies, [[Corvette]], [[Frigate]], [[Carrier (Enemy)]], [[Gox]], Locust Drone, all Grineer melee units, [[Corrupted Heavy Gunner]]s, humanoid Corpus bosses, [[Specter (Tenno)]], [[Specter (Enemy)]] and {{WF|Rhino}}'s {{A|Iron Skin}}.
*'''Shield:''' Possessed by all regular Corpus units (except Locust Drone), [[Regulator]]s, [[Grineer]] bosses, [[Orokin Drone]]s, [[Corrupted Crewman]], [[Corrupted Vor]], [[Warframe]]s, [[Specter (Tenno)]], [[Specter (Enemy)]]. It is most damaged by the [[Grineer]] faction.
*'''Proto Shield:''' Possessed by all Corpus bosses, including [[Zanuka]] and [[Zanuka Hunter]], [[Corpus Tech]]s ,[[Nullifier Crewman]], [[Corrupted Nullifier]] and [[Stalker]].
*'''Machinery: '''Possessed by [[Roller]]s, [[Regulator]]s and [[Latcher]]s.
*'''Robotic: '''Possessed by all [[Corpus]] proxies (except Locust Drone), including proxy bosses like [[Ambulas]] and [[Zanuka]].

<sup>1) Does not affect [[Boss]]es. | 2) Does not affect [[Roller]]s, [[Regulator]]s, [[Latcher]]s or [[Osprey]]. | 3) Does not affect [[MOA]]s. | 4) The damage associated bypasses these secondary protections.</sup>
]=]
end
    
return p

--=p.healthtable 'Flesh'