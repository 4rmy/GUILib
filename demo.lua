local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/4rmy/GUILib/main/lib.lua"))()

local window = library:CreateWindow({
    title = "Demo Window"
})
local tab = window:CreateTab({
    Name = "Tab"
})
local section = tab:CreateSection({
    Name = "Section"
})
section:CreateLabel({
    Text = "<Label Name>"
})
section:CreateButton({
    Text = "Button",
    Callback = function()
        print("Clicked!")
    end
})
section:CreateToggle({
    Text = "Toggle",
    Callback = function(Value)
        print("Toggled:", tostring(Value))
    end
})
section:CreateKeybind({
    Text = "Keybind",
    Key = Enum.KeyCode.E, -- Default KeyCode
    Callback = function()
        print("Keypressed!")
    end
})
section:CreateSlider({
    Text = "Slider",
    Min = 1,
    Max = 100,
    Increment = 1,
    Default = 50,
    Callback = function(Value)
        print("Slider:", tostring(Value))
    end
})
section:CreateTextbox({
    Text = "Textbox",
    DefaultText = "",
    Placeholder = "Input...",
    Callback = function(Value)
        print("Textbox:", Value)
    end
})
window:Notify({
    Title = "Notification",
    Message = "I'm a notification,\ncheck this out!",
    Delay = 5 -- Default Delay
})