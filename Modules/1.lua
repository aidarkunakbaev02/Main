local baseYaw = 0
local yawOffset = 0
local lastJitterUpdate = tick()
local breakAA = 0
local minTickInterval = 0.05
local maxTickInterval = 0.2
local TickInterval = 0.1
local DefensiveAATick = 0

local function updateYaw(deltaTime)
    if Toggles.AntiAim.Value then
        if Options.YawBase.Value == "Local View" then
            yawOffset = Camera.CFrame.LookVector.Y
        elseif Options.YawBase.Value == "Static" then
            yawOffset = math.rad(Options.StaticYaw.Value)
        elseif Options.YawBase.Value == "At Target" then
            local target = getClosestEnemy()
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local lookVector = (target.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Unit
                yawOffset = math.atan2(lookVector.X, lookVector.Z)
            end
        end

        if Toggles.SpinBot.Value then
            yawOffset = yawOffset + Options.SpinBotspeed.Value * deltaTime
        elseif Toggles.Jitter.Value then
             if tick() - lastJitterUpdate >= 1 / Options.JitterSpeed.Value then
                lastJitterUpdate = tick()
                yawOffset = yawOffset +  math.rad(Options.Anglejitter.Value) + math.rad((math.random(1, 2) == 1 and Options.Jitterroll.Value or -Options.Jitterroll.Value))
            end
        elseif Toggles.BreakA.Value then
            breakAA = (breakAA + Options.BreakAspeed.Value) % 360
            yawOffset = yawOffset + math.rad(breakAA)
        elseif Toggles.DefensiveAA.Value then
             DefensiveAATick += deltaTime
            if DefensiveAATick >= TickInterval then
                DefensiveAATick = 0
                TickInterval = math.random() * (maxTickInterval - minTickInterval) + minTickInterval
                yawOffset = yawOffset + math.rad(math.random(-180,180))
            end
        end
    end
end

RunService.RenderStepped:Connect(function(deltaTime)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0  then
        if Toggles.AntiAim.Value then
            LocalPlayer.Character.Humanoid.AutoRotate = false
            updateYaw(deltaTime)
            local pitch = 0

            if Options.pitchSelection.Value == "Down" then
                pitch = math.rad(-90)
            elseif Options.pitchSelection.Value == "Up" then
                pitch = math.rad(90)
            end

            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.Angles(pitch, yawOffset, 0)
        else
            LocalPlayer.Character.Humanoid.AutoRotate = true
        end
    end
end)
