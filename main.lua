--!strict  
--[[  
Gato's Kill Pack [v1.1]  
                                                                                                      
        @@@@@@@@@                                                                                     
     @@@+-.   .-*@@                                                                                   
    @@-          .@@                     @@@@@@                                                       
   @#:            -@@@@#+++++*%@@      @@#.   =@@                                                     
  @%.             -@@%.       ..=@@  @@=:.    -@@@       @@@@                                         
 @@.     .:++.  .:@@@*.          :#@@%:          :@@  @@*=..-*#@@    @%#%@                            
 @+.    .+@@@@%#%@@ @@%+::..      :@@%:           *@@@-.       .=@@  @# +@   @@@@@@@@                 
@@-.    :#+   .:%@  @@%=.          #@@@+       .:=@@@:           -%@ @@.-@ @@+.    .=@@               
@@-     .-:     .#@@%:     :+*-    *@@@:      -@@@ @+.           .+@  @*#@@@=.      .%@               
@@=.             *@@-      ....   .%@@%       -@@ @@-    .#%.     :@@      @=   .#%@@@                
 @%:            .%@@-             =@@@#        .-%@@-     ...     -@@      @@#=:.    .%@              
  @@*:          =@@@*           .-%@ @%          *@@=.            =@        @@%:..    =@              
    @@@@%#-...:*@@  @@=..     .:*@@  @@=        .%@@%.           :#@       @@-.      :@@              
         @@@@@@@      @@@%%%%%@@@     @@*.     .#@  @%.         .%@         @+.   .=%@@               
                                        @@@@%%@@@    @@*:.   .:*@@           @@@@@@@                  
                                                       @@@@%@@@@                                      
                                       @@                                                             
                   @%*+#@@  @@#*@@  @@*--#@       @@@@@@@@@                                           
       @@@@       @+.   =@ @#.  .*@ @=.  .*@     @@:.. ...+@@                           @@@@@         
     @%:  :%@@##@@@*. .:%@@@:    :%@%:    .@@   @@:        -@@@@@%%%@@@        @@     @@*. .#@        
    @@:    .:.  .@@@%:::%@@%.    .*@%.     *@   @*   -*.    %@#.    ..+@@  @@@=::-%@@ @*.   .@@@@     
    @#.         .%@*.    *@%.     +@%.     +@   @=   ..    .@@*.       .@@@%:      :%@@-    .#: .%@   
    @#.        -%@@=     :@%.     =@%.     =@  @@-        .*@@@@+=:.    =@@.      .-@@%.         =@   
    @%:       -%@@@=     .%@.     =@@-     =@  @@-    .-+%@@ @=.  .#%.  -@*    -@@@@@@#        .:@@   
    @@:         .%@+.    .@@+     +@@+.    *@   @+    .+@   @#.    ..   *@*       .:%@*      .+%@@    
     @+          #@%:    =@@@:   .#@@@-   -@@   @@:    =@   @%:        =@@@.       .*@*        ..@@   
     @@-.  -@*-=#@ @@=::+@@ @@#=+%@  @@@@@@       @@%%@@@    @@+-...:=%@  @@-.    .-%@%.        .%@   
       @@%@@@ @@     @@@@                                      @@@@@@@     @@@#*+*%@@ @*. :#@#--%@    
                                                                                       @@@@@  @@      
  
Made by @not_.gato!       
]]  
  
local shared = odh_shared_plugins  
if shared.discord_id == 586568393801596928 then
    game.Players.LocalPlayer:Kick("hands up skid!")
    return
end
shared.Notify("never give up on your dreams, even when things get hard and you feel like giving up. keep going no matter what, because one day everything will make sense. i’ll always be here loving you <3", 0)
local uniSect = shared.AddSection("GKP | Universal")  

local P: Players = game:GetService("Players")  
local R: RunService = game:GetService("RunService")  
local RS: ReplicatedStorage = game:GetService("ReplicatedStorage")  
local lp: Player = P.LocalPlayer  
  
-- annotations.  
local _game: string = shared.game_name  
local isMM2: boolean = _game == "Murder Mystery 2"  
local isMMV: boolean = _game == "Murder Mystery Modded"  
local isFTF: boolean = _game == "Flee The Facility"  
local mmGame: boolean = isMM2 or isMMV  
  
local mmSect: any = nil  
if isMM2 then  
    mmSect = shared.AddSection("GKP | Murder Mystery 2")  
elseif isMMV then  
    mmSect = shared.AddSection("GKP | Murder Mystery Modded")  
end  
  
local ftfSect: any = nil  
if isFTF then  
    ftfSect = shared.AddSection("GKP | Flee The Facility")  
end  
  
-- localization.  
local typeof = typeof  
local type = type  
local pcall = pcall  
local pairs = pairs  
local tostring = tostring  
local string_lower = string.lower  
local string_match = string.match  
local os_clock = os.clock  
local task_wait = task.wait  
local task_spawn = task.spawn  
local task_delay = task.delay  
local table_insert = table.insert  
local table_clear = table.clear  
local ipairs = ipairs  
local math_floor = math.floor  
local UIS: UserInputService = game:GetService("UserInputService")  
local TS: TweenService = game:GetService("TweenService")  
local Vector3_new = Vector3.new  
  

local function safegetservice(name: string): any
    local ok, svc = pcall(game.GetService, game, name)
    return ok and svc or nil
end

local WHITELIST_FILE = "pls_speed_i_need_this.json"
local whitelist: {[string]: boolean} = {}

local function savewhitelist()
    if not writefile then return end
    local hs = safegetservice("HttpService")
    if not hs then return end
    local ok, data = pcall(hs.JSONEncode, hs, whitelist)
    if ok then pcall(writefile, WHITELIST_FILE, data) end
end

local function loadwhitelist()
    if not readfile then return end
    local ok, content = pcall(readfile, WHITELIST_FILE)
    if not ok or not content or content == "" then return end
    local hs = safegetservice("HttpService")
    if not hs then return end
    local ok2, data = pcall(hs.JSONDecode, hs, content)
    if ok2 and type(data) == "table" then whitelist = data end
end
local zero: Vector3 = Vector3_new(0, 0, 0)  
local nan: Vector3 = Vector3_new(0/0, 0/0, 0/0)  
local shp: (Instance, string, any) -> boolean = sethiddenproperty  
local chi: (string, Instance?) -> Instance = shared.create_hidden_instance  
loadwhitelist()

local function splithrp(char)
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local rj = hrp:FindFirstChildOfClass("Motor6D")
    if not rj then
        for _, v in ipairs(char:GetDescendants()) do
            if v:IsA("Motor6D") and v.Part0 == hrp then rj = v break end
        end
    end
    if rj then rj.Enabled = false end
end

local frozenChars = {}
local unfreezechar

local function freezechar(char)
    if not char or frozenChars[char] then return end
    local state = { conns = {}, parts = {}, savedCF = nil, prevCamSubject = nil }
    frozenChars[char] = state
    local cam = workspace.CurrentCamera
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
    if hrp then
        local ok, cf = pcall(function() return hrp.CFrame end)
        if ok then state.savedCF = cf end
    end
    if cam then
        state.prevCamSubject = cam.CameraSubject
        cam.CameraSubject = torso or hrp or cam.CameraSubject
    end
    for _, v in ipairs(char:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
            state.parts[v] = v.Anchored
            pcall(function() v.Anchored = true end)
        end
    end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        table_insert(state.conns, hum.Died:Connect(function()
            unfreezechar(char)
        end))
    end
    table_insert(state.conns, char.AncestryChanged:Connect(function(_, parent)
        if not parent then unfreezechar(char) end
    end))
    table_insert(state.conns, lp.CharacterAdded:Connect(function()
        unfreezechar(char)
    end))
end

unfreezechar = function(char)
    if not char then return end
    local state = frozenChars[char]
    if not state then return end
    frozenChars[char] = nil
    for i = #state.conns, 1, -1 do
        local c = state.conns[i]
        if c then pcall(function() c:Disconnect() end) end
    end
    table_clear(state.conns)
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp and hrp.Parent then
        pcall(shp, hrp, "PhysicsRepRootPart", nil)
        if state.savedCF then
            pcall(function() hrp.CFrame = state.savedCF end)
            pcall(function() hrp.AssemblyLinearVelocity = zero end)
            pcall(function() hrp.AssemblyAngularVelocity = zero end)
        end
        local rj = hrp:FindFirstChildOfClass("Motor6D")
        if not rj then
            for _, v in ipairs(char:GetDescendants()) do
                if v:IsA("Motor6D") and v.Part0 == hrp then rj = v break end
            end
        end
        if rj then pcall(function() rj.Enabled = true end) end
    end
    for part, wasAnchored in pairs(state.parts) do
        if part and part.Parent then
            pcall(function() part.Anchored = wasAnchored end)
        end
    end
    table_clear(state.parts)
    local cam = workspace.CurrentCamera
    if cam then
        local newChar = lp.Character
        local hum = newChar and newChar:FindFirstChildOfClass("Humanoid")
        if hum then
            cam.CameraSubject = hum
        elseif state.prevCamSubject then
            pcall(function() cam.CameraSubject = state.prevCamSubject end)
        end
    end
end
  
-- maidy.  
type MaidType = {  
    _t: { any },  
    add: (self: MaidType, task: any) -> any,  
    clean: (self: MaidType) -> ()  
}  
  
local Maid: MaidType = {} :: any  
Maid.__index = Maid  
  
function Maid.new(): MaidType  
    return setmetatable({ _t = {} }, Maid) :: any  
end  
  
function Maid.add(self: MaidType, task: any): any  
    table_insert(self._t, task)  
    return task  
end  
  
function Maid.clean(self: MaidType): ()  
    local tasks = self._t  
    for i = #tasks, 1, -1 do  
        local t = tasks[i]  
        local t_type = typeof(t)  
        if t_type == "RBXScriptConnection" then  
            t:Disconnect()  
        elseif t_type == "Instance" then  
            t:Destroy()  
        elseif type(t) == "function" then  
            t()  
        elseif type(t) == "table" and t.Destroy then  
            t:Destroy()  
        end  
    end  
    table_clear(tasks)  
end  
  
local killMaid = Maid.new()  
local allMaid = Maid.new()  
  
local BB_SHAPES = {  
    [0] = "rbxassetid://86221076925479",  
    [1] = "rbxassetid://96242665417546",  
    [2] = "rbxassetid://97129189935336",  
    [3] = "rbxassetid://76165862027868",  
    [4] = "rbxassetid://125868092127496"  
}  
  
local BB_NORMAL_COLOR = ColorSequence.new({  
    ColorSequenceKeypoint.new(0, Color3.new(0.133333, 0.827451, 0.494118)),  
    ColorSequenceKeypoint.new(0.6, Color3.new(0.231373, 0.509804, 0.498039)),  
    ColorSequenceKeypoint.new(1, Color3.new(0.501961, 0.501961, 0.501961))  
})  
  
local BB_TOGGLED_COLOR = ColorSequence.new({  
    ColorSequenceKeypoint.new(0, Color3.new(0.0784314, 0.0784314, 0.0784314)),  
    ColorSequenceKeypoint.new(0.75, Color3.new(0.0784314, 0.0784314, 0.54902)),  
    ColorSequenceKeypoint.new(1, Color3.new(0.470588, 0.156863, 0.470588))  
})  
  
local BB = {Buttons = {}, Maids = {}, Count = 0}  
local BB_rootMaid = Maid.new()

local commandsDisabled = false
local cmdwhitelistonly = false
local cmdeveryone = false
local otherchatconns = {}

local cmdPrefix = ";"

local bbUndraggable = false  
  
local function bb_getstorage()  
    local _hui = gethui and gethui()  
    local storageParent = (_hui and typeof(_hui) == "Instance" and _hui) or safegetservice("CoreGui") or lp:WaitForChild("PlayerGui")  
    local sg = storageParent:FindFirstChild("@bindstorage")  
    if not sg then  
        sg = Instance.new("ScreenGui")  
        sg.Name = "@bindstorage"  
        sg.ResetOnSpawn = false  
        sg.IgnoreGuiInset = true  
        pcall(function() sg.ScreenInsets = Enum.ScreenInsets.None end)  
        sg.Parent = storageParent  
        BB_rootMaid:add(sg)  
    end  
    return sg  
end  
  
local function bb_makedraggable(gui, maid, ripple, sound, clickFunc)  
    local dragging = false  
    local dragInput = nil  
    local dragStart = nil  
    local startPos = nil  
    local hasMoved = false  
  
    maid:add(gui.InputBegan:Connect(function(input)  
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then  
            dragging = true  
            dragStart = input.Position  
            startPos = gui.Position  
            hasMoved = false  
  
            sound:Play()  
            local absPos = gui.AbsolutePosition  
            ripple.Position = UDim2.new(0, input.Position.X - absPos.X, 0, input.Position.Y - absPos.Y)  
            ripple.Size = UDim2.new(0, 0, 0, 0)  
            ripple.BackgroundTransparency = 0.5  
            ripple.Visible = true  
  
            TS:Create(ripple, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {  
                Size = UDim2.new(0, 45, 0, 45),  
                BackgroundTransparency = 1  
            }):Play()  
  
            local releaseConn  
            releaseConn = UIS.InputEnded:Connect(function(endInput)  
                if endInput.UserInputType == input.UserInputType then  
                    dragging = false  
                    if not hasMoved then clickFunc() end  
                    releaseConn:Disconnect()  
                end  
            end)  
        end  
    end))  
  
    maid:add(gui.InputChanged:Connect(function(input)  
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then  
            dragInput = input  
        end  
    end))  
  
    maid:add(UIS.InputChanged:Connect(function(input)  
        if input == dragInput and dragging then  
            if bbUndraggable then return end  
            local delta = input.Position - dragStart  
            if delta.Magnitude > 7 then hasMoved = true end  
            local screen = gui.Parent.AbsoluteSize  
            gui.Position = UDim2.new(startPos.X.Scale + (delta.X / screen.X), 0, startPos.Y.Scale + (delta.Y / screen.Y), 0)  
        end  
    end))  
end  
  
function BB.add(id, text, onFunc, offFunc, isButton)  
    if BB.Buttons[id] then return BB.Buttons[id]:FindFirstChild("BindValue") end  
  
    local btnMaid = Maid.new()  
    local camera = workspace.CurrentCamera  
    local screen = camera.ViewportSize  
  
    local buttonSizeY = 0.11  
    local widthScale = buttonSizeY * (screen.Y / screen.X)  
  
    local xPos = 0.1 + ((BB.Count % 8) * (widthScale + 0.005))  
    local yPos = 0.9 - (math_floor(BB.Count / 8) * (buttonSizeY + 0.015))  
  
    local btn = Instance.new("ImageButton")  
    btn.Name = id  
    btn.Size = UDim2.new(widthScale, 0, buttonSizeY, 0)  
    btn.Position = UDim2.new(xPos, 0, yPos, 0)  
    btn.AnchorPoint = Vector2.new(0.5, 0.5)  
    btn.Image = BB_SHAPES[0]  
    btn.BackgroundTransparency = 1  
    btn.BorderSizePixel = 0  
    btn.ClipsDescendants = false  
    btn.AutoButtonColor = false  
    btn.Parent = bb_getstorage()  
    btnMaid:add(btn)  
  
    local bindVal = Instance.new("BoolValue", btn)  
    bindVal.Name = "BindValue"  
  
    local label = Instance.new("TextLabel", btn)  
    label.Name = "@Text"  
    label.Size = UDim2.new(0.8, 0, 0.8, 0)  
    label.Position = UDim2.new(0.5, 0, 0.5, 0)  
    label.AnchorPoint = Vector2.new(0.5, 0.5)  
    label.BackgroundTransparency = 1  
    label.Font = Enum.Font.Jura  
    label.Text = text  
    label.TextColor3 = Color3.new(1, 1, 1)  
    label.TextSize = 10  
    label.TextWrapped = true  
    label.ZIndex = 3  
  
    local aspect = Instance.new("UIAspectRatioConstraint", btn)  
    aspect.AspectRatio = 1  
    aspect.AspectType = Enum.AspectType.ScaleWithParentSize  
  
    local stroke = Instance.new("UIGradient", btn)  
    stroke.Name = "@Stroke"  
    stroke.Color = BB_NORMAL_COLOR  
  
    local ripple = Instance.new("Frame")  
    ripple.Name = "@ripple"  
    ripple.BackgroundColor3 = Color3.fromRGB(0, 155, 255)  
    ripple.BackgroundTransparency = 0.5  
    ripple.Size = UDim2.new(0, 0, 0, 0)  
    ripple.AnchorPoint = Vector2.new(0.5, 0.5)  
    ripple.Visible = false  
    ripple.ZIndex = 2  
    ripple.Parent = btn  
    Instance.new("UICorner", ripple).CornerRadius = UDim.new(1, 0)  
  
    local sound = Instance.new("Sound")  
    sound.SoundId = "rbxassetid://3868133279"  
    sound.Volume = 0.5  
    sound.Parent = btn  
  
    local debounce = false  
    local tInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)  
  
    local function onClick()  
        if debounce then return end  
        debounce = true  
        local fOut = TS:Create(btn, tInfo, {ImageTransparency = 1})  
        fOut:Play()  
        fOut.Completed:Wait()  
  
        if isButton then  
            if onFunc then pcall(onFunc) end  
        else  
            bindVal.Value = not bindVal.Value  
            stroke.Color = bindVal.Value and BB_TOGGLED_COLOR or BB_NORMAL_COLOR  
            if bindVal.Value then  
                if onFunc then pcall(onFunc) end  
            else  
                if offFunc then pcall(offFunc) end  
            end  
        end  
  
        local fIn = TS:Create(btn, tInfo, {ImageTransparency = 0})  
        fIn:Play()  
        fIn.Completed:Wait()  
        debounce = false  
    end  
  
    bb_makedraggable(btn, btnMaid, ripple, sound, onClick)  
    btnMaid:add(R.RenderStepped:Connect(function() stroke.Rotation = (stroke.Rotation + 1) % 360 end))  
  
    BB.Buttons[id] = btn  
    BB.Maids[id] = btnMaid  
    BB.Count = BB.Count + 1  
    return bindVal  
end  
  
function BB.setshape(id, shape)  
    local btn = BB.Buttons[id]  
    if btn and BB_SHAPES[shape] then  
        btn.Image = BB_SHAPES[shape]  
    end  
end  
  
function BB.remove(id)  
    if BB.Maids[id] then  
        BB.Maids[id]:clean()  
        BB.Maids[id] = nil  
        BB.Buttons[id] = nil  
    end  
end  
  
local BB_SHAPE_OPTIONS = {"Circle", "Square", "Hexagon", "Star", "Heart"}  
  
-- classes.  
type MainType = {  
    active: boolean,  
    loop_target: boolean,  
    loop_all: boolean,  
    kill: (target: Player) -> (),  
    killall: () -> ()  
}  
  
type OtherType = {  
    trip: { [string]: { Role: string, Dead: boolean } },  
    roles: { [Player]: { Role: string, Dead: boolean } },  
    af_m: boolean,  
    af_s: boolean,  
    af_b: boolean,  
    getmm2data: () -> (),  
    r1: (p: Player) -> string?,  
    r2: (p: Player) -> string?,  
    r3: (p: Player) -> string?,  
    getrole: (p: Player) -> string,  
    isdead: (p: Player) -> boolean,  
    killm: () -> (),  
    kills: () -> (),  
    killh: () -> (),  
    getbeast: () -> Player?,  
    killbeast: () -> ()  
}  
  
local Main: MainType = {  
    active = false,  
    loop_target = false,  
    loop_all = false  
} :: any  
  
local Other: OtherType = {  
    trip = {},  
    roles = {},  
    af_m = false,  
    af_s = false,  
    af_b = false  
} :: any  
  
-- main functions thing  
function Main.kill(target: Player): ()  
    if Main.active then return end  
    Main.active = true  
    if not target or not target.Character then Main.active = false return end  
      
    local lChar = lp.Character  
    local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart") :: BasePart?  
    local lHum = lChar and lChar:FindFirstChild("Humanoid") :: Humanoid?  
    local tChar = target.Character  
    local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart") :: BasePart?  
    if not lRoot or not tRoot or not lHum then Main.active = false return end  
    splithrp(lChar)
    freezechar(lChar)
  
    local saved = lRoot.CFrame  
    local running = true  
      
    local con = R.Heartbeat:Connect(function()  
        if not running or not lRoot.Parent or not tRoot.Parent then  
            Maid.clean(killMaid)  
            return  
        end  
        pcall(shp, lHum, "MoveDirectionInternal", nan)  
        pcall(shp, lRoot, "PhysicsRepRootPart", tRoot)  
        pcall(shp, lRoot, "CFrame", tRoot.CFrame)   
        lRoot.Velocity = zero  
        lRoot.AssemblyLinearVelocity = zero  
        lRoot.AssemblyAngularVelocity = zero  
        lRoot.RotVelocity = zero  
    end)  
    Maid.add(killMaid, con)  
  
    Maid.add(killMaid, function()  
        running = false  
        pcall(shp, lRoot, "PhysicsRepRootPart", nil)  
        if saved and lRoot and lRoot.Parent then  
            lRoot.CFrame = saved  
            lRoot.Velocity = zero  
            lRoot.AssemblyLinearVelocity = zero  
            lRoot.AssemblyAngularVelocity = zero  
            lRoot.RotVelocity = zero  
        end  
        unfreezechar(lChar)
        Main.active = false  
    end)  
  
    task_delay(1, function()  
        pcall(Maid.clean, killMaid)  
        Main.active = false  
    end)  
end  
  
function Main.killall(): ()  
    if Main.active then return end  
    Main.active = true  
    local list: { Player }, done: { [Player]: boolean }, index: number = {}, {}, 1  
    local tChar: Model?, tRoot: BasePart?, saved: CFrame?  
    local running = true  
    local lChar = lp.Character  
    local lHum = lChar and lChar:FindFirstChild("Humanoid") :: Humanoid?  
    local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart") :: BasePart?  
  
    if not lRoot or not lHum then Main.active = false return end  
    saved = lRoot.CFrame  
    splithrp(lChar)
    freezechar(lChar)

    local plrs = P:GetPlayers()  
    for i = 1, #plrs do  
        local p = plrs[i]  
        if p ~= lp and not whitelist[p.Name] then table_insert(list, p) end
    end  
    if #list == 0 then unfreezechar(lChar) Main.active = false return end  

    local function stop()  
        running = false  
        Maid.clean(allMaid)  
    end  

    local function nextTarg(): boolean  
        local start = index  
        local count = #list  
        for i = 1, count do  
            local idx = (start - 1 + i) % count + 1  
            local p = list[idx]  
            if p and p.Parent and not done[p] then  
                local c = p.Character  
                local r = c and c:FindFirstChild("HumanoidRootPart") :: BasePart?  
                if c and r and r:IsDescendantOf(workspace) then  
                    index = idx  
                    tChar = c; tRoot = r  
                    return true  
                end  
            end  
        end  
        return false  
    end  

    nextTarg()  
    local lastTime = os_clock()  

    local con = R.Heartbeat:Connect(function()  
        if not running then  
            Maid.clean(allMaid)  
            return  
        end  
        if not lRoot or not lHum or lHum.Health <= 0 then  
            stop()  
            return  
        end  
        pcall(shp, lHum, "MoveDirectionInternal", nan)  
        if not tRoot or not tRoot:IsDescendantOf(workspace) then  
            if not nextTarg() then  
                local doneAll = true  
                for i = 1, #list do  
                    if not done[list[i]] then doneAll = false break end  
                end  
                if doneAll then stop() end  
            end  
            return  
        end  

        if os_clock() - lastTime >= 1.5 then   
            local p = list[index]  
            if p then done[p] = true end  
            pcall(shp, lRoot, "PhysicsRepRootPart", nil)  
              
            local doneAll = true  
            for i = 1, #list do  
                if not done[list[i]] then doneAll = false break end  
            end  
            if doneAll then stop() return end  
            if not nextTarg() then return end  
            lastTime = os_clock()  
        end  

        pcall(shp, lRoot, "PhysicsRepRootPart", tRoot)  
        pcall(shp, lRoot, "CFrame", tRoot.CFrame)   
        lRoot.Velocity = zero  
        lRoot.AssemblyLinearVelocity = zero  
        lRoot.AssemblyAngularVelocity = zero  
        lRoot.RotVelocity = zero  
    end)  
    Maid.add(allMaid, con)  
  
    Maid.add(allMaid, function()  
        pcall(shp, lRoot, "PhysicsRepRootPart", nil)  
        if saved and lRoot and lRoot.Parent then  
            lRoot.CFrame = saved  
            lRoot.Velocity = zero  
            lRoot.AssemblyLinearVelocity = zero  
            lRoot.AssemblyAngularVelocity = zero  
            lRoot.RotVelocity = zero  
        end  
        unfreezechar(lChar)
        Main.active = false  
    end)  

    task_delay(60, function()  
        if running then  
            pcall(Maid.clean, allMaid)  
            Main.active = false  
        end  
    end)  
end  
  
-- mm2 related stuff  
function Other.getmm2data(): ()  
    local rem = RS:FindFirstChild("GetPlayerData", true)  
    if rem and rem:IsA("RemoteFunction") then  
        local success, data = pcall(rem.InvokeServer, rem)  
        if success and type(data) == "table" then  
            for k, v in pairs(data) do  
                local name = type(k) == "string" and k or tostring(k)  
                if type(v) == "table" then  
                    if v.Name then name = v.Name end  
                    Other.trip[name] = {  
                        Role = v.Role or "Unknown",  
                        Dead = v.Dead or v.Killed or false  
                    }  
                elseif type(v) == "string" then  
                    Other.trip[name] = { Role = v, Dead = false }  
                end  
            end  
        end  
    end  
end  
  
function Other.r1(p: Player): string?  
    local c = p.Character  
    if not c then return end  
    if c:FindFirstChild("Murderer") or c:FindFirstChild("Knife") then return "Murderer" end  
    if c:FindFirstChild("Sheriff") or c:FindFirstChild("Gun") then return "Sheriff" end
    if c:FindFirstChild("Hero") then return "Hero" end
    if c:FindFirstChild("Innocent") then return "Innocent" end  
    return nil  
end  
  
function Other.r2(p: Player): string?  
    local c = p.Character  
    if not c then return end  
    local children = c:GetChildren()  
    for i = 1, #children do  
        local t = children[i]  
        if t:IsA("Tool") then  
            local name = string_lower(t.Name)  
            if name == "knife" or name == "murderer" then return "Murderer" end  
            if name == "gun" or name == "sheriff" then return "Sheriff" end
            if name == "hero" then return "Hero" end
        end  
    end  
    return nil  
end  
  
function Other.r3(p: Player): string?  
    local c = p.Character  
    if not c then return end  
    local h = c:FindFirstChild("Head")  
    local b = h and h:FindFirstChildWhichIsA("BillboardGui")  
    local l = b and b:FindFirstChildWhichIsA("TextLabel")  
    if l and l.Text then  
        local txt = string_lower(l.Text)  
        if string_match(txt, "murderer") then return "Murderer" end  
        if string_match(txt, "sheriff") then return "Sheriff" end
        if string_match(txt, "hero") then return "Hero" end
        if string_match(txt, "innocent") then return "Innocent" end  
    end  
    return nil  
end  
  
function Other.getrole(p: Player): string  
    if Other.trip[p.Name] and Other.trip[p.Name].Role then return Other.trip[p.Name].Role end  
    return Other.r1(p) or Other.r2(p) or Other.r3(p) or "Unknown"  
end  
  
function Other.isdead(p: Player): boolean  
    if Other.trip[p.Name] then return Other.trip[p.Name].Dead == true end  
    local c = p.Character  
    local h = c and c:FindFirstChildWhichIsA("Humanoid") :: Humanoid?  
    return if h then h.Health <= 0 else false  
end  
  
function Other.killm(): ()  
    local target: Player? = nil  
    for p, data in pairs(Other.roles) do  
        if data.Role == "Murderer" and not data.Dead then  
            target = p  
            break  
        end  
    end  
    if target then Main.kill(target) end  
end  
  
function Other.kills(): ()  
    local target: Player? = nil  
    for p, data in pairs(Other.roles) do  
        if (data.Role == "Sheriff" or data.Role == "Hero") and not data.Dead then  
            target = p  
            break  
        end  
    end  
    if not target then  
        for _, p in ipairs(P:GetPlayers()) do  
            if p ~= lp and not Other.isdead(p) then  
                local role = Other.r1(p) or Other.r2(p) or Other.r3(p)  
                if role == "Sheriff" or role == "Hero" then target = p break end
            end  
        end  
    end  
    if target then Main.kill(target) end  
end  
  
function Other.killh(): ()  
    local target: Player? = nil  
    for p, data in pairs(Other.roles) do  
        if data.Role == "Hero" and not data.Dead then  
            target = p  
            break  
        end  
    end  
    if not target then  
        for _, p in ipairs(P:GetPlayers()) do  
            if p ~= lp and not Other.isdead(p) then  
                local c = p.Character  
                if c then  
                    if c:FindFirstChild("Hero") then target = p break end  
                    for _, t in ipairs(c:GetChildren()) do  
                        if t:IsA("Tool") and string_lower(t.Name) == "hero" then target = p break end  
                    end  
                end  
            end  
        end  
    end  
    if target then Main.kill(target) end  
end  
  
-- ftf related stuff  
function Other.getbeast(): Player?  
    local plrs = P:GetPlayers()  
    for i = 1, #plrs do  
        local p = plrs[i]  
        if p ~= lp then  
            local char = p.Character  
            if char and char:FindFirstChild("Hammer") then  
                return p  
            end  
        end  
    end  
    return nil  
end  
  
function Other.killbeast(): ()  
    local beast = Other.getbeast()  
    if beast then  
        Main.kill(beast)  
    end  
end  
  
local sel: Player? = nil  
  
-- ui related stuff  
uniSect:AddPlayerDropdown("Select Target Player", function(p: Player)  
    sel = p  
end)  
  
uniSect:AddButton("Kill Target", function()  
    if sel then  
        Main.kill(sel)  
    end  
end)  
  
uniSect:AddToggle("Enable Kill Target Bindable Button", function(val: boolean)  
    if val then  
        BB.add("kill_target", "Kill\nTarget", function() if sel then Main.kill(sel) end end, nil, true)  
    else  
        BB.remove("kill_target")  
    end  
end)  
  
uniSect:AddDropdown("Kill Target Bindable Button Shape", BB_SHAPE_OPTIONS, function(val: string)  
    for i, name in ipairs(BB_SHAPE_OPTIONS) do  
        if name == val then BB.setshape("kill_target", i - 1) break end  
    end  
end)  
  
uniSect:AddButton("Kill All", function()  
    Main.killall()  
end)  
  
uniSect:AddToggle("Enable Kill All Bindable Button", function(val: boolean)  
    if val then  
        BB.add("kill_all", "Kill\nAll", function() Main.killall() end, nil, true)  
    else  
        BB.remove("kill_all")  
    end  
end)  
  
uniSect:AddDropdown("Kill All Bindable Button Shape", BB_SHAPE_OPTIONS, function(val: string)  
    for i, name in ipairs(BB_SHAPE_OPTIONS) do  
        if name == val then BB.setshape("kill_all", i - 1) break end  
    end  
end)  
  
uniSect:AddToggle("Loop Kill Target", function(val: boolean)  
    Main.loop_target = val  
end)  
  
uniSect:AddToggle("Loop Kill All", function(val: boolean)  
    Main.loop_all = val  
end)  
  
task_spawn(function()  
    while true do  
        if Main.loop_target and sel and not Main.active then  
            Main.kill(sel)  
        elseif Main.loop_all and not Main.active then  
            Main.killall()  
        end  
        task_wait(0.1)  
    end  
end)  
  
local miscSect = shared.AddSection("GKP | Miscellaneous")
local _setClickKill
local _setTouchKill
local _setFlyKill
local _clickKillState = false
local _touchKillState = false
local _flyKillState = false  
  
do  
    local clickKillCon = nil  
    local clickKillEnabled = false  
    local clickKillCon2 = nil  
    local clickKillTarget = nil  
  
    local function StartClickKill()  
        clickKillCon = UIS.InputBegan:Connect(function(input, gameProcessed)  
            if gameProcessed then return end  
            if input.UserInputType ~= Enum.UserInputType.MouseButton1  
            and input.UserInputType ~= Enum.UserInputType.Touch then return end  
  
            local mouse = lp:GetMouse()  
            local target = mouse.Target  
            if not target then return end  
  
            local character = target:FindFirstAncestorWhichIsA("Model")  
            if not character then return end  
            local humanoid = character:FindFirstChild("Humanoid")  
            if not humanoid then return end  
            local targetPlayer = P:GetPlayerFromCharacter(character)  
            if not targetPlayer or targetPlayer == lp then return end  
  
            clickKillTarget = targetPlayer  
            local tChar = targetPlayer.Character  
            local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")  
            local lChar = lp.Character  
            local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")  
            if not tRoot or not lRoot then return end  
            splithrp(lChar)
            freezechar(lChar)
            lRoot.CFrame = tRoot.CFrame * CFrame.new(0, 0, 2)  
            task_wait(0.1)  
            if clickKillCon2 then clickKillCon2:Disconnect() end  
            local sessionActive = true  
            clickKillCon2 = R.Heartbeat:Connect(function()  
                if not sessionActive then return end  
                if not lRoot or not lRoot.Parent then sessionActive = false return end  
                if not tRoot or not tRoot:IsDescendantOf(workspace) then  
                    tChar = targetPlayer.Character  
                    tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")  
                    if not tRoot then return end  
                end  
                pcall(shp, lRoot, "PhysicsRepRootPart", tRoot)  
        pcall(shp, lRoot, "CFrame", tRoot.CFrame)   
                lRoot.Velocity = zero  
                lRoot.AssemblyLinearVelocity = zero  
                lRoot.AssemblyAngularVelocity = zero  
                lRoot.RotVelocity = zero  
                local lHum = lChar and lChar:FindFirstChildOfClass("Humanoid")  
                if lHum then pcall(shp, lHum, "MoveDirectionInternal", nan) end  
            end)  
            task_delay(1, function()  
                sessionActive = false  
                if clickKillCon2 then clickKillCon2:Disconnect() clickKillCon2 = nil end  
                pcall(shp, lRoot, "PhysicsRepRootPart", nil)  
                unfreezechar(lChar)
            end)  
        end)  
    end  
  
    local function StopClickKill()  
        if clickKillCon then clickKillCon:Disconnect() clickKillCon = nil end  
        if clickKillCon2 then clickKillCon2:Disconnect() clickKillCon2 = nil end  
        clickKillTarget = nil  
    end  
  
    _setClickKill = function(v) clickKillEnabled = v _clickKillState = v if v then StartClickKill() else StopClickKill() end end  
  
    miscSect:AddToggle("Click Kill", function(val: boolean)  
        clickKillEnabled = val  
        if clickKillEnabled then  
            StartClickKill()  
        else  
            StopClickKill()  
        end  
    end)  
  
    miscSect:AddToggle("Enable Click Kill Bindable Button", function(val: boolean)  
        if val then  
            BB.add("click_kill", "Click\nKill", function()  
                clickKillEnabled = true  
                StartClickKill()  
            end, function()  
                clickKillEnabled = false  
                StopClickKill()  
            end)  
        else  
            BB.remove("click_kill")  
        end  
    end)  
  
    miscSect:AddDropdown("Click Kill Bindable Button Shape", BB_SHAPE_OPTIONS, function(val: string)  
        for i, name in ipairs(BB_SHAPE_OPTIONS) do  
            if name == val then BB.setshape("click_kill", i - 1) break end  
        end  
    end)  
end  
  
do  
    local touchKillEnabled = false  
    local touchedCon = nil  
    local touchKillConnections = {}  
    local touchKillCharAddedCon = nil  
  
    local function StartTouchKill()  
        local function onTouched(hit)  
            if not touchKillEnabled then return end  
            local char = hit:FindFirstAncestorWhichIsA("Model")  
            if not char then return end  
            local humanoid = char:FindFirstChildOfClass("Humanoid")  
            if not humanoid then return end  
            local targetPlayer = P:GetPlayerFromCharacter(char)  
            if not targetPlayer or targetPlayer == lp then return end  
  
            local lChar = lp.Character  
            local lHrp = lChar and lChar:FindFirstChild("HumanoidRootPart")  
            local tHrp = char:FindFirstChild("HumanoidRootPart")  
            if not lHrp or not tHrp then return end  
            if touchKillConnections[targetPlayer] then return end  

            local sessionActive = true  
            local con = R.Heartbeat:Connect(function()  
                if not sessionActive then return end  
                if not lHrp or not lHrp.Parent then sessionActive = false return end  
                if not tHrp or not tHrp:IsDescendantOf(workspace) then  
                    tHrp = char:FindFirstChild("HumanoidRootPart")  
                    if not tHrp then return end  
                end  
                pcall(shp, lHrp, "PhysicsRepRootPart", tHrp)  
                lHrp.CFrame = tHrp.CFrame  
                lHrp.Velocity = zero  
                lHrp.AssemblyLinearVelocity = zero  
                lHrp.AssemblyAngularVelocity = zero  
                lHrp.RotVelocity = zero  
                local lHum = lChar and lChar:FindFirstChildOfClass("Humanoid")  
                if lHum then pcall(shp, lHum, "MoveDirectionInternal", nan) end  
            end)  
  
            touchKillConnections[targetPlayer] = con  
  
            task_delay(1.5, function()  
                sessionActive = false  
                if con then pcall(function() con:Disconnect() end) end  
                touchKillConnections[targetPlayer] = nil  
                if lHrp and lHrp.Parent then  
                    pcall(shp, lHrp, "PhysicsRepRootPart", nil)  
                end  
            end)  
        end  
  
        local char = lp.Character  
        if char then  
            local hrp = char:FindFirstChild("HumanoidRootPart")  
            if hrp then touchedCon = hrp.Touched:Connect(onTouched) end  
        end  
  
        if touchKillCharAddedCon then pcall(function() touchKillCharAddedCon:Disconnect() end) end  
        touchKillCharAddedCon = lp.CharacterAdded:Connect(function(newChar)  
            if not touchKillEnabled then return end  
            task_wait(0.5)  
            if not touchKillEnabled then return end  
            local newHrp = newChar:FindFirstChild("HumanoidRootPart")  
            if newHrp then  
                if touchedCon then pcall(function() touchedCon:Disconnect() end) end  
                touchedCon = newHrp.Touched:Connect(onTouched)  
            end  
        end)  
    end  
  
    local function StopTouchKill()  
        touchKillEnabled = false  
        if touchedCon then pcall(function() touchedCon:Disconnect() end) touchedCon = nil end  
        if touchKillCharAddedCon then pcall(function() touchKillCharAddedCon:Disconnect() end) touchKillCharAddedCon = nil end  
        for _, con in pairs(touchKillConnections) do  
            if con then pcall(function() con:Disconnect() end) end  
        end  
        touchKillConnections = {}  
        local char = lp.Character  
        if char then  
            local hrp = char:FindFirstChild("HumanoidRootPart")  
            if hrp then pcall(shp, hrp, "PhysicsRepRootPart", nil) end  
        end  
    end  
  
    _setTouchKill = function(v) touchKillEnabled = v _touchKillState = v if v then StartTouchKill() else StopTouchKill() end end  
  
    miscSect:AddToggle("Touch Kill", function(val: boolean)  
        touchKillEnabled = val  
        if touchKillEnabled then  
            StartTouchKill()  
        else  
            StopTouchKill()  
        end  
    end)  
  
    miscSect:AddToggle("Enable Touch Kill Bindable Button", function(val: boolean)  
        if val then  
            BB.add("touch_kill", "Touch\nKill", function()  
                touchKillEnabled = true  
                StartTouchKill()  
            end, function()  
                StopTouchKill()  
            end)  
        else  
            BB.remove("touch_kill")  
        end  
    end)  
  
    miscSect:AddDropdown("Touch Kill Bindable Button Shape", BB_SHAPE_OPTIONS, function(val: string)  
        for i, name in ipairs(BB_SHAPE_OPTIONS) do  
            if name == val then BB.setshape("touch_kill", i - 1) break end  
        end  
    end)  
end  
  
do  
    local flyKillEnabled = false  
    local flyCon = nil  
    local flyKillCon = nil  
    local flyBg = nil  
    local flyBv = nil  
    local flySpeed = 50  
    local goingUp = false  
    local goingDown = false  
    local inputConnections = {}  
  
    local cachedPlayers = {}  
    P.PlayerAdded:Connect(function(p)  
        if p ~= lp then table_insert(cachedPlayers, p) end  
    end)  
    P.PlayerRemoving:Connect(function(p)  
        for i, cp in ipairs(cachedPlayers) do  
            if cp == p then table.remove(cachedPlayers, i) break end  
        end  
    end)  
    for _, p in ipairs(P:GetPlayers()) do  
        if p ~= lp then table_insert(cachedPlayers, p) end  
    end  
  
    local function StartFlyKill()  
        local char = lp.Character  
        if not char then return end  
        local hrp = char:FindFirstChild("HumanoidRootPart")  
        if not hrp then return end  
  
        flyBg = Instance.new("BodyGyro")  
        flyBg.P = 9e4  
        flyBg.maxTorque = Vector3_new(9e9, 9e9, 9e9)  
        flyBg.cframe = hrp.CFrame  
        flyBg.Parent = hrp  
  
        flyBv = Instance.new("BodyVelocity")  
        flyBv.velocity = zero  
        flyBv.maxForce = Vector3_new(9e9, 9e9, 9e9)  
        flyBv.Parent = hrp  
  
        local cam = workspace.CurrentCamera  
        local flyHumanoid = char:FindFirstChild("Humanoid")  
  
        local upConn = UIS.InputBegan:Connect(function(input, gp)  
            if gp then return end  
            if input.KeyCode == Enum.KeyCode.Space then goingUp = true  
            elseif input.KeyCode == Enum.KeyCode.LeftShift then goingDown = true end  
        end)  
        table_insert(inputConnections, upConn)  
  
        local upConn2 = UIS.InputEnded:Connect(function(input, gp)  
            if gp then return end  
            if input.KeyCode == Enum.KeyCode.Space then goingUp = false  
            elseif input.KeyCode == Enum.KeyCode.LeftShift then goingDown = false end  
        end)  
        table_insert(inputConnections, upConn2)  
  
        local jumpConn = UIS.JumpRequest:Connect(function()  
            goingUp = true  
            task_delay(0.3, function() goingUp = false end)  
        end)  
        table_insert(inputConnections, jumpConn)  
  
        flyCon = R.RenderStepped:Connect(function()  
            if not flyKillEnabled then return end  
            if not hrp or not hrp.Parent then return end  
  
            flyBg.cframe = cam.CFrame  
  
            local moveDir = zero  
  
            if UIS:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end  
            if UIS:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end  
            if UIS:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end  
            if UIS:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end  
  
            if flyHumanoid and flyHumanoid.MoveDirection.Magnitude > 0.1 then  
                local cf = cam.CFrame.Rotation  
                local dir = cf:VectorToObjectSpace(flyHumanoid.MoveDirection * 10)  
                if dir.Magnitude ~= 0 then  
                    local mobileMove = cf:VectorToWorldSpace(Vector3_new(dir.X, 0, dir.Z).Unit * dir.Magnitude)  
                    moveDir = moveDir + mobileMove  
                end  
            end  
  
            if goingUp then moveDir = moveDir + Vector3_new(0, 1, 0) end  
            if goingDown then moveDir = moveDir - Vector3_new(0, 1, 0) end  
  
            flyBv.velocity = moveDir.Magnitude > 0 and moveDir.Unit * flySpeed or zero  
        end)  
  
        flyKillCon = R.Heartbeat:Connect(function()  
            if not flyKillEnabled then return end  
            if not hrp or not hrp.Parent then return end  
  
            local nearestPlayer = nil  
            local nearestHrp = nil
            local nearestDist = math.huge  
            for _, p in ipairs(cachedPlayers) do  
                if p.Character then  
                    local tHrp = p.Character:FindFirstChild("HumanoidRootPart")  
                    if tHrp then  
                        local dist = (hrp.Position - tHrp.Position).Magnitude  
                        if dist < nearestDist and dist < 10 then  
                            nearestDist = dist  
                            nearestPlayer = p  
                            nearestHrp = tHrp
                        end  
                    end  
                end  
            end  

            if nearestPlayer then  
                if nearestHrp then  
                    pcall(shp, hrp, "PhysicsRepRootPart", nearestHrp)  
                    local flyHum = char:FindFirstChildOfClass("Humanoid")  
                    if flyHum then pcall(shp, flyHum, "MoveDirectionInternal", nan) end  
                end  
            else  
                pcall(shp, hrp, "PhysicsRepRootPart", nil)  
            end  
        end)  
    end  
  
    local function StopFlyKill()  
        flyKillEnabled = false  
        if flyCon then flyCon:Disconnect() flyCon = nil end  
        if flyKillCon then flyKillCon:Disconnect() flyKillCon = nil end  
        for _, conn in ipairs(inputConnections) do  
            if conn then conn:Disconnect() end  
        end  
        inputConnections = {}  
        if flyBg then flyBg:Destroy() flyBg = nil end  
        if flyBv then flyBv:Destroy() flyBv = nil end  
        goingUp = false  
        goingDown = false  
        local char = lp.Character  
        if char then  
            local hrp = char:FindFirstChild("HumanoidRootPart")  
            if hrp then pcall(shp, hrp, "PhysicsRepRootPart", nil) end  
        end  
    end  
  
    _setFlyKill = function(v) flyKillEnabled = v _flyKillState = v if v then StartFlyKill() else StopFlyKill() end end  
  
    miscSect:AddToggle("Fly Kill", function(val: boolean)  
        flyKillEnabled = val  
        if flyKillEnabled then  
            StartFlyKill()  
        else  
            StopFlyKill()  
        end  
    end)  
  
    miscSect:AddToggle("Enable Fly Kill Bindable Button", function(val: boolean)  
        if val then  
            BB.add("fly_kill", "Fly\nKill", function()  
                flyKillEnabled = true  
                StartFlyKill()  
            end, function()  
                flyKillEnabled = false  
                StopFlyKill()  
            end)  
        else  
            BB.remove("fly_kill")  
        end  
    end)  
  
    miscSect:AddDropdown("Fly Kill Bindable Button Shape", BB_SHAPE_OPTIONS, function(val: string)  
        for i, name in ipairs(BB_SHAPE_OPTIONS) do  
            if name == val then BB.setshape("fly_kill", i - 1) break end  
        end  
    end)  
end  



do

    local antiFlingEnabled = false

    -- [Player] = { charConn, descConn, parts = {[BasePart] = originalCanCollide} }

    local afStates = {}

    local afPlayerAddedConn = nil

    local afPlayerRemovingConn = nil



    local function applyToChar(player, char)

        if not char or not antiFlingEnabled then return end

        local state = afStates[player]

        if not state then return end

        -- Disconnect old DescendantAdded conn before re-applying on respawn

        if state.descConn then

            pcall(function() state.descConn:Disconnect() end)

            state.descConn = nil

        end

        table_clear(state.parts)

        -- Disable CanCollide on all existing BaseParts, saving originals

        for _, v in ipairs(char:GetDescendants()) do

            if v:IsA("BasePart") then

                state.parts[v] = v.CanCollide

                pcall(function() v.CanCollide = false end)

            end

        end

        -- Watch for parts added later (tools, accessories, etc.)

        state.descConn = char.DescendantAdded:Connect(function(d)

            if not antiFlingEnabled then return end

            if d:IsA("BasePart") then

                state.parts[d] = d.CanCollide

                pcall(function() d.CanCollide = false end)

            end

        end)

    end



    local function restorePlayer(player)

        local state = afStates[player]

        if not state then return end

        if state.charConn then pcall(function() state.charConn:Disconnect() end) state.charConn = nil end

        if state.descConn then pcall(function() state.descConn:Disconnect() end) state.descConn = nil end

        for part, orig in pairs(state.parts) do

            if part and part.Parent then

                pcall(function() part.CanCollide = orig end)

            end

        end

        table_clear(state.parts)

        afStates[player] = nil

    end



    local function trackPlayer(player)

        if not player or player == lp or afStates[player] then return end

        local state = { charConn = nil, descConn = nil, parts = {} }

        afStates[player] = state

        -- Apply to already-loaded character

        if player.Character then

            applyToChar(player, player.Character)

        end

        -- Re-apply every time the player respawns

        state.charConn = player.CharacterAdded:Connect(function(char)

            if not antiFlingEnabled then return end

            task_wait(0) -- one frame so descendants are populated

            applyToChar(player, char)

        end)

    end



    local function StartAntiFling()

        local plrs = P:GetPlayers()

        for i = 1, #plrs do

            trackPlayer(plrs[i])

        end

        afPlayerAddedConn = P.PlayerAdded:Connect(function(p)

            if antiFlingEnabled then trackPlayer(p) end

        end)

        -- On player leave: drop state without restoring (char is already gone)

        afPlayerRemovingConn = P.PlayerRemoving:Connect(function(p)

            local state = afStates[p]

            if state then

                if state.charConn then pcall(function() state.charConn:Disconnect() end) end

                if state.descConn then pcall(function() state.descConn:Disconnect() end) end

                afStates[p] = nil

            end

        end)

    end



    local function StopAntiFling()

        if afPlayerAddedConn then pcall(function() afPlayerAddedConn:Disconnect() end) afPlayerAddedConn = nil end

        if afPlayerRemovingConn then pcall(function() afPlayerRemovingConn:Disconnect() end) afPlayerRemovingConn = nil end

        -- Snapshot keys before iteration to avoid mutation issues

        local toRestore = {}

        for p in pairs(afStates) do table_insert(toRestore, p) end

        for _, p in ipairs(toRestore) do restorePlayer(p) end

        afStates = {}

    end



    miscSect:AddToggle("Anti-Fling", function(val: boolean)

        antiFlingEnabled = val

        if antiFlingEnabled then

            StartAntiFling()

        else

            StopAntiFling()

        end

    end)

end

local whitelistSel: Player? = nil

miscSect:AddPlayerDropdown("Whitelist Player", function(p: Player)
    whitelistSel = p
end)

miscSect:AddButton("Whitelist Player", function()
    if whitelistSel then
        whitelist[whitelistSel.Name] = true
        savewhitelist()
        shared.Notify(whitelistSel.Name .. " has been whitelisted.", 1)
    end
end)

miscSect:AddButton("Unwhitelist Player", function()
    if whitelistSel then
        whitelist[whitelistSel.Name] = nil
        savewhitelist()
        shared.Notify(whitelistSel.Name .. " has been removed from whitelist.", 1)
    end
end)

miscSect:AddButton("Unwhitelist All", function()
    whitelist = {}
    savewhitelist()
    shared.Notify("All players have been removed from whitelist.", 1)
end)
  
local trygetgun
local rungivegun
local playernotavailable
if mmGame and mmSect then  
    mmSect:AddButton("Kill Murderer", function()  
        Other.killm()  
    end)  
  
    mmSect:AddToggle("Enable Kill Murderer Bindable Button", function(val: boolean)  
        if val then  
            BB.add("kill_murderer", "Kill\nMurderer", function() Other.killm() end, nil, true)  
        else  
            BB.remove("kill_murderer")  
        end  
    end)  
  
    mmSect:AddDropdown("Kill Murderer Bindable Button Shape", BB_SHAPE_OPTIONS, function(val: string)  
        for i, name in ipairs(BB_SHAPE_OPTIONS) do  
            if name == val then BB.setshape("kill_murderer", i - 1) break end  
        end  
    end)  
  
    mmSect:AddButton("Kill Sheriff", function()  
        Other.kills()  
    end)  
  
    mmSect:AddToggle("Enable Kill Sheriff Bindable Button", function(val: boolean)  
        if val then  
            BB.add("kill_sheriff", "Kill\nSheriff", function() Other.kills() end, nil, true)  
        else  
            BB.remove("kill_sheriff")  
        end  
    end)  
  
    mmSect:AddDropdown("Kill Sheriff Bindable Button Shape", BB_SHAPE_OPTIONS, function(val: string)  
        for i, name in ipairs(BB_SHAPE_OPTIONS) do  
            if name == val then BB.setshape("kill_sheriff", i - 1) break end  
        end  
    end)  
  
    mmSect:AddToggle("Auto Kill Murderer", function(val: boolean)  
        Other.af_m = val  
    end)  
  
    mmSect:AddToggle("Auto Kill Sheriff", function(val: boolean)  
        Other.af_s = val  
    end)  
  
    if isMM2 then  
        mmSect:AddButton("Give Target Gun", function()  
            if sel then  
                rungivegun(sel)  
            end  
        end)  
  
        mmSect:AddToggle("Enable Give Target Gun Bindable Button", function(val: boolean)  
            if val then  
                BB.add("give_target_gun", "Give\nGun", function() if sel then rungivegun(sel) end end, nil, true)  
            else  
                BB.remove("give_target_gun")  
            end  
        end)  
  
        mmSect:AddDropdown("Give Target Gun Bindable Button Shape", BB_SHAPE_OPTIONS, function(val: string)  
            for i, name in ipairs(BB_SHAPE_OPTIONS) do  
                if name == val then BB.setshape("give_target_gun", i - 1) break end  
            end  
        end)  

        mmSect:AddButton("Get Gun", function()
            if playernotavailable(lp) then shared.Notify("Player and Target must be in game!", 2) return end
            local lpRole = Other.getrole(lp)
            if lpRole == "Sheriff" or lpRole == "Hero" then shared.Notify("You're already Sheriff?!!", 2) return end
            if _flyKillState and _setFlyKill then _setFlyKill(false) end
            if not workspace:FindFirstChild("GunDrop", true) then
                Other.kills()
                Other.killh()
            end
            trygetgun(nil)
        end)

        mmSect:AddToggle("Enable Get Gun Bindable Button", function(val: boolean)
            if val then
                BB.add("get_gun", "Get\nGun", function()
                    if playernotavailable(lp) then return end
                    local lpRole = Other.getrole(lp)
                    if lpRole == "Sheriff" or lpRole == "Hero" then return end
                    if _flyKillState and _setFlyKill then _setFlyKill(false) end
                    if not workspace:FindFirstChild("GunDrop", true) then
                        Other.kills()
                        Other.killh()
                    end
                    trygetgun(nil)
                end, nil, true)
            else
                BB.remove("get_gun")
            end
        end)

        mmSect:AddDropdown("Get Gun Bindable Button Shape", BB_SHAPE_OPTIONS, function(val: string)
            for i, name in ipairs(BB_SHAPE_OPTIONS) do
                if name == val then BB.setshape("get_gun", i - 1) break end
            end
        end)
    end  
  
    task_spawn(function()  
        while true do  
            Other.getmm2data()  
            local plrs = P:GetPlayers()  
            for i = 1, #plrs do  
                local p = plrs[i]  
                if p ~= lp then  
                    Other.roles[p] = { Role = Other.getrole(p), Dead = Other.isdead(p) }  
                end  
            end  
            task_wait(1)  
        end  
    end)  
  
    task_spawn(function()  
        while true do  
            if not Main.active then  
                if Other.af_m then Other.killm() end  
                if Other.af_s then Other.kills() end  
            end  
            task_wait(1)  
        end  
    end)  
end  
  
if isFTF and ftfSect then  
    ftfSect:AddButton("Kill Beast", function()  
        Other.killbeast()  
    end)  
  
    ftfSect:AddToggle("Enable Kill Beast Bindable Button", function(val: boolean)  
        if val then  
            BB.add("kill_beast", "Kill\nBeast", function() Other.killbeast() end, nil, true)  
        else  
            BB.remove("kill_beast")  
        end  
    end)  
  
    ftfSect:AddDropdown("Kill Beast Bindable Button Shape", BB_SHAPE_OPTIONS, function(val: string)  
        for i, name in ipairs(BB_SHAPE_OPTIONS) do  
            if name == val then BB.setshape("kill_beast", i - 1) break end  
        end  
    end)  
  
    ftfSect:AddToggle("Auto Kill Beast", function(val: boolean)  
        Other.af_b = val  
    end)  
      
    task_spawn(function()  
        while true do  
            if Other.af_b and not Main.active then  
                Other.killbeast()  
            end  
            task_wait(1)  
        end  
    end)  
  end  
  
  -- you actually read this all?

local function resolvetarget(arg)
    local low = string_lower(arg)
    local plrs = P:GetPlayers()
    for _, p in ipairs(plrs) do
        if p ~= lp and string_match(string_lower(p.Name), low) then return p end
    end
    return nil
end

local function getclosest()
    local lChar = lp.Character
    local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")
    if not lRoot then return nil end
    local best, bestDist = nil, math.huge
    for _, p in ipairs(P:GetPlayers()) do
        if p ~= lp and p.Character then
            local r = p.Character:FindFirstChild("HumanoidRootPart")
            if r then
                local d = (lRoot.Position - r.Position).Magnitude
                if d < bestDist then bestDist = d best = p end
            end
        end
    end
    return best
end

local function getfarthest()
    local lChar = lp.Character
    local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")
    if not lRoot then return nil end
    local best, bestDist = nil, 0
    for _, p in ipairs(P:GetPlayers()) do
        if p ~= lp and p.Character then
            local r = p.Character:FindFirstChild("HumanoidRootPart")
            if r then
                local d = (lRoot.Position - r.Position).Magnitude
                if d > bestDist then bestDist = d best = p end
            end
        end
    end
    return best
end

local function getrandom()
    local list = {}
    for _, p in ipairs(P:GetPlayers()) do
        if p ~= lp then table_insert(list, p) end
    end
    if #list == 0 then return nil end
    return list[math.random(1, #list)]
end

local function getfriends()
    local list = {}
    for _, p in ipairs(P:GetPlayers()) do
        if p ~= lp and lp:IsFriendsWith(p.UserId) then table_insert(list, p) end
    end
    return list
end

local function flingtarget(target)
    if not target or not target.Character then return end
    local lChar = lp.Character
    local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")
    local lHum = lChar and lChar:FindFirstChild("Humanoid")
    local tChar = target.Character
    local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
    if not lRoot or not tRoot or not lHum then return end
    splithrp(lChar)
    freezechar(lChar)
    local saved = lRoot.CFrame
    local elapsed = 0
    local fCon
    local finished = false
    local function finish()
        if finished then return end
        finished = true
        if fCon then pcall(function() fCon:Disconnect() end) fCon = nil end
        if lRoot and lRoot.Parent then
            pcall(shp, lRoot, "PhysicsRepRootPart", nil)
            pcall(function() lRoot.CFrame = saved end)
            pcall(function() lRoot.AssemblyLinearVelocity = zero end)
        end
        unfreezechar(lChar)
    end
    fCon = R.Heartbeat:Connect(function(dt)
        if finished then return end
        elapsed = elapsed + dt
        if not lRoot or not lRoot.Parent or not tRoot or not tRoot:IsDescendantOf(workspace) then
            finish()
            return
        end
        pcall(shp, lHum, "MoveDirectionInternal", nan)
        pcall(shp, lRoot, "PhysicsRepRootPart", tRoot)
        pcall(shp, lRoot, "CFrame", tRoot.CFrame)
        lRoot.AssemblyLinearVelocity = Vector3_new(math.random(-500, 500), 9999, math.random(-500, 500))
        if elapsed >= 0.3 then
            finish()
        end
    end)
    task_delay(1, finish)
end

trygetgun = function(onSuccess)
    local start = os_clock()
    task_spawn(function()
        while os_clock() - start < 5 do
            local drop = workspace:FindFirstChild("GunDrop", true)
            if drop then
                local part = drop:IsA("BasePart") and drop or drop:FindFirstChildWhichIsA("BasePart")
                local lChar = lp.Character
                local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")
                local lHum = lChar and lChar:FindFirstChild("Humanoid")
                if part and lRoot then
                    part.CFrame = lRoot.CFrame
                    task_wait(0.6)
                end
                if onSuccess then onSuccess() end
                return
            end
            task_wait(0.1)
        end
        shared.Notify("Failed to get the Gun :(", 3)
    end)
end

playernotavailable = function(p)
    local entry = Other.trip[p.Name]
    if not entry or not entry.Role or entry.Role == "Unknown" then return true end
    return entry.Dead == true
end

local function parsetogglearg(arg, current)
    if arg == "true" or arg == "enabled" then return true
    elseif arg == "false" or arg == "disabled" then return false
    else return not current end
end

local function rungivegunto(target)
    if not target or playernotavailable(target) then shared.Notify("Player and Target must be in game!", 2) return end
    local tRole = Other.getrole(target)
    if tRole == "Sheriff" or tRole == "Hero" then shared.Notify("Target already has the gun!", 2) return end
    if tRole == "Murderer" then shared.Notify("You cannot give the Murderer the gun... :/", 2) return end
    local tChar = target.Character
    local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
    local lChar = lp.Character
    local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")
    local lHum = lChar and lChar:FindFirstChild("Humanoid")
    if tRoot and lRoot and lHum then
        splithrp(lChar)
        freezechar(lChar)
        pcall(shp, lRoot, "PhysicsRepRootPart", tRoot)
        local elapsed = 0
        local pCon
        local finished = false
        local function finish()
            if finished then return end
            finished = true
            if pCon then pcall(function() pCon:Disconnect() end) pCon = nil end
            if lRoot and lRoot.Parent then
                pcall(shp, lRoot, "PhysicsRepRootPart", nil)
            end
            unfreezechar(lChar)
        end
        pCon = R.Heartbeat:Connect(function(dt)
            if finished then return end
            elapsed = elapsed + dt
            if not lRoot or not lRoot.Parent or not tRoot or not tRoot:IsDescendantOf(workspace) then
                finish()
                return
            end
            pcall(shp, lHum, "MoveDirectionInternal", nan)
            pcall(function() lRoot.CFrame = tRoot.CFrame * CFrame.new(0, 3, -5) end)
            lRoot.AssemblyLinearVelocity = zero
            if elapsed >= 0.4 then
                finish()
            end
        end)
        task_delay(1, finish)
        task_wait(0.5)
        lChar = lp.Character
        lHum = lChar and lChar:FindFirstChild("Humanoid")
        if lHum then lHum.Health = 0 end
    end
end

rungivegun = function(target)
    if playernotavailable(lp) then shared.Notify("Player and Target must be in game!", 2) return end
    local lpRole = Other.getrole(lp)
    if _flyKillState and _setFlyKill then _setFlyKill(false) end
    local gunDropped = workspace:FindFirstChild("GunDrop", true) ~= nil
    local function give() task_wait(0.3) rungivegunto(target) end
    if lpRole == "Sheriff" or lpRole == "Hero" then
        task_spawn(give)
    elseif gunDropped then
        trygetgun(give)
    else
        Other.kills()
        Other.killh()
        trygetgun(give)
    end
end

local loopedCmds = {}
local handlecmd

handlecmd = function(cmd, arg)
    if cmd == "kill" then
        if arg == "all" then
            Main.killall()
        elseif arg == "closest" then
            local t = getclosest()
            if t then Main.kill(t) end
        elseif arg == "farthest" then
            local t = getfarthest()
            if t then Main.kill(t) end
        elseif arg == "random" then
            local t = getrandom()
            if t then Main.kill(t) end
        elseif arg == "friends" then
            local friends = getfriends()
            task_spawn(function()
                for _, p in ipairs(friends) do
                    Main.kill(p)
                    task_wait(1.2)
                end
            end)
        elseif arg == "murderer" and mmGame then
            Other.killm()
        elseif (arg == "murder" or arg == "knife") and mmGame then
            Other.killm()
        elseif arg == "sheriff" and mmGame then
            Other.kills()
        elseif (arg == "hero" or arg == "gunner" or arg == "gun") and mmGame then
            if arg == "hero" then
                Other.killh()
            else
                Other.kills()
            end
        elseif arg == "beast" and isFTF then
            Other.killbeast()
        else
            local t = resolvetarget(arg)
            if t then Main.kill(t) end
        end

    elseif cmd == "endround" then
        if mmGame then
            Other.killm()
        elseif isFTF then
            local beast = Other.getbeast()
            if beast then flingtarget(beast) end
        end

    elseif cmd == "kall" or cmd == "killall" then
        Main.killall()

    elseif cmd == "getgun" and mmGame then
        if playernotavailable(lp) then shared.Notify("Player and Target must be in game!", 2) return end
        local lpRole = Other.getrole(lp)
        if lpRole == "Sheriff" or lpRole == "Hero" then shared.Notify("You're already Sheriff?!!", 2) return end
        if _flyKillState and _setFlyKill then _setFlyKill(false) end
        if not workspace:FindFirstChild("GunDrop", true) then
            Other.kills()
            Other.killh()
        end
        trygetgun(nil)

    elseif cmd == "givegun" and mmGame then
        if playernotavailable(lp) then shared.Notify("Player and Target must be in game!", 2) return end
        local lpRole = Other.getrole(lp)
        local gunDropped = workspace:FindFirstChild("GunDrop", true) ~= nil
        if _flyKillState and _setFlyKill then _setFlyKill(false) end
        local function doGive()
            task_wait(0.3)
            local target
            if arg == "" or arg == "random" then
                local survivors = {}
                for _, p in ipairs(P:GetPlayers()) do
                    if p ~= lp and not playernotavailable(p) then table_insert(survivors, p) end
                end
                if #survivors > 0 then target = survivors[math.random(1, #survivors)] end
            elseif arg == "closest" then
                target = getclosest()
            elseif arg == "farthest" then
                target = getfarthest()
            else
                target = resolvetarget(arg)
            end
            rungivegunto(target)
        end
        if lpRole == "Sheriff" or lpRole == "Hero" then
            task_spawn(doGive)
        elseif gunDropped then
            trygetgun(doGive)
        else
            Other.kills()
            Other.killh()
            trygetgun(doGive)
        end

    elseif cmd == "loop" or cmd == "l" then
        local loopCmd, loopArg = string_match(arg, "^(%S+)%s*(.*)")
        if not loopCmd then return end
        loopCmd = string_lower(loopCmd)
        loopArg = loopArg or ""
        local key = loopCmd .. " " .. loopArg
        if loopedCmds[key] then return end
        loopedCmds[key] = true
        loopedCmds[key] = task_spawn(function()
            while loopedCmds[key] do
                handlecmd(loopCmd, loopArg)
                local waited = 0
                while Main.active and waited < 5 do
                    task_wait(0.1)
                    waited = waited + 0.1
                end
                task_wait(0.1)
            end
        end)

    elseif cmd == "unloop" or cmd == "unl" or cmd == "noloop" then
        local loopCmd, loopArg = string_match(arg, "^(%S+)%s*(.*)")
        if not loopCmd then return end
        loopCmd = string_lower(loopCmd)
        loopArg = loopArg or ""
        local key = loopCmd .. " " .. loopArg
        if loopedCmds[key] then
            task.cancel(loopedCmds[key])
            loopedCmds[key] = nil
        end

    elseif cmd == "unloopall" or cmd == "unlall" or cmd == "noloopall" then
        for key, thread in pairs(loopedCmds) do
            task.cancel(thread)
            loopedCmds[key] = nil
        end

    elseif cmd == "touchkill" then
        if _setTouchKill then _setTouchKill(parsetogglearg(arg, _touchKillState)) end

    elseif cmd == "clickkill" then
        if _setClickKill then _setClickKill(parsetogglearg(arg, _clickKillState)) end

    elseif cmd == "flykill" then
        if _setFlyKill then _setFlyKill(parsetogglearg(arg, _flyKillState)) end

    elseif cmd == "whitelist" or cmd == "wl" or cmd == "ignore" then
        if arg == "all" then
            local plrs = P:GetPlayers()
            for i = 1, #plrs do
                if plrs[i] ~= lp then whitelist[plrs[i].Name] = true end
            end
            savewhitelist()
            shared.Notify("All players have been whitelisted.", 1)
        elseif arg ~= "" then
            local t = resolvetarget(arg)
            if t then
                whitelist[t.Name] = true
                savewhitelist()
                shared.Notify(t.Name .. " has been whitelisted.", 2)
            end
        end

    elseif cmd == "unwhitelist" or cmd == "unwl" or cmd == "unignore" then
        if arg == "all" then
            whitelist = {}
            savewhitelist()
            shared.Notify("All players have been removed from whitelist.", 1)
        elseif arg ~= "" then
            local t = resolvetarget(arg)
            if t then
                whitelist[t.Name] = nil
                savewhitelist()
                shared.Notify(t.Name .. " has been removed from whitelist.", 2)
            end
        end
    end
end

local function connectotherchats()
    for _, p in ipairs(P:GetPlayers()) do
        if p ~= lp and not otherchatconns[p] then
            otherchatconns[p] = p.Chatted:Connect(function(msg)
                if commandsDisabled then return end
                if not cmdeveryone and not (cmdwhitelistonly and whitelist[p.Name]) then return end
                local cmd, argRaw = string_match(msg, "^" .. cmdPrefix .. "(%S+)%s*(.*)")
                if not cmd then return end
                handlecmd(string_lower(cmd), argRaw and string_lower(argRaw) or "")
            end)
        end
    end
end

local function disconnectotherchats()
    for _, conn in pairs(otherchatconns) do conn:Disconnect() end
    otherchatconns = {}
end

local function refreshotherchats()
    if cmdeveryone or cmdwhitelistonly then connectotherchats() else disconnectotherchats() end
end

P.PlayerAdded:Connect(function(p)
    if p ~= lp and (cmdeveryone or cmdwhitelistonly) then connectotherchats() end
end)

P.PlayerRemoving:Connect(function(p)
    if otherchatconns[p] then otherchatconns[p]:Disconnect() otherchatconns[p] = nil end
end)

lp.Chatted:Connect(function(msg)
    if commandsDisabled then return end
    local cmd, argRaw = string_match(msg, "^" .. cmdPrefix .. "(%S+)%s*(.*)")
    if not cmd then return end
    cmd = string_lower(cmd)
    local arg = argRaw and string_lower(argRaw) or ""
    handlecmd(cmd, arg)
end)

local configSect = shared.AddSection("GKP | Configurations")

configSect:AddToggle("Disable Commands", function(val: boolean)
    commandsDisabled = val
end)

configSect:AddToggle("Whitelisted Players can use Commands", function(val: boolean)
    cmdwhitelistonly = val
    refreshotherchats()
end)

configSect:AddToggle("Everyone can use Commands", function(val: boolean)
    cmdeveryone = val
    refreshotherchats()
end)

configSect:AddTextBox("Prefix", function(val: string)
    if val and val ~= "" then
        cmdPrefix = val
    end
end)

configSect:AddToggle("Undraggable Bindable Buttons", function(val: boolean)
    bbUndraggable = val
end)

configSect:AddParagraph("Information", "Current Version: 1.1\nNote: This addon is still currently in early release, bugs/unexpected behaviour may happen!!!!!\nCredits: @not_.gato")
