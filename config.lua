config = {}
config.defaults = {
    profile = {
        --Buffs
        --buffsLocation	= { "TOPRIGHT", Minimap, "TOPLEFT", -40, 10 },
        buffsL1			= "TOPRIGHT",
        buffsL2			= "Minimap",
        buffsL3	        = "TOPLEFT",
        buffsL4			= -40,
        buffsL5			= 10,
        buffsScale      = 1,
        buffsPadding    = 5,
        buffsWidth		= 40,
        buffsHeight		= 40,
        buffsMargin		= 5,
        buffsNumCols	= 10,
        buffsStartPoint = "TOPRIGHT",
        buffsRowMargin	= 20,
        --Debuffs
        deBuffsLocation     = { "TOPRIGHT", "WUIBuffFrame", "BOTTOMRIGHT", 0, -10 },
        deBuffsScale		= 1,
        deBuffsPadding	    = 5,
        deBuffsWidth		= 48,
        deBuffsHeight		= 48,
        deBuffsMargin		= 5,
        deBuffsNumCols	    = 8,
        deBuffsStartPoint   = "TOPRIGHT",
        deBuffsRowMargin    = 20,

        --Casting Bar
        castingbaricon          = true,
        castingbariconposition  = 1,
        castingbarpoint         = select(1,CastingBarFrame:GetPoint()),
        castingbarrelativeTo    = select(2,CastingBarFrame:GetPoint()),
        castingbarrelativePoint = select(3,CastingBarFrame:GetPoint()),
        castingbarx             = 0,
        castingbary             = 210,
        castingbarscale         = 1.3,

        --Minimap
        hidemapicon     = true,
        hidenorth       = true,
        hidezoomicons   = true,
        scrollzoom      = true,
        minimapscale    = 1,

        --Misc
        autoscreenshot  = true,
        chat            = true,
        easydelete      = true,
        stats           = true,
        talkinghead     = true,

        --Unitframes
        playerframeclasscolor   = true,
        targetframeclasscolor   = true,
        playerportrait          = true,
        targetportrait          = true,
    
        playerframepoint            = select(1,PlayerFrame:GetPoint()),
        playerframerelativeTo       = select(2,PlayerFrame:GetPoint()),
        playerframerelativePoint    = select(3,PlayerFrame:GetPoint()),
        playerframex                = 395, --select(4,PlayerFrame:GetPoint()),
        playerframey                = -603, --select(5,PlayerFrame:GetPoint()),
        playerframescale            = 1.3, --PlayerFrame:GetScale(),
        targetframepoint            = select(1,TargetFrame:GetPoint()),
        targetframerelativeTo       = select(2,TargetFrame:GetPoint()),
        targetframerelativePoint    = select(3,TargetFrame:GetPoint()),
        targetframex                = 850, --select(4,TargetFrame:GetPoint()),
        targetframey                = -603, --select(5,TargetFrame:GetPoint()),
        targetframescale            = 1.3, --TargetFrame:GetScale(),
    
        raidframescale = 1,

        --Tooltip
        UnitTitle           = true,
		UnitGender          = false,
		UnitStatus          = true,
		UnitRealm           = true,
		RealmLabel          = false,
		GuildRank           = false,
        TargetOfTarget      = true,
        enableSpecText      = true,
        insideBar           = true,

        scaleFactor         = 1.0,
        showServerName      = true,
        enableClassColor    = true,
        --enableGuildColor    = true,
        --enableFactionColor  = true, -- opposite faction
        showUnitHealth      = true,
        healthFont          = STANDARD_TEXT_FONT,
        healthFontSize      = 13, -- 12 and 14 (default)
        healthFontFlags     = 'OUTLINE',
        healthOffsetY       = 0,
    
        anchorToCursor      = false,
        anchorToCursorAlt   = false, -- WorldFrame only
        cursorAnchorPoint   = 'ANCHOR_CURSOR_LEFT', -- '_CURSOR_LEFT', '_CURSOR', '_CURSOR_RIGHT'
        cursorOffsetX       = 0,
        cursorOffsetY       = 0,
        useCustomPosition   = false,
        point               = 'CENTER',
        relativeFrame       = UIParent,
        relativePoint       = 'CENTER',
        offsetX             = 0,
        offsetY             = 0,
    
        hideInCombat        = false, -- for buffs, spells, items, etc. the tooltip remains visible
        showSpellID         = false,
        spellIDText         = GetLocale() == 'ruRU' and 'ID заклинания:' or 'Spell ID:',
        spellIDTextColor    = CreateColor(1, 0.50196, 0), -- LEGENDARY_ORANGE_COLOR, HEIRLOOM_BLUE_COLOR
        
        colorGuildByReaction = true,
        colGuild = "|cff0080cc",
        colSameGuild = "|cffff32ff",
        colRace = "|cffffffff",
        colLevel = "|cffc0c0c0",
    
        colReactText1 = "|cffc0c0c0",
        colReactText2 = "|cffff0000",
        colReactText3 = "|cffff7f00",
        colReactText4 = "|cffffff00",
        colReactText5 = "|cff00ff00",
        colReactText6 = "|cff25c1eb",
        colReactText7 = "|cff808080",
    },
}

options = {
    type = "group",
    name = format("WUI - v%.2f", GetAddOnMetadata("WUI", "Version")),
    handler = WUI,
    args = {

        align = {
            name = "Align",
            desc = "Turn on/off a grid pattern in the UI",
            type = 'group',
            order = 1,
            args = {
                aligntext = {
                    order = 1, type = "description",
                    name = "You also can type /align to turn on/off the grid",
                },
                aligngrid = {
                    order = 2, type = "group", inline = true,
                    name = "",
                    args = {
                        bind = {
                            order = 1, type = "execute", func = function() SlashCmdList["EA"]("align"); InterfaceOptionsFrame_Show(false) end,
                            name = "Align...", desc = format("%s", "\nTurn on/off the grid"),
                        },
                    },
                },
            },
        },

        buffsframe = {
            name = "Buffs",
            desc = "Some changes to the BuffFrame",
            type = 'group',
            order = 1.1,
            args = {
                buffs = {
                    order = 1, type = "group", inline = true,
                    name = "Buffs settings",
                    args = {
                        buffsWidth = {
                            order = 1, type = "range", min = 10, max = 80,
                            name = "Buffs Width", desc = "Size of buffs icons width",
                            get = function(info) return WUI.db.profile.buffsWidth end,
                            set = function(info,val) WUI.db.profile.buffsWidth = val end,
                        },
                        buffsHeight = {
                            order = 2, type = "range", min = 10, max = 80,
                            name = "Buffs Height", desc = "Size of buffs icons height",
                            get = function(info) return WUI.db.profile.buffsHeight end,
                            set = function(info,val) WUI.db.profile.buffsHeight = val end,
                        },
                        buffsNumCols = {
                            order = 3, type = "range", min = 1, max = 10, step = 1,
                            name = "Buffs Num Columns", desc = "Number of columns of the BuffFrame",
                            get = function(info) return WUI.db.profile.buffsNumCols end,
                            set = function(info,val) WUI.db.profile.buffsNumCols = val end,
                        },
                    },
                },
                debuffs = {
                    order = 2, type = "group", inline = true,
                    name = "DeBuffs settings",
                    args = {
                        deBuffsWidth = {
                            order = 1, type = "range", min = 10, max = 80,
                            name = "DeBuffs Width", desc = "Size of debuffs icons width",
                            get = function(info) return WUI.db.profile.deBuffsWidth end,
                            set = function(info,val) WUI.db.profile.deBuffsWidth = val end,
                        },
                        deBuffsHeight = {
                            order = 2, type = "range", min = 10, max = 80,
                            name = "DeBuffs Height", desc = "Size of debuffs icons height",
                            get = function(info) return WUI.db.profile.deBuffsHeight end,
                            set = function(info,val) WUI.db.profile.deBuffsHeight = val end,
                        },
                        deBuffsNumCols = {
                            order = 3, type = "range", min = 1, max = 10, step = 1,
                            name = "DeBuffs Num Columns", desc = "Number of columns of the deBuffFrame",
                            get = function(info) return WUI.db.profile.deBuffsNumCols end,
                            set = function(info,val) WUI.db.profile.deBuffsNumCols = val end,
                        },
                    },
                },
                reloadbuffs = {
                    order = 6, type = "group", inline = true,
                    name = "",
                    args = {
                        reload = {
                            order = 1, type = "execute", func = function() ReloadUI() end, confirm = true,
                            name = "Reload UI", desc = format("%s", "\nTo these settings take effect, you need to reload user interface"),
                        },
                    },
                },
            },
        },
        
        castingbar = {
            name = "Casting Bar",
            desc = "Changes to the casting bar",
            type = 'group',
            order = 2,
            args = {
                castingbaricon = {
                    order = 1, type = "toggle",
                    name = "Casting Bar Icon", desc = "Show the casting bar icon",
                    get = function(info) return WUI.db.profile.castingbaricon end,
                    set = function(info,val) WUI.db.profile.castingbaricon = val end,
                },
                castingbariconposition = {
                    order = 2, type = "select",
                    name = "Casting Bar Icon Position",
                    desc = "Position of the icon relative to the casting bar",
                    get = function ()
                        return WUI.db.profile.castingbariconposition
                    end,
                    set = function (info, newValue)
                        WUI.db.profile.castingbariconposition = newValue; 
                    end,
                    style = "dropdown",
                    values = {"Left", "Inside", "Right"},
                    disabled = function () 
                        return WUI.db.profile.castingbaricon == false;
                    end,
                },
                castingbartweaks = {
                    order = 3, type = "group", inline = true,
                    name = "Casting Bar Tweaks",
                    args = {
                        castingbarx = {
                            order = 1, type = "range", min =  -(floor(tonumber(GetScreenWidth())) / 4) , max = floor(tonumber(GetScreenWidth())) / 4, step = 1, bigStep = 10,
                            name = "Casting Bar X", desc = "Casting bar X position",
                            get = function(info) return WUI.db.profile.castingbarx end,
                            set = function(info,val)
                                WUI.db.profile.castingbarx = val
                                CastingBar:CastingBarUpdate()
                            end,
                        },
                        castingbary = {
                            order = 2, type = "range", min = 0, max = (floor(tonumber(GetScreenHeight())) /2), step = 1, bigStep = 10,
                            name = "Casting Bar Y", desc = "Casting bar Y position",
                            get = function(info) return WUI.db.profile.castingbary end,
                            set = function(info,val)
                                WUI.db.profile.castingbary = val
                                CastingBar:CastingBarUpdate()
                            end,
                        },
                        castingbarscale = {
                            order = 3, type = "range", min = 0.1, max = 2.0,
                            name = "Casting Bar Scale", desc = "Casting bar scale",
                            get = function(info) return WUI.db.profile.castingbarscale end,
                            set = function(info,val)
                                WUI.db.profile.castingbarscale = val
                                CastingBar:CastingBarUpdate()
                            end,
                        },
                        reloadcastingbar = {
                            order = 4, type = "group", inline = true,
                            name = "",
                            args = {
                                reload = {
                                    order = 1, type = "execute", func = function() ReloadUI() end, confirm = true,
                                    name = "Reload UI", desc = format("%s", "\nTo these settings take effect, you need to reload user interface"),
                                },
                            },
                        },
                    },
                },
            },
        },

        --local LibKeyBound = LibStub('LibKeyBound-1.0')
        --LibKeyBound:Toggle()
        keybind = {
            name = "Keybind",
            desc = "Change Actionbars Keybinds",
            type = 'group',
            order = 3,
            args = {
                bindtext = {
                    order = 1, type = "description",
                    name = "You also can type /kb to bind keys",
                },
                bindmode = {
                    order = 2, type = "group", inline = true,
                    name = "",
                    args = {
                        bind = {
                            order = 1, type = "execute", func = function() local LibKeyBound = LibStub('LibKeyBound-1.0'); LibKeyBound:Toggle(); InterfaceOptionsFrame_Show(false) end,
                            name = "Bind keys...", desc = format("%s", "\nEnter binding key mode"),
                        },
                    },
                },
            },
        },

        minimap = {
            name = "Minimap",
            desc = "Some changes to the Minimap",
            type = 'group',
            order = 4,
            args = {
                hidemapicon = {
                    order = 1, type = "toggle",
                    name = "Hide Map Icon", desc = "Hides the map icon",
                    get = function(info) return WUI.db.profile.hidemapicon end,
                    set = function(info,val)
                        WUI.db.profile.hidemapicon = val
                        Mini:HideMapIcon()
                    end,
                },
                hidenorth = {
                    order = 2, type = "toggle",
                    name = "Hide North", desc = "Hides north indicator",
                    get = function(info) return WUI.db.profile.hidenorth end,
                    set = function(info,val)
                        WUI.db.profile.hidenorth = val
                        Mini:HideNorth()
                    end,
                },
                hidezoomicons = {
                    order = 3, type = "toggle",
                    name = "Hide Zoom Icons", desc = "Hides the zoom + - icons",
                    get = function(info) return WUI.db.profile.hidezoomicons end,
                    set = function(info,val)
                        WUI.db.profile.hidezoomicons = val
                        Mini:HideZoomIcons()
                    end,
                },
                scrollzoom = {
                    order = 4, type = "toggle",
                    name = "Enable Scrool Zoom", desc = "Enables scroll zoom in minimap",
                    get = function(info) return WUI.db.profile.scrollzoom end,
                    set = function(info,val)
                        WUI.db.profile.scrollzoom = val
                        Mini:ScrollZoom()
                    end,
                },
                spacer = {
                order = 4.5, type = "description",
                name = "",
                },
                minimapscale = {
                    order = 5, type = "range", min = 0.1, max = 2,
                    name = "Minimap Scale", desc = "Change minimap scale",
                    get = function(info) return WUI.db.profile.minimapscale end,
                    set = function(info,val)
                        WUI.db.profile.minimapscale = val
                        Mini:MinimapScale()
                    end,
                },
            },
        },

        misc = {
            name = "Miscellaneous",
            desc = "Some quality of life options",
            type = 'group',
            order = 5,
            args = {
                autoscreenshot = {
                    order = 1, type = "toggle",
                    name = "Auto Screenshot", desc = "Automatically triggers screenshot when receiving achievements",
                    get = function(info) return WUI.db.profile.autoscreenshot end,
                    set = function(info,val) WUI.db.profile.autoscreenshot = val end,
                },
                chat = {
                    order = 2, type = "toggle",
                    name = "Chat", desc = "Some modifications to the chat",
                    get = function(info) return WUI.db.profile.chat end,
                    set = function(info,val) WUI.db.profile.chat = val end,
                },
                easydelete = {
                    order = 3, type = "toggle",
                    name = "Easy Delete", desc = "Supress [Type DELETE into the field to confirm] on deleting itens (disable will reload ui)",
                    get = function(info) return WUI.db.profile.easydelete end,
                    set = function(info,val) WUI.db.profile.easydelete = val end,
                },
                stats = {
                    order = 4, type = "toggle",
                    name = "Stats", desc = "Show a bar with fps/ms statistics",
                    get = function(info) return WUI.db.profile.stats end,
                    set = function(info,val)
                        WUI.db.profile.stats = val
                        Stats:UpdateStats()
                    end,
                },
                talkinghead = {
                    order = 5, type = "toggle",
                    name = "Talking Head", desc = "Hides the talking head frame",
                    get = function(info) return WUI.db.profile.talkinghead end,
                    set = function(info,val) WUI.db.profile.talkinghead = val end,
                },
                reloadmisc = {
                    order = 6, type = "group", inline = true,
                    name = "",
                    args = {
                        reload = {
                            order = 1, type = "execute", func = function() ReloadUI() end, confirm = true,
                            name = "Reload UI", desc = format("%s", "\nTo some settings take effect, you need to reload user interface"),
                        },
                    },
                },
            },
        },

        tooltip = {
            name = "ToolTip",
            desc = "Change the anchor of the tooltip",
            type = 'group',
            order = 6,
            args = {
                enableClassColor = {
                    order = 1, type = "toggle",
                    name = "Color", desc = "Change tooltip border from player, target, npc, item quality, etc, to match color",
                    get = function(info) return WUI.db.profile.enableClassColor end,
                    set = function(info,val) WUI.db.profile.enableClassColor = val end,
                },
                UnitTitle = {
                    order = 2, type = "toggle",
                    name = "Title", desc = "Show/Hide title",
                    get = function(info) return WUI.db.profile.UnitTitle end,
                    set = function(info,val) WUI.db.profile.UnitTitle = val end,
                },
                UnitGender = {
                    order = 3, type = "toggle",
                    name = "Gender", desc = "Show/Hide gender",
                    get = function(info) return WUI.db.profile.UnitGender end,
                    set = function(info,val) WUI.db.profile.UnitGender = val end,
                },
                UnitStatus = {
                    order = 4, type = "toggle",
                    name = "Status", desc = "Show/Hide status <AFK> <DND>",
                    get = function(info) return WUI.db.profile.UnitStatus end,
                    set = function(info,val) WUI.db.profile.UnitStatus = val end,
                },
                UnitRealm = {
                    order = 5, type = "toggle",
                    name = "Realm", desc = "Show/Hide realm",
                    get = function(info) return WUI.db.profile.UnitRealm end,
                    set = function(info,val) WUI.db.profile.UnitRealm = val end,
                },
                RealmLabel = {
                    order = 6, type = "toggle",
                    name = "Realm Label", desc = "Show/Hide realm label",
                    get = function(info) return WUI.db.profile.RealmLabel end,
                    set = function(info,val) WUI.db.profile.RealmLabel = val end,
                },
                GuildRank = {
                    order = 7, type = "toggle",
                    name = "Guild Rank", desc = "Show/Hide guild rank",
                    get = function(info) return WUI.db.profile.GuildRank end,
                    set = function(info,val) WUI.db.profile.GuildRank = val end,
                },
                colorGuildByReaction = {
                    order = 8, type = "toggle",
                    name = "Guild Color by Reaction", desc = "Color guild name by reaction",
                    get = function(info) return WUI.db.profile.colorGuildByReaction end,
                    set = function(info,val) WUI.db.profile.colorGuildByReaction = val end,
                },
                TargetOfTarget = {
                    order = 9, type = "toggle",
                    name = "Target of Target", desc = "Show/Hide target of target",
                    get = function(info) return WUI.db.profile.TargetOfTarget end,
                    set = function(info,val) WUI.db.profile.TargetOfTarget = val end,
                },
                enableSpecText = {
                    order = 10, type = "toggle",
                    name = "Talents Text", desc = "Show/Hide talent spec in tooltip",
                    get = function(info) return WUI.db.profile.enableSpecText end,
                    set = function(info,val) WUI.db.profile.enableSpecText = val end,
                },
                showUnitHealth = {
                    order = 11, type = "toggle",
                    name = "Show Health Text", desc = "Show/Hide tooltip health text",
                    get = function(info) return WUI.db.profile.showUnitHealth end,
                    set = function(info,val) WUI.db.profile.showUnitHealth = val end,
                },
                insideBar = {
                    order = 12, type = "toggle",
                    name = "Health Bar Inside", desc = "Place tooltip health bar inside tooltip (will reload ui)",
                    get = function(info) return WUI.db.profile.insideBar end,
                    set = function(info,val) WUI.db.profile.insideBar = val, ReloadUI() end,
                },
                tooltipHeader2 = {
                    order = 13, type = "header",
                    name = "", desc = "",
                    get = function(info) return WUI.db.profile.HideCombat end,
                    set = function(info,val) WUI.db.profile.HideCombat = val end,
                },
                hideInCombat = {
                    order = 14, type = "toggle",
                    name = "Hide in Combat", desc = "Hide tooltip when in combat",
                    get = function(info) return WUI.db.profile.hideInCombat end,
                    set = function(info,val) WUI.db.profile.hideInCombat = val end,
                },
                showSpellID = {
                    order = 15, type = "toggle",
                    name = "Show Spell Id", desc = "Show spell id in tooltip",
                    get = function(info) return WUI.db.profile.showSpellID end,
                    set = function(info,val) WUI.db.profile.showSpellID = val end,
                },
                tooltipHeader3 = {
                    order = 16, type = "header",
                    name = "Tooltip Anchor", desc = "",
                    get = function(info) return WUI.db.profile.HideCombat end,
                    set = function(info,val) WUI.db.profile.HideCombat = val end,
                },
                useCustomPosition = {
                    order = 17, type = "toggle",
                    name = "Anchor to Custom Position", desc = "Anchor tooltip to a custom position",
                    get = function(info) return WUI.db.profile.useCustomPosition end,
                    set = function(info,val) WUI.db.profile.useCustomPosition = val end,
                },
                anchorToCursor = {
                    order = 18, type = "toggle",
                    name = "Anchor to Cursor", desc = "Anchor tooltip to cursor",
                    get = function(info) return WUI.db.profile.anchorToCursor end,
                    set = function(info,val) WUI.db.profile.anchorToCursor = val end,
                },
                tooltipanchor = {
                    order = 19, type = "group", inline = true,
                    name = "",
                    args = {
                        show_anchor = {
                            order = 1, type = "execute", func = function() DragFrame2:Show(); InterfaceOptionsFrame_Show(false) end,
                            name = "Show Anchor", desc = format("%s", "\nShow a moveble box where tooltip can be anchored"),
                        },
                    },
                },
            },
        },

        unitframes = {
            name = "UnitFrames",
            desc = "Some changes to the UnitFrames",
            type = 'group',
            order = 7,
            args = {    
                playerframeclasscolor = {
                    order = 1, type = "toggle",
                    name = "Player Class Color", desc = "Change health bar color of player frame to class color",
                    get = function(info) return WUI.db.profile.playerframeclasscolor end,
                    set = function(info,val)
                        WUI.db.profile.playerframeclasscolor = val
                        UnitFrames:PlayerFrameClassColor()
                    end,
                },
                targetframeclasscolor = {
                    order = 2, type = "toggle",
                    name = "Target Class Color", desc = "Change health bar color of target frame to class color",
                    get = function(info) return WUI.db.profile.targetframeclasscolor end,
                    set = function(info,val)
                        WUI.db.profile.targetframeclasscolor = val
                        UnitFrames:TargetFrameClassColor()
                    end,
                },
                playerportrait = {
                    order = 3, type = "toggle",
                    name = "Player Class Icon Portrait", desc = "Change the player frame portrait to class icon",
                    get = function(info) return WUI.db.profile.playerportrait end,
                    set = function(info,val)
                        WUI.db.profile.playerportrait = val
                        UnitFrames:PlayerPortrait()
                    end,
                },
                targetportrait = {
                    order = 4, type = "toggle",
                    name = "Target Class Icon Portrait", desc = "Change the target frame portrait to class icon",
                    get = function(info) return WUI.db.profile.targetportrait end,
                    set = function(info,val)
                        WUI.db.profile.targetportrait = val
                        UnitFrames:TargetPortrait()
                    end,
                },
                playerframestweaks = {
                    order = 5, type = "group", inline = true,
                    name = "Player Frames Tweaks",
                    args = {
                        playerframex = {
                            order = 1, type = "range", min = 0, max = floor(tonumber(GetScreenWidth())), step = 1, bigStep = 10,
                            name = "Player Frame X", desc = "Change player frame X position",
                            get = function(info) return WUI.db.profile.playerframex end,
                            set = function(info,val)
                                WUI.db.profile.playerframex = val
                                UnitFrames:PlayerFrame()
                            end,
                        },
                        playerframey = {
                            order = 2, type = "range", min = -(floor(tonumber(GetScreenHeight()))), max = 0, step = 1, bigStep = 10,
                            name = "Player Frame Y", desc = "Change player frame Y position",
                            get = function(info) return WUI.db.profile.playerframey end,
                            set = function(info,val)
                                WUI.db.profile.playerframey = val
                                UnitFrames:PlayerFrame()
                            end,
                        },
                        playerframescale = {
                            order = 3, type = "range", min = 0.1, max = 2.0,
                            name = "Player Frame Scale", desc = "Change player frame scale",
                            get = function(info) return WUI.db.profile.playerframescale end,
                            set = function(info,val)
                                WUI.db.profile.playerframescale = val
                                UnitFrames:PlayerFrame()
                            end,
                        },
                    },
                },
                targetframestweaks = {
                    order = 6, type = "group", inline = true,
                    name = "Target Frames Tweaks",
                    args = {
                        targetframex = {
                            order = 1, type = "range", min = 0, max = floor(tonumber(GetScreenWidth())), step = 1, bigStep = 10,
                            name = "Target Frame X", desc = "Change target frame X position",
                            get = function(info) return WUI.db.profile.targetframex end,
                            set = function(info,val)
                                WUI.db.profile.targetframex = val
                                UnitFrames:TargetFrame()
                            end,
                        },
                        targetframey = {
                            order = 2, type = "range", min = -(floor(tonumber(GetScreenHeight()))), max = 500, step = 1, bigStep = 10,
                            name = "Target Frame Y", desc = "Change target frame Y position",
                            get = function(info) return WUI.db.profile.targetframey end,
                            set = function(info,val)
                                WUI.db.profile.targetframey = val
                                UnitFrames:TargetFrame()
                            end,
                        },
                        targetframescale = {
                            order = 3, type = "range", min = 0.1, max = 2.0,
                            name = "Target Frame Scale", desc = "Change target frame scale",
                            get = function(info) return WUI.db.profile.targetframescale end,
                            set = function(info,val)
                                WUI.db.profile.targetframescale = val
                                UnitFrames:TargetFrame()
                            end,
                        },
                    },
                },
                raidframescale = {
                    order = 7, type = "range", min = 0.1, max = 2,
                    name = "Raid Frame Scale", desc = "Change raid frame scale",
                    get = function(info) return WUI.db.profile.raidframescale end,
                    set = function(info,val)
                        WUI.db.profile.raidframescale = val
                        UnitFrames:RaidFrameScale()
                    end,
                },
            },
        },
    },
}