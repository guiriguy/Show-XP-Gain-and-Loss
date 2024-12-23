
--╭────────────────────────╮
--|   Native ModOptions    |
--╰────────────────────────╯
-- Thanks to ModOptions guide
SSXP.config = {
    debug   = nil,
    showNumbers  = nil,
    showOnlyPositive = nil,
    showOnlyNegative  = nil,
    showComboBox  = nil,
    positiveColor = nil,
    negativeColor = nil,
    refreshMode = nil,
    skills    = nil,
    seconds    = nil
}
SSXP.PerkTranslation = {}

SSXP.ModOptions = function ()
    local options = PZAPI.ModOptions:create("2891170430", "Simple Show XP")
    options:addSeparator()
    options:addSeparator()
    options:addDescription(getText("IGUI_SSXP_Description"))
    options:addSeparator()
    options:addTitle(getText("IGUI_SSXP_showOptions"))
    --[[[SSXP.config.debug = options:addTickBox(
        "1",
        getText("IGUI_SSXP_debugMode"),
        false,
        getText("IGUI_SSXP_debugMode_tooltip")
    )]]--
    SSXP.config.showNumbers = options:addTickBox(
        "2",
        getText("IGUI_SSXP_showNumbers"),
        true,
        getText("IGUI_SSXP_showNumbers_tooltip")
    )
    --To be converted into a combobox    
    --[[SSXP.config.showOnlyPositive = options:addTickBox(
        "3",
        getText("IGUI_SSXP_showOnlyPositive"),
        false,
        getText("IGUI_SSXP_showOnlyPositive_tooltip")
    )    
    SSXP.config.showOnlyNegative = options:addTickBox(
        "4",
        getText("IGUI_SSXP_showOnlyNegative"),
        false,
        getText("IGUI_SSXP_showOnlyNegative_tooltip")
    )]]--
    SSXP.config.showComboBox = options:addComboBox(
        "5",
        getText("IGUI_SSXP_showPositiveOrNegative"),
        "tooltip" --Tooltip doesn't seem to work
    )
    SSXP.config.showComboBox:addItem("IGUI_SSXP_showBoth",true)
    SSXP.config.showComboBox:addItem(getText("IGUI_SSXP_showOnlyPositive"),false)
    SSXP.config.showComboBox:addItem(getText("IGUI_SSXP_showOnlyNegative"),false)
    SSXP.config.positiveColor = options:addColorPicker(
        "6",
        "IGUI_SSXP_PositiveColor",
        0, --R
        1, --G
        0, --B
        1, --A
        "IGUI_SSXP_PositiveColor_tooltip"
    )
    SSXP.config.negativeColor = options:addColorPicker(
        "7",
        "IGUI_SSXP_NegativeColor",
        1, --R
        0, --G
        0, --B
        1, --A
        "IGUI_SSXP_NegativeColor_tooltip"
    )
    options:addTitle(getText("IGUI_SSXP_refreshingOptions"))
    SSXP.config.refreshMode = options:addComboBox(
        "8",
        "IGUI_SSXP_refreshMode",
        "IGUI_SSXP_refreshMode_tooltip" --Tooltip doesn't seem to work
    )
    SSXP.config.refreshMode:addItem(getText("IGUI_SSXP_refreshMode_1"),false)
    SSXP.config.refreshMode:addItem(getText("IGUI_SSXP_refreshMode_2"),false)
    SSXP.config.refreshMode:addItem(getText("IGUI_SSXP_refreshMode_3"),false)
    SSXP.config.refreshMode:addItem(getText("IGUI_SSXP_refreshMode_4"),false)
    SSXP.config.refreshMode:addItem(getText("IGUI_SSXP_refreshMode_5"),true)
    options:addDescription(getText("IGUI_SSXP_secondsDescription"))
    SSXP.config.seconds = options:addSlider(
        "9",
        getText("IGUI_SSXP_refreshModeSeconds"),
        3, --min
        60, --max
        1, --steps
        3, --defaultValue
        getText("IGUI_SSXP_refreshModeSeconds_tooltip")
    )
    options:addSeparator()    
    SSXP.config.skills = options:addMultipleTickBox(
        "10",
        "IGUI_SSXP_setPerks"
    )
    for perk in pairs(Perks) do
        if 
        perk ~= "class" and
        perk ~= "fromIndex" and
        perk ~= "FromString" and
        perk ~= "getMaxIndex" and
        perk ~= "None" and
        perk ~= "PhysicalCategory" and
        perk ~= "FarmingCategory" and
        perk ~= "MAX" and
        perk ~= "Passiv" and
        perk ~= "new" 
        then
            perk = tostring(perk)
            local perkName = Perks[perk]:getName()
            SSXP.PerkTranslation[perkName] = perk
            if perk == "PlantScavenging" then
                SSXP.config.skills:addTickBox(perkName,false)
            else                
                SSXP.config.skills:addTickBox(perkName,true)
            end
        end
    end
    options:addSeparator()
    options:addSeparator()
end
SSXP.ModOptions()