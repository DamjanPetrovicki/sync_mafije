ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- ESX.RegisterServerCallback('sogo_mafia:getArmoryWeapons', function(source, cb)
-- 	TriggerEvent('esx_datastore:getSharedDataStore', 'society_' .. xPlayer.job.name, function(store)
-- 		local weapons = store.get('weapons')

-- 		if weapons == nil then
-- 			weapons = {}
-- 		end

-- 		cb(weapons)
-- 	end)
-- end)



-- ESX.RegisterServerCallback('sogo_mafia:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
-- 	local xPlayer = ESX.GetPlayerFromId(source)

-- 	if removeWeapon then
-- 		xPlayer.removeWeapon(weaponName)
-- 	end

-- 	TriggerEvent('esx_datastore:getSharedDataStore', 'society_' .. xPlayer.job.name, function(store)
-- 		local weapons = store.get('weapons') or {}
-- 		local foundWeapon = false

-- 		for i=1, #weapons, 1 do
-- 			if weapons[i].name == weaponName then
-- 				weapons[i].count = weapons[i].count + 1
-- 				foundWeapon = true
-- 				break
-- 			end
-- 		end

-- 		if not foundWeapon then
-- 			table.insert(weapons, {
-- 				name  = weaponName,
-- 				count = 1
-- 			})
-- 		end

-- 		store.set('weapons', weapons)
-- 		cb()
-- 	end)
-- end)


-- ESX.RegisterServerCallback('sogo_mafia:removeArmoryWeapon', function(source, cb, weaponName)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
-- 	xPlayer.addWeapon(weaponName, 500)

-- 	TriggerEvent('esx_datastore:getSharedDataStore', 'society_' .. xPlayer.job.name, function(store)
-- 		local weapons = store.get('weapons') or {}

-- 		local foundWeapon = false

-- 		for i=1, #weapons, 1 do
-- 			if weapons[i].name == weaponName then
-- 				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
-- 				foundWeapon = true
-- 				break
-- 			end
-- 		end

-- 		if not foundWeapon then
-- 			table.insert(weapons, {
-- 				name = weaponName,
-- 				count = 0
-- 			})
-- 		end

-- 		store.set('weapons', weapons)
-- 		cb()
-- 	end)
-- end)


-- ESX.RegisterServerCallback('sogo_mafia:buyWeapon', function(source, cb, weaponName, type, componentNum)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
-- 	local authorizedWeapons, selectedWeapon = Config.Oruzje[xPlayer.job.grade_name]

-- 	for k,v in ipairs(authorizedWeapons) do
-- 		if v.weapon == weaponName then
-- 			selectedWeapon = v
-- 			break
-- 		end
-- 	end

-- 	if not selectedWeapon then
-- 		print(('sogo_mafia: %s attempted to buy an invalid weapon.'):format(xPlayer.identifier))
-- 		cb(false)
-- 	else
-- 		-- Weapon
-- 		if type == 1 then
-- 			if xPlayer.getMoney() >= selectedWeapon.price then
-- 				xPlayer.removeMoney(selectedWeapon.price)
-- 				xPlayer.addWeapon(weaponName, 100)

-- 				cb(true)
-- 			else
-- 				cb(false)
-- 			end

-- 		-- Weapon Component
-- 		elseif type == 2 then
-- 			local price = selectedWeapon.components[componentNum]
-- 			local weaponNum, weapon = ESX.GetWeapon(weaponName)
-- 			local component = weapon.components[componentNum]

-- 			if component then
-- 				if xPlayer.getMoney() >= price then
-- 					xPlayer.removeMoney(price)
-- 					xPlayer.addWeaponComponent(weaponName, component.name)

-- 					cb(true)
-- 				else
-- 					cb(false)
-- 				end
-- 			else
-- 				print(('sogo_mafia: %s attempted to buy an invalid weapon component.'):format(xPlayer.identifier))
-- 				cb(false)
-- 			end
-- 		end
-- 	end
-- end)

