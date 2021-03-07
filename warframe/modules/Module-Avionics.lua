local AvionicData = mw.loadData( [[Module:Avionics/data]] )
local Shared = (function()local s=require([[Module:Shared]])return{skpairs=s.skpairs,titleCase=s.titleCase}end)()-- alphabetical iterator, Title Case
--local Icon = require( [[Module:Icon]] )
--local Version = require( [[Module:Version]] )

local function getAvionic(name)
    local data = AvionicData.Avionics
    
    local _av = data[name] or data[Shared.titleCase(name)]
    if _av ~= nil then return _av end
    
    for avionicName, Avionic in pairs(data) do
        if Avionic.Link == name then return Avionic end
    end--if page address is named
end

--local function Introduction(Update) return Version.getVersionLink({args={Update}}) end

p = {

Value = function(frame)
    local AvionicName, ValName = frame.args[1], frame.args[2]
    
    if not AvionicName then error("No avionic specified") end
    local Avionic = getAvionic(AvionicName)
    if not Avionic then error("No such avionic '"..AvionicName.."' found") end
    
    if(Avionic == nil or type(Avionic) ~= 'table') then
        error("No avionic")
    elseif(ValName == nil or ValName == '') then
        error("No value specified")
    end--nilcheck
    
    ValName = Shared.titleCase(ValName)
    return Avionic[({--dictionary:
        ['Trade Tax']='Tradetax',
        ['House Icon']='Houseicon',
        --['Description']='Desc',
        ['Update']='Intro',
        ['Introduction']='Intro',
    })[ValName] or ValName]
end,

AvionicTable = function(frame)
    local Parameter,searchParameter,imgOnly = frame.args[1],frame.args[2],frame.args[3]
    --    Var       Val             Image Only
    --Without Val, display all avionics, sorted by var
    
    if Parameter == '' then Parameter = nil end
    if searchParameter == '' then searchParameter = nil end
    if imgOnly == nil or imgOnly == '' then imgOnly = false end
    
    local buildTable = {'{| border="1" cellpadding="1" cellspacing="1" class="article-table"\n', insert=table.insert,--[[ consert=function(self,tab)self:insert(table.concat(tab))end ]]}
    local tablePart, indexes = {House={None=''}},{}
    
    -- for k, v in pairs {'|', (imgOnly and '' or '-\n!'),
    --     (searchParameter or not Parameter
    --         and (imgOnly and '' or Parameter..' !!')
    --         or table.concat {'-\n!', Parameter, ' !!', ' Avionic\n'} ),
    -- (imgOnly and ' Icon !! Name !! Description\n|-' or '' )} do buildTable:insert(v) end
    -- --header
    if not imgOnly then 
        if searchParameter or not Parameter then
            buildTable:insert('|-\n! Icon !! Name !! Description\n')
        else
            buildTable:insert('|-\n!'..Parameter..' !! Icon !! Name !! Description\n|-')
        end
    else 
        if searchParameter or not Parameter then 
            buildTable:insert('|')
        else
            buildTable:insert('|-\n!'..Parameter..' !! Avionic\n')
        end
    end--header
    
    --local isFirst = true
    for Name, Avionic in Shared.skpairs(AvionicData["Avionics"]) do
        
        local avpart
        if imgOnly then
            avpart =
            p.tooltipImage({ args = {Avionic.Name or Name,'135px'} })
        else
            avpart =
            '| ' .. p.tooltipImage({ args = {Avionic.Name or Name,'40px'} }) ..'\n'..
            '| ' .. p.tooltipText({ args={Avionic.Name or Name} }) ..'\n'..
            '| ' .. Avionic.Desc ..'\n'
        end--make part
        
        if searchParameter then
            --one param
            if Avionic[Shared.titleCase(Parameter)] == searchParameter then
                if not imgOnly then
                    buildTable:insert '|-\n'
                end
                buildTable:insert(avpart)
            end
        elseif not Parameter then
            if not imgOnly then
                buildTable:insert '|-\n'
            end
            buildTable:insert(avpart)
        else
            --multiple params
            local param = Avionic[Shared.titleCase(Parameter)]
            if param then
                if not tablePart[Parameter] then tablePart[Parameter]={} end
                if imgOnly then
                    tablePart[Parameter][param] = (tablePart[Parameter][param] or '') .. avpart .. '\n'
                else
                    tablePart[Parameter][param] = (tablePart[Parameter][param] or '') .. '|-\n' .. avpart
                end
                if not indexes[Parameter] then indexes[Parameter]={} end
                indexes[Parameter][param] = (indexes[Parameter][param] or 0) + 1
            end
        end--join part
        
        --if isFirst then isFirst = false end
    end
    if searchParameter or not Parameter then 
        if imgOnly then
            buildTable:insert '\n'
        end
    else
        for key, _part in pairs(tablePart[Parameter]) do
            if imgOnly then
                buildTable:insert('|-\n! '..
                (
                    Parameter=='House' and 
                        (
                            '[[File:'..(key=='None' and 'Avionics_dark.png' or 'House'..key)
                            --..({Sigma='HouseSigma.png', Lavan='HouseLavan.png', Vidar='HouseVidar.png', Zetki='HouseZetki.png', None='Avionics_dark.png'})[key]
                            ..'|60px|link=House '..key..']]'
                        )
                        or key
                )
                ..'\n|\n')
                buildTable:insert(_part)
            else
                buildTable:insert(table.concat{'\n|-\n! rowspan = ',(indexes[Parameter][key]+1),' |',key,'\n',_part})
            end
        end
    end
    buildTable:insert "|}"
    return table.concat(buildTable)
end,

tooltipText = function(frame)
    local Name = frame.args ~= nil and frame.args[1] or nil
    if Name == nil then
        --error('No avionic name')
        return '<span style="color:red;">{{[[Template:Avi]]}}</span> Insert an avionic name.['..'[Category:Avionic Tooltip error]]'
    end
    
    local Avionic = getAvionic(Name)
    if Avionic == nil then
        --error(Name..' not found')
        return '<span style="color:red;">{{[[Template:Avi|Avionic]]}}</span> "'..Name..'" not found['..'[Category:Avionic Tooltip error]]'
    end
    
    local newName = frame.args ~= nil and frame.args[2]
    if newName == '' then newName = nil end
    
    local Link = Avionic.Link
    local linkText = ''
    if Link == nil then
        Link = Name
    end
    
    local showIcon = ((frame.args[3] ~= '') and frame.args[3]) or nil
    
    local dataname
    if newName ~= nil then
        linkText = Link..'|'..newName
        dataname = newName
    else
        if Name == Link then
            linkText = Link
        else
            linkText = Link..'|'..Name
        end
        dataname = ''
    end--link
    
    local tAvionic ={}
    table.insert(tAvionic,'<span class="avionic-tooltip" data-param="'..Name..'" data-name="'..dataname..'">')
    --20px thumb, 200px hover
    
    if Avionic.House ~= nil then
        if showIcon == nil then
            table.insert(tAvionic,'[[File:'..Avionic.Houseicon..'|20px|link='..Avionic.Link..']]&nbsp;')
        elseif showIcon == "none" then
            --table.insert(tAvionic, '')
        elseif showIcon == "icon" then
            table.insert(tAvionic, '[[File:'..Avionic.Image..'|20px|link='..Avionic.Link..']]&nbsp;')
        else
            table.insert(tAvionic, '[[File:Avionics_dark.png|20px|link='..Avionic.Link..']]&nbsp;')
        end
    else
        table.insert(tAvionic, '[[File:Avionics_dark.png|20px|link='..Avionic.Link..']]&nbsp;')
    end
    
    table.insert(tAvionic,'[['..linkText..']]</span>')--link
    
    return table.concat(tAvionic)
end,
tooltipImage = function(frame)
    local Name = frame.args ~= nil and frame.args[1]
    if Name == nil then
        return '<span style="color:red;">{{[[Template:Avi]]}}</span> Insert an avionic name. [[Category:'..'Avionic Tooltip error]]'
    end
    local Avionic = getAvionic(Name)
    local size = frame.args[2]
    if size == nil then size = '130px' end
    
    
    if Avionic == nil then
        return '<span style="color:red;">{{[[Template:Avi|Avionic]]}}</span> "'..Name..'" not found [[Category:'..'Avionic Tooltip error]]'
    end
    
    local tAvionic ={}
    table.insert(tAvionic,'<span class="avionic-tooltip" data-param="'..Name..'" data-name="imageonly">')--hover
    
    -- if Avionic.House ~= nil then
    --         table.insert(tAvionic,'[[File:House'..Avionic['House']..'.png|20px|link='..Avionic['LINK']..']]&nbsp;')
    -- else
    --     table.insert(tAvionic, '[[File:Avionics_dark.png|20px|link='..Avionic['LINK']..']]&nbsp;')
    -- end--20px thumb
    
    table.insert(tAvionic,'[[file:'..Avionic.Image..'|'..size..'|link='..Avionic.Link..']]</span>')--text, end hover
    
    return table.concat(tAvionic)
end,

tooltip = function(frame)
    local AvionicName = frame.args ~= nil and frame.args[1] or nil
    local renamed = frame.args ~= nil and frame.args[2] or nil
    if renamed == '' then renamed = nil end
    
    local Avionic = getAvionic(AvionicName, "Name");
    if Avionic == nil then
        --error("no avionic "..AvionicName.."")
        return "Something went wrong with Module:Avionics (p.tooltip: no avionic "..AvionicName..")"
    end
    
    
    return '{| class="Tooltip"\n|-\n| style="padding:0px;"|\n{| class="Sub"\n|-\n| class="Image"| ['..'[File:'..Avionic.Image..'|180px]]\n|-\n| class="Spacer"|'--Main image
    
    ..(renamed and ('\n|-\n! class="Title"|'..AvionicName..'\n|-\n| class="Spacer"|') or '')--Name
    
    ..'\n|-\n| style="background-color: #0D1B1C; color: #eeeeee; padding: 10px; font-size:13px; line-height: 16px;"|<span style="font-weight: bold;font-size: 14px;">'
    ..(renamed == 'imageonly' and Avionic.House..' ' or '')--House
    ..Avionic.Rarity..'</span><br />'
    ..(Avionic.Description ~= "''No description''" and Avionic.Description or Avionic.Desc)
    ..'\n|}\n|-\n|}'
end,

}

return p