local type_drains = require("tables")

local function enabled(name)
    local setting = settings.startup[name]
    return setting and setting.value or false
end

local function radar_has_extra_scan_range(radar)
    local scan = radar.max_distance_of_sector_revealed or 0
    local vision = radar.max_distance_of_nearby_sector_revealed or 0
    return scan > vision
end

-- Only supported electric prototypes are modified. Void/burner sources retain
-- their original usage and scan costs, including prototypes from other mods.
for entity_type, options in pairs(type_drains) do
    for _, prototype in pairs(data.raw[entity_type] or {}) do
        local source = prototype.energy_source
        if type(source) == "table" and source.type == "electric" then
            local selected = enabled("remove-drain-" .. entity_type)
            if entity_type == "radar" then
                selected = selected or (enabled("remove-drain-radar-only-if-no-scan")
                    and not radar_has_extra_scan_range(prototype))
            end
            if selected then
                source.drain = "0W"
                if prototype.energy_usage and options.remove_usage then
                    prototype.energy_usage = (entity_type == "radar" or entity_type == "beacon") and "1W" or "0W"
                    if entity_type == "radar" then
                        prototype.energy_per_nearby_scan = "1J"
                        prototype.energy_per_sector = "30J"
                    end
                end
            end
        end
    end
end
