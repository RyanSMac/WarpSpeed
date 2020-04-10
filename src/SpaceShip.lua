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

    -- controls the ships movement speed
    self.shipSpeed = 100

    -- set starting hp for ship
    self.hp = 5

    -- a list holding all the ships lasers
    self.lasers = {}
    self.shotTimer = 0
    self.pauseShot = false

    -- count time in seconds
    Timer.every(0.5, function()
        self.shotTimer = self.shotTimer + 1
    end)


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
    -- update ship movement
    self:movement(dt)

    -- check if ship shot and update laser list
    self:shoot(dt)

    -- update ships lasers
    for l, laser in pairs(self.lasers) do
        laser:update(dt)
    end
end

function SpaceShip:render()
    -- render ship
    love.graphics.draw(gTextures['space-ships'], self.x, self.y)

    -- render laser
    for l, laser in pairs(self.lasers) do
        laser:render()
    end
end

function SpaceShip:movement( dt )
    -- keyboard input forward and backward
    if love.keyboard.isDown('a') then
        self.dx = -self.shipSpeed
    elseif love.keyboard.isDown('d') then
        self.dx = self.shipSpeed
    else
        self.dx = 0
    end

    -- keyboard input up and down
    if love.keyboard.isDown('w') then 
        self.dy = -self.shipSpeed
    elseif love.keyboard.isDown('s') then 
        self.dy = self.shipSpeed
    else
        self.dy = 0
    end

    -- changes speed based on input
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

function SpaceShip:shoot(dt)
    -- adds a laser to the ships lasers list
    if love.keyboard.isDown('space') and not self.pauseShot then
        table.insert( self.lasers, Laser(self.x, self.y, self.width, self.height))
        table.insert( self.lasers, Laser(self.x, self.y + 23, self.width, self.height))
        self.pauseShot = true
        self.shotTimer = 0
    end

    if self.shotTimer >= 1 then
        self.pauseShot = false
    end   
end