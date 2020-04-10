--
-- Libraries
--
Class = require("lib/class")
push = require("lib/push")

-- used for timers and tweening
Timer = require("lib/knife.timer")

--
-- our own code
--

-- utility
require("src/StateMachine")
require("src/Util")

-- game pieces
require("src/SpaceShip")
require("src/Meteor")

-- game states
require("src/states/BaseState")
require("src/states/StartState")
require("src/states/PlayState")
require("src/states/GameOverState")

-- sounds

-- graphics
gTextures = {
    ['menu-background'] = love.graphics.newImage('graphics/backgrounds/menu_background.png'),
    ['play-background'] = love.graphics.newImage('graphics/backgrounds/play_background.png'),
    ['space-ships'] = love.graphics.newImage('graphics/space_ships/player_ship.png'),
    ['meteors'] = love.graphics.newImage('graphics/objects/meteor_sheet.png')
}

-- quads
gFrames = {
    ['meteor'] = GenerateQuadsMeteors(gTextures['meteors'])
}

-- fonts

-- constants
BACKGROUND_SCROLL_SPEED = 80

METEOR_SIZE = {
    [1] = {42, 39},
    [2] = {22, 20},
    [3] = {31, 36},
    [4] = {26, 27},
    [5] = {17, 15}
}