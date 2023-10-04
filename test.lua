-- // Lib \\ --
--[[
    local UI = loadstring(game:HttpGet("https://akiri.best/assets/files/gayasf.ui2?key=5y1lxXSfWKhlQkSqhUuFyB8kPp8hsCau"))()
]]
-- // Library Init \\ --
local Start = tick()
local LoadTime = tick()
local Secure = setmetatable({}, {
    __index = function(Idx, Val)
        return game:GetService(Val)
    end
})
--
local UserInput = Secure.UserInputService
local RunService = Secure.RunService
local CoreGui = Secure.CoreGui
local Players = Secure.Players
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local HttpService = Secure.HttpService
local Mouse = LocalPlayer:GetMouse()
local InputGUI = Instance.new("ScreenGui", CoreGui)

local Stats = Secure.Stats.Network.ServerStatsItem["Data Ping"] 
--
-- Aimware = {6, [[{"Outline":"000005","Accent":"c82828","LightText":"e8e8e8","DarkText":"afafaf","LightContrast":"2b2b2b","CursorOutline":"191919","DarkContrast":"191919","TextBorder":"0a0a0a","Inline":"373737"}]]},
--
local Library = {
    Theme = {
        Accent = {
            Color3.fromHex("#c37be5"), -- Color3.fromHex("#a280d9"), -- Color3.fromRGB(255, 42, 10), Color3.fromHex("#3599d4")
            Color3.fromRGB(180, 156, 255),
            Color3.fromRGB(114, 0, 198),
            Color3.fromRGB(139, 130, 185),
            Color3.fromHex("#a83299")
        },
        Notification = {
            Error = Color3.fromHex("#c82828"),
            Warning = Color3.fromHex("#fc9803")
        },
        Hitbox = Color3.fromRGB(69, 69, 69),
        Friend = Color3.fromRGB(0, 200, 0),
        Outline = Color3.fromHex("#000005"),
        Inline = Color3.fromHex("#3c3c3c"),
        LightContrast = Color3.fromHex("#231946"),
        DarkContrast = Color3.fromHex("#191432"),
        Text = Color3.fromHex("#c8c8ff"),
        TextInactive = Color3.fromHex("#afafaf"),
        Font = Drawing.Fonts.Plex,
        TextSize = 13,
        UseOutline = true
    },
    Icons = {},
    Flags = {},
    Items = {},
    Drawings = {},
    Ignores = {},
    Keybind = {},
    Watermark = {},
    Connections = {},
    Keys = {
        KeyBoard = {["Q"] = "Q", ["W"] = "W", ["E"] = "E", ["R"] = "R", ["T"] = "T", ["Y"] = "Y", ["U"] = "U", ["I"] = "I", ["O"] = "O", ["P"] = "P", ["A"] = "A", ["S"] = "S", ["D"] = "D", ["F"] = "F", ["G"] = "G", ["H"] = "H", ["J"] = "J", ["K"] = "K", ["L"] = "L", ["Z"] = "Z", ["X"] = "X", ["C"] = "C", ["V"] = "V", ["B"] = "B", ["N"] = "N", ["M"] = "M", ["One"] = {"1", "!"}, ["Two"] = {"2", "\""}, ["Three"] = {"3", "£"}, ["Four"] = {"4", "$"}, ["Five"] = {"5", "%"}, ["Six"] = {"6", "^"}, ["Seven"] = {"7", "&"}, ["Eight"] = {"8", "*"}, ["Nine"] = {"9", "("}, ["Zero"] = {"0", ")"}, ["Space"] = " ", ["Slash"] = {"/", "?"}, ["BackSlash"] = {"\\", "|"}, ["Minus"] = {"-", "_"}, ["Equals"] = {"=", "+"}, ["RightBracket"] = {"]", "}"}, ["LeftBracket"] = {"[", "{"}, ["Semicolon"] = {";", ":"}, ["Quote"] = {"'", "@"}, ["Comma"] = {",", "<"}, ["Period"] = {".", ">"}},
        Letters = {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M"},
        KeyCodes = {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M", "One", "Two", "Three", "Four", "Five", "Six", "Seveen", "Eight", "Nine", "Zero", "Insert", "Tab", "Home", "End", "LeftAlt", "LeftControl", "LeftShift", "RightAlt", "RightControl", "RightShift", "CapsLock"},
        Inputs = {"MouseButton1", "MouseButton2", "MouseButton3"},
        Shortened = {["MouseButton1"] = "M1", ["MouseButton2"] = "M2", ["MouseButton3"] = "M3", ["Insert"] = "INS", ["LeftAlt"] = "LA", ["LeftControl"] = "LC", ["LeftShift"] = "LS", ["RightAlt"] = "RA", ["RightControl"] = "RC", ["RightShift"] = "RS", ["CapsLock"] = "CL"}
    },
    Input = {
        Caplock = false,
        LeftShift = false
    },
    Images = {},
    WindowVisible = true,
    Communication = Instance.new("BindableEvent")
}
--
local Utility = {}
--
getgenv().Library = Library
getgenv().Utility = Utility
syn.protect_gui(InputGUI)
-----------------------------------------------------------------
do
    Utility.AddInstance = function(NewInstance, Properties)
        local NewInstance = Instance.new(NewInstance)
        --
        for Index, Value in pairs(Properties) do
            NewInstance[Index] = Value
        end
        --
        return NewInstance
    end
    --
    function Utility.CloneTbl(T)
        local Tbl = {}
        for Index, Value in pairs(T) do
            Tbl[Index] = Value
        end
        return Tbl
    end
    --
    Utility.CLCheck = function()
        repeat task.wait() until iswindowactive()
        do
            local InputHandle = Utility.AddInstance("TextBox", {
                Position = UDim2.new(0, 0, 0, 0)
            })
            --
            InputHandle:CaptureFocus() task.wait() keypress(0x4E) task.wait() keyrelease(0x4E) InputHandle:ReleaseFocus()
            Library.Input.Caplock = InputHandle.Text == "N" and true or false
            InputHandle:Destroy()
        end
    end
    --
    Utility.Loop = function(Delay, Call)
        local Callback = typeof(Call) == "function" and Call or function() end
        --
        task.spawn(function()
            while task.wait(Delay) do
                local Success, Error = pcall(function()
                    Callback()
                end)
                --
                if Error then 
                    return 
                end
            end
        end)
    end
    --
    Utility.RemoveDrawing = function(Instance, Location)
        local SpecificDrawing = 0
        --
        Location = Location or Library.Drawings
        --
        for Index, Value in pairs(Location) do 
            if Value[1] == Instance then
                if Value[1] then
                    Value[1]:Remove()
                end
                if Value[2] then
                    Value[2] = nil
                end
                SpecificDrawing = Index
            end
        end
        --
        table.remove(Location, table.find(Location, Location[SpecificDrawing]))
    end
    --
    Utility.AddConnection = function(Type, Callback)
        local Connection = Type:Connect(Callback)
        --
        Library.Connections[#Library.Connections + 1] = Connection
        --
        return Connection
    end
    --
    Utility.Round = function(Num, Float)
        local Bracket = 1 / Float;
        return math.floor(Num * Bracket) / Bracket;
    end
    --
    Utility.AddDrawing = function(Instance, Properties, Location)
        local InstanceType = Instance
        local Instance = Drawing.new(Instance)
        --
        for Index, Value in pairs(Properties) do
            Instance[Index] = Value
            if InstanceType == "Text" then
                if Index == "Font" then
                    Instance.Font = Library.Theme.Font
                end
                if Index == "Size" then
                    Instance.Size = Library.Theme.TextSize
                end
            end
        end
        --
        if Properties.ZIndex ~= nil then
            Instance.ZIndex = Properties.ZIndex + 20
        else
            Instance.ZIndex = 20
        end
        --
        Location = Location or Library.Drawings
        if InstanceType == "Image" then
            Location[#Location + 1] = {Instance, true}
        else
            Location[#Location + 1] = {Instance}
        end
        --
        return Instance
    end
    --
    --Loni
    Utility.OnMouse = function(Instance)
        local Mouse = UserInput:GetMouseLocation()
        if Instance.Visible and (Mouse.X > Instance.Position.X) and (Mouse.X < Instance.Position.X + Instance.Size.X) and (Mouse.Y > Instance.Position.Y) and (Mouse.Y < Instance.Position.Y + Instance.Size.Y) then
            if Library.WindowVisible then
                return true
            end
        end
    end
    --
    Utility.Rounding = function(Num, DecimalPlaces)
        return tonumber(string.format("%." .. (DecimalPlaces or 0) .. "f", Num))
    end
    --
    Utility.AddDrag = function(Sensor, List)
        local DragUtility = {
            MouseStart = Vector2.new(), MouseEnd = Vector2.new(), Dragging = false
        }
        --
        Utility.AddConnection(UserInput.InputBegan, function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                if Utility.OnMouse(Sensor) then
                    DragUtility.Dragging = true
                end
            end
        end)
        --
        Utility.AddConnection(UserInput.InputEnded, function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                DragUtility.Dragging = false
            end
        end)
        --
        Utility.AddConnection(RunService.RenderStepped, function()
            DragUtility.MouseStart = UserInput:GetMouseLocation()
            --
            for Index, Value in pairs(List) do
                if Index ~= nil and Value ~= nil then
                    if DragUtility.Dragging then
                        Value[1].Position = Vector2.new(
                            Value[1].Position.X + (DragUtility.MouseStart.X - DragUtility.MouseEnd.X), 
                            Value[1].Position.Y + (DragUtility.MouseStart.Y - DragUtility.MouseEnd.Y)
                        )
                    end
                end
            end
            --
            DragUtility.MouseEnd = UserInput:GetMouseLocation()
        end)
    end
    --
    function Utility.HSVToRGB(HSVColor)
        local R, G, B = HSVColor.R * 255, HSVColor.G * 255, HSVColor.B * 255
	    return R, G, B
    end
    --
    Utility.AddCursor = function(Instance)
        local CursorOutline = Utility.AddDrawing("Triangle", {
            Color = Library.Theme.Accent[1],
            Thickness = 1,
            Filled = false,
            ZIndex = 5
        }, Library.Ignores)
        --
        local Cursor = Utility.AddDrawing("Triangle", {
            Color = Library.Theme.Accent[1],
            Thickness = 3,
            Filled = true,
            Transparency = 1,
            ZIndex = 5
        }, Library.Ignores)
        --
        Utility.AddConnection(Library.Communication.Event, function(Type, Color)
            if Type == "Accent" then
                Cursor.Color = Color
                CursorOutline.Color = Color
            end
        end)
        --
        Utility.AddConnection(RunService.RenderStepped, function()
            local Mouse = UserInput:GetMouseLocation()
            --
            if Library.WindowVisible then
                CursorOutline.Visible = true
                CursorOutline.PointA = Vector2.new(Mouse.X, Mouse.Y)
                CursorOutline.PointB = Vector2.new(Mouse.X + 15, Mouse.Y + 5)
                CursorOutline.PointC = Vector2.new(Mouse.X + 5, Mouse.Y + 15)

                Cursor.Visible = true
                Cursor.PointA = Vector2.new(Mouse.X, Mouse.Y)
                Cursor.PointB = Vector2.new(Mouse.X + 15, Mouse.Y + 5)
                Cursor.PointC = Vector2.new(Mouse.X + 5, Mouse.Y + 15)
            else
                CursorOutline.Visible = false
                Cursor.Visible = false
            end
        end)
    end
    --
    Utility.MiddlePos = function(Instance)
        return Vector2.new(
            (Camera.ViewportSize.X / 2) - (Instance.Size.X / 2), 
            (Camera.ViewportSize.Y / 2) - (Instance.Size.Y / 2)
        )
    end
    --
    Utility.SaveConfig = function(Config)
        local CFG = Utility.CloneTbl(Library.Flags)
        for Index, Value in pairs(CFG) do
            if Library.Items[Index].TypeOf == "Colorpicker" then
