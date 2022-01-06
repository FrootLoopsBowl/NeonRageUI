ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

local isOpen = false
local checkbox = {
    one = false,
    two = false,
    three = false, 
    four = false
}
local list = {
    "Blanc", --1
    "Bleu",
    "Bleu Électrique", --3
    "Vert Menthe",
    "Vert Lime", --5
    "Jaune",
    "Or", --7
    "Orange",
    "Rouge", --9
    "Rose",
    "Rose Chaud", --11
    "Mauve",
    "Mauve Nuit" --13
}
local listIndex = 1

local neonMain = RageUI.CreateMenu("Neon", "Menu Neon")
neonMain.Closed = function()
    isOpen = false
    RageUI.Visible(neonMain, false)
end

function OpenMenuNeon()
    if isOpen then 
        isOpen = false
        RageUI.Visible(neonMain, false)
    else
        isOpen = true
        RageUI.Visible(neonMain, true)
        Citizen.CreateThread(function()
            while isOpen do
                Wait(1)
                RageUI.IsVisible(neonMain, function()
                    RageUI.Checkbox('Neon Avant', description, checkbox.one, {}, {
                        onChecked = function()
                            SettingNeon(true, 2)
                        end,
                        onUnChecked = function()
                            SettingNeon(false, 2)
                        end,
                        onSelected = function(Index)
                            checkbox.one = Index
                        end
                    })
                    RageUI.Checkbox('Neon Arriere', description, checkbox.two, {}, {
                        onChecked = function()
                            SettingNeon(true, 3)
                        end,
                        onUnChecked = function()
                            SettingNeon(false, 3)
                        end,
                        onSelected = function(Index)
                            checkbox.two = Index
                        end
                    })
                    RageUI.Checkbox('Neon Gauche', description, checkbox.three, {}, {
                        onChecked = function()
                            SettingNeon(true, 0)
                        end,
                        onUnChecked = function()
                            SettingNeon(false, 0)
                        end,
                        onSelected = function(Index)
                            checkbox.three = Index
                        end
                    })
                    RageUI.Checkbox('Neon Droit', description, checkbox.four, {}, {
                        onChecked = function()
                            SettingNeon(true, 1)
                        end,
                        onUnChecked = function()
                            SettingNeon(false, 1)
                        end,
                        onSelected = function(Index)
                            checkbox.four = Index
                        end
                    })
                    RageUI.List("Couleur", list, listIndex, nil, {}, true, {
                        onSelected = function()
                            SettingColor(listIndex)
                        end,
                        onListChange = function(Index)
                            listIndex = Index
                        end
                    })
                end)
            end
        end)
    end
end

RegisterCommand("neon", function()
    ESX.TriggerServerCallback('neon:getItem', function(qtty)
        if qtty ~= 0 then
            OpenMenuNeon()
        else
            Notif('Vous n\'avez pas de kit neon')
        end
      end, 'kitneon')
end, false)
