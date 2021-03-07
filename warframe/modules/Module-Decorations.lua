local p = {};

local CatData = mw.loadData( 'Module:Decorations/data' );
local Icon = require( "Module:Icon" );
local Shared = require( "Module:Shared" );
local multis = {1, 3, 10, 30, 100};

-- calculates multiplied clan costs
local function getNum(num, multi, bool)
    if bool == true then
        multi = 1;
    end

    num = math.floor((num + 0)*multi);

    if num < 1 then
        num = 1;
    end

    return num;
end

-- builds a table for a single decoration item
local function buildRow(rowData, result)
    local costData = rowData.Cost;
    local resourceData = costData.Resources;
    local count = 1;
    for _ in ipairs(resourceData) do
        count = count + 1;
    end

    local itemCol = '\n! rowspan="'..count..'" | '..rowData.Name..'<br>[[File:'..rowData.Image..'|150px]]<br>Capacity: -'..costData.Capacity..'<br>Build Time: '..costData.Time..' hours';
    table.insert(result, itemCol);

    table.insert(result, '\n| style="font-size: 90%;" | '..Icon._Item("Credits", "Text"));

    local creds = costData.Credits;
    local static = rowData.Static;
    for _, multi in ipairs(multis) do
        table.insert(result, '\n| style="font-size: 90%;" | '..Shared.formatnum(getNum(creds, multi, static)));
    end

    for i, res in ipairs(resourceData) do
        local amount = res.Count;
        local bgc = "none";

        if i % 2 == 1 then
            bgc = "#A1B1FC";
        end

        table.insert(result, '\n|- style="font-size:90%; background-color:'..bgc..';"');

        if res.Type == "Resource" then
            table.insert(result, '\n| '..Icon._Resource(res.Name, "Text"));
        else
            table.insert(result, '\n| '..Icon._Item(res.Name, "Text"));
        end

        for j = 1, 5 do
            table.insert(result, '\n| '..Shared.formatnum(getNum(amount, multis[j], static)));
        end
    end

    return result;
end

-- builds a list of decorations for a decoration category
local function buildTable(Name)
    local catData = CatData[Name];

    local result = {};
    local tHead = [[
{| class="navbox" style="margin-bottom:20px;"
|- class="navboxhead"
! style="width:25%;" | Item
! style="width:20%;" | Resources
! style="width:11%;" | Ghost
! style="width:11%;" | Shadow
! style="width:11%;" | Storm
! style="width:11%;" | Mountain
! style="width:11%;" | Moon
|-]];

    for _, v in ipairs(catData) do
        table.insert(result, tHead);
        result = buildRow(v, result);
        table.insert(result, '\n|}\n');
    end

    return table.concat(result);
end

function p.buildTable(frame)
    return buildTable(frame.args[1]);
end

return p