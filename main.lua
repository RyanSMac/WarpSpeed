-- initialize our nearest-neighbor filter
love.graphics.setDefaultFilter('nearest', 'nearest')

-- File containing everything other file the game needs to run
require 'src/Dependencies'

function love.load()
    
    -- window bar title
    love.window.setTitle('Warp Speed')

    -- seed the RNG
    math.randomseed(os.time())

    -- initialize our virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true,
        canvas = true
    })

    -- set up the games state machine
    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end,
        ['victory'] = function() return VictoryState() end,
        ['game-over'] = function() return GameOverState() end
    }

    -- change to the start to begin the game
    gStateMachine:change('start')

    -- set up list to store all keyboard presses
    love.keyboard.keysPressed = {}

    -- set up list to store all mouse presses
    love.mouse.buttonsPressed = {}
end

function love.resize(w, h)
    -- allows for window resizing
    push:resize(w, h)
end

function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true
end

function love.mousepressed(x, y, button)
    -- add to our table of mouse button this frame
    love.mouse.buttonsPressed[button] = true
end

function love.keyboard.wasPressed(key)
    -- check is a key was pressed on the keyboard
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.mouse.wasPressed(button)
    -- check if a key was pressed on the mouse
    if love.mouse.buttonsPressed[button] then
        return true
    else
        return false
    end
end

function love.update( dt )
    -- update for which ever state the game is currently in
    gStateMachine:update(dt)

    -- empty both the input lists
    love.keyboard.keysPressed = {}
    love.mouse.buttonsPressed = {}
end

function love.draw()
    push:start()

    -- render for which ever state the game is currently in
    gStateMachine:render()

    -- display FPS for debugging; simply comment out to remove
    displayFPS()

    push:finish()
end

--[[
    Renders the current FPS.
]]
function displayFPS()
    -- simple FPS display across all states
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
end