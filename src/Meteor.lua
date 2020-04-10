Meteor = Class{}

function Meteor:init(type)
    self.x = VIRTUAL_WIDTH + 50
    self.y = math.random( -25, VIRTUAL_HEIGHT + 25 )

    self.type = type

    self.dx = -100 + -math.random( 1, 50 )
    if self.y <= VIRTUAL_HEIGHT / 2 then
        self.dy = math.random( 0, 25 )
    else
        self.dy = math.random( 0, -25 )
    end

    self.width = METEOR_SIZE[type][1]
    self.height = METEOR_SIZE[type][2]
end

function Meteor:update( dt )
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Meteor:render()
    love.graphics.draw(gTextures['meteors'], gFrames['meteor'][self.type], self.x, self.y)
end