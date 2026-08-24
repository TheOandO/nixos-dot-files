---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "nautilus"
local browser     = "zen"
local textEditor  = "gedit"

---------------------
---- KEYBINDINGS ----
---------------------

local 	mainMod = "SUPER" -- Sets "Windows" key as main modifier
-- local ipc = "noctalia msg"
local   volumeStep                 = 10
local   volumeMax                  = 100

local function layout_bind(bind_table)
    return function ()
        local workspace = hl.get_active_special_workspace() or
                          hl.get_active_workspace()

        if not workspace then
            return
        end

        local layout = workspace.tiled_layout
                
        if bind_table[layout] then
            hl.dispatch(bind_table[layout])
        end
    end
end

local function resize_active_window(x, y)
    return function() -- returning the function so hl reloads everytime correctly
        local win = hl.get_active_window()
        if win and win.size then
            local w = (win.size.x * (x / 100)) or 800
            local h = (win.size.y * (y / 100)) or 600

            hl.dispatch(hl.dsp.window.resize({ x = w, y = h, relative = true }))
        else
            hl.dispatch(hl.dsp.no_op())
        end
    end
end


-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Space",          hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",              hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + S",              hl.dsp.global("caelestia:launcher"))
hl.bind(mainMod .. " + SHIFT + W",      hl.dsp.global("caelestia:nexus"))
hl.bind(mainMod .. " + SHIFT + X",      hl.dsp.global("caelestia:utilities"))
hl.bind(mainMod .. " + SHIFT + S",      hl.dsp.exec_cmd("caelestia:screenshotFreeze"))
hl.bind(mainMod .. " + SHIFT + Q",      hl.dsp.global("caelestia:session"))
hl.bind(mainMod .. " + SHIFT + L",      hl.dsp.global("caelestia:lock"))


local closeWindowBind = hl.bind(mainMod .. " + Escape", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E",              hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + W",              hl.dsp.exec_cmd(textEditor))

hl.bind(mainMod .. " + D",              hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R",              hl.dsp.exec_cmd("qs -c caelestia kill; sleep .1; caelestia shell -d"))
hl.bind(mainMod .. " + P",              hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F",              hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"}))
hl.bind(mainMod .. "+ SHIFT + F",       hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle"}))
hl.bind(mainMod .. " + J",              hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",           hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + right",          hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + up",             hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + down",           hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + left",    hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + right",   hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + up",      hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + down",    hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + left",   resize_active_window(-10, 0), { repeating = true })
hl.bind(mainMod .. " + SHIFT + right",  resize_active_window(10, 0), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up",     resize_active_window(0, -10), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",   resize_active_window(0, 10), { repeating = true })
hl.bind(mainMod .. " + CTRL + SHIFT + left",   hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + SHIFT + right",  hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + SHIFT + up",     hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + SHIFT + down",   hl.dsp.window.move({ direction = "down" }))

-- hl.bind("ALT + TAB",                    hl.dsp.exec_cmd(ipc .. " window-switcher"))
hl.bind("ALT + Tab",                    hl.dsp.exec_cmd("snappy-switcher next --mod alt"))
hl.bind("SUPER + TAB",                  hl.dsp.exec_cmd("snappy-switcher next --workspace --mod super"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + ALT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + ALT + " .. key,     hl.dsp.window.move({ workspace = i }))
    end

-- Switch first 5 workspaces with mainMod + [Z,X,C,V,B]
hl.bind(mainMod .. " + Z" ,             hl.dsp.focus({ workspace = "1" }))
hl.bind(mainMod .. " + ALT + Z",        hl.dsp.window.move({ workspace = "1" }))
hl.bind(mainMod .. " + X" ,             hl.dsp.focus({ workspace = "2" }))
hl.bind(mainMod .. " + ALT + X",        hl.dsp.window.move({ workspace = "2" }))
hl.bind(mainMod .. " + C" ,             hl.dsp.focus({ workspace = "3" }))
hl.bind(mainMod .. " + ALT + C",        hl.dsp.window.move({ workspace = "3" }))
hl.bind(mainMod .. " + V" ,             hl.dsp.focus({ workspace = "4" }))
hl.bind(mainMod .. " + ALT + V",        hl.dsp.window.move({ workspace = "4" }))
hl.bind(mainMod .. " + B" ,             hl.dsp.focus({ workspace = "5" }))
hl.bind(mainMod .. " + ALT + B",        hl.dsp.window.move({ workspace = "5" }))

-- Change active workspace's layout
hl.bind("SUPER + G", function ()
    local layouts     = { "scrolling", "dwindle", "master", "monocle" }
    local workspace   = hl.get_active_workspace()
	if hl.get_active_special_workspace() then
		workspace = hl.get_active_special_workspace()
	end

    local next_layout = "dwindle"

    if not workspace then
        return
    end

    for i = 1, #layouts do
        if layouts[i] == workspace.tiled_layout then
            local next_layout_idx = (i % #layouts) + 1
            next_layout = layouts[next_layout_idx]
            break
        end
    end

	if workspace.special then
		hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
	else
		hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
	end
end)

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_up",             hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down",           hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + ALT + mouse_up",       layout_bind({
															scrolling = hl.dsp.layout("move +col"),
															monocle = hl.dsp.layout("cycleprev"),
															}))
hl.bind(mainMod .. " + ALT + mouse_down",     layout_bind({
															scrolling = hl.dsp.layout("move -col"),
															monocle = hl.dsp.layout("cyclenext"),
															}))
hl.bind(mainMod .. " + ALT + right",          layout_bind({
															scrolling = hl.dsp.layout("move +col"),
															monocle = hl.dsp.layout("cycleprev"),
															}))
hl.bind(mainMod .. " + ALT + left",           layout_bind({
															scrolling = hl.dsp.layout("move -col"),
															monocle = hl.dsp.layout("cyclenext"),
															}))
hl.bind(mainMod .. " + SHIFT + mouse_up",     hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + mouse_down",   hl.dsp.window.move({ workspace = "e-1" }))

    -- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", 	hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", 	hl.dsp.window.resize(), { mouse = true })

    -- Media keys
hl.bind("XF86AudioRaiseVolume",   	hl.dsp.exec_cmd(
									    "wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l " ..
									    (volumeMax / 100) .. " @DEFAULT_AUDIO_SINK@ " .. volumeStep .. "%+"
									), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",    	hl.dsp.exec_cmd(
									    "wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. volumeStep .. "%-"
									), { locked = true, repeating = true })
hl.bind("XF86AudioMute",           	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp",     	hl.dsp.global("caelestia:brightnessUp"), { locked = true })
hl.bind("XF86MonBrightnessDown",   	hl.dsp.global("caelestia:brightnessDown"), { locked = true })

