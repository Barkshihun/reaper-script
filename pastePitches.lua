local D_PITCH = "D_PITCH"
function splitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

if not reaper.APIExists("CF_GetClipboard") then
    reaper.ReaScriptError("Requires extension, SWS v2.12.1 or later.\n")
    return
end

local countSelectedMediaItems = reaper.CountSelectedMediaItems(0)
if countSelectedMediaItems == 0 then
    return
end

local clipboard = reaper.CF_GetClipboard("")
local result = splitString(clipboard, ",")
if result[#result] ~= "=rP*1>" then
    reaper.ShowConsoleMsg("피치를 복사해주세요\n")
    return
end

reaper.Undo_BeginBlock2(0)
for i = 0, countSelectedMediaItems - 1 do
    if i + 1 > #result - 1 then
        break
    end
    local item = reaper.GetSelectedMediaItem(0, i)
    local take = reaper.GetActiveTake(item)
    if take then
        reaper.SetMediaItemTakeInfo_Value(take, D_PITCH, result[i + 1])
    end
end
reaper.UpdateArrange()
reaper.Undo_EndBlock2(0, "피치 붙여넣음", -1)
