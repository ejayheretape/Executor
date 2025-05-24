--[[not obfuscated obviously 
you can skid now you players.
]]
if isfolder and makefolder then
    local folderName = "LightExec"
    if not isfolder(folderName) then
        makefolder(folderName)
    end
end

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "Light_Sc"
gui.ResetOnSpawn = false

local TweenService = game:GetService("TweenService")

local loadingFrame = Instance.new("Frame", gui)
loadingFrame.Size = UDim2.new(0, 200, 0, 60)
loadingFrame.Position = UDim2.new(0.5, -100, 0, -70)
loadingFrame.AnchorPoint = Vector2.new(0.5, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loadingFrame.BackgroundTransparency = 0.3
loadingFrame.BorderSizePixel = 0
Instance.new("UICorner", loadingFrame).CornerRadius = UDim.new(0, 10)

local strokeLoad = Instance.new("UIStroke", loadingFrame)
strokeLoad.Thickness = 2
strokeLoad.Color = Color3.fromRGB(0, 255, 0)
strokeLoad.Transparency = 0

local labelLoad = Instance.new("TextLabel", loadingFrame)
labelLoad.Size = UDim2.new(1, 0, 0.6, 0)
labelLoad.BackgroundTransparency = 1
labelLoad.Text = "Loading..."
labelLoad.TextColor3 = Color3.fromRGB(255, 255, 255)
labelLoad.TextScaled = true
labelLoad.Font = Enum.Font.SourceSansBold

local barBackground = Instance.new("Frame", loadingFrame)
barBackground.Size = UDim2.new(1, -10, 0.2, 0)
barBackground.Position = UDim2.new(0, 5, 0.7, 0)
barBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
barBackground.BackgroundTransparency = 0.3
barBackground.BorderSizePixel = 0
barBackground.ClipsDescendants = true
Instance.new("UICorner", barBackground).CornerRadius = UDim.new(0, 6)

local progressBar = Instance.new("Frame", barBackground)
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
progressBar.BorderSizePixel = 0
Instance.new("UICorner", progressBar).CornerRadius = UDim.new(0, 6)

local slideIn = TweenService:Create(loadingFrame, TweenInfo.new(0.5), {
    Position = UDim2.new(0.5, -100, 0.1, 0)
})
local slideOut = TweenService:Create(loadingFrame, TweenInfo.new(0.5), {
    Position = UDim2.new(0.5, -100, 0, -70)
})
local progressTween = TweenService:Create(progressBar, TweenInfo.new(3), {
    Size = UDim2.new(1, 0, 1, 0)
})

slideIn:Play()
progressTween:Play()
progressTween.Completed:Wait()
slideOut:Play()
slideOut.Completed:Wait()
loadingFrame:Destroy()

local execFrame = Instance.new("Frame", gui)
execFrame.Size = UDim2.new(0, 300, 0, 200)
execFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
execFrame.AnchorPoint = Vector2.new(0.5, 0.5)
execFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
execFrame.Active = true
execFrame.Draggable = true
Instance.new("UICorner", execFrame).CornerRadius = UDim.new(0, 10)
local strokeExec = Instance.new("UIStroke", execFrame)
strokeExec.Color = Color3.fromRGB(0, 255, 0)
strokeExec.Thickness = 2
strokeExec.Transparency = 0

local closeButton = Instance.new("TextButton", execFrame)
closeButton.Size = UDim2.new(0, 24, 0, 24)
closeButton.Position = UDim2.new(1, -28, 0, 4)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(1, 0)
closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local textbox = Instance.new("TextBox", execFrame)
textbox.Size = UDim2.new(1, -20, 0.6, -10)
textbox.Position = UDim2.new(0, 10, 0, 40)
textbox.ClearTextOnFocus = false
textbox.MultiLine = true
textbox.TextXAlignment = Enum.TextXAlignment.Left
textbox.TextYAlignment = Enum.TextYAlignment.Top
textbox.TextWrapped = true
textbox.Text = "-- Enter script here"
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.Font = Enum.Font.Code
textbox.TextSize = 14
textbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", textbox).CornerRadius = UDim.new(0, 6)

local injectButton = Instance.new("TextButton", execFrame)
injectButton.Size = UDim2.new(0.25, 0, 0.2, 0)
injectButton.Position = UDim2.new(0.05, 0, 0.75, 0)
injectButton.Text = "Inject"
injectButton.Font = Enum.Font.GothamBold
injectButton.TextSize = 14
injectButton.TextColor3 = Color3.fromRGB(0, 0, 0)
injectButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Instance.new("UICorner", injectButton).CornerRadius = UDim.new(0, 6)

local clearButton = Instance.new("TextButton", execFrame)
clearButton.Size = UDim2.new(0.25, 0, 0.2, 0)
clearButton.Position = UDim2.new(0.35, 0, 0.75, 0)
clearButton.Text = "Clear All"
clearButton.Font = Enum.Font.GothamBold
clearButton.TextSize = 14
clearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
clearButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", clearButton).CornerRadius = UDim.new(0, 6)

local executeButton = Instance.new("TextButton", execFrame)
executeButton.Size = UDim2.new(0.25, 0, 0.2, 0)
executeButton.Position = UDim2.new(0.65, 0, 0.75, 0)
executeButton.Text = "Execute"
executeButton.Font = Enum.Font.GothamBold
executeButton.TextSize = 14
executeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
executeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Instance.new("UICorner", executeButton).CornerRadius = UDim.new(0, 6)

local executorInjected = false
local injecting = false

local injectProgressBG = Instance.new("Frame", injectButton)
injectProgressBG.Size = UDim2.new(1, -4, 0.3, 0)
injectProgressBG.Position = UDim2.new(0, 2, 0.65, 0)
injectProgressBG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
injectProgressBG.BorderSizePixel = 0
injectProgressBG.ClipsDescendants = true
Instance.new("UICorner", injectProgressBG).CornerRadius = UDim.new(0, 4)

local injectProgressBar = Instance.new("Frame", injectProgressBG)
injectProgressBar.Size = UDim2.new(0, 0, 1, 0)
injectProgressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
injectProgressBar.BorderSizePixel = 0
Instance.new("UICorner", injectProgressBar).CornerRadius = UDim.new(0, 4)

injectButton.MouseButton1Click:Connect(function()
    if executorInjected or injecting then return end
    injecting = true
    injectButton.Text = "Injecting..."
    injectProgressBar.Size = UDim2.new(0, 0, 1, 0)
    local tween = TweenService:Create(injectProgressBar, TweenInfo.new(3), {
        Size = UDim2.new(1, 0, 1, 0)
    })
    tween:Play()
    tween.Completed:Wait()
    executorInjected = true
    injecting = false
    injectButton.Text = "Injected"
    injectButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
end)

clearButton.MouseButton1Click:Connect(function()
    textbox.Text = ""
end)

executeButton.MouseButton1Click:Connect(function()
    if not executorInjected then return end
    local code = textbox.Text
    local func = loadstring(code)
    if func then
        pcall(func)
    end
end)
