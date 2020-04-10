SpaceShip = Class{}

function SpaceShip:init()
    -- x is placed in the middle
    self.x = 15

    self.y = VIRTUAL_HEIGHT / 2 - 17

    -- set starting velocity
    self.dx = 0
    self.dy = 0

    -- starting dimensions
    self.width = 34
    self.height = 38

    self.shipSpeed = 100
end

function SpaceShip:collides( target )
    -- check if left or right edge over lap with target
    if self.x + 10 > target.x + target.width or target.x > self.x + self.width - 10 then
        return false
    end

    -- check if top or bottom over lap with target
    if self.y + 10 > target.y + target.height or target.y > self.y + self.height - 10 then
        return false
    end

    return true
end

function SpaceShip:update( dt )
    -- keyboard input
    if love.keyboard.isDown('a') then
        self.dx = -self.shipSpeed
    elseif love.keyboard.isDown('d') then
        self.dx = self.shipSpeed
    else
        self.dx = 0
    end

    if love.keyboard.isDown('w') then 
        self.dy = -self.shipSpeed
    elseif love.keyboard.isDown('s') then 
        self.dy = self.shipSpeed
    else
        self.dy = 0
    end

    if self.dx < 0 then
        self.x = math.max(0, self.x + self.dx * dt)
    else
        self.x = math.min( VIRTUAL_WIDTH - self.width, self.x + self.dx * dt )
    end

    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)
    else
        self.y = math.min( VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt )
    end
end

function SpaceShip:render()
    love.graphics.draw(gTextures['space-ships'], self.x, self.y)
end