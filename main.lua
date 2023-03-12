local love = require 'love'
require "src/menu"
require "src/audio"
require "src/player"
require "src/map"
require "src/entities"
require "src/entity"
require "src/game_over"
require "src/ghost"
require "src/slime"
require "src/pause"

function love.load()
    love.graphics.setDefaultFilter( "nearest" )
    in_start_menu = true;
    in_game_over = true;
    audio_load()
    menu_load()
    map_load()
    player_load()
    ghost_load()
    slime_load()
    pause_load()
    game_over_load()
end


function love.update()
    if in_start_menu == true then
        menu_update()
    else
        player_update()
        ghost_update()
        slime_update()
    end
end

function love.draw()
    if in_start_menu == true then
        menu_draw()
    else
        map_draw()
        player_draw()
        ghost_draw()
        slime_draw()
    end
    if life < 0 then
        game_over_draw()
        if love.keyboard.isDown("space") then
            over = false
            reset()
        end
    end
    if (pause_button == false and life > 0) then
        pause_draw()
    end
end

function love.mousepressed(x, y, button, istouch, key)
    if in_start_menu == true then
        button_menu(x, y, button, key)
    end

    if start_audio == true then
        love.audio.play(source)
    end
    if start_audio == false then
        love.audio.pause(source)
    end

    if pause_button == false then
        pause_menu(x, y, button, key)
    end

end

function love.keypressed( key )
    if in_start_menu == false then
        move_player( key )
        move_ghost( key )
        move_slime( key )
    if pause_button == true then
            pause_menu_true( key )
            goto ici
        end
    if pause_button == false then
            pause_menu_false( key )
        end
    end
    if in_start_menu == true then
        if key == "space" then
            in_start_menu = false
        end
    end
    ::ici::
end