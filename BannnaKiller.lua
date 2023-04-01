local RunService = game:GetService("RunService")
local LocalPlayer = game.Players.LocalPlayer

local function GetBannanas()
    local Bannanas = {}
    for i,v in pairs(workspace:GetChildren()) do
        if v.Name == "BananaPeel" then
            table.insert(Bannanas, v)
        end
    end
    return Bannanas
end

local function GetRandomPlayer()
    local Players = game.Players:GetPlayers()
    local PlayersExcludingMyself = {}

    for i,v in pairs(Players) do
        if v ~= LocalPlayer and v.Name ~= "Iplaydev" then
            table.insert(PlayersExcludingMyself, v)
        end
    end

    return PlayersExcludingMyself[math.random(1,#PlayersExcludingMyself)]
end

RunService.Heartbeat:Connect(function()
    local Bannanas = GetBannanas()

    for _, Bannana in next, Bannanas do
        Bannana.Velocity = Vector3.new(0,-5,0)
    end

    for _, Bannana in next, Bannanas do
        if isnetworkowner(Bannana) then
            Bannana.CFrame = GetRandomPlayer().Character.PrimaryPart.CFrame
        end
    end
end)