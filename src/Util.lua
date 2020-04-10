function GenerateQuadsMeteors( atlas )
    local x = 0
    local y = 0

    local counter = 1
    local quads = {}

    quads[counter] = love.graphics.newQuad(x, y, 42, 39,
        atlas:getDimensions())
    counter = counter + 1

    x = x + 42

    quads[counter] = love.graphics.newQuad(x, y, 22, 20,
        atlas:getDimensions())
    counter = counter + 1

    x = x + 22

    quads[counter] = love.graphics.newQuad(x, y, 31, 36,
        atlas:getDimensions())
    counter = counter + 1

    x = x + 31

    quads[counter] = love.graphics.newQuad(x, y, 26, 27,
        atlas:getDimensions())
    counter = counter + 1

    x = x + 26

    quads[counter] = love.graphics.newQuad(x, y, 17, 15,
        atlas:getDimensions())
    counter = counter + 1

    return quads

end

function GenerateQuadsHealth( atlas )
    local x = 0
    local y = 0
    local width = 16

    local counter = 1
    local quads = {}
    
    quads[counter] = love.graphics.newQuad(x, y, 98, 32,
        atlas:getDimensions())
    counter = counter + 1

    x = x + 98
    y = y + 8

    for i=1,5 do
        quads[counter] = love.graphics.newQuad(x, y, width, 18,
            atlas:getDimensions())
        counter = counter + 1

        width = width + 16
    end

    return quads
end