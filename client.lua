--Script by FAXES

AddEventHandler('onClientMapStart', function()
  Citizen.CreateThread(function()
    local display = true

    TriggerEvent('scroll:display', true)

    while display do
      Citizen.Wait(1)
      -- ShowInfo('~y~Attention.~w~ use /togscroll to disable the scroll message.', 0)
        display = false
        TriggerEvent('scroll:display', false)
      end
      if message:sub(1) == '/togscroll' then
	  CancelEvent()
        display = false
        TriggerEvent('scroll:display', false)
      end
    end
  end)
end)

RegisterNetEvent('scroll:display')
AddEventHandler('scroll:display', function(value)
  SendNUIMessage({
    type = "scroll",
    display = value
  })
end)

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

RegisterCommand("scroll",function(source,args,raw) 
	msg = string.gsub(raw,8)
	SendNUIMessage({newtext=msg})
end,true)
