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