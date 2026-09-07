
--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = {
        class = ".*",
        float = false,
    },

    suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)

local function tagged_rule(tag, matches, field)
    for _, match in ipairs(matches) do
        if field then
            local table = {}
            table[field] = match
            match = table
        end
        hl.window_rule({ match = match, tag = "+" .. tag })
    end
end

local function create_tag(tag, rules)
    local rule = { match = { tag = tag } }
    for k, v in pairs(rules) do
        rule[k] = v
    end
    hl.window_rule(rule)
end

-- All tags
local opaque_tag = "opaque"
local float_tag = "float"
local float_60_70_tag = "float_60_70"
local float_70_80_tag = "float_70_80"
local float_50_60_tag = "float_50_60"
local game_tag = "game"
local xwl_popup_tag = "xwl_popup"
local system_monitor_tag = "system_monitor"
local music_player_tag = "music_player"
local communication_app_tag = "communication_app"
local todo_app_tag = "todo_app"

-- Center all floating windows except xwayland windows (xwayland popups count as windows)
hl.window_rule({ match = { float = true, xwayland = false }, center = true })

-- Picture in picture (move and resize done via resizer in execs.lua)
hl.window_rule({
    match             = { title = "Picture(-| )in(-| )[Pp]icture" },
    move              = "(monitor_w*0.98-window_w) (monitor_h*0.97-window_h)", -- Initial move so window doesn't jump so much
    pin               = true,
    float             = true,
    keep_aspect_ratio = true,
})


-- Exclude zen extension popups from maximizing
-- hl.window_rule({
--     match = {
--         class = "zen",
--         title = "^.*Extension:.*",
--     },
--     tile = false,
--     float = true,
--     maximize = false,
--     persistent_size = true,
-- 	move = {"monitor_w * 0.78", "(monitor_h * 0.775)"},
-- 	size = {"monitor_w * 0.2", "monitor_h * 0.4"},
--     suppress_event = "maximize",
-- })

-- Floating apps
tagged_rule(float_tag, {
    "guifetch",                           -- System info
    "yad|zenity",                         -- Dialogs
    "wev",                                -- Input detector
    "org.gnome.FileRoller|file-roller",   -- Archive manager
    "blueman-manager",                    -- Bluetooth GUI
    "com.github.GradienceTeam.Gradience", -- GTK themer (deprecated)
    "feh|imv|swappy",                     -- Image viewers
    "org.quickshell",                     -- Quickshell
}, "class")
tagged_rule(float_tag, {
    "File (Operation|Upload)( Progress)?", -- File manager operation progress (upload, move, copy, etc)
    ".* Properties",                       -- File properties
}, "title")
-- 50% x 60%
tagged_rule(float_50_60_tag, {
    "nwg-look",              -- GTK theme manager
    "system-config-printer", -- Printer config
}, "class")


-- Games
tagged_rule(game_tag, {
    "steam_app_[0-9]+",  -- Steam games
    "steam_app_default", -- Lutris games
    "gamescope",         -- Gamescope
}, "class")
-- Xwayland popups
tagged_rule(xwl_popup_tag, {
    { xwayland = true, title = "win[0-9]+" },
    { xwayland = true, title = "",         class = "", initial_title = "", initial_class = "" }
})

-- Steam
tagged_rule(float_tag, { { class = "steam", title = "Friends List" } })
tagged_rule(xwl_popup_tag, { { class = "steam", title = "" } })

-------------------------
---- Tag definitions ----
-------------------------
-- These have to come after all uses of window tagging. Thank you Hyprland...

create_tag(opaque_tag, { opaque = true })
create_tag(float_tag, { float = true })
create_tag(float_50_60_tag, { float = true, size = "(monitor_w*0.5) (monitor_h*0.6)", center = true })
create_tag(float_60_70_tag, { float = true, size = "(monitor_w*0.6) (monitor_h*0.7)", center = true })
create_tag(float_70_80_tag, { float = true, size = "(monitor_w*0.7) (monitor_h*0.8)", center = true })
create_tag(game_tag, { opaque = true, immediate = true, idle_inhibit = "always" })
create_tag(xwl_popup_tag, {
    no_dim = true,
    no_shadow = true,
    no_blur = true,
    opaque = true,
})
-------------------------
---- Tag definitions ----
-------------------------
-- These have to come after all uses of window tagging. Thank you Hyprland...

create_tag(opaque_tag, { opaque = true })
create_tag(float_tag, { float = true })
create_tag(float_50_60_tag, { float = true, size = "(monitor_w*0.5) (monitor_h*0.6)", center = true })
create_tag(float_60_70_tag, { float = true, size = "(monitor_w*0.6) (monitor_h*0.7)", center = true })
create_tag(float_70_80_tag, { float = true, size = "(monitor_w*0.7) (monitor_h*0.8)", center = true })
create_tag(game_tag, { opaque = true, immediate = true, idle_inhibit = "always" })
create_tag(xwl_popup_tag, {
    no_dim = true,
    no_shadow = true,
    no_blur = true,
    opaque = true,
})



hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)
hl.layer_rule({
    name = "noctalia",
    match = {
        namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
    },
    no_anim = true,
    ignore_alpha = 0.5,
    blur = true,
    blur_popups = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

hl.workspace_rule({ workspace = "1", default_name = "multitask", persistent = true, default = true})
hl.workspace_rule({ workspace = "2", default_name = "focus", persistent = true, layout = "master" })
hl.workspace_rule({ workspace = "3", default_name = "gaming", persistent = true, layout = "monocle"  })
hl.workspace_rule({ workspace = "4", persistent = true })
hl.workspace_rule({ workspace = "5", persistent = true })


-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "slave",
        new_status = "true",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        direction = "right",
    },
})
