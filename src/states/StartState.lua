StartState = Class{__includes = BaseState}

function StartState:init()
    -- currently selected menu item
    self.currentMenuItem = 1

    -- used for transition between menu and game
    self.transitionAlpha = 0

    -- if we've selected an option need to pause input during animation
    self.pauseInput = false
end

function StartState:update( dt )
    if love.keyboard.wasPressed('escape') then
        love.event.quit{}
    end

    -- as long as input can still be made
    if not self.pauseInput then
        
        -- change menu selection
        if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
            self.currentMenuItem = self.currentMenuItem == 1 and 2 or 1
            -- menu sound needed
        end

        -- switch to another state via one of the menu options
        if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
            if self.currentMenuItem == 1 then
                -- tween, using Timer, the transition rect's alpha to 1 then
                -- transition to the PlayState after the animation is over
                Timer.tween(1, {
                    [self] = {transitionAlpha = 1}
                }):finish(function()
                    gStateMachine:change('play', {
                        level = 1
                    })
                end)
            else
                love.event.quit()
            end
        end
    end

    -- update timer
    Timer.update(dt)
end

function StartState:render()
    -- draw menu background
    love.graphics.draw(gTextures['menu-background'], 0, 0)

    -- draws tile to the screen
    -- need to add font included in the art assets
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf('WARP SPEED', 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')

    -- draw rect behind start and quit game text
    love.graphics.setColor(1, 1, 1, 128 / 255)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 76, VIRTUAL_HEIGHT / 2 + 25, 150, 58, 6)

    -- draw start text
    if self.currentMenuItem == 1 then
        love.graphics.setColor(99 / 255, 155 / 255, 1, 1)
    else
        love.graphics.setColor(48 / 255, 96 / 255, 130 / 255, 1)
    end

    love.graphics.printf('Start', 0, VIRTUAL_HEIGHT / 2 + 30, VIRTUAL_WIDTH, 'center')
    
    if self.currentMenuItem == 2 then
        love.graphics.setColor(99 / 255, 155 / 255, 1, 1)
    else
        love.graphics.setColor(48 / 255, 96 / 255, 130 / 255, 1)
    end
    
    love.graphics.printf('Quit Game', 0, VIRTUAL_HEIGHT / 2 + 63, VIRTUAL_WIDTH, 'center')

    -- draw our transition rect; is normally fully transparent, unless we're moving to a new state
    love.graphics.setColor(1, 1, 1, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end