-- awesomewm fancy_taglist: a taglist that contains a tasklist for each tag.
-- Usage:
-- 1. Save as "fancy_taglist.lua" in ~/.config/awesome
-- 2. Add a fancy_taglist for every screen:
--          awful.screen.connect_for_each_screen(function(s)
--              ...
--              local fancy_taglist = require("fancy_taglist")
--              s.mytaglist = fancy_taglist.new({
--                  screen = s,
--                  taglist = { buttons = mytagbuttons },
--                  tasklist = { buttons = mytasklistbuttons }
--              })
--              ...
--          end)
-- 3. Add s.mytaglist to your wibar.
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

local module = {}

local function generate_filter(t)
    return function(c, scr)
        local ctags = c:tags()
        for _, v in ipairs(ctags) do if v == t then return true end end
        return false
    end
end

local function fancy_tasklist(cfg, t)
    local overrides = {
        filter = generate_filter(t),
        layout = {spacing = 0, layout = wibox.layout.fixed.horizontal},
        widget_template = {
            {id = "clienticon", margins = 5, widget = awful.widget.clienticon},
            create_callback = function(self, c, _, _)
                self:get_children_by_id("clienticon")[1].client = c
                awful.tooltip({
                    objects = {self},
                    timer_function = function() return c.name end
                })
            end,
            layout = wibox.layout.align.vertical
        }
    }
    return awful.widget.tasklist(gears.table.join(cfg, overrides))
end

-- @param cfg.screen
-- @param cfg.tasklist -> see awful.widget.tasklist
-- @param cfg.taglist  -> see awful.widget.taglist
function module.new(cfg)
    cfg = cfg or {}
    local taglist_cfg = cfg.taglist or {}
    local tasklist_cfg = cfg.tasklist or {}

    local screen = cfg.screen or awful.screen.focused()
    taglist_cfg.screen = screen
    tasklist_cfg.screen = screen

    local overrides = {
        filter = awful.widget.taglist.filter.all,
        widget_template = {
            {
                {
                    -- margin around each box
                    {
                        -- box around each tag and its tasklist
                        {
                            {
                                -- tag
                                {
                                    id = "text_role",
                                    widget = wibox.widget.textbox,
                                    align = "center"
                                },
                                -- tasklist
                                {
                                    id = "tasklist_placeholder",
                                    layout = wibox.layout.fixed.horizontal
                                },
                                layout = wibox.layout.fixed.horizontal
                            },
                            left = 11,
                            right = 11,
                            widget = wibox.container.margin
                        },
                        shape = gears.shape.rounded_rect,
                        bg = "#d1d5dc",
                        widget = wibox.container.background
                    },
                    left = 3,
                    right = 3,
                    widget = wibox.container.margin
                },
                id = "background_role",
                widget = wibox.container.background
            },
            layout = wibox.layout.fixed.horizontal,
            create_callback = function(self, _, index, _)
                local t = screen.tags[index]
                self:get_children_by_id("tasklist_placeholder")[1]:add(
                    fancy_tasklist(tasklist_cfg, t))
            end
        }
    }
    return awful.widget.taglist(gears.table.join(taglist_cfg, overrides))
end

return module
