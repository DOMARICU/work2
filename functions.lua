local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local freefalllsrc = character:WaitForChild("Freefall")

--SAVE SETTINGS:
local SVSetting = {
  maxflyspeed = 400,
  maxhitboxsize = 50,
  htbxdisabled = true
}

--VAR
local Flying = false
local FlyBodyGyro, FlyBodyVelocity
local FlySpeed = 50

function framework()
  local function init()
    print("Injected!🚀")
  end

  local function logger(value)
    print(value)
  end

  local function dekshdse(ex)
    if ex then
      if not Flying then
        Flying = true
        freefalllsrc.Enabled = false
  
        if LocalPlayer.Character then
          for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
              if part:IsA("BasePart") and part.CanCollide then
                  part.CanCollide = false
              end
          end
      end
  
      FlyBodyGyro = Instance.new("BodyGyro")
      FlyBodyGyro.P = 9e4
      FlyBodyGyro.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
      FlyBodyGyro.CFrame = workspace.CurrentCamera.CFrame
      FlyBodyGyro.Parent = LocalPlayer.Character.HumanoidRootPart
  
      FlyBodyVelocity = Instance.new("BodyVelocity")
      FlyBodyVelocity.Velocity = Vector3.zero
      FlyBodyVelocity.MaxForce = Vector3.new(9e4, 9e4, 9e4)
      FlyBodyVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
  
      local function updateFly()
          if not Flying then return end
  
          local cam = workspace.CurrentCamera
          local direction = Vector3.zero
  
          if UserInputService:IsKeyDown(Enum.KeyCode.W) then
              direction = direction + cam.CFrame.LookVector
          end
          if UserInputService:IsKeyDown(Enum.KeyCode.S) then
              direction = direction - cam.CFrame.LookVector
          end
          if UserInputService:IsKeyDown(Enum.KeyCode.A) then
              direction = direction - cam.CFrame.RightVector
          end
          if UserInputService:IsKeyDown(Enum.KeyCode.D) then
              direction = direction + cam.CFrame.RightVector
          end
  
          FlyBodyVelocity.Velocity = direction * FlySpeed
          FlyBodyGyro.CFrame = cam.CFrame
  
          if LocalPlayer.Character then
              for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                  if part:IsA("BasePart") and part.CanCollide then
                      part.CanCollide = false
                  end
              end
          end
      end
  
      RunService:BindToRenderStep("Fly", Enum.RenderPriority.Character.Value, updateFly)
      else
        Flying = false
        freefalllsrc.Enabled = true
  
        if FlyBodyGyro then FlyBodyGyro:Destroy() end
          if FlyBodyVelocity then FlyBodyVelocity:Destroy() end
  
          if LocalPlayer.Character then
              for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                  if part:IsA("BasePart") then
                      part.CanCollide = true
                  end
              end
          end
  
          RunService:UnbindFromRenderStep("Fly")
      end
    else
      if Flying then
        Flying = false
  
        if FlyBodyGyro then FlyBodyGyro:Destroy() end
        if FlyBodyVelocity then FlyBodyVelocity:Destroy() end
  
        if LocalPlayer.Character then
          for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
              part.CanCollide = true
            end
          end
        end
  
        RunService:UnbindFromRenderStep("Fly")
      end
    end
  end

  local function adjustFlySpeed(ox)
    local inputSpeed = tonumber(ox)
    if inputSpeed and inputSpeed >= 5 and inputSpeed <= SVSetting.maxflyspeed then
        FlySpeed = inputSpeed
    else
        print("ERROR! A higher Value Detected!", FlySpeed)
    end
  end

  init()
  return {
    logger = logger,
    dekshdse = dekshdse,
    adjustFlySpeed = adjustFlySpeed
  }
end

return framework()
