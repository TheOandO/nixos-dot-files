
-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
        	active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
        	inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "scrolling",
    },

    decoration = {
        rounding       = 12,
        rounding_power = 6,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1,
        inactive_opacity = 0.9,

        shadow = {
            enabled      = false,
        	range        = 4,
        	render_power = 3,
        	color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = false,
        	size      = 6,
        	passes    = 2,
        	vibrancy  = 0.2,
        },
    },
})
