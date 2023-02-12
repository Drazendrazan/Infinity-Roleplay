function StartPayCheck()
  CreateThread(function()
    while true do
      Wait(Config.PaycheckInterval)
      local xPlayers = ESX.GetExtendedPlayers()
      for i = 1, #(xPlayers) do
        local xPlayer = xPlayers[i]
        local job = xPlayer.job.grade_name
        local salary = xPlayer.job.grade_salary

        if salary > 0 then
          if job == 'unemployed' then -- unemployed
            xPlayer.addAccountMoney('bank', salary)
            xPlayer.showNotification("SALÁRIO", "Recebeste o teu subsídio de desemprego: €"..salary, 2000, "info")
          elseif Config.EnableSocietyPayouts and exports["jobs_creator"]:isPlayerOnDuty(xPlayer.source) then -- possibly a society
            TriggerEvent('esx_society:getSociety', xPlayer.job.name, function(society)
              if society ~= nil then -- verified society
                TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
                  if account.money >= salary then -- does the society money to pay its employees?
                    xPlayer.showNotification("SALÁRIO", "Recebeste o teu salário: €".. salary .. "", 2000, "info")
                    xPlayer.addAccountMoney('bank', salary)
                    account.removeMoney(salary)
                  end
                end)
              else -- not a society
                xPlayer.showNotification("SALÁRIO", "Recebeste o teu salário: €".. salary .. "", 2000, "info")
                xPlayer.addAccountMoney('bank', salary)
              end
            end)
          else
            xPlayer.showNotification("SALÁRIO", "Recebeste o teu salário: €".. salary/3 .. "", 2000, "info")
            xPlayer.addAccountMoney('bank', salary/3)
          end
        end
      end
    end
  end)
end
