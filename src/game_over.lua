local love = require 'love'

function game_over_load()
    game_over = love.graphics.newImage("asset_menu/game_over.png")
end

function game_over_draw()
    local x, y = love.mouse.getPosition()
    love.graphics.scale(2)

    love.graphics.draw(game_over, 665 / 2, 256 / 2, 0, 0.6, 0.6)
end

function return_menu(key)
    if key == "escape" then
        game_over = false
    end
end