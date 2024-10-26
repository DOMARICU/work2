local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local framework = loadstring(game:HttpGet('https://raw.githubusercontent.com/DOMARICU/work2/refs/heads/main/functions.lua'))()

local SVSetting = {
  maxflyspeed = 400,
  maxhitboxsize = 50
}

local ESPDistance = 100

local fr = framework

local function startup()
  if Rayfield then
    else
      print("Error! Rayfield UI not found!")
  end
  if framework then
  else
    print("Error! Main Script not found!")
end
end

  local Window = Rayfield:CreateWindow({
    Name = "WAR TYCOON",
    LoadingTitle = "DarkPulse",
    LoadingSubtitle = "by --!!--",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "warytcoon",
       FileName = "Settings"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = {"Hello"} 
    }
  })
  
  local MAIN = Window:CreateTab("MAIN", 4483362458) -- Titel, Bild
  local VISUALS = Window:CreateTab("VISUALS", 4483362458)
  local OTHERS = Window:CreateTab("OTHERS", 4483362458)
  local Section = MAIN:CreateSection("Made by Furabyte")
  
  local Flytogglesw = MAIN:CreateToggle({
    Name = "FLY",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(value)
      fr.dekshdse(value)
    end,
  })
  
  local flyspeed = MAIN:CreateSlider({
    Name = "FLY SPEED",
    Range = {50, SVSetting.maxflyspeed},
    Increment = 10,
    Suffix = "",
    CurrentValue = 50,
    Flag = "Slider1",
    Callback = function(Value)
      fr.adjustFlySpeed(Value)
    end,
  })

  local ESPBOX = VISUALS:CreateToggle({
    Name = "ESP BOX",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
      fr.logger(Value)
    end,
  })
  
  local Toggle = VISUALS:CreateToggle({
    Name = "ESP LINES",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(Value)
      fr.logger(Value) 
    end,
  })
  
  local DistanceSlider = VISUALS:CreateSlider({
    Name = "ESP Distance",
    Range = {50, 500},
    Increment = 10,
    Suffix = " studs",
    CurrentValue = ESPDistance,
    Flag = "DistanceSlider",
    Callback = function(Value)
      ESPDistance = Value
    end,
  })
  
  local TeamCheckToggle = VISUALS:CreateToggle({
    Name = "Team Check",
    CurrentValue = false,
    Flag = "Toggle4",
    Callback = function(Value)
      TeamCheckEnabled = Value
    end,
  })

  local UNA = OTHERS:CreateToggle({
    Name = "UNLIMITED AMMO",
    CurrentValue = false,
    Flag = "Toggle5",
    Callback = function(Value)
      fr.logger(Value)
    end,
  })

  local htbch = OTHERS:CreateToggle({
    Name = "Use Hitboxchanger",
    CurrentValue = false,
    Flag = "Toogle6",
    Callback = function(Value)
      fr.logger(Value)
    end,
  })

  local htbxvlue = OTHERS:CreateSlider({
    Name = "HITBOX SIZE",
    Range = {5, SVSetting.maxhitboxsize},
    Increment = 5,
    Suffix = "",
    CurrentValue = 5,
    Flag = "hitbxslider",
    Callback = function(Value)
      fr.logger(Value)
    end,
  })

startup()
