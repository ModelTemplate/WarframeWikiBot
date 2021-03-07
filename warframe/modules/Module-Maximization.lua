local p = {};

local Shared = require( [[Module:Shared]] );
local Data = mw.loadData( [[Module:Maximization/data]] );

local function buildJS(WF)
    --WF = WF.args and WF.args[1] or WF
    local JS = '';
    local tempJS = '';
    local u = Data[string.upper(WF)];
    if not u then error(WF..' not found') end
        
    JS = JS..'\n<span id="'..WF..'">';
        
    if u.Types ~= nil and u.Types ~= '' then
        tempJS = tempJS..' (<span id="'..WF..'_Types">';
        for j, v in ipairs(u.Types) do
            if j == 1 then
                JS = JS..'<b><span id="'..WF..'_TypesName">'..v..'</span>:</b>'..tempJS;
            elseif j == 2 then
                JS = JS..string.gsub(v, "%s+", "_");
            else
                JS = JS..', '..string.gsub(v, "%s+", "_");
            end
        end
        JS = JS..'</span>)<br />';
    end
        
    local _ = 1;
    local AUGcount = 1;
    local Aname = '';
    local AUGname = '';
    local Abilities = {};
    for j, v in ipairs(u) do
        if v.Name ~= Aname and v.AUG == nil then
            Aname = v.Name;
            Abilities[Aname] = _;
        elseif v.Name == Aname then
            _ = _ - 1;
        end
            
        if v.Name ~= AUGname and v.AUG ~= nil then
            AUGname = v.Name;
        end
        
        local augment = '';
        if v.AUG ~= nil then
            augment = '_AUG'..AUGcount;
            AUGcount = AUGcount + 1;
            _ = _ - 1;
        else
            AUGcount = 1;
        end
        
        local Atype = '';
        if v.Type ~= nil and v.Type ~= '' then
            Atype = '_'..string.gsub(v.Type, "%s+", "_");
        end
        
        local id = '<span id="'..WF.._..augment;
        
        JS = JS..'\n<b>'..id..Atype..'">'..v.Name..'</span></b> (';
        
        local tempJS = ''; local count = 0;
        for k, w in ipairs(v) do
            local unit = '';
            if w.Unit ~= nil and w.Unit ~= '' then
                unit = id..'_Unit'..k..Atype..'">'..w.Unit..'</span>';
            end
            tempJS = tempJS..'\n<br />'..id..'_Value'..k..Atype..'">'..w[1]..'</span>'..unit..' '..id..'_Name'..k..Atype..'">'..w[2]..'</span>';
            count = count + 1;
        end
        JS = JS..id..'_Count'..Atype..'">'..count..'</span>)'..tempJS..'<br />';
            
        _ = _ + 1;
    end
        
    JS = JS..'\n</span>';
    
    return JS;
end

function p.buildJS(frame)
	local r={} 
	for i,v in ipairs(frame.args or frame) do
		assert(v and v~='', 'No warframe #'..i)
		r[i]=buildJS(Shared.titleCase(v)) 
	end 
	return table.concat(r ,'<br/>')
end

return p