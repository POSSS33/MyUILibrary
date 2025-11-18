--// MiniBox UI Library (Simple Mobile UI)
local MiniBox = {}

function MiniBox:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MiniBoxUI"
    ScreenGui.Parent = game.CoreGui

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 260, 0, 180)
    Main.Position = UDim2.new(0.5, -130, 0.4, 0)
    Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true
    Main.Parent = ScreenGui

    local UIAspect = Instance.new("UIScale")
    UIAspect.Scale = 1
    UIAspect.Parent = Main

    local Top = Instance.new("Frame")
    Top.Size = UDim2.new(1, 0, 0, 30)
    Top.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Top.BorderSizePixel = 0
    Top.Parent = Main

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -60, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = title
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 16
    Title.TextColor3 = Color3.fromRGB(255,255,255)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Top

    --// ปุ่มย่อ
    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 25, 0, 25)
    MinBtn.Position = UDim2.new(1, -55, 0.1, 0)
    MinBtn.Text = "🔽"
    MinBtn.Font = Enum.Font.GothamSemibold
    MinBtn.TextSize = 14
    MinBtn.BackgroundTransparency = 1
    MinBtn.TextColor3 = Color3.fromRGB(255,255,255)
    MinBtn.Parent = Top

    --// ปุ่มปิด
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 25, 0, 25)
    CloseBtn.Position = UDim2.new(1, -30, 0.1, 0)
    CloseBtn.Text = "❌"
    CloseBtn.Font = Enum.Font.GothamSemibold
    CloseBtn.TextSize = 14
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.TextColor3 = Color3.fromRGB(255,70,70)
    CloseBtn.Parent = Top

    local Content = Instance.new("Frame")
    Content.Size = UDim2.new(1, 0, 1, -30)
    Content.Position = UDim2.new(0,0,0,30)
    Content.BackgroundTransparency = 1
    Content.Parent = Main

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    local minimized = false
    MinBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            Content.Visible = false
            Main.Size = UDim2.new(0,260,0,30)
            MinBtn.Text = "🔼"
        else
            Content.Visible = true
            Main.Size = UDim2.new(0,260,0,180)
            MinBtn.Text = "🔽"
        end
    end)

    local function AddButton(text, callback)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(1, -20, 0, 35)
        Btn.Position = UDim2.new(0, 10, 0, 40 * (#Content:GetChildren()))
        Btn.Text = text
        Btn.Font = Enum.Font.GothamSemibold
        Btn.TextSize = 14
        Btn.TextColor3 = Color3.fromRGB(255,255,255)
        Btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
        Btn.BorderSizePixel = 0
        Btn.Parent = Content

        Btn.MouseButton1Click:Connect(function()
            callback()
        end)
    end

    return {
        Button = AddButton
    }
end

return MiniBox
