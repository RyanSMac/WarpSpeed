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
require("src/Laser")

-- game states
require("src/states/BaseState")
require("src/states/StartState")
require("src/states/PlayState")
require("src/states/GameOverState")
require("src/states/VictoryState")

-- sounds

-- graphics
gTextures = {
    ['menu-background'] = love.graphics.newImage('graphics/backgrounds/menu_background.png'),
    ['play-background'] = love.graphics.newImage('graphics/backgrounds/play_background.png'),
    ['space-ships'] = love.graphics.newImage('graphics/space_ships/player_ship.png'),
    ['shot'] = love.graphics.newImage('graphics/shot/shot.png'),
    ['meteors'] = love.graphics.newImage('graphics/objects/meteor_sheet.png'),
    ['health-bar'] = love.graphics.newImage('graphics/hud/health.png')
}

-- quads
gFrames = {
    ['meteor'] = GenerateQuadsMeteors(gTextures['meteors']),
    ['health'] = GenerateQuadsHealth(gTextures['health-bar'])
}

-- fonts

-- constants
-- Physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- virtual resolution dimensions
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

-- speed the background of the play state scrolls
BACKGROUND_SCROLL_SPEED = 80

-- size of all the meteor hit boxes
METEOR_SIZE = {
    [1] = {42, 39},
    [2] = {22, 20},
    [3] = {31, 36},
    [4] = {26, 27},
    [5] = {17, 15}
}