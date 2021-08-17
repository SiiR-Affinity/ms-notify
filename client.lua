RegisterNetEvent('ms-notify:sendAlert')
AddEventHandler('ms-notify:sendAlert', function(data)
	SendAlert(data)
end)

RegisterNetEvent('ms-notify:removeAlert')
AddEventHandler('ms-notify:removeAlert', function(id)
	RemoveAlert(id)
end)

RegisterCommand('testnotify', function()
	SendAlert({ id = 'Test', text = 'This is a test normal notification!', type = 'warning', icon = 'fas fa-wallet', soundFile = 'tone2', time = -1})
end)

RegisterCommand('removenotif', function()
	RemoveAlert('Test')
end)


function SendAlert(data)
	SendNUIMessage({
		id = data.id,
		text = CleanText(data.text),
		type = data.type,
		icon = data.icon,
		time = data.time,
		align = data.align,
		soundFile = data.soundFile
	})
end

function RemoveAlert(id)
	SendNUIMessage({
		id = id,
		delete = true
	})
end

function CleanText(text)
	text = string.gsub(text, '(~[rbgypcmuonshw]~)', '')
	return text
end