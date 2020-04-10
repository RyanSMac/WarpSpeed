PlayState = Class{__includes = BaseState}

function PlayState:init()
    -- start transition alpha at full for fade in
    self.transitionAlpha = 1

    -- flag to show wether we're able to process input
    self.pauseInput = false

    -- set start score and timer
    self.score = 0
    self.timer = 0

    self.spawnRate = 1
    self.spawnTime = 0

    -- count time in seconds
    Timer.every(1, function()
        self.timer = self.timer + 1
    end)


    -- spawn player ship
    self.player = SpaceShip()

    -- all object in scene
    self.objects = {}

    backgroundX = 0
end

function PlayState:enter( params )
    -- grab level # from passed params
    self.level = params.level

    -- grab score if passed though else set to 0
    self.score = params.score or 0

    -- first, over 1 second change transition alpha
    Timer.tween(1, {
        [self] = {transitionAlpha = 0}
    })
end

function PlayState:update( dt )

    self.spawnTime = self.spawnTime + dt

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    -- spawn object into scene
    if self.spawnTime >= self.spawnRate then
        table.insert( self.objects, Meteor(math.random( 1, 3 )))
        table.insert( self.objects, Meteor(math.random( 1, 3 )))
        table.insert( self.objects, Meteor(math.random( 4, 5 )))
        self.spawnTime = 0
    end

    backgroundX = backgroundX - BACKGROUND_SCROLL_SPEED * dt

    if backgroundX <= -4608 + VIRTUAL_WIDTH then
        backgroundX = 0
    end

    self.player:update(dt)

    for o, object in pairs(self.objects) do
        object:update(dt)

        if self.player:collides(object) then
            gStateMachine:change('game-over')
        end
    end

    for o, object in pairs(self.objects) do
        if object.x + object.width < 0 then
            table.remove( self.objects, o )
        end
    end

    Timer.update(dt)
end

function PlayState:render()
    -- draw our transition rect; is normally fully transparent, unless we're moving to a new state
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    -- render background
    love.graphics.draw(gTextures['play-background'], backgroundX, 0)

    -- render player ship
    self.player:render()

    for o, object in pairs(self.objects) do
        object:render()
    end

    -- draw our transition rect; is normally fully transparent, unless we're moving to a new state
    love.graphics.setColor(1, 1, 1, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end