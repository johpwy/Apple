--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:a915a47b336ac78ae77e208a0660ff14:81140d7253e66b543dcee1f0b545d627:021b39c5aa5fe07995ddacd17f829d10$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
           
            x=530,
            y=2,
            width=262,
            height=157,

        },
        {
            
            x=794,
            y=2,
            width=262,
            height=157,

        },
        
    },
    
    sheetContentWidth = 1850,
    sheetContentHeight = 164
}

SheetInfo.frameIndex =
{

    ["doglo1"] = 1,
    ["doglo2"] = 2,
    
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
