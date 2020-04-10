Laser = Class{}

function Laser:init(shipX, shipY, shipWidth, shipHeight)
    -- use ship position to spawn laser
    self.x = shipX + shipWidth - 15
    self.y = shipY + 4

    -- speed of laser
    self.dx = 10

    -- dimensions of laser
    self.width = 17
    self.height = 8
end

function Laser:update( dt )
    self.x = self.x + self.dx + dt
end

function Laser:render()
    love.graphics.draw(gTextures['shot'], self.x, self.y)
end