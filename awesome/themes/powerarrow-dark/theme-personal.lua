--[[

     Powerarrow Dark Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local wallpaper = require("themes.powerarrow-dark.wallpapers")
 
local chosen_wallpaper = wallpaper()

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local genfont =  (
--"Iosevka Nerd Font 10" 
"Cantarell 9" 
--Roboto Regular Nerd 10"
--"Fira Code Regular 12"
)

local wibox_dpi = 18

local colors = {}
colors.white = "#FFFFFF"
colors.white_but_not = "#DDDDFF" -- white
colors.red = "#913831"--"#EA6F81" -- red
colors.pink = "#CC9393" -- pink
colors.black = "#1A1A1A" -- black
colors.black_less = "#313131" -- less black
colors.gray = "#3F3F3F" -- gray
colors.gray_less = "#7F7F7F" -- less gray
colors.gray_closer_to_white = "#A6A6A6"
colors.green = "#7AC82E"
colors.light_blue = "#46A8C3"

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark"
theme.wallpaper                                 = theme.dir .. "/wallpapers/" .. chosen_wallpaper
theme.font                                      = genfont
theme.fg_normal                                 = colors.white
theme.fg_focus                                  = colors.red --colors.red
theme.fg_urgent                                 = colors.pink

theme.bg_normal                                 = colors.black
theme.bg_focus                                  = colors.black_less

theme.bg_urgent                                 = colors.black
theme.border_width                              = dpi(1)
theme.border_normal                             = colors.gray
theme.border_focus                              = colors.gray --colors.gray_less
theme.border_marked                             = colors.pink
theme.tasklist_bg_focus                         = colors.black

theme.titlebar_bg_focus                         = colors.black_less--colors.red --theme.bg_focus
theme.titlebar_bg_normal                        = colors.black --theme.bg_normal
theme.titlebar_fg_focus                         = colors.red --theme.fg_focus

theme.normal_transparent                        = colors.black .. "BB"

theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(0)

-- default power-arrow
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
-- theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
-- theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
-- theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
-- theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"

theme.titlebar_minimize_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_minimize_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_minimize_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_minimize_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"


-- mac buttons
-- theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/mac/close_focus.svg"
-- theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/mac/close_normal.svg"
-- theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/mac/maximized_focus_inactive.svg"
-- theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/mac/maximized_normal_inactive.svg"
-- theme.titlebar_minimize_button_normal           = theme.dir .. "/icons/titlebar/mac/minimize_normal.svg"
-- theme.titlebar_minimize_button_focus            = theme.dir .. "/icons/titlebar/mac/minimize_focus.svg"


local markup = lain.util.markup
local separators = lain.util.separators

--widget:set_markup(markup.font(theme.font, markup("#EA6F81", artist) .. title))

local keyboardlayout = awful.widget.keyboardlayout:new(
  function (widget, stdout)
    widget:set_markup(markup.font(theme.font, stdout))
  end
)
--local keyboardlayout = wibox.widget.textbox(tostring(awful.widget.keyboardlayout()))
-- Textclock
-- local clockicon = wibox.widget.imagebox(theme.widget_clock)
-- local clock = awful.widget.watch(
--     "date +'%a %d %b %R'", 60,
--     function(widget, stdout)
--         widget:set_markup(" " .. markup.font(theme.font, stdout) .. " ")
--     end
-- )
-- Custom clock
--mytextclock = wibox.widget.textclock()

local mytextclock = awful.widget.watch(
    "date +'%a %d %b %H:%M' ", 60,
    function(widget, stdout)
        widget:set_markup(markup.font(theme.font, stdout))
    end
)

local cw = calendar_widget({
    theme = 'dark',
    placement = 'top_right',
    radius = 10,
})

mytextclock:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)

-- -- Calendar
-- theme.cal = lain.widget.cal({
--     attach_to = { clock },
--     notification_preset = {
--         font = theme.font,
--         fg   = theme.fg_normal,
--         bg   = theme.bg_normal
--     }
-- })

-- Mail IMAP check
--local mailicon = wibox.widget.imagebox(theme.widget_mail)
--[[ commented because it needs to be set before use
mailicon:buttons(my_table.join(awful.button({ }, 1, function () awful.spawn(mail) end)))
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            widget:set_markup(markup.font(theme.font, " " .. mailcount .. " "))
            mailicon:set_image(theme.widget_mail_on)
        else
            widget:set_text("")
            mailicon:set_image(theme.widget_mail)
        end
    end
})
--]]

-- MPD
-- local musicplr = awful.util.terminal .. " -title Music -e ncmpcpp"
-- local mpdicon = wibox.widget.imagebox(theme.widget_music)
-- mpdicon:buttons(my_table.join(
--     awful.button({ "Mod4" }, 1, function () awful.spawn(musicplr) end),
--     awful.button({ }, 1, function ()
--         os.execute("mpc prev")
--         theme.mpd.update()
--     end),
--     awful.button({ }, 2, function ()
--         os.execute("mpc toggle")
--         theme.mpd.update()
--     end),
--     awful.button({ }, 3, function ()
--         os.execute("mpc next")
--         theme.mpd.update()
--     end)))
-- theme.mpd = lain.widget.mpd({
--     settings = function()
--         if mpd_now.state == "play" then
--             artist = " " .. mpd_now.artist .. " "
--             title  = mpd_now.title  .. " "
--             mpdicon:set_image(theme.widget_music_on)
--         elseif mpd_now.state == "pause" then
--             artist = " mpd "
--             title  = "paused "
--         else
--             artist = ""
--             title  = ""
--             mpdicon:set_image(theme.widget_music)
--         end
--
--         widget:set_markup(markup.font(theme.font, markup("#EA6F81", artist) .. title))
--     end
-- })

-- MEM
--local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, "Mem: " .. mem_now.used .. "MB" ))
    end
})

-- CPU
--local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        --widget:set_markup(markup.font(theme.font, " Cpu:  " .. cpu_now.usage .. "% "))
        widget:set_markup(markup.font(theme.font, "Cpu: " .. cpu_now.usage .. "%"))
    end
})

-- Coretemp
--local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, "Temp: " .. coretemp_now .. "°C"))
    end
})

-- / fs
--local fsicon = wibox.widget.imagebox(theme.widget_hdd)
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10" },
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. fs_now["/"].percentage .. "% "))
    end
})
--]]

-- Battery
--local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                --baticon:set_image(theme.widget_ac)
                widget:set_markup(markup.font(theme.font, "Bat: Line"))
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                widget:set_markup(markup.font(theme.font, "Bat: Empty"))
                --baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                --baticon:set_image(theme.widget_battery_low)
                widget:set_markup(markup.font(theme.font, "Bat: Low"))
            else
                --baticon:set_image(theme.widget_battery)
                widget:set_markup(markup.font(theme.font, "Bat: "))
            end
            widget:set_markup(markup.font(theme.font, "Bat: " .. bat_now.perc .. "%"))
        else
            widget:set_markup(markup.font(theme.font, "Bat: AC"))
            --baticon:set_image(theme.widget_ac)
        end
    end
})

-- ALSA volume
-- local volicon = wibox.widget.imagebox(theme.widget_vol)
-- theme.volume = lain.widget.alsa({
--     settings = function()
--         if volume_now.status == "off" then
--             volicon:set_image(theme.widget_vol_mute)
--         elseif tonumber(volume_now.level) == 0 then
--             volicon:set_image(theme.widget_vol_no)
--             awful.spawn(terminal.." -e amixer -q set toggle")
--         elseif tonumber(volume_now.level) <= 50 then
--             volicon:set_image(theme.widget_vol_low)
--         else
--             volicon:set_image(theme.widget_vol)
--         end
--             widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
--     end
-- })


-- local volicon = wibox.widget.imagebox(theme.widget_vol)
-- local regex = awful.spawn(terminal.."-e amixer -c 0 sget Master | grep -o \"[0-9][0-9]%\" | grep -o \"[0-9][0-9]\"")
-- theme.volume = lain.widget.alsa({
--     settings = function()
--         if tonumber(regex) == 0 then
--             volicon:set_image(theme.widget_vol_no)
--             --os.execute("amixer -q -c 0 set toggle")
--             os.execute("amixer -q -c 0 set PCM 0")
--         elseif tonumber(regex) <= 50 then
--             volicon:set_image(theme.widget_vol_low)
--             os.execute("amixer -q -c 0 set PCM 230")
--         else
--             volicon:set_image(theme.widget_vol)
--             os.execute("amixer -q -c 0 set PCM 230")
--         end
--         widget:set_markup(markup.font(theme.font, " " .. regex.. "% "))
--     end
-- })    


-- theme.volume.widget:buttons(awful.util.table.join(
--                                awful.button({}, 4, function ()
--                                      --awful.util.spawn("amixer set Master 1%+")
--                                      --awful.util.spawn("amixer set Master 1%+")
--                                      awful.util.spawn("amixer -c 0 set Master 1%+")
--                                      --awful.util.spawn("amixer -c 0 set PCM -8dB")
--                                      theme.volume.update()
--                                end),
--                                awful.button({}, 5, function ()
--                                      --awful.util.spawn("amixer set Master 1%-")
--                                      awful.util.spawn("amixer -c 0 set Master 1%-")
--                                      --awful.util.spawn("amixer -c 0 set PCM -8dB")
--                                      theme.volume.update()
--                                end)
-- ))




-- Net
--local neticon = wibox.widget.imagebox(theme.widget_net)
-- local net = lain.widget.net({
--     settings = function()
--         widget:set_markup(markup.font(theme.font,
--                           markup(colors.green, " In:  " .. string.format("%03.1f", net_now.received))
--                           .. " " ..
--                           markup(colors.light_blue, " Out:  " .. string.format("%03.1f", net_now.sent) .. " ")))
--     end
-- })

-- Separators
local spr     = wibox.widget.textbox(' ')
local arrl_dl = separators.arrow_left(theme.bg_focus, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_focus)
local mysep = wibox.widget.textbox(" | ")

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- null walpaper
    -- gears.wallpaper.set("#dd3333")

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    --s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(wibox_dpi), bg = theme.bg_normal", fg = theme.fg_normal})
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(wibox_dpi),
        bg = theme.bg_normal,
        fg = theme.fg_normal,
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --spr,
            s.mytaglist,
            s.mypromptbox,
            --spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            mysep,
            keyboardlayout, --wibox.container.background(keyboardlayout, theme.bg_normal),
            --spr,
            mysep,
            --arrl_ld, --theme.bg_focus
            --mpdicon, --wibox.container.background(mpdicon, theme.bg_normal),
            --wibox.container.background(theme.mpd.widget, theme.bg_normal),
            --arrl_dl,
            --wibox.container.background(volicon, theme.bg_focus),
            --wibox.container.background(theme.volume.widget, theme.bg_focus),
            volume_widget(), --wibox.container.background(volume_widget(), theme.bg_normal),
            mysep,
            -- arrl_ld,
            -- arrl_dl,
            --arrl_ld,
            --wibox.container.background(mailicon, theme.bg_focus),s
            --wibox.container.background(theme.mail.widget, theme.bg_focus),
            --arrl_dl,

            --cpuicon, --wibox.container.background(cpuicon, theme.bg_normal),
            cpu.widget, --wibox.container.background(cpu.widget, theme.bg_normal),
            --cpu_widget({
            --    width = 50,
            --    step_width = 3,
            --    step_spacing = 1,
            --    color = colors.light_blue
            --}),
            mysep,
            --memicon,
            mem.widget,
            mysep,
            --arrl_ld,
            --arrl_dl,
            --tempicon,
            temp.widget,
            mysep,
            --arrl_ld,
            --wibox.container.background(fsicon, theme.bg_focus),
            --wibox.container.background(theme.fs.widget, theme.bg_focus),
            --arrl_dl,
            --baticon,
            bat.widget,
            --mysep,
            --arrl_ld,
            --wibox.container.background(neticon, theme.bg_focus),
            --net.widget, --wibox.container.background(net.widget, theme.bg_normal),
            --arrl_dl,
            mysep,
            --clock,
            mytextclock,
            --spr,
            --arrl_ld,
            mysep,
            s.mylayoutbox, --wibox.container.background(s.mylayoutbox, theme.bg_normal),
            mysep,
            logout_menu_widget()
        },
    }
end

return theme
