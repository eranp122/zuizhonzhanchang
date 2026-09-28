-- ==========================================
-- 最终战场 · zmV5悬浮窗版
-- 已去除所有作者信息
-- ==========================================
local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local RS=game:GetService("ReplicatedStorage")
local UIS=game:GetService("UserInputService")
local LP=Players.LocalPlayer
local PG=LP:WaitForChild("PlayerGui")
local Workspace=workspace
local Camera=Workspace.CurrentCamera

if PG:FindFirstChild("FinalGui")then PG.FinalGui:Destroy()end

-- ============ 主 GUI ============
local Gui=Instance.new("ScreenGui")
Gui.Name="FinalGui"
Gui.ResetOnSpawn=false
Gui.DisplayOrder=999999
Gui.IgnoreGuiInset=true
Gui.Parent=PG

-- 悬浮球
local Orb=Instance.new("TextButton")
Orb.Size=UDim2.new(0,50,0,50)
Orb.Position=UDim2.new(0.5,-25,0,50)
Orb.BackgroundColor3=Color3.fromRGB(255,255,255)
Orb.BackgroundTransparency=0.72
Orb.Text="⚔"
Orb.TextColor3=Color3.fromRGB(255,255,255)
Orb.TextSize=22
Orb.Font=Enum.Font.GothamBold
Orb.BorderSizePixel=0
Orb.AutoButtonColor=false
Orb.Active=true
Orb.ZIndex=999999
Orb.Parent=Gui
Instance.new("UICorner",Orb).CornerRadius=UDim.new(1,0)

local OrbStroke=Instance.new("UIStroke",Orb)
OrbStroke.Thickness=2.5
OrbStroke.Color=Color3.fromRGB(255,180,210)
OrbStroke.Transparency=.15
local OrbSG=Instance.new("UIGradient",OrbStroke)
OrbSG.Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,120,180)),
ColorSequenceKeypoint.new(.25,Color3.fromRGB(255,190,120)),
ColorSequenceKeypoint.new(.5,Color3.fromRGB(120,220,180)),
ColorSequenceKeypoint.new(.75,Color3.fromRGB(120,180,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(255,120,180))})
task.spawn(function()
while Orb.Parent do
OrbSG.Offset=Vector2.new(math.sin(tick()*1.5)*0.5,tick()*0.3%1)
task.wait(.03)
end end)

local OG=Instance.new("UIGradient",Orb)
OG.Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,140,190)),
ColorSequenceKeypoint.new(.25,Color3.fromRGB(255,200,140)),
ColorSequenceKeypoint.new(.5,Color3.fromRGB(140,230,190)),
ColorSequenceKeypoint.new(.75,Color3.fromRGB(140,190,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(255,140,190))})
OG.Transparency=NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75),
NumberSequenceKeypoint.new(.5,0.55),
NumberSequenceKeypoint.new(1,0.75)})
task.spawn(function()
while Orb.Parent do
OG.Offset=Vector2.new(math.sin(tick()*1.2)*0.4,tick()*0.18%1)
task.wait(.03)
end end)

local OrbHi=Instance.new("Frame")
OrbHi.Size=UDim2.new(0.7,0,0.35,0)
OrbHi.Position=UDim2.new(0.15,0,0.08,0)
OrbHi.BackgroundColor3=Color3.fromRGB(255,255,255)
OrbHi.BackgroundTransparency=0.6
OrbHi.BorderSizePixel=0
OrbHi.ZIndex=3
OrbHi.Parent=Orb
Instance.new("UICorner",OrbHi).CornerRadius=UDim.new(1,0)

local OrbShade=Instance.new("Frame")
OrbShade.Size=UDim2.new(0.85,0,0.5,0)
OrbShade.Position=UDim2.new(0.075,0,0.48,0)
OrbShade.BackgroundColor3=Color3.fromRGB(0,0,0)
OrbShade.BackgroundTransparency=0.88
OrbShade.BorderSizePixel=0
OrbShade.ZIndex=2
OrbShade.Parent=Orb
Instance.new("UICorner",OrbShade).CornerRadius=UDim.new(1,0)

-- 面板
local P=Instance.new("Frame")
P.Size=UDim2.new(0,340,0,260)
P.Position=UDim2.new(.5,0,.5,0)
P.AnchorPoint=Vector2.new(.5,.5)
P.BackgroundColor3=Color3.fromRGB(255,255,255)
P.BackgroundTransparency=0.82
P.BorderSizePixel=0
P.Visible=false
P.ZIndex=999998
P.ClipsDescendants=true
P.Parent=Gui
Instance.new("UICorner",P).CornerRadius=UDim.new(0,20)

local PStroke=Instance.new("UIStroke",P)
PStroke.Thickness=2.2
PStroke.Color=Color3.fromRGB(255,180,210)
PStroke.Transparency=.15
local PSG=Instance.new("UIGradient",PStroke)
PSG.Color=OrbSG.Color
task.spawn(function()
while P.Parent do
PSG.Offset=Vector2.new(math.sin(tick()*1.2)*0.5,tick()*0.25%1)
task.wait(.03)
end end)

local PGrad=Instance.new("UIGradient",P)
PGrad.Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,150,200)),
ColorSequenceKeypoint.new(.25,Color3.fromRGB(255,200,150)),
ColorSequenceKeypoint.new(.5,Color3.fromRGB(150,230,200)),
ColorSequenceKeypoint.new(.75,Color3.fromRGB(150,190,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(255,150,200))})
PGrad.Transparency=NumberSequence.new({
NumberSequenceKeypoint.new(0,.9),
NumberSequenceKeypoint.new(.5,.84),
NumberSequenceKeypoint.new(1,.9)})
task.spawn(function()
while P.Parent do
PGrad.Offset=Vector2.new(math.sin(tick()*0.8)*0.4,tick()*0.12%1)
task.wait(.03)
end end)

local TopHi=Instance.new("Frame")
TopHi.Size=UDim2.new(1,-30,0,1)
TopHi.Position=UDim2.new(0,15,0,1)
TopHi.BackgroundColor3=Color3.fromRGB(255,255,255)
TopHi.BackgroundTransparency=0.3
TopHi.BorderSizePixel=0
TopHi.ZIndex=3
TopHi.Parent=P

local BotShade=Instance.new("Frame")
BotShade.Size=UDim2.new(1,-30,0,1)
BotShade.Position=UDim2.new(0,15,1,-2)
BotShade.BackgroundColor3=Color3.fromRGB(0,0,0)
BotShade.BackgroundTransparency=0.75
BotShade.BorderSizePixel=0
BotShade.ZIndex=3
BotShade.Parent=P

local Title=Instance.new("TextLabel")
Title.Size=UDim2.new(1,-16,0,20)
Title.Position=UDim2.new(0,8,0,4)
Title.BackgroundTransparency=1
Title.Text="⚔ 最终战场"
Title.TextColor3=Color3.fromRGB(255,255,255)
Title.TextStrokeTransparency=0
Title.TextStrokeColor3=Color3.fromRGB(0,0,0)
Title.TextSize=12
Title.Font=Enum.Font.GothamBold
Title.TextXAlignment=Enum.TextXAlignment.Left
Title.ZIndex=5
Title.Parent=P

-- 左右分栏
local Container=Instance.new("Frame")
Container.Size=UDim2.new(1,-12,1,-30)
Container.Position=UDim2.new(0,6,0,26)
Container.BackgroundTransparency=1
Container.ZIndex=2
Container.Parent=P

local Sidebar=Instance.new("ScrollingFrame")
Sidebar.Size=UDim2.new(0,54,1,0)
Sidebar.BackgroundColor3=Color3.fromRGB(20,20,35)
Sidebar.BackgroundTransparency=0.3
Sidebar.BorderSizePixel=0
Sidebar.ScrollBarThickness=2
Sidebar.ScrollBarImageColor3=Color3.fromRGB(255,255,255)
Sidebar.ScrollBarImageTransparency=.4
Sidebar.AutomaticCanvasSize=Enum.AutomaticSize.Y
Sidebar.CanvasSize=UDim2.new(0,0,0,0)
Sidebar.ZIndex=3
Sidebar.Parent=Container
Instance.new("UICorner",Sidebar).CornerRadius=UDim.new(0,12)

local SideStroke=Instance.new("UIStroke",Sidebar)
SideStroke.Thickness=1.5
SideStroke.Color=Color3.fromRGB(255,180,210)
SideStroke.Transparency=.3

local SideLayout=Instance.new("UIListLayout",Sidebar)
SideLayout.Padding=UDim.new(0,3)
SideLayout.SortOrder=Enum.SortOrder.LayoutOrder
SideLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center

local SidePad=Instance.new("UIPadding",Sidebar)
SidePad.PaddingTop=UDim.new(0,5)
SidePad.PaddingBottom=UDim.new(0,5)

local Content=Instance.new("Frame")
Content.Size=UDim2.new(1,-60,1,0)
Content.Position=UDim2.new(0,60,0,0)
Content.BackgroundTransparency=1
Content.ZIndex=3
Content.Parent=Container

-- 页面系统
local pages={}
local sideButtons={}

local function createPage(key)
local page=Instance.new("ScrollingFrame")
page.Size=UDim2.new(1,0,1,0)
page.BackgroundTransparency=1
page.BorderSizePixel=0
page.ScrollBarThickness=2
page.ScrollBarImageColor3=Color3.fromRGB(255,255,255)
page.ScrollBarImageTransparency=.3
page.AutomaticCanvasSize=Enum.AutomaticSize.Y
page.Visible=false
page.ZIndex=3
page.Parent=Content
local l=Instance.new("UIListLayout",page)
l.Padding=UDim.new(0,4)
l.SortOrder=Enum.SortOrder.LayoutOrder
local p=Instance.new("UIPadding",page)
p.PaddingLeft=UDim.new(0,3)
p.PaddingRight=UDim.new(0,3)
p.PaddingTop=UDim.new(0,3)
p.PaddingBottom=UDim.new(0,6)
pages[key]={page=page,order=0}
end

local function nextOrder(key)
pages[key].order=pages[key].order+1
return pages[key].order
end

local function addCategory(key,label)
local btn=Instance.new("TextButton")
btn.Size=UDim2.new(1,-8,0,24)
btn.BackgroundColor3=Color3.fromRGB(40,40,60)
btn.Text=label
btn.TextColor3=Color3.fromRGB(255,255,255)
btn.TextStrokeTransparency=0.2
btn.TextStrokeColor3=Color3.fromRGB(0,0,0)
btn.TextSize=10
btn.Font=Enum.Font.GothamBold
btn.BorderSizePixel=0
btn.ZIndex=4
btn.Parent=Sidebar
Instance.new("UICorner",btn).CornerRadius=UDim.new(0,9)
local bs=Instance.new("UIStroke",btn)
bs.Thickness=1.2
bs.Color=Color3.fromRGB(255,180,210)
bs.Transparency=.35
btn.MouseButton1Click:Connect(function()
for _,v in pairs(pages)do v.page.Visible=false end
for _,v in pairs(sideButtons)do
v.BackgroundColor3=Color3.fromRGB(40,40,60)
v.TextColor3=Color3.fromRGB(255,255,255)
end
pages[key].page.Visible=true
btn.BackgroundColor3=Color3.fromRGB(255,80,160)
btn.TextColor3=Color3.fromRGB(255,255,255)
end)
sideButtons[key]=btn
end

local function addLabel(key,text)
local l=Instance.new("TextLabel")
l.Size=UDim2.new(1,0,0,18)
l.BackgroundColor3=Color3.fromRGB(40,40,60)
l.Text="  "..text
l.TextColor3=Color3.fromRGB(255,240,120)
l.TextStrokeTransparency=0.3
l.TextStrokeColor3=Color3.fromRGB(0,0,0)
l.TextSize=10
l.Font=Enum.Font.GothamBold
l.TextXAlignment=Enum.TextXAlignment.Left
l.LayoutOrder=nextOrder(key)
l.ZIndex=4
l.Parent=pages[key].page
Instance.new("UICorner",l).CornerRadius=UDim.new(0,5)
end

local function makeButton(key,text,callback)
local b=Instance.new("TextButton")
b.Size=UDim2.new(1,0,0,28)
b.BackgroundColor3=Color3.fromRGB(50,50,75)
b.Text=text
b.TextColor3=Color3.fromRGB(255,255,255)
b.TextStrokeTransparency=0.2
b.TextStrokeColor3=Color3.fromRGB(0,0,0)
b.TextSize=11
b.Font=Enum.Font.GothamBold
b.BorderSizePixel=0
b.LayoutOrder=nextOrder(key)
b.ZIndex=4
b.Parent=pages[key].page
Instance.new("UICorner",b).CornerRadius=UDim.new(0,9)
local bs=Instance.new("UIStroke",b)
bs.Thickness=1.2
bs.Color=Color3.fromRGB(255,180,210)
bs.Transparency=.25
b.MouseButton1Click:Connect(callback)
return b
end

local function makeToggle(key,text,onFunc,offFunc,default)
local b=Instance.new("TextButton")
b.Size=UDim2.new(1,0,0,30)
b.BackgroundColor3=Color3.fromRGB(50,50,75)
b.Text=text.."  ○"
b.TextColor3=Color3.fromRGB(255,255,255)
b.TextStrokeTransparency=0.2
b.TextStrokeColor3=Color3.fromRGB(0,0,0)
b.TextSize=11
b.Font=Enum.Font.GothamBold
b.BorderSizePixel=0
b.LayoutOrder=nextOrder(key)
b.ZIndex=4
b.Parent=pages[key].page
Instance.new("UICorner",b).CornerRadius=UDim.new(0,9)
local stroke=Instance.new("UIStroke",b)
stroke.Thickness=1.2
stroke.Color=Color3.fromRGB(255,180,210)
stroke.Transparency=.35
local state=default or false
local function update()
if state then
b.Text=text.."  ●"
b.BackgroundColor3=Color3.fromRGB(90,200,140)
stroke.Color=Color3.fromRGB(180,255,200)
stroke.Transparency=.15
else
b.Text=text.."  ○"
b.BackgroundColor3=Color3.fromRGB(50,50,75)
stroke.Color=Color3.fromRGB(255,180,210)
stroke.Transparency=.35
end
end
update()
b.MouseButton1Click:Connect(function()
state=not state
update()
if state then if onFunc then pcall(onFunc)end
else if offFunc then pcall(offFunc)end end
end)
return b
end

local function makeSliderToggle(key,text,minV,maxV,defV,onFunc,offFunc)
local b=Instance.new("TextButton")
b.Size=UDim2.new(1,0,0,30)
b.BackgroundColor3=Color3.fromRGB(50,50,75)
b.Text=text.."  ○"
b.TextColor3=Color3.fromRGB(255,255,255)
b.TextStrokeTransparency=0.2
b.TextStrokeColor3=Color3.fromRGB(0,0,0)
b.TextSize=11
b.Font=Enum.Font.GothamBold
b.BorderSizePixel=0
b.LayoutOrder=nextOrder(key)
b.ZIndex=4
b.Parent=pages[key].page
Instance.new("UICorner",b).CornerRadius=UDim.new(0,9)
local stroke=Instance.new("UIStroke",b)
stroke.Thickness=1.2
stroke.Color=Color3.fromRGB(255,180,210)
stroke.Transparency=.35

local panel=Instance.new("Frame")
panel.Size=UDim2.new(1,0,0,46)
panel.BackgroundColor3=Color3.fromRGB(30,30,50)
panel.BorderSizePixel=0
panel.LayoutOrder=nextOrder(key)
panel.Visible=false
panel.ZIndex=4
panel.Parent=pages[key].page
Instance.new("UICorner",panel).CornerRadius=UDim.new(0,9)

local vl=Instance.new("TextLabel")
vl.Size=UDim2.new(1,-14,0,14)
vl.Position=UDim2.new(0,7,0,3)
vl.BackgroundTransparency=1
vl.Text=text..": "..defV
vl.TextColor3=Color3.fromRGB(255,255,255)
vl.TextSize=10
vl.Font=Enum.Font.GothamBold
vl.TextXAlignment=Enum.TextXAlignment.Left
vl.ZIndex=5
vl.Parent=panel

local bar=Instance.new("Frame")
bar.Size=UDim2.new(1,-30,0,8)
bar.Position=UDim2.new(0,15,0,28)
bar.BackgroundColor3=Color3.fromRGB(255,255,255)
bar.BackgroundTransparency=.5
bar.BorderSizePixel=0
bar.ZIndex=5
bar.Parent=panel
Instance.new("UICorner",bar).CornerRadius=UDim.new(1,0)

local fill=Instance.new("Frame")
fill.Size=UDim2.new(0,0,1,0)
fill.BackgroundColor3=Color3.fromRGB(255,80,160)
fill.BorderSizePixel=0
fill.ZIndex=6
fill.Parent=bar
Instance.new("UICorner",fill).CornerRadius=UDim.new(1,0)

local knob=Instance.new("TextButton")
knob.Size=UDim2.new(0,14,0,14)
knob.AnchorPoint=Vector2.new(.5,.5)
knob.Position=UDim2.new(0,0,.5,0)
knob.BackgroundColor3=Color3.new(1,1,1)
knob.Text=""
knob.BorderSizePixel=0
knob.ZIndex=7
knob.Parent=bar
Instance.new("UICorner",knob).CornerRadius=UDim.new(1,0)

local state=false
local cv=defV
local function updateSlider(alpha)
alpha=math.clamp(alpha,0,1)
local v=math.floor(minV+(maxV-minV)*alpha)
cv=v
fill.Size=UDim2.new(alpha,0,1,0)
knob.Position=UDim2.new(alpha,0,.5,0)
vl.Text=text..": "..v
return v
end
updateSlider((defV-minV)/(maxV-minV))

local sd=false
bar.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
sd=true
local sx=bar.AbsolutePosition.X
local sw=bar.AbsoluteSize.X
updateSlider((i.Position.X-sx)/sw)
if state and onFunc then pcall(onFunc,cv)end
end
end)
UIS.InputChanged:Connect(function(i)
if not sd then return end
if i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch then
local sx=bar.AbsolutePosition.X
local sw=bar.AbsoluteSize.X
updateSlider((i.Position.X-sx)/sw)
if state and onFunc then pcall(onFunc,cv)end
end
end)
UIS.InputEnded:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
sd=false
end
end)

b.MouseButton1Click:Connect(function()
state=not state
if state then
b.Text=text.."  ●"
b.BackgroundColor3=Color3.fromRGB(90,200,140)
stroke.Color=Color3.fromRGB(180,255,200)
stroke.Transparency=.15
panel.Visible=true
if onFunc then pcall(onFunc,cv)end
else
b.Text=text.."  ○"
b.BackgroundColor3=Color3.fromRGB(50,50,75)
stroke.Color=Color3.fromRGB(255,180,210)
stroke.Transparency=.35
panel.Visible=false
if offFunc then pcall(offFunc)end
end
end)
return b
end

local StatusLabel=Instance.new("TextLabel")
StatusLabel.Size=UDim2.new(1,-16,0,16)
StatusLabel.Position=UDim2.new(0,8,1,-20)
StatusLabel.BackgroundColor3=Color3.fromRGB(0,0,0)
StatusLabel.BackgroundTransparency=.3
StatusLabel.Text="就绪"
StatusLabel.TextColor3=Color3.fromRGB(120,255,180)
StatusLabel.TextStrokeTransparency=0.2
StatusLabel.TextStrokeColor3=Color3.fromRGB(0,0,0)
StatusLabel.TextSize=10
StatusLabel.Font=Enum.Font.GothamBold
StatusLabel.TextXAlignment=Enum.TextXAlignment.Center
StatusLabel.ZIndex=6
StatusLabel.Parent=P
Instance.new("UICorner",StatusLabel).CornerRadius=UDim.new(0,6)

local function setStatus(txt,ok)
StatusLabel.Text=txt
StatusLabel.TextColor3=ok and Color3.fromRGB(120,255,180)or Color3.fromRGB(255,120,120)
end

-- 分类
createPage("main")
createPage("violent")
createPage("hitbox")
createPage("lock")
createPage("emote")
createPage("settings")

addCategory("main","主要")
addCategory("violent","暴力")
addCategory("hitbox","碰撞箱")
addCategory("lock","锁人")
addCategory("emote","表情")
addCategory("settings","设置")

pages.main.page.Visible=true
sideButtons.main.BackgroundColor3=Color3.fromRGB(255,80,160)
sideButtons.main.TextColor3=Color3.new(1,1,1)

-- ==========================================
-- 一、主要功能区
-- ==========================================
addLabel("main","· 基础功能")

makeButton("main","篡改",function()
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dream77239/ubg-script/refs/heads/main/%E6%8B%A6%E6%88%AA.txt"))()
end)
setStatus("✓ 篡改已加载",true)
end)

-- 假防
local fakeBlockEnabled=false
local loopRunning=false
makeToggle("main","假防",function()
fakeBlockEnabled=true
local BlockRemote=RS:WaitForChild("Remotes"):WaitForChild("Combat"):WaitForChild("Block")
local character=LP.Character or LP.CharacterAdded:Wait()
local function enableBlock()
pcall(function()
BlockRemote:FireServer(true)
end)
end
enableBlock()
if not loopRunning then
loopRunning=true
task.spawn(function()
while true do
task.wait(0.01)
if fakeBlockEnabled then
local success,isBlocking=pcall(function()
return character:GetAttribute("IsBlocking")
end)
if success and not isBlocking then
enableBlock()
end
end
end
end)
end
setStatus("✓ 假防开启",true)
end,function()
fakeBlockEnabled=false
local BlockRemote=RS:WaitForChild("Remotes"):WaitForChild("Combat"):WaitForChild("Block")
pcall(function()BlockRemote:FireServer(false)end)
setStatus("假防关闭",true)
end)

-- 侧闪无冷却
local defaultCooldown=RS.Settings.Cooldowns.Dash.Value
makeToggle("main","侧闪无冷却",function()
RS.Settings.Cooldowns.Dash.Value=1
setStatus("✓ 侧闪无冷却",true)
end,function()
RS.Settings.Cooldowns.Dash.Value=defaultCooldown
setStatus("侧闪冷却恢复",true)
end)

-- 近战无冷却
local defaultMeleeCooldown=RS.Settings.Cooldowns.Melee.Value
makeToggle("main","近战无冷却",function()
RS.Settings.Cooldowns.Melee.Value=1
setStatus("✓ 近战无冷却",true)
end,function()
RS.Settings.Cooldowns.Melee.Value=defaultMeleeCooldown
setStatus("近战冷却恢复",true)
end)

-- 技能无冷却
local defaultAbility=RS.Settings.Cooldowns.Ability.Value
makeToggle("main","技能无冷却 (仅宿傩)",function()
RS.Settings.Cooldowns.Ability.Value=1
setStatus("✓ 技能无冷却",true)
end,function()
RS.Settings.Cooldowns.Ability.Value=defaultAbility
setStatus("技能冷却恢复",true)
end)

-- 自动签到表情
local EmoteClaim=RS.Remotes.Combat.EmoteClaim
local emoteClaimActive=false
local emoteClaimConnection=nil
makeToggle("main","自动签到表情",function()
emoteClaimActive=true
emoteClaimConnection=RunService.Heartbeat:Connect(function()
if emoteClaimActive then
pcall(function()EmoteClaim:FireServer()end)
end
end)
setStatus("✓ 自动签到开启",true)
end,function()
emoteClaimActive=false
if emoteClaimConnection then
emoteClaimConnection:Disconnect()
emoteClaimConnection=nil
end
setStatus("自动签到关闭",true)
end)

addLabel("main","· 战斗增强")

-- 无减速
local noSlowdownsToggle=RS.Settings.Toggles.NoSlowdowns
makeToggle("main","无减速效果",function()
noSlowdownsToggle.Value=true
setStatus("✓ 无减速",true)
end,function()
noSlowdownsToggle.Value=false
setStatus("无减速关闭",true)
end)

-- 取消硬直
local defaultDisableHitStun=RS.Settings.Toggles.DisableHitStun.Value
makeToggle("main","取消被攻击硬直",function()
RS.Settings.Toggles.DisableHitStun.Value=true
setStatus("✓ 取消硬直",true)
end,function()
RS.Settings.Toggles.DisableHitStun.Value=defaultDisableHitStun
setStatus("硬直恢复",true)
end)

-- 跳过开场
local defaultDisableIntros=RS.Settings.Toggles.DisableIntros.Value
makeToggle("main","跳过角色开场动作",function()
RS.Settings.Toggles.DisableIntros.Value=true
setStatus("✓ 跳过开场",true)
end,function()
RS.Settings.Toggles.DisableIntros.Value=defaultDisableIntros
setStatus("开场恢复",true)
end)

-- 普攻无僵直
local defaultNoStunOnMiss=RS.Settings.Toggles.NoStunOnMiss.Value
makeToggle("main","普攻无僵直",function()
RS.Settings.Toggles.NoStunOnMiss.Value=true
setStatus("✓ 普攻无僵直",true)
end,function()
RS.Settings.Toggles.NoStunOnMiss.Value=defaultNoStunOnMiss
setStatus("普攻僵直恢复",true)
end)

-- 防布娃娃
local defaultRagdollTimer=RS.Settings.Multipliers.RagdollTimer.Value
makeToggle("main","防布娃娃",function()
RS.Settings.Multipliers.RagdollTimer.Value=0.5
setStatus("✓ 防布娃娃",true)
end,function()
RS.Settings.Multipliers.RagdollTimer.Value=defaultRagdollTimer
setStatus("布娃娃恢复",true)
end)

-- 无限大招时间
local defaultUltimateTimer=RS.Settings.Multipliers.UltimateTimer.Value
makeToggle("main","延长大招时间",function()
RS.Settings.Multipliers.UltimateTimer.Value=100000
setStatus("✓ 大招时间延长",true)
end,function()
RS.Settings.Multipliers.UltimateTimer.Value=defaultUltimateTimer
setStatus("大招时间恢复",true)
end)

-- 秒开大
local defaultInstantTransformation=RS.Settings.Toggles.InstantTransformation.Value
makeToggle("main","秒开大",function()
RS.Settings.Toggles.InstantTransformation.Value=true
setStatus("✓ 秒开大",true)
end,function()
RS.Settings.Toggles.InstantTransformation.Value=defaultInstantTransformation
setStatus("秒开大关闭",true)
end)

-- ping乱码
local Ping=LP:WaitForChild("Info"):WaitForChild("Ping")
local pingLoop=nil
makeToggle("main","ping乱码",function()
pingLoop=task.spawn(function()
while true do
for i=0,999,25 do
Ping.Value=i
task.wait(0.03)
end
for i=999,0,-25 do
Ping.Value=i
task.wait(0.03)
end
end
end)
setStatus("✓ ping乱码开启",true)
end,function()
if pingLoop then
task.cancel(pingLoop)
pingLoop=nil
end
setStatus("ping乱码关闭",true)
end)

-- 一拳倒地
local MeleeDamage=RS:WaitForChild("Settings"):WaitForChild("Multipliers"):WaitForChild("MeleeDamage")
MeleeDamage.Value=100
makeToggle("main","一拳倒地",function()
MeleeDamage.Value=1000000
setStatus("✓ 一拳倒地",true)
end,function()
MeleeDamage.Value=100
setStatus("一拳倒地关闭",true)
end)

-- 一拳击飞
local RagdollPower=RS:WaitForChild("Settings"):WaitForChild("Multipliers"):WaitForChild("RagdollPower")
local flyPunchConnection=nil
makeToggle("main","一拳击飞",function()
RagdollPower.Value=10000
local maxTeleportDistance=50
local lastPosition=nil
flyPunchConnection=RunService.RenderStepped:Connect(function()
local Character=LP.Character or LP.CharacterAdded:Wait()
local HumanoidRootPart=Character:WaitForChild("HumanoidRootPart")
if not lastPosition then
lastPosition=HumanoidRootPart.Position
end
local currentPos=HumanoidRootPart.Position
local distance=(currentPos-lastPosition).Magnitude
if distance>maxTeleportDistance then
HumanoidRootPart.CFrame=CFrame.new(lastPosition)
else
lastPosition=currentPos
end
end)
setStatus("✓ 一拳击飞",true)
end,function()
RagdollPower.Value=100
if flyPunchConnection then
flyPunchConnection:Disconnect()
flyPunchConnection=nil
end
setStatus("一拳击飞关闭",true)
end)

-- 墙打无冷却
local wallCombo=RS.Settings.Cooldowns.WallCombo
makeToggle("main","墙打无冷却",function()
wallCombo.Value=0
setStatus("✓ 墙打无冷却",true)
end,function()
wallCombo.Value=100
setStatus("墙打冷却恢复",true)
end)

-- 随处墙打
local wall=nil
pcall(function()
wall=workspace.Map.Structural.Terrain:GetChildren()[5]:GetChildren()[12]
end)
if not wall then
wall=Instance.new("Part")
wall.Parent=workspace
end
wall.Size=Vector3.new(12,6,2)
wall.Transparency=0.6
wall.Material=Enum.Material.SmoothPlastic
wall.Anchored=true
wall.CanCollide=true
wall.CFrame=wall.CFrame or CFrame.new(0,5,0)
if getconnections then
for _,conn in pairs(getconnections(wall.AncestryChanged))do
conn:Disable()
end
end

local followConnection=nil
makeToggle("main","随处墙打",function()
if not followConnection then
followConnection=RunService.RenderStepped:Connect(function()
local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
if hrp then
wall.CFrame=hrp.CFrame*CFrame.new(0,0,-8)
end
end)
end
setStatus("✓ 随处墙打开启",true)
end,function()
if followConnection then
followConnection:Disconnect()
followConnection=nil
end
setStatus("随处墙打关闭",true)
end)

addLabel("main","· 视觉增强")

-- 防卡
local originalData={}
local skyBackup=nil
makeToggle("main","防卡",function()
originalData={}
for _,v in pairs(workspace:GetDescendants())do
if v:IsA("ParticleEmitter")or v:IsA("Trail")or v:IsA("Smoke")or v:IsA("Fire")or v:IsA("Explosion")then
originalData[v]=v.Enabled
v.Enabled=false
elseif v:IsA("Decal")or v:IsA("Texture")then
originalData[v]=v.Transparency
v.Transparency=1
elseif v:IsA("MeshPart")or v:IsA("UnionOperation")or v:IsA("Part")then
if v.Name~="HumanoidRootPart"then
originalData[v]=v.Material
v.Material=Enum.Material.SmoothPlastic
end
elseif v:IsA("SurfaceGui")or v:IsA("BillboardGui")or v:IsA("Beam")then
if v:IsA("Beam")then
originalData[v]=v.Enabled
v.Enabled=false
else
originalData[v]=v.Enabled~=nil and v.Enabled or true
if v.Enabled~=nil then
v.Enabled=false
end
end
end
end
originalData["GlobalShadows"]=game.Lighting.GlobalShadows
originalData["FogEnd"]=game.Lighting.FogEnd
game.Lighting.GlobalShadows=false
game.Lighting.FogEnd=9e9
local sky=game.Lighting:FindFirstChildOfClass("Sky")
if sky then
skyBackup=sky:Clone()
sky:Destroy()
end
local newSky=Instance.new("Sky")
newSky.SkyboxBk=""
newSky.SkyboxDn=""
newSky.SkyboxFt=""
newSky.SkyboxLf=""
newSky.SkyboxRt=""
newSky.SkyboxUp=""
newSky.SunAngularSize=0
newSky.MoonAngularSize=0
newSky.Parent=game.Lighting
game.Lighting.Ambient=Color3.fromRGB(128,128,128)
game.Lighting.OutdoorAmbient=Color3.fromRGB(128,128,128)
setStatus("✓ 防卡开启",true)
end,function()
for obj,value in pairs(originalData)do
if typeof(obj)=="Instance"and obj.Parent then
if obj:IsA("ParticleEmitter")or obj:IsA("Trail")or obj:IsA("Smoke")or obj:IsA("Fire")or obj:IsA("Explosion")then
obj.Enabled=value
elseif obj:IsA("Decal")or obj:IsA("Texture")then
obj.Transparency=value
elseif obj:IsA("MeshPart")or obj:IsA("UnionOperation")or obj:IsA("Part")then
obj.Material=value
elseif obj:IsA("SurfaceGui")or obj:IsA("BillboardGui")or obj:IsA("Beam")then
if obj:IsA("Beam")then
obj.Enabled=value
elseif obj.Enabled~=nil then
obj.Enabled=value
end
end
elseif obj=="GlobalShadows"then
game.Lighting.GlobalShadows=value
elseif obj=="FogEnd"then
game.Lighting.FogEnd=value
end
end
if skyBackup then
local currentSky=game.Lighting:FindFirstChildOfClass("Sky")
if currentSky then
currentSky:Destroy()
end
skyBackup.Parent=game.Lighting
skyBackup=nil
end
originalData={}
setStatus("防卡关闭",true)
end)

-- 隐身
local clone,platform,originalCFrame
local function CreatePlatform(position)
local part=Instance.new("Part")
part.Size=Vector3.new(10,1,10)
part.Position=position-Vector3.new(0,3,0)
part.Anchored=true
part.CanCollide=true
part.Transparency=0.5
part.Parent=workspace
return part
end
local function CreateClone()
local Character=LP.Character or LP.CharacterAdded:Wait()
local newClone=Character:Clone()
for _,v in ipairs(newClone:GetDescendants())do
if v:IsA("BasePart")then
v.Transparency=0.5
end
end
newClone.Parent=workspace
return newClone
end
makeToggle("main","隐身",function()
local Character=LP.Character or LP.CharacterAdded:Wait()
local HumanoidRootPart=Character:WaitForChild("HumanoidRootPart")
originalCFrame=HumanoidRootPart.CFrame
HumanoidRootPart.CFrame=HumanoidRootPart.CFrame+Vector3.new(0,-50,0)
platform=CreatePlatform(HumanoidRootPart.Position)
task.wait(1)
clone=CreateClone()
clone:MoveTo(originalCFrame.Position)
Camera.CameraSubject=clone:FindFirstChildWhichIsA("Humanoid")
LP.Character=clone
setStatus("✓ 隐身开启",true)
end,function()
if clone then
clone:Destroy()
clone=nil
end
if platform then
platform:Destroy()
platform=nil
end
if originalCFrame then
local char=LP.Character
if char then
local hrp=char:FindFirstChild("HumanoidRootPart")
if hrp then
hrp.CFrame=originalCFrame
end
end
originalCFrame=nil
end
local char=LP.Character
if char then
local hum=char:FindFirstChildWhichIsA("Humanoid")
if hum then
Camera.CameraSubject=hum
end
end
setStatus("隐身关闭",true)
end)

-- 范围显示（彩虹圈）
local CircleParts={}
local CircleConnection
local function RainbowColor(t)
local r=math.sin(t)*40+180
local g=math.sin(t+2)*40+180
local b=math.sin(t+4)*40+180
return Color3.fromRGB(r,g,b)
end
makeToggle("main","墙打/杀戮范围显示",function()
local function CreateCircle(radius,segments,thickness)
local parts={}
for i=1,segments do
local part=Instance.new("Part")
part.Anchored=true
part.CanCollide=false
part.Material=Enum.Material.Neon
part.Size=Vector3.new(thickness,0.2,radius*2*math.pi/segments)
part.Color=Color3.fromRGB(180,180,180)
part.Parent=workspace
table.insert(parts,part)
end
return parts
end
local radius=60
local segments=60
local thickness=0.2
CircleParts=CreateCircle(radius,segments,thickness)
local time=0
local updateAccumulator=0
local updateRate=1/60
CircleConnection=RunService.RenderStepped:Connect(function(dt)
time=time+dt
updateAccumulator=updateAccumulator+dt
if updateAccumulator<updateRate then return end
updateAccumulator=0
local char=LP.Character
if char and char:FindFirstChild("HumanoidRootPart")then
local rootPos=char.HumanoidRootPart.Position
local humanoid=char:FindFirstChild("Humanoid")
local heightOffset=humanoid and humanoid.HipHeight/2+0.1 or 0.9
local pos=rootPos-Vector3.new(0,heightOffset,0)
for i,part in ipairs(CircleParts)do
local angle=(i/#CircleParts)*2*math.pi
local x=pos.X+math.cos(angle)*radius
local z=pos.Z+math.sin(angle)*radius
part.Position=Vector3.new(x,pos.Y,z)
part.Orientation=Vector3.new(0,-math.deg(angle),0)
part.Color=RainbowColor(time+i*0.1)
end
end
end)
setStatus("✓ 范围显示开启",true)
end,function()
if CircleConnection then
CircleConnection:Disconnect()
CircleConnection=nil
end
for _,part in ipairs(CircleParts)do
if part and part.Parent then
part:Destroy()
end
end
CircleParts={}
setStatus("范围显示关闭",true)
end)

makeButton("main","删除墙打特效",function()
local paths={
RS.Characters.Gon.WallCombo.GonWallCombo.Center,
RS.Characters.Gon.WallCombo.GonWallCombo.Explosion,
RS.Characters.Gon.WallCombo.GonIntroHands,
RS.Characters.Mob.WallCombo.MobWallCombo.Center,
RS.Characters.Nanami.WallCombo.NanamiWallCombo.Center,
RS.Characters.Stark.WallCombo.StarkWallCombo.Center,
RS.Characters.Sukuna.WallCombo.SukunaTransformWallCombo,
RS.Characters.Sukuna.WallCombo.SukunaWallCombo
}
for _,obj in ipairs(paths)do
if obj and obj:IsA("Instance")then
for _,child in ipairs(obj:GetChildren())do
child:Destroy()
end
end
end
setStatus("✓ 已删除墙打特效",true)
end)

makeButton("main","删除击杀表情特效",function()
local KillEmote=RS:WaitForChild("Cosmetics"):WaitForChild("KillEmote")
local function removeEffects(obj)
for _,child in ipairs(obj:GetChildren())do
if child:IsA("ParticleEmitter")or child:IsA("Trail")or child:IsA("Beam")or child:IsA("Fire")or child:IsA("Smoke")or child:IsA("Sparkles")or child:IsA("Light")then
child:Destroy()
else
removeEffects(child)
end
end
end
removeEffects(KillEmote)
setStatus("✓ 已删除表情特效",true)
end)

-- 大招多次使用
local multiUseCutscenesToggle=RS.Settings.Toggles.MultiUseCutscenes
makeToggle("main","大招多次使用 (全角色)",function()
multiUseCutscenesToggle.Value=true
setStatus("✓ 大招多次使用",true)
end,function()
multiUseCutscenesToggle.Value=false
setStatus("大招多次使用关闭",true)
end)

addLabel("main","· 移动与属性")

-- 飞行
local FLYING=false
local flyKeyDown,flyKeyUp,mobileFlyConn
local iyflyspeed=2
local FLY_TOGGLE_STATE=false

local function getRoot(char)
return char:FindFirstChild("HumanoidRootPart")or char:FindFirstChild("Torso")or char:FindFirstChild("UpperTorso")
end

local function NOFLY()
FLYING=false
if flyKeyDown then flyKeyDown:Disconnect()flyKeyDown=nil end
if flyKeyUp then flyKeyUp:Disconnect()flyKeyUp=nil end
if mobileFlyConn then mobileFlyConn:Disconnect()mobileFlyConn=nil end
local char=LP.Character
if char then
local humanoid=char:FindFirstChildOfClass("Humanoid")
local root=getRoot(char)
if humanoid then humanoid.PlatformStand=false end
if root then
for _,v in pairs(root:GetChildren())do
if v:IsA("BodyGyro")or v:IsA("BodyVelocity")then
v:Destroy()
end
end
end
end
pcall(function()
workspace.CurrentCamera.CameraType=Enum.CameraType.Custom
end)
end

local function sFLY()
local char=LP.Character or LP.CharacterAdded:Wait()
local humanoid=char:FindFirstChildOfClass("Humanoid")or char:WaitForChild("Humanoid")
local root=getRoot(char)
if not root then return end
if flyKeyDown then flyKeyDown:Disconnect()end
if flyKeyUp then flyKeyUp:Disconnect()end
if mobileFlyConn then mobileFlyConn:Disconnect()end
local CONTROL={F=0,B=0,L=0,R=0,Q=0,E=0}
local BG=Instance.new("BodyGyro")
local BV=Instance.new("BodyVelocity")
BG.P=9e4
BG.MaxTorque=Vector3.new(9e9,9e9,9e9)
BG.CFrame=root.CFrame
BG.Parent=root
BV.MaxForce=Vector3.new(9e9,9e9,9e9)
BV.Velocity=Vector3.new(0,0,0)
BV.Parent=root
FLYING=true
flyKeyDown=UIS.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.Keyboard then
if input.KeyCode==Enum.KeyCode.W then CONTROL.F=iyflyspeed end
if input.KeyCode==Enum.KeyCode.S then CONTROL.B=-iyflyspeed end
if input.KeyCode==Enum.KeyCode.A then CONTROL.L=-iyflyspeed end
if input.KeyCode==Enum.KeyCode.D then CONTROL.R=iyflyspeed end
if input.KeyCode==Enum.KeyCode.E then CONTROL.Q=iyflyspeed*2 end
if input.KeyCode==Enum.KeyCode.Q then CONTROL.E=-iyflyspeed*2 end
end
end)
flyKeyUp=UIS.InputEnded:Connect(function(input)
if input.UserInputType==Enum.UserInputType.Keyboard then
if input.KeyCode==Enum.KeyCode.W then CONTROL.F=0 end
if input.KeyCode==Enum.KeyCode.S then CONTROL.B=0 end
if input.KeyCode==Enum.KeyCode.A then CONTROL.L=0 end
if input.KeyCode==Enum.KeyCode.D then CONTROL.R=0 end
if input.KeyCode==Enum.KeyCode.E then CONTROL.Q=0 end
if input.KeyCode==Enum.KeyCode.Q then CONTROL.E=0 end
end
end)
mobileFlyConn=RunService.RenderStepped:Connect(function()
if not FLYING then return end
local camera=workspace.CurrentCamera
local moveVector=Vector3.new(CONTROL.L+CONTROL.R,CONTROL.Q+CONTROL.E,CONTROL.F+CONTROL.B)
local ok,controlModule=pcall(function()
return require(LP.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
end)
if ok and controlModule then
local mv=controlModule:GetMoveVector()
moveVector=Vector3.new(mv.X*iyflyspeed,moveVector.Y,-mv.Z*iyflyspeed)
end
BV.Velocity=(camera.CFrame.RightVector*moveVector.X+Vector3.new(0,moveVector.Y,0)+camera.CFrame.LookVector*moveVector.Z)*50
BG.CFrame=camera.CFrame
humanoid.PlatformStand=true
end)
end

makeToggle("main","飞行",function()
FLY_TOGGLE_STATE=true
sFLY()
LP.CharacterAdded:Connect(function()
if FLY_TOGGLE_STATE then
task.wait(0.5)
sFLY()
end
end)
setStatus("✓ 飞行开启",true)
end,function()
FLY_TOGGLE_STATE=false
NOFLY()
setStatus("飞行关闭",true)
end)

makeSliderToggle("main","飞行速度",1,10,2,function(v)
iyflyspeed=v
setStatus("✓ 飞行速度 "..v,true)
end,function()
iyflyspeed=2
end)

-- 速度
local tpwalking=false
local tpwalkSpeed=100
makeToggle("main","速度",function()
tpwalking=true
spawn(function()
while tpwalking do
local chr=LP.Character or LP.CharacterAdded:Wait()
local hrp=chr:FindFirstChild("HumanoidRootPart")
local hum=chr:FindFirstChildWhichIsA("Humanoid")
local delta=RunService.Heartbeat:Wait()
if hrp and hum and hum.MoveDirection.Magnitude>0 then
hrp.CFrame=hrp.CFrame+(hum.MoveDirection*tpwalkSpeed*delta)
end
end
end)
setStatus("✓ 速度开启",true)
end,function()
tpwalking=false
setStatus("速度关闭",true)
end)

makeSliderToggle("main","速度调节",0,250,100,function(v)
tpwalkSpeed=v
setStatus("✓ 速度 "..v,true)
end,function()
tpwalkSpeed=100
end)

makeSliderToggle("main","冲刺加速",0,1000,100,function(v)
RS.Settings.Multipliers.DashSpeed.Value=v
setStatus("✓ 冲刺 "..v,true)
end,function()
RS.Settings.Multipliers.DashSpeed.Value=100
end)

makeSliderToggle("main","跳跃增强",0,1000,100,function(v)
RS.Settings.Multipliers.JumpHeight.Value=v
setStatus("✓ 跳跃 "..v,true)
end,function()
RS.Settings.Multipliers.JumpHeight.Value=100
end)

makeSliderToggle("main","攻击加速",0,1000,100,function(v)
RS.Settings.Multipliers.MeleeSpeed.Value=v
setStatus("✓ 攻击加速 "..v,true)
end,function()
RS.Settings.Multipliers.MeleeSpeed.Value=100
end)

-- ==========================================
-- 二、暴力功能区
-- ==========================================
addLabel("violent","· 秒杀类")

local activeGod=false
local function getLocalPlayerCharacter()
return LP.Character
end
local function generateActionNumber()
return "Action"..math.random(1000,9999)
end
local function getServerTime()
return tick()
end
local function wallcomboveryud()
local playerChar=getLocalPlayerCharacter()
if not playerChar then return false end
local head=playerChar:FindFirstChild("Head")
if not head then return false end
local charData=LP:FindFirstChild("Data")
local charValue=charData and charData:FindFirstChild("Character")and charData.Character.Value
if not charValue then return false end
local charsFolder=RS:FindFirstChild("Characters")
if not charsFolder or not charsFolder:FindFirstChild(charValue)then return false end
local wallComboAbility=charsFolder[charValue]:FindFirstChild("WallCombo")
if not wallComboAbility then return false end
local targetCharacter=playerChar
local actionNumber=generateActionNumber()
local serverTime=getServerTime()
local randomId=math.random(100000,999999)
local remoteArgs={
wallComboAbility,
"Characters:"..charValue..":WallCombo",
1,
randomId,
{
HitboxCFrames={nil},
BestHitCharacter=targetCharacter,
HitCharacters={targetCharacter},
Ignore={[actionNumber]={targetCharacter}},
DeathInfo={},
Actions={[actionNumber]={}},
HitInfo={
Blocked=false,
IsFacing=true,
IsInFront=true
},
BlockedCharacters={},
ServerTime=serverTime,
FromCFrame=nil
},
actionNumber
}
pcall(function()
RS.Remotes.Abilities.Ability:FireServer(wallComboAbility,randomId)
end)
pcall(function()
RS.Remotes.Combat.Action:FireServer(unpack(remoteArgs))
end)
end

task.spawn(function()
while task.wait(0.01)do
if activeGod then
pcall(wallcomboveryud)
end
end
end)

makeToggle("violent","无敌",function()
activeGod=true
setStatus("✓ 无敌开启",true)
end,function()
activeGod=false
setStatus("无敌关闭",true)
end)

makeButton("violent","卡服",function()
local active=true
local spawnedTasks={}
local function buildCombatArgs()
return {
[1]=RS.Characters.Gon.WallCombo,
[2]="Characters:Gon:WallCombo",
[3]=1,
[4]=33036,
[5]={
["HitboxCFrames"]={},
["BestHitCharacter"]=workspace.Characters.NPCs:FindFirstChild("The Ultimate Bum"),
["HitCharacters"]={workspace.Characters.NPCs:FindFirstChild("The Ultimate Bum")},
["Ignore"]={},
["DeathInfo"]={},
["Actions"]={},
["HitInfo"]={
["IsFacing"]=true,
["IsInFront"]=true
},
["BlockedCharacters"]={},
["ServerTime"]=os.clock(),
["FromCFrame"]=CFrame.new(534.693,5.532,79.486)
},
[6]="Action651",
[7]=0
}
end
local abilityArgs={
[1]=RS.Characters.Gon.WallCombo,
[2]=33036,
[4]=workspace.Characters.NPCs:FindFirstChild("The Ultimate Bum"),
[5]=Vector3.new(527.693,4.532,79.978)
}
for i=1,10000 do
local t=task.spawn(function()
if active then
pcall(function()
local combatArgs=buildCombatArgs()
RS.Remotes.Abilities.Ability:FireServer(unpack(abilityArgs))
RS.Remotes.Combat.Action:FireServer(unpack(combatArgs))
end)
end
end)
table.insert(spawnedTasks,t)
end
task.delay(3,function()
active=false
for _,t in ipairs(spawnedTasks)do
if task.cancel then
task.cancel(t)
end
end
spawnedTasks={}
local localContainers=workspace:FindFirstChild("Container(Drawing)")
if localContainers then
for _,v in ipairs(localContainers:GetChildren())do
if v.Name:match(tostring(LP.UserId))then
v:Destroy()
end
end
end
end)
setStatus("✓ 卡服已启动",true)
end)

-- 全图秒杀
local KillAllF={}
KillAllF.P=Players
KillAllF.R=RunService
KillAllF.RS=RS
KillAllF.W=workspace
KillAllF.L=LP
KillAllF.Cfg={Enabled=false,Range=67.5,Friends=true,Target="Closest"}
KillAllF.Data={List={},Idx=1,FCon=nil,KCon=nil,OSub=nil,OType=nil,SCFrame=nil,SCCFrame=nil,SCType=nil}

KillAllF.Dash=function()
local char=KillAllF.L.Character or KillAllF.L.CharacterAdded:Wait()
local hrp=char:FindFirstChild("HumanoidRootPart")
if hrp then
require(KillAllF.RS:WaitForChild("Core")).Library("Remote").Send("Dash",hrp.CFrame,"L",1)
end
end

KillAllF.HRP=function()
local c=KillAllF.L.Character
if c and c:FindFirstChild('Humanoid')and c.Humanoid.RootPart then
return c.Humanoid.RootPart
end
return nil
end

KillAllF.IsF=function(p)
if not p or p==KillAllF.L then return false end
return KillAllF.L:IsFriendsWith(p.UserId)
end

KillAllF.GetT=function()
local tgs={}
local root=KillAllF.HRP()
if not root then return tgs end
local pos=root.Position
for _,v in ipairs(KillAllF.P:GetPlayers())do
local char=v.Character
if char and v~=KillAllF.L and char:FindFirstChild(' ')==nil then
if KillAllF.Cfg.Friends and KillAllF.IsF(v)then continue end
local hum=char:FindFirstChild('Humanoid')
local hrp=char:FindFirstChild('HumanoidRootPart')
if hum and hrp then
local dist=(hrp.Position-pos).Magnitude
if dist<KillAllF.Cfg.Range then
local lchar=KillAllF.L.Character
if lchar then
local lName=lchar.Name
local cs=char:GetAttribute("Cutscene")
local csV=not cs or cs==lchar:GetAttribute("Cutscene")
if hrp and not char:GetAttribute("Ignore")and csV and((not char:GetAttribute("Grabbed")or char:GetAttribute("Grabbed")==lName)and(not char:GetAttribute("Victim")or char:GetAttribute("Victim")==lName))and not char:GetAttribute("Invincible")and not char:GetAttribute("Grabbing")then
table.insert(tgs,{c=char,d=dist,h=hum:GetAttribute("Health")or hum.Health or 0})
end
end
end
end
end
end
if KillAllF.Cfg.Target=="Closest"and #tgs>0 then
table.sort(tgs,function(a,b)return a.d<b.d end)
return {tgs[1]}
end
return tgs
end

KillAllF.Aura=function(n)
local root=KillAllF.HRP()
if not root then return end
local tgs=KillAllF.GetT()
for _,data in ipairs(tgs)do
if data.c then
for i=1,n do
KillAllF.Data.List[KillAllF.Data.Idx]=data.c
KillAllF.Data.Idx=KillAllF.Data.Idx+1
end
end
end
if KillAllF.Data.Idx>1 then
local name=KillAllF.L.Data.Character.Value
local combo=KillAllF.RS.Characters[name].WallCombo
KillAllF.RS.Remotes.Abilities.Ability:FireServer(combo,69)
KillAllF.RS.Remotes.Combat.Action:FireServer(combo,"",4,69,{BestHitCharacter=nil,HitCharacters=KillAllF.Data.List,Ignore={},Actions={}})
for k in pairs(KillAllF.Data.List)do KillAllF.Data.List[k]=nil end
KillAllF.Data.Idx=1
end
end

KillAllF.GetR=function()
local al={}
for _,p in ipairs(KillAllF.P:GetPlayers())do
if p~=KillAllF.L and p.Character then
local hu=p.Character:FindFirstChild("Humanoid")
local hr=p.Character:FindFirstChild("HumanoidRootPart")
if hu and hr and(hu:GetAttribute("Health")or 0)>0 and not hu:GetAttribute("Godmode")then
table.insert(al,p)
end
end
end
return #al>0 and al[math.random(1,#al)]or nil
end

KillAllF.TP=function(p)
if not p or not p.Character then return false end
local hr=p.Character:FindFirstChild("HumanoidRootPart")
if not hr then return false end
pcall(function()
require(KillAllF.L.PlayerScripts.Character.FullCustomReplication).Override(KillAllF.L.Character,CFrame.new(hr.Position-Vector3.new(0,30,0)))
end)
return true
end

KillAllF.Spec=function(p)
local cam=KillAllF.W.CurrentCamera
if cam and p and p.Character then
local hu=p.Character:FindFirstChildOfClass("Humanoid")
if hu then cam.CameraType=Enum.CameraType.Custom cam.CameraSubject=hu end
end
end

KillAllF.Loop=function()
local c=KillAllF.L.Character
if not c or not c.Parent then return end
local r=KillAllF.GetR()
if r then
KillAllF.TP(r)
KillAllF.Spec(r)
task.wait(0.5)
end
end

KillAllF.Grav=function(b)
local c=KillAllF.L.Character
if not c then return end
for _,p in ipairs(c:GetDescendants())do
if p:IsA("BasePart")then
p.Anchored=not b
if not b then p.Velocity=Vector3.new(0,0,0)end
end
end
end

KillAllF.Save=function()
local c=KillAllF.L.Character
local hr=c and c:FindFirstChild("HumanoidRootPart")
if not hr then return false end
KillAllF.Data.SCFrame=hr.CFrame
local cam=KillAllF.W.CurrentCamera
if cam then
KillAllF.Data.SCCFrame=cam.CFrame
KillAllF.Data.SCType=cam.CameraType
end
return true
end

KillAllF.Rest=function()
if not KillAllF.Data.SCFrame or not KillAllF.L.Character then return end
pcall(function()require(KillAllF.L.PlayerScripts.Character.FullCustomReplication).Override(KillAllF.L.Character,KillAllF.Data.SCFrame)end)
task.delay(0.1,function()
local cam=KillAllF.W.CurrentCamera
if cam and KillAllF.Data.SCCFrame then
cam.CameraType=KillAllF.Data.SCType
cam.CFrame=KillAllF.Data.SCCFrame
end
end)
end

KillAllF.Start=function()
if not KillAllF.Save()then return end
KillAllF.Grav(false)
local cam=KillAllF.W.CurrentCamera
if cam then
KillAllF.Data.OSub=cam.CameraSubject
KillAllF.Data.OType=cam.CameraType
end
KillAllF.Data.FCon=KillAllF.R.Heartbeat:Connect(KillAllF.Loop)
KillAllF.Data.KCon=KillAllF.R.Heartbeat:Connect(function()
KillAllF.Dash()
local cn=KillAllF.L.Data.Character.Value
KillAllF.Aura(cn=="Gon"and 20 or 50)
end)
end

KillAllF.Stop=function()
if KillAllF.Data.FCon then KillAllF.Data.FCon:Disconnect()KillAllF.Data.FCon=nil end
if KillAllF.Data.KCon then KillAllF.Data.KCon:Disconnect()KillAllF.Data.KCon=nil end
KillAllF.Rest()
KillAllF.Grav(true)
local cam=KillAllF.W.CurrentCamera
if cam and KillAllF.Data.OSub then
cam.CameraSubject=KillAllF.Data.OSub
cam.CameraType=KillAllF.Data.OType
end
end

makeToggle("violent","全图秒杀",function()
KillAllF.Cfg.Enabled=true
KillAllF.Start()
setStatus("✓ 全图秒杀开启",true)
end,function()
KillAllF.Cfg.Enabled=false
KillAllF.Stop()
setStatus("全图秒杀关闭",true)
end)

KillAllF.L.CharacterAdded:Connect(function()
if KillAllF.Cfg.Enabled then
KillAllF.Stop()
KillAllF.Cfg.Enabled=false
end
end)

addLabel("violent","· 杀戮光环")

-- 杀戮光环 v1
local Configs={
IgnoreFriends=false,
MaxDistance=100,
Damage=9999,
HealthLimit=0,
DashInterval=0.7,
AttackInterval=0.001
}
local runningAura=false
local auraConn
local lastDash=0
local lastAttack=0
local data=LP:WaitForChild("Data")
local charValue=data:WaitForChild("Character")
local localCharacterName=charValue.Value
local ability=RS:WaitForChild("Characters"):WaitForChild(localCharacterName):WaitForChild("WallCombo")
local AbilitiesRemote=RS:WaitForChild("Remotes"):WaitForChild("Abilities"):WaitForChild("Ability")
local CombatRemote=RS:WaitForChild("Remotes"):WaitForChild("Combat"):WaitForChild("Action")

local function getLocalRootPart()
local c=LP.Character
return c and c:FindFirstChild("HumanoidRootPart")
end

local function triggerDash()
if tick()-lastDash<Configs.DashInterval then return end
lastDash=tick()
local hrp=getLocalRootPart()
if not hrp then return end
local dashRemote=RS.Remotes.Character:FindFirstChild("Dash")
if dashRemote then
pcall(function()
dashRemote:FireServer(hrp.CFrame,"L",hrp.CFrame.LookVector,nil,tick())
end)
end
end

local function sendKillAura()
if tick()-lastAttack<Configs.AttackInterval then return end
lastAttack=tick()
local localRootPart=getLocalRootPart()
if not localRootPart then return end
triggerDash()
local maxDistSq=Configs.MaxDistance*Configs.MaxDistance
for _,targetPlayer in ipairs(Players:GetPlayers())do
if targetPlayer~=LP then
local targetChar=targetPlayer.Character
if targetChar then
local targetRootPart=targetChar:FindFirstChild("HumanoidRootPart")
local targetHumanoid=targetChar:FindFirstChild("Humanoid")
if targetRootPart and targetHumanoid and targetHumanoid.Health>Configs.HealthLimit then
if not(Configs.IgnoreFriends and LP:IsFriendsWith(targetPlayer.UserId))then
local delta=localRootPart.Position-targetRootPart.Position
if delta.Magnitude*delta.Magnitude<=maxDistSq then
pcall(function()
AbilitiesRemote:FireServer(ability,Configs.Damage,{},targetRootPart.Position)
end)
pcall(function()
CombatRemote:FireServer(
ability,
localCharacterName..":WallCombo",
2,
Configs.Damage,
{
HitboxCFrames={targetRootPart.CFrame,targetRootPart.CFrame},
BestHitCharacter=targetChar,
HitCharacters={targetChar},
Ignore={},
DeathInfo={},
BlockedCharacters={},
HitInfo={IsFacing=false,IsInFront=true},
ServerTime=os.time(),
Actions={
ActionNumber1={
[targetPlayer.Name]={
StartCFrameStr=tostring(localRootPart.CFrame),
Local=true,
Collision=false,
Animation="Punch1Hit",
Preset="Punch",
Velocity=Vector3.zero,
FromPosition=targetRootPart.Position,
Seed=math.random(1,999999)
}
}
},
FromCFrame=targetRootPart.CFrame
},
"Action150",
0
)
end)
end
end
end
end
end
end
end
end

local function startAura()
if auraConn then auraConn:Disconnect()auraConn=nil end
auraConn=RunService.Heartbeat:Connect(function()
if runningAura then
sendKillAura()
end
end)
end

makeToggle("violent","杀戮光环v1 (慢)",function()
runningAura=true
startAura()
setStatus("✓ 杀戮光环v1开启",true)
end,function()
runningAura=false
if auraConn then auraConn:Disconnect()auraConn=nil end
setStatus("杀戮光环v1关闭",true)
end)

-- 杀戮光环 v2
local enabledV2=false
local connV2
local PlayersList={}
local indexV2=1
local RANGE=70
local DASH_INTERVAL=0.25
local lastDashV2=0

local function C()
return LP.Character
end
local function HRP()
if C()and C():FindFirstChild("Humanoid")then
return C().Humanoid.RootPart
end
end
local function isFriend(p)
return LP:IsFriendsWith(p.UserId)
end
local function triggerDashV2()
local now=tick()
if now-lastDashV2<DASH_INTERVAL then return end
lastDashV2=now
local hrp=HRP()
if not hrp then return end
local dashRemote=RS.Remotes.Character:FindFirstChild("Dash")
if dashRemote then
pcall(function()
dashRemote:FireServer(hrp.CFrame,"L",hrp.CFrame.LookVector,nil,now)
end)
end
end
local function getTargets()
local targets={}
local hrp=HRP()
if not hrp then return targets end
for _,p in ipairs(Players:GetPlayers())do
if p~=LP and p.Character then
if isFriend(p)then continue end
local hum=p.Character:FindFirstChild("Humanoid")
local root=p.Character:FindFirstChild("HumanoidRootPart")
if hum and root and hum.Health>0 then
if(root.Position-hrp.Position).Magnitude<=RANGE then
if not p.Character:GetAttribute("Invincible")then
table.insert(targets,p.Character)
end
end
end
end
end
return targets
end
local function KillAuraV2(count)
triggerDashV2()
local targets=getTargets()
for _,char in ipairs(targets)do
for i=1,count do
PlayersList[indexV2]=char
indexV2=indexV2+1
end
end
if indexV2>1 then
local combo=RS.Characters[LP.Data.Character.Value].WallCombo
RS.Remotes.Abilities.Ability:FireServer(combo,69)
RS.Remotes.Combat.Action:FireServer(
combo,
"",
4,
69,
{
BestHitCharacter=nil,
HitCharacters=PlayersList,
Ignore={},
Actions={}
}
)
table.clear(PlayersList)
indexV2=1
end
end

makeToggle("violent","杀戮光环v2 (快)",function()
enabledV2=true
connV2=RunService.Heartbeat:Connect(function()
local count=(LP.Data.Character.Value=="Gon")and 20 or 50
KillAuraV2(count)
end)
setStatus("✓ 杀戮光环v2开启",true)
end,function()
enabledV2=false
if connV2 then
connV2:Disconnect()
connV2=nil
end
setStatus("杀戮光环v2关闭",true)
end)

makeToggle("violent","杀戮光环忽略好友",function()
Configs.IgnoreFriends=true
setStatus("✓ 忽略好友",true)
end,function()
Configs.IgnoreFriends=false
setStatus("不忽略好友",true)
end)

addLabel("violent","· 墙打秒杀")

local Core=require(RS:WaitForChild("Core"))
local charValueWC=LP:WaitForChild("Data"):WaitForChild("Character").Value
local charsWC=RS:WaitForChild("Characters")
local abilityWC=charsWC:WaitForChild(charValueWC):WaitForChild("WallCombo")
local wallComboCooldown=0.05
local lastWallComboTime=0
local wallComboEnabled=false
local ignoreFriendsWC=false
local wallComboConn=nil
local dashConnWC=nil

local function isFriendWC(targetPlayer)
local ok,res=pcall(function()return LP:IsFriendsWith(targetPlayer.UserId)end)
return ok and res
end
local function shouldIgnorePlayerModel(model)
if not model then return false end
if ignoreFriendsWC then
for _,pl in ipairs(Players:GetPlayers())do
if pl~=LP and pl.Character==model then
if isFriendWC(pl)then
return true
end
end
end
end
return false
end
local function getHeadWC()
local character=LP.Character
if not character then return nil end
return character:FindFirstChild("Head")
end
local function hasValidTargetsForWallCombo(range)
local head=getHeadWC()
if not head then return false end
local hrpPos=head.Position
for _,pl in ipairs(Players:GetPlayers())do
if pl~=LP and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart")then
if not shouldIgnorePlayerModel(pl.Character)then
local d=(pl.Character.HumanoidRootPart.Position-hrpPos).Magnitude
if d<=range then return true end
end
end
end
return false
end
local function executeWallCombo()
local head=getHeadWC()
if not head then return end
local now=tick()
if now-lastWallComboTime<wallComboCooldown then return end
if not hasValidTargetsForWallCombo(100)then return end
lastWallComboTime=now
local res
local success=pcall(function()
res=Core.Get("Combat","Hit").Box(nil,LP.Character,{Size=Vector3.new(100,100,100)})
end)
if not success or not res then return end
pcall(function()
Core.Get("Combat","Ability").Activate(charsWC[charValueWC].WallCombo,res,head.Position+Vector3.new(0,0,2.5))
end)
end
local function fireDashWC()
local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
if not hrp then return end
local now=tick()
if now-lastDashTimeWC<0.1 then return end
lastDashTimeWC=now
local args={
[1]=hrp.CFrame,
[2]="F",
[3]=hrp.CFrame.LookVector,
[5]=now
}
pcall(function()
RS.Remotes.Character.Dash:FireServer(unpack(args))
end)
end

lastDashTimeWC=0

makeToggle("violent","墙打秒杀",function()
wallComboEnabled=true
if wallComboConn then wallComboConn:Disconnect()wallComboConn=nil end
if dashConnWC then dashConnWC:Disconnect()dashConnWC=nil end
wallComboConn=RunService.Heartbeat:Connect(function()
executeWallCombo()
end)
dashConnWC=RunService.Heartbeat:Connect(function()
fireDashWC()
end)
setStatus("✓ 墙打秒杀开启",true)
end,function()
wallComboEnabled=false
if wallComboConn then wallComboConn:Disconnect()wallComboConn=nil end
if dashConnWC then dashConnWC:Disconnect()dashConnWC=nil end
setStatus("墙打秒杀关闭",true)
end)

makeToggle("violent","墙打秒杀忽略好友",function()
ignoreFriendsWC=true
setStatus("✓ 忽略好友",true)
end,function()
ignoreFriendsWC=false
setStatus("不忽略好友",true)
end)

-- ==========================================
-- 三、碰撞箱区
-- ==========================================
addLabel("hitbox","· 碰撞箱设置")

pcall(function()
setthreadidentity(8)
end)

local HitboxS={
Players=Players,
RunService=RunService,
RS=RS,
Cfg={Hitbox=false,X=150,Y=150,Z=150,Enhancer=false,Multi=3},
Cache={},
Conn=nil,
DashT=0
}

getgenv().HitboxEnabled=false

function HitboxS:HRP()
local c=LP.Character
return c and c:FindFirstChild("HumanoidRootPart")
end

function HitboxS:GetCore()
if self.Cache.Core then return self.Cache.Core end
local ok,core=pcall(function()
return require(self.RS:WaitForChild("Core",10))
end)
if ok then
self.Cache.Core=core
return core
end
end

function HitboxS:ToggleHitbox(state)
self.Cfg.Hitbox=state
getgenv().HitboxEnabled=state
local core=self:GetCore()
if not core or not core.Get then return end
local hit=core.Get("Combat","Hit")
if not hit or not hit.Box then return end
if state then
if not self.Cache.OrigBox then
self.Cache.OrigBox=hit.Box
end
hit.Box=function(_,char,data)
data=data or{}
data.Size=Vector3.new(self.Cfg.X,self.Cfg.Y,self.Cfg.Z)
return self.Cache.OrigBox(nil,char,data)
end
else
if self.Cache.OrigBox then
hit.Box=self.Cache.OrigBox
end
end
end

function HitboxS:Dash()
if tick()-self.DashT<0.18 then return end
self.DashT=tick()
local hrp=self:HRP()
if not hrp then return end
pcall(function()
self:GetCore().Library("Remote").Send("Dash",hrp.CFrame,"L",1)
end)
end

function HitboxS:EnableEnhancer()
if self.Cache.HitProc then return end
local ok,hit=pcall(function()
return require(LP.PlayerScripts:WaitForChild("Combat"):WaitForChild("Hit"))
end)
if not ok or not hit.Process then return end
self.Cache.HitProc=hit.Process
hit.Process=function(...)
local best,targets,blocked=self.Cache.HitProc(...)
if not targets or #targets==0 then
return best,targets,blocked
end
self:Dash()
local r=self.RS.Remotes.Combat.Action
for _=1,self.Cfg.Multi do
pcall(function()
r:FireServer(nil,"",4,69,{BestHitCharacter=nil,HitCharacters=targets,Ignore={},Actions={}})
end)
end
return best,targets,blocked
end
end

function HitboxS:DisableEnhancer()
if not self.Cache.HitProc then return end
local ok,hit=pcall(function()
return require(LP.PlayerScripts.Combat.Hit)
end)
if ok then
hit.Process=self.Cache.HitProc
end
self.Cache.HitProc=nil
end

function HitboxS:StartDashLoop()
if self.Conn then return end
self.Conn=self.RunService.Heartbeat:Connect(function()
self:Dash()
end)
end

function HitboxS:StopDashLoop()
if self.Conn then
self.Conn:Disconnect()
self.Conn=nil
end
end

makeToggle("hitbox","碰撞箱扩大",function()
HitboxS:ToggleHitbox(true)
HitboxS:EnableEnhancer()
HitboxS:StartDashLoop()
setStatus("✓ 碰撞箱扩大",true)
end,function()
HitboxS:ToggleHitbox(false)
HitboxS:DisableEnhancer()
HitboxS:StopDashLoop()
setStatus("碰撞箱恢复",true)
end)

makeSliderToggle("hitbox","碰撞箱X轴",10,150,150,function(v)
HitboxS.Cfg.X=v
setStatus("✓ X轴 "..v,true)
end,function()end)

makeSliderToggle("hitbox","碰撞箱Y轴",10,150,150,function(v)
HitboxS.Cfg.Y=v
setStatus("✓ Y轴 "..v,true)
end,function()end)

makeSliderToggle("hitbox","碰撞箱Z轴",10,150,150,function(v)
HitboxS.Cfg.Z=v
setStatus("✓ Z轴 "..v,true)
end,function()end)

-- ==========================================
-- 四、锁人区
-- ==========================================
addLabel("lock","· 锁人设置")

local LockS={}
LockS.Players=Players
LockS.RunService=RunService
LockS.LP=LP
LockS.v3new=Vector3.new
LockS.cfnew=CFrame.new
LockS.mathcos=math.cos
LockS.mathsin=math.sin
LockS.tableinsert=table.insert
LockS.pairs=pairs
LockS.BEHIND_DISTANCE=5
LockS.CIRCLE_RADIUS=6
LockS.CIRCLE_SPEED=13
LockS.followEnabled=false
LockS.circleEnabled=false
LockS.lookEnabled=false
LockS.selectedTargetName=nil
LockS.circleAngle=0
LockS.mainConnection=nil
LockS.playerDropdown=nil

function LockS.getRoot(targetPlayer)
if targetPlayer and targetPlayer.Character then
return targetPlayer.Character:FindFirstChild("HumanoidRootPart")
end
end
function LockS.getPlayerByName(name)
for _,p in LockS.pairs(LockS.Players:GetPlayers())do
if p.Name==name then return p end
end
end
function LockS.getPlayerNames()
local names={}
for _,p in LockS.pairs(LockS.Players:GetPlayers())do
if p~=LockS.LP then
LockS.tableinsert(names,p.Name)
end
end
return names
end
function LockS.updateLoop(dt)
if not LockS.selectedTargetName then return end
local target=LockS.getPlayerByName(LockS.selectedTargetName)
local targetRoot=LockS.getRoot(target)
local myRoot=LockS.getRoot(LockS.LP)
if not targetRoot or not myRoot then return end
local targetPos=targetRoot.Position
local finalPos=nil
if LockS.circleEnabled then
LockS.circleAngle=LockS.circleAngle+(LockS.CIRCLE_SPEED*dt)
local x=LockS.mathcos(LockS.circleAngle)*LockS.CIRCLE_RADIUS
local z=LockS.mathsin(LockS.circleAngle)*LockS.CIRCLE_RADIUS
finalPos=targetPos+LockS.v3new(x,0,z)
elseif LockS.followEnabled then
local offset=targetRoot.CFrame.LookVector*LockS.BEHIND_DISTANCE
finalPos=targetPos-offset
end
if finalPos then
if LockS.lookEnabled then
myRoot.CFrame=LockS.cfnew(finalPos,LockS.v3new(targetPos.X,finalPos.Y,targetPos.Z))
else
myRoot.CFrame=LockS.cfnew(finalPos)*myRoot.CFrame.Rotation
end
elseif LockS.lookEnabled then
local myPos=myRoot.Position
myRoot.CFrame=LockS.cfnew(myPos,LockS.v3new(targetPos.X,myPos.Y,targetPos.Z))
end
end
function LockS.toggleConnection()
if LockS.followEnabled or LockS.circleEnabled or LockS.lookEnabled then
if not LockS.mainConnection then
LockS.mainConnection=LockS.RunService.RenderStepped:Connect(LockS.updateLoop)
end
else
if LockS.mainConnection then
LockS.mainConnection:Disconnect()
LockS.mainConnection=nil
end
end
end

-- 玩家下拉列表（用按钮切换）
local currentLockTarget=nil
local lockTargetBtn
lockTargetBtn=makeButton("lock","选择目标: 点击刷新",function()
local names=LockS.getPlayerNames()
if #names==0 then
setStatus("✗ 无其他玩家",false)
return
end
-- 轮流选
local idx=1
if currentLockTarget then
for i,n in ipairs(names)do
if n==currentLockTarget then idx=i+1 break end
end
if idx>#names then idx=1 end
end
currentLockTarget=names[idx]
LockS.selectedTargetName=currentLockTarget
lockTargetBtn.Text="目标: "..currentLockTarget
setStatus("✓ 锁定 "..currentLockTarget,true)
end)

makeButton("lock","刷新玩家列表",function()
currentLockTarget=nil
LockS.selectedTargetName=nil
lockTargetBtn.Text="选择目标: 点击刷新"
setStatus("✓ 已刷新",true)
end)

makeToggle("lock","锁背",function()
LockS.followEnabled=true
LockS.circleEnabled=false
LockS.toggleConnection()
setStatus("✓ 锁背开启",true)
end,function()
LockS.followEnabled=false
LockS.toggleConnection()
setStatus("锁背关闭",true)
end)

makeToggle("lock","转圈",function()
LockS.circleEnabled=true
LockS.followEnabled=false
LockS.toggleConnection()
setStatus("✓ 转圈开启",true)
end,function()
LockS.circleEnabled=false
LockS.toggleConnection()
setStatus("转圈关闭",true)
end)

makeToggle("lock","看着玩家",function()
LockS.lookEnabled=true
LockS.toggleConnection()
setStatus("✓ 看着玩家开启",true)
end,function()
LockS.lookEnabled=false
LockS.toggleConnection()
setStatus("看着玩家关闭",true)
end)

-- ==========================================
-- 五、表情区
-- ==========================================
addLabel("emote","· 击杀表情")

local EmoteT={}
EmoteT.env={
RS=RS,
Players=Players,
}
EmoteT.env.LP=LP
EmoteT.env.core=require(RS:WaitForChild("Core"))
EmoteT.env.Character=LP.Character or LP.CharacterAdded:Wait()
EmoteT.env.HumanoidRootPart=EmoteT.env.Character:WaitForChild("HumanoidRootPart")
EmoteT.state={
killEmotes={},
aura=false,
spam=false,
auraDelay=0.5,
spamDelay=0.5,
selectedEmote="",
keybind=Enum.KeyCode.G,
dropdown=nil,
tmp={}
}

function EmoteT.getRoot(char)
return char and char:FindFirstChild("HumanoidRootPart")
end
function EmoteT.useEmote(name)
local tmp=EmoteT.state.tmp
tmp.emote=EmoteT.env.RS:WaitForChild("Cosmetics"):WaitForChild("KillEmote"):FindFirstChild(name)
tmp.myRoot=EmoteT.getRoot(EmoteT.env.LP.Character)
if not tmp.emote or not tmp.myRoot then return end
tmp.closest=nil
tmp.dist=math.huge
for _,p in pairs(EmoteT.env.Players:GetPlayers())do
if p~=EmoteT.env.LP and p.Character then
tmp.r=EmoteT.getRoot(p.Character)
if tmp.r then
tmp.d=(tmp.myRoot.Position-tmp.r.Position).Magnitude
if tmp.d<tmp.dist then
tmp.dist=tmp.d
tmp.closest=p.Character
end
end
end
end
if tmp.closest then
task.spawn(function()
_G.KillEmote=true
pcall(function()
EmoteT.env.core.Get("Combat","Ability").Activate(tmp.emote,tmp.closest)
end)
_G.KillEmote=false
end)
end
end
function EmoteT.useRandom()
local list=EmoteT.state.killEmotes
if #list>0 then
EmoteT.useEmote(list[math.random(#list)])
end
end

task.spawn(function()
while true do
if EmoteT.state.aura then
EmoteT.useRandom()
task.wait(EmoteT.state.auraDelay)
else
task.wait(0.1)
end
end
end)

task.spawn(function()
while true do
if EmoteT.state.spam and EmoteT.state.selectedEmote~=""then
EmoteT.useEmote(EmoteT.state.selectedEmote)
task.wait(EmoteT.state.spamDelay)
else
task.wait(0.1)
end
end
end)

UIS.InputBegan:Connect(function(i,g)
if not g and i.KeyCode==EmoteT.state.keybind and EmoteT.state.selectedEmote~=""then
EmoteT.useEmote(EmoteT.state.selectedEmote)
end
end)

-- 刷新表情列表
local currentEmoteIdx=0
local emoteBtn
emoteBtn=makeButton("emote","选择表情: 点击刷新",function()
if #EmoteT.state.killEmotes==0 then
setStatus("✗ 请先刷新列表",false)
return
end
currentEmoteIdx=currentEmoteIdx+1
if currentEmoteIdx>#EmoteT.state.killEmotes then currentEmoteIdx=1 end
local name=EmoteT.state.killEmotes[currentEmoteIdx]
EmoteT.state.selectedEmote=name
emoteBtn.Text="表情: "..name
setStatus("✓ 选择 "..name,true)
end)

makeButton("emote","刷新击杀表情",function()
table.clear(EmoteT.state.killEmotes)
local ok,folder=pcall(function()
return EmoteT.env.RS:WaitForChild("Cosmetics"):WaitForChild("KillEmote")
end)
if not ok then
setStatus("✗ 无法访问表情文件夹",false)
return
end
for _,e in pairs(folder:GetChildren())do
EmoteT.state.killEmotes[#EmoteT.state.killEmotes+1]=e.Name
end
setStatus("✓ 已刷新 "..#EmoteT.state.killEmotes.." 个表情",true)
end)

makeToggle("emote","击杀表情光环",function()
EmoteT.state.aura=true
setStatus("✓ 表情光环开启",true)
end,function()
EmoteT.state.aura=false
setStatus("表情光环关闭",true)
end)

makeSliderToggle("emote","表情光环间隔",0.01,5,0.5,function(v)
EmoteT.state.auraDelay=v
setStatus("✓ 间隔 "..v,true)
end,function()
EmoteT.state.auraDelay=0.5
end)

makeToggle("emote","持续发送选中的表情",function()
EmoteT.state.spam=true
setStatus("✓ 持续发送开启",true)
end,function()
EmoteT.state.spam=false
setStatus("持续发送关闭",true)
end)

makeSliderToggle("emote","表情发送速度",0.01,5,0.5,function(v)
EmoteT.state.spamDelay=v
setStatus("✓ 速度 "..v,true)
end,function()
EmoteT.state.spamDelay=0.5
end)

makeButton("emote","随机用一个击杀表情",function()
EmoteT.useRandom()
setStatus("✓ 已使用随机表情",true)
end)

-- 快捷键
local EmoteKeyMap={
G=Enum.KeyCode.G,F=Enum.KeyCode.F,H=Enum.KeyCode.H,J=Enum.KeyCode.J,
K=Enum.KeyCode.K,L=Enum.KeyCode.L,Z=Enum.KeyCode.Z,X=Enum.KeyCode.X,
C=Enum.KeyCode.C,V=Enum.KeyCode.V,B=Enum.KeyCode.B,N=Enum.KeyCode.N,
M=Enum.KeyCode.M,Q=Enum.KeyCode.Q,E=Enum.KeyCode.E,R=Enum.KeyCode.R,
T=Enum.KeyCode.T,Y=Enum.KeyCode.Y,U=Enum.KeyCode.U,I=Enum.KeyCode.I,
O=Enum.KeyCode.O,P=Enum.KeyCode.P,
}
local keyList={}
for k in pairs(EmoteKeyMap)do
keyList[#keyList+1]=k
end
table.sort(keyList)

local keyIdx=1
makeButton("emote","快捷键: G",function()
keyIdx=keyIdx%#keyList+1
local k=keyList[keyIdx]
EmoteT.state.keybind=EmoteKeyMap[k]
setStatus("✓ 快捷键 "..k,true)
end)

-- ==========================================
-- 六、设置区
-- ==========================================
addLabel("settings","· 脚本控制")

makeButton("settings","卸载脚本",function()
KillAllF.Stop()
if auraConn then auraConn:Disconnect()end
if connV2 then connV2:Disconnect()end
if wallComboConn then wallComboConn:Disconnect()end
if dashConnWC then dashConnWC:Disconnect()end
if followConnection then followConnection:Disconnect()end
if flyPunchConnection then flyPunchConnection:Disconnect()end
if emoteClaimConnection then emoteClaimConnection:Disconnect()end
if pingLoop then task.cancel(pingLoop)end
if LockS.mainConnection then LockS.mainConnection:Disconnect()end
HitboxS:ToggleHitbox(false)
HitboxS:DisableEnhancer()
HitboxS:StopDashLoop()
NOFLY()
Gui:Destroy()
end)

-- ============ 悬浮球拖动 ============
local dragging=false
local dragStart=nil
local startPos=nil
local moved=false

Orb.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1
or input.UserInputType==Enum.UserInputType.Touch then
dragging=true
moved=false
dragStart=input.Position
startPos=Orb.Position
input.Changed:Connect(function()
if input.UserInputState==Enum.UserInputState.End then dragging=false end
end)
end
end)

Orb.InputChanged:Connect(function(input)
if not dragging then return end
if input.UserInputType~=Enum.UserInputType.MouseMovement
and input.UserInputType~=Enum.UserInputType.Touch then return end
local d=input.Position-dragStart
moved=true
Orb.Position=UDim2.new(
startPos.X.Scale,startPos.X.Offset+d.X,
startPos.Y.Scale,startPos.Y.Offset+d.Y)
end)

Orb.MouseButton1Click:Connect(function()
if moved then moved=false return end
if P.Visible then
P.Visible=false
Orb.Text="⚔"
else
P.Visible=true
Orb.Text="×"
end
end)

-- 加载提示
game:GetService("StarterGui"):SetCore("SendNotification",{
Title="最终战场",
Text="已加载 · 点击⚔打开",
Duration=3})