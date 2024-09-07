require("addon")
local sampev = require("samp.events")

local password = password
local dialog_id = 32700

function sampev.onShowDialog(id, style, title, btn1, btn2, text)
    if id == dialog_id then
        sendDialogResponse(id, 1, -1, password)
        return false
    end
end
