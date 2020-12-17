ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local mafijee = 0
for k,v in pairs(Config.Mafije) do
	TriggerEvent('esx_society:registerSociety', k, k, 'society_' .. k, 'society_'..k, 'society_'..k, {type = 'public'})
	mafijee = mafijee + 1
end

print('[^1sync_mafije^0]: Developed by ^7sogolisica^0 and ^5sync^0 | Loaded ^4' .. mafijee .. '^0 mafias')


-----------------------
-----CALLBACKOVI-------
-----------------------
ESX.RegisterServerCallback('sync_mafije:getOtherPlayerData', function(source, cb, target)
		local xPlayer = ESX.GetPlayerFromId(target)
		local data = {
			name      = GetPlayerName(target),
			job       = xPlayer.job,
			inventory = xPlayer.inventory,
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout
		}
	cb(data)
end)

ESX.RegisterServerCallback('sync_mafije:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory
	cb({items = items})
end)

-----------------------
-------EVENTOVI--------
-----------------------
RegisterServerEvent('sync_mafije:oduzmiItem')
AddEventHandler('sync_mafije:oduzmiItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		if targetItem.count > 0 and targetItem.count <= amount then

			if sourceXPlayer.canCarryItem(itemName. amount) then
				targetXPlayer.removeInventoryItem(itemName, amount)
				sourceXPlayer.addInventoryItem(itemName, amount)

				sourceXPlayer.showNotification(_U('you_confiscated', amount, sourceItem.label, targetXPlayer.name))
				targetXPlayer.showNotification(_U('got_confiscated', amount, sourceItem.label, sourceXPlayer.name))
				--TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated', amount, sourceItem.label, targetXPlayer.name))
				--TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated', amount, sourceItem.label, sourceXPlayer.name))
			else				
				--TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
				sourceXPlayer.showNotification(_U('quantity_invalid'))
			end
		else
			--TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			sourceXPlayer.showNotification(_U('quantity_invalid'))
		end

	elseif itemType == 'item_account' then
		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney(itemName, amount)

		--TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_account', amount, itemName, targetXPlayer.name))
		sourceXPlayer.showNotification(_U('you_confiscated_account', amount, itemName, targetXPlayer.name))
		targetXPlayer.showNotification(_U('got_confiscated_account', amount, itemName, targetXPlayer.name))
		--TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_account', amount, itemName, sourceXPlayer.name))

	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeWeapon(itemName, amount)
		sourceXPlayer.addWeapon(itemName, amount)

		sourceXPlayer.showNotification(_U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount))
		targetXPlayer.showNotification(_U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name))
		--TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount))
		--TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name))
	end
end)

RegisterServerEvent('sync_mafije:vezivanje')
AddEventHandler('sync_mafije:vezivanje', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('sync_mafije:vezivanje', target)
end)

RegisterServerEvent('sync_mafije:vuci')
AddEventHandler('sync_mafije:vuci', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('sync_mafije:vuci', target, source)
end)

RegisterServerEvent('sync_mafije:staviUVozilo')
AddEventHandler('sync_mafije:staviUVozilo', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('sync_mafije:staviUVozilo', target)
end)

RegisterServerEvent('sync_mafije:staviVanVozila')
AddEventHandler('sync_mafije:staviVanVozila', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('sync_mafije:staviVanVozila', target)
end)

RegisterServerEvent('sync_mafije:poruka')
AddEventHandler('sync_mafije:poruka', function(target, msg)
	TriggerClientEvent('esx:showNotification', target, msg)

end)



ESX.RegisterServerCallback('sync_mafije:dbGettajPuske', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local org = xPlayer.job.name
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_' .. org, function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('sync_mafije:staviUoruzarnicu', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)
	local org = xPlayer.job.name

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_' .. org, function(store)
		local weapons = store.get('weapons') or {}
		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('sync_mafije:izvadiIzOruzarnice', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local org = xPlayer.job.name

	xPlayer.addWeapon(weaponName, 500)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_' .. org, function(store)
		local weapons = store.get('weapons') or {}

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('sync_mafije:kupiOruzje', function(source, cb, weaponName, type, componentNum)
	local xPlayer = ESX.GetPlayerFromId(source)
	local org = xPlayer.job.name
	local authorizedWeapons, selectedWeapon = Config.Oruzje[xPlayer.job.grade_name]

	for k,v in ipairs(authorizedWeapons) do
		if v.weapon == weaponName then
			selectedWeapon = v
			break
		end
	end

	if not selectedWeapon then
		print(('sync_mafije: %s je pokusao kupiti krivu pusku!'):format(xPlayer.identifier))
		xPlayer.kick('You have been kicked from this server for exploiting!')
		cb(false)
	else
		if type == 1 then
			if xPlayer.getMoney() >= selectedWeapon.price then
				xPlayer.removeMoney(selectedWeapon.price)
				xPlayer.addWeapon(weaponName, 100)

				cb(true)
			else
				cb(false)
			end
		elseif type == 2 then
			local price = selectedWeapon.components[componentNum]
			local weaponNum, weapon = ESX.GetWeapon(weaponName)
			local component = weapon.components[componentNum]

			if component then
				if xPlayer.getMoney() >= price then
					xPlayer.removeMoney(price)
					xPlayer.addWeaponComponent(weaponName, component.name)

					cb(true)
				else
					cb(false)
				end
			else
				print(('sync_mafije: %s je pokusao kupiti krivi dodatak.'):format(xPlayer.identifier))
				xPlayer.kick('You have been kicked from this server for exploiting!')
			end
		end
	end
end)
