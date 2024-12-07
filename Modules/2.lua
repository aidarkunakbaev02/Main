local executorname = getexecutorname()



if executorname == 'Solara'  then

    game.Players.LocalPlayer:Kick("Solara Not Supported")

else

    print('hello')

end



--fly module

local flySettings={fly=false,flyspeed=50}

local c local h local bv local bav local cam local flying local p=game.Players.LocalPlayer

local buttons={W=false,S=false,A=false,D=false,Moving=false}

local startFly=function()if not p.Character or not p.Character.Head or flying then return end c=p.Character h=c.Humanoid h.PlatformStand=true cam=workspace:WaitForChild('Camera') bv=Instance.new("BodyVelocity") bav=Instance.new("BodyAngularVelocity") bv.Velocity,bv.MaxForce,bv.P=Vector3.new(0,0,0),Vector3.new(10000,10000,10000),1000 bav.AngularVelocity,bav.MaxTorque,bav.P=Vector3.new(0,0,0),Vector3.new(10000,10000,10000),1000 bv.Parent=c.Head bav.Parent=c.Head flying=true h.Died:connect(function()flying=false end)end

local endFly=function()if not p.Character or not flying then return end h.PlatformStand=false bv:Destroy() bav:Destroy() flying=false end

game:GetService("UserInputService").InputBegan:connect(function(input,GPE)if GPE then return end for i,e in pairs(buttons)do if i~="Moving" and input.KeyCode==Enum.KeyCode[i]then buttons[i]=true buttons.Moving=true end end end)

game:GetService("UserInputService").InputEnded:connect(function(input,GPE)if GPE then return end local a=false for i,e in pairs(buttons)do if i~="Moving"then if input.KeyCode==Enum.KeyCode[i]then buttons[i]=false end if buttons[i]then a=true end end end buttons.Moving=a end)

local setVec=function(vec)return vec*(flySettings.flyspeed/vec.Magnitude)end

game:GetService("RunService").Heartbeat:connect(function(step)if flying and c and c.PrimaryPart then local p=c.PrimaryPart.Position local cf=cam.CFrame local ax,ay,az=cf:toEulerAnglesXYZ()c:SetPrimaryPartCFrame(CFrame.new(p.x,p.y,p.z)*CFrame.Angles(ax,ay,az))if buttons.Moving then local t=Vector3.new()if buttons.W then t=t+(setVec(cf.lookVector))end if buttons.S then t=t-(setVec(cf.lookVector))end if buttons.A then t=t-(setVec(cf.rightVector))end if buttons.D then t=t+(setVec(cf.rightVector))end c:TranslateBy(t*step)end end end)















Client = {

	Modules = {

		ClientEnvoirment,

		ClientMain,

		CreateProj,

		CretTrail,

		ModsShit

	},

	Toggles = {

		BHop = false,

		Infammo = false,

		Automtatic = false,

		FireRate = false,

		NoRecoil = false,

		NoSpread = false,

		WallBang = false,

		InstantRespawn = false,

		AntiAim = false,

		AutoAmmo = false,

		AutoHealth = false,

		Trac = false,

		Sight = false,

		FOV = false,

		Golden = true,

		Visiblecheck = false,

		SilentAim = false,



	},

	Values = {

		JumpPower = 50,

		LookMeth = 'Look Up',                                                                                                                                                                                                                                                 

		Test = '',

		FOV = 150,

		ChatMsg = 'Onetap v2 Winning always',

		AimPart = 'Head'





	}

}


NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/lobox920/Notification-Library/Main/Library.lua"))()



if game:IsLoaded() then

	NotificationLibrary:SendNotification("Success", "Onetap Has Been Loaded! Executor Support!", 3)

end



wait(0.5) 



if not game:IsLoaded() then

 game.Players.LocalPlayer:Kick("Contact with : aidar#2500 Code Error 682")

end

wait(0.5) 

if game.Players then

	NotificationLibrary:SendNotification("Success", "Success! Players Loaded esp work!", 3)

end

wait(0.5) 

if not game.Players.LocalPlayer then

	NotificationLibrary:SendNotification("Error", "Error Players not loaded esp not work", 3)

end





NotificationLibrary:SendNotification("Success", "Game : Arsenal", 3)



local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()



local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()

local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()





warn("Onetap Loaded Enjoy")







local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"))();











ESP.Enabled = false;



ESP.ShowBox = false;



ESP.ShowName = false;



ESP.ShowHealth = false;



ESP.ShowTracer = false;



ESP.ShowDistance = false;



ESP.ShowSkeletons = false;







    local ESP_SETTINGS = {



        BoxOutlineColor = Color3.new(1, 1, 1),



        BoxColor = Color3.new(1, 1, 1),



        NameColor = Color3.new(1, 1, 1),



        HealthOutlineColor = Color3.new(0, 0, 0),



        HealthHighColor = Color3.new(0, 1, 0),



        HealthLowColor = Color3.new(1, 0, 0),



        CharSize = Vector2.new(4, 6),



        Teamcheck = false,



        WallCheck = false,



        Enabled = false,



        ShowBox = false,



        BoxType = "2D",



        ShowName = false,



        ShowHealth = false,



        ShowDistance = false,



        ShowSkeletons = false,



        ShowTracer = false,



        TracerColor = Color3.new(1, 1, 1), 



        TracerThickness = 2,



        SkeletonsColor = Color3.new(1, 1, 1),



        TracerPosition = "Bottom",



    }







local fov = 100

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local Players = game:GetService("Players")

local Cam = game.Workspace.CurrentCamera



local FOVring = Drawing.new("Circle")

FOVring.Visible = false

FOVring.Thickness = 2

FOVring.Color = Color3.fromRGB(255, 0, 0) 

FOVring.Filled = false 

FOVring.Radius = fov

FOVring.Position = Cam.ViewportSize / 2



local function updateDrawings()

    local camViewportSize = Cam.ViewportSize

    FOVring.Position = camViewportSize / 2

end



local function onKeyDown(input)

    if input.KeyCode == Enum.KeyCode.Delete then

        RunService:UnbindFromRenderStep("FOVUpdate")

        FOVring:Remove()

    end

end
