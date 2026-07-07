---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local browser     = "zen"


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local ipc = "noctalia msg"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Space",          hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + A",              hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + S",              hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
hl.bind(mainMod .. " + W",              hl.dsp.exec_cmd(ipc .. " panel-toggle wallpaper"))
hl.bind(mainMod .. " + SHIFT + X",      hl.dsp.exec_cmd(ipc .. " settings-open"))
hl.bind(mainMod .. " + SHIFT + V",      hl.dsp.exec_cmd(ipc .. " panel-toggle clipboard"))
hl.bind(mainMod .. " + SHIFT + S",      hl.dsp.exec_cmd(ipc .. " screenshot-region"))


local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + Escape",         hl.dsp.exec_cmd(ipc .. " panel-toggle session"))
hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E",              hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D",              hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R",              hl.dsp.exec_cmd(ipc .. " config-reload"))
hl.bind(mainMod .. " + P",              hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F",              hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"}))
hl.bind(mainMod .. "+ SHIFT + F",       hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle"}))
hl.bind(mainMod .. " + J",              hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",           hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + right",          hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + up",             hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + down",           hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + left",    hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + right",   hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + up",      hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + down",    hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + left",   hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right",  hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",     hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",   hl.dsp.window.move({ direction = "down" }))
hl.bind("ALT + TAB",                    hl.dsp.exec_cmd(ipc .. " window-switcher"))


-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + ALT + " .. key,     hl.dsp.window.move({ workspace = i }))
    end

hl.bind(mainMod .. " + Z" ,             hl.dsp.focus({ workspace = "name:gaming" }))
hl.bind(mainMod .. " + ALT + Z",        hl.dsp.window.move({ workspace = "name:gaming" }))
hl.bind(mainMod .. " + X" ,             hl.dsp.focus({ workspace = "name:focus" }))
hl.bind(mainMod .. " + ALT + X",        hl.dsp.window.move({ workspace = "name:focus" }))
hl.bind(mainMod .. " + C" ,             hl.dsp.focus({ workspace = "3" }))
hl.bind(mainMod .. " + ALT + C",        hl.dsp.window.move({ workspace = "3" }))
hl.bind(mainMod .. " + V" ,             hl.dsp.focus({ workspace = "4" }))
hl.bind(mainMod .. " + ALT + V",        hl.dsp.window.move({ workspace = "4" }))
hl.bind(mainMod .. " + B" ,             hl.dsp.focus({ workspace = "5" }))
hl.bind(mainMod .. " + ALT + B",        hl.dsp.window.move({ workspace = "5" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_up",             hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down",           hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + ALT + mouse_up",       hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + ALT + mouse_down",     hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + ALT + right",       hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + ALT + left",     hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + SHIFT + mouse_up",     hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + mouse_down",   hl.dsp.window.move({ workspace = "e-1" }))

    -- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- Media keys
hl.bind("XF86AudioRaiseVolume",    hl.dsp.exec_cmd(ipc .. " volume-up"))
hl.bind("XF86AudioLowerVolume",    hl.dsp.exec_cmd(ipc .. " volume-down"))
hl.bind("XF86AudioMute",           hl.dsp.exec_cmd(ipc .. " volume-mute"))
hl.bind("XF86MonBrightnessUp",     hl.dsp.exec_cmd(ipc .. " brightness-up"))
hl.bind("XF86MonBrightnessDown",   hl.dsp.exec_cmd(ipc .. " brightness-down"))

