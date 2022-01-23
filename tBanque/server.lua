ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent(":TomN | C-host.fr::deposer")
AddEventHandler(":TomN | C-host.fr::deposer", function(money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money
    local xMoney = xPlayer.getMoney()
    
    if xMoney >= total then

    xPlayer.addAccountMoney('bank', total)
    xPlayer.removeMoney(total)
 
         TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'Banque', "Vous avez deposé ~g~"..total.."$~s~ à la banque !", 'CHAR_BANK_FLEECA', 10)
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d\'argent~s~ !")
    end    
end) 

RegisterServerEvent(":TomN | C-host.fr::retirer")
AddEventHandler(":TomN | C-host.fr::retirer", function(money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money
    local xMoney = xPlayer.getBank()
    
    if xMoney >= total then

    xPlayer.removeAccountMoney('bank', total)
    xPlayer.addMoney(total)
 
         TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'Banque', "Vous avez retiré ~g~"..total.."$~s~ de la banque !", 'CHAR_BANK_FLEECA', 10)
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d\'argent~s~ !")
    end    
end) 

RegisterServerEvent(":TomN | C-host.fr::solde") 
AddEventHandler(":TomN | C-host.fr::solde", function(action, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerMoney = xPlayer.getBank()

    TriggerClientEvent(":TomN | C-host.fr::solderefresh", source, playerMoney)
end)

RegisterServerEvent(":TomN | C-host.fr::poche") 
AddEventHandler(":TomN | C-host.fr::poche", function(action, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerPoche = xPlayer.getMoney()

    TriggerClientEvent(":TomN | C-host.fr::pocherefresh", source, playerPoche)
end)