local QBCore = exports['qb-core']:GetCoreObject()
local AmountGiveMoney = 25 -- Amount given to the player

-- QBCore.Commands.Add('testvote', '(Admin) Simulation de vote top serveur', {}, false, function(source, args) -- Simulation of a top server vote
    -- TriggerEvent('onPlayerVote', "Walter Paterson") - Change “Walter Paterson” to your IG character’s first name
-- end, 'god')


AddEventHandler('onPlayerVote', function (playername, ip, date)
    -- print(playername)
    -- print(ip)
    -- print(date)

    local PlayerFounded = false
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if playername == (v.PlayerData.charinfo.firstname .. ' ' .. v.PlayerData.charinfo.lastname) then 
            PlayerFounded = true
            local Player = QBCore.Functions.GetPlayer(k)
            if Player then 
                TriggerClientEvent('QBCore:Notify', k, "~y~Merci d'avoir voté ! Voici "..AmountGiveMoney.."€ afin de te remercier de ta contribution ")
                Player.Functions.AddMoney('bank', AmountGiveMoney)
            end
        end
    end

    if not PlayerFounded then 
        MySQL.Async.fetchAll('SELECT citizenid, charinfo, money FROM players', {}, function(result)
            for k,v in pairs(result) do
                if string.find(string.lower((json.decode(v.charinfo).firstname..' '..json.decode(v.charinfo).lastname)), string.lower(playername)) then       

                    CitizenID = v.citizenid
                    playermoney = json.encode(json.decode(v.money).bank)
                    playermoney = math.floor(playermoney + AmountGiveMoney)

                    local NewBDD = json.decode(v.money)
                    NewBDD['bank'] = playermoney
                    
                    Wait(100)
                    local update = MySQL.update('UPDATE players SET money = ? WHERE citizenid = ?', {json.encode(NewBDD), CitizenID})
                end
            end
            
        end)
    end

    LogsVote(playername, ip, date)
end)


function LogsVote(playername, ip, date) -- If you wish to have voting logs (Date, IP and player name)

    local DiscordWebHook = "https://discord.com/api/webhooks/" 
    local embeds = {
        {
            ["title"]= "Vote Top Serveur",
            ["fields"] = {
                { name = "• Nom du joueur :", value = playername},
                { name = "• IP :", value = ip or 'Inconnu'},
                { name = "• Date :", value = date or 'Inconnu'},
            },
            ["color"] = 16753920, -- https://www.colorhexa.com/30ff00
        }
    }
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = username,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end