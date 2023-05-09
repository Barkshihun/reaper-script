local takeD_PITCHTable = {}
for i = 0, reaper.CountSelectedMediaItems(0) - 1 do
    local item = reaper.GetSelectedMediaItem(0, i)
    local take = reaper.GetActiveTake(item)
    local takeD_PITCH = reaper.GetMediaItemTakeInfo_Value(take, "D_PITCH")
    table.insert(takeD_PITCHTable, takeD_PITCH)
end
local string = ""
for i, v in ipairs(takeD_PITCHTable) do
    string = string .. v .. ","
end
string = string .. "=rP*1>"

if reaper.APIExists("CF_SetClipboard") then
    reaper.CF_SetClipboard(string)
    reaper.Undo_BeginBlock2(0)
    reaper.Undo_EndBlock2(0, "피치를 복사", -1)
else
    reaper.ReaScriptError("Requires extension, SWS v2.12.1 or later.\n")
end
