require("addon")

local encoding = require('encoding')
local effil = require('effil')
local samp = require('samp.events')

local Telegram = require('dolbogram')
local bot = Telegram("7214150830:AAEJqq0ayfvhY8SvY7_NNS2ffVK1g45Kmh0")

encoding.default = 'CP1251'
u8 = encoding.UTF8

CHAT_ID = 5612679983

function samp.onServerMessage(color, text)
    local formattedText = text:gsub("{%x+}", "")
    telegramMessageAll(formattedText)
end

function telegramMessageAll(text)
    bot:sendMessage{chat_id = CHAT_ID, text = u8(text)}
end

function getCommand(message)
    assert(message)
    local cmd, arg = nil, nil
    if string.find(message, "^/.+") then
        cmd = string.match(message, "^/([^%s]+)")
        arg = string.match(message, "^/[^%s]+ (.+)")
    end
    return cmd, arg
end

bot:connect()

bot:on('ready', function(data)
    print("Bot started") -- maybe change for your text
end)

bot:on('message', function(message)
    if message.text then
        local command, arg = getCommand(message.text)
        if command == "send" and message.from.id == CHAT_ID then -- elif command == "your_command" for add new command
            sendInput(u8:decode(arg))
        end
    end
end)
