local CollisionData = {
    ["276de19dc5541f30"] = true,
    ["e379cc9592197cd8"] = true,
    ["8f3cb89b79b42ec4"] = true,
    ["6cdb4f6f58ec4fa8"] = true,
    ["7ae8fcbfe6a00f7b"] = true,
    ["85462a64da94ee78"] = true,
    ["7a4c85917d8d8323"] = true,
    ["b37a4188fde4c161"] = true,
    ["7b91ae618eadbe49"] = true,
    ["01c78e4ef0340674"] = true,
    ["adea0368e2fee02b"] = true,
    ["42370b3a7b92f537"] = true,
    ["39d0838c190f1540"] = true,
    ["cacb76e8e1d7e2f3"] = true,
    ["c746af9ae100c837"] = true,
    ["75baea8dccabc8d5"] = true,
    ["4027cbad1f8d5b37"] = true,
    ["9b2fcf39f23e2344"] = true,
    ["d678a2a41e3f1bfb"] = true,
    ["0fe54fe3af59d86c"] = true,
    ["2854ee0748613f72"] = true,
    ["16dde5dd77259b35"] = true,
    ["8969155cb42a67cc"] = true,
    ["c5c4442c5e147cb0"] = true,
    ["9eda9e73ac0ef710"] = true,
    ["673ea142d68175df"] = true,
    ["260a42b4809c08dc"] = true,
    ["9d8b22836aa015ed"] = true,
    ["78f4407343b48f6d"] = true,
    ["96eba158d67240f6"] = true,
    ["a3649015ec10f0fa"] = true,
    ["6cb6040856588734"] = true,
    ["97e8d510fc7f6b4b"] = true,
    ["99792495ba726698"] = true,
    ["e765f9d63549a5c5"] = true,
    ["093021865a2c35af"] = true,
    ["a5bab566e1733d44"] = true,
    ["3345b74c3081f3f9"] = true,
    ["f9639a083eb4eb0c"] = true,
    ["8f0bd5d3ce8adf20"] = true,
    ["120d0ca08375e85e"] = true,
    ["d6ab68fdfb25156e"] = true,
    ["77175ed91c87d38a"] = true,
    ["89a7dbeb98bb47fb"] = true,
    ["67e5497920d65b45"] = true,
    ["4385cb1d46044948"] = true,
    ["75d60c30cfc752d5"] = true,
    ["6e94e532295a1c4c"] = true,
    ["b7dd69c3082ad494"] = true,
    ["03996689587afc9c"] = true,
    ["fe7682409496395c"] = true,
    ["20a34b41ca06015c"] = true,
    ["70fbfdaf5e1c50a1"] = true,
    ["cbeb471aa32636ea"] = true,
    ["7c6a421c90a8709a"] = true,
    ["fe13549df62eab40"] = true,
    ["df37c0dd7a9e1392"] = true,
    ["887ceed0e322a202"] = true,
    ["b1f9779228aff5cf"] = true,
    ["ea53e01e72a77431"] = true,
    ["31245608e2096b2a"] = true
}

local id = "INVIS_WALLS"
_G.Invis_Walls = _G.Invis_Walls or {}
local walls = _G.Invis_Walls

_G.Drawing_Invis_Walls_Colored = not _G.Drawing_Invis_Walls_Colored
local colours = _G.Drawing_Invis_Walls_Colored

local lined = _G.Drawing_Invis_Walls_Lined
if lined then --Stop Drawing
    _G.Drawing_Invis_Walls_Lined = false
    Hooks:Remove(id)
end

if #walls == 0 then
    for _, unit in pairs(World:find_units("all", 1)) do
        if CollisionData[unit:name():key()] then
            table.insert(walls, unit)
        end
    end
    _G.Invis_Walls = walls
end

for i = 1, #walls do
    local unit = walls[i]
    unit:set_visible(colours and true or false)
end