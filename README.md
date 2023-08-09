# Dreamy GUI Library Documentation
## Preview Image
![Alt text](images/image.png)

## Initialize the Library
```lua
local library = loadstring(game:HttpGet("<LIB URL>"))()
```
### methods
- CreateWindow


## Window
### Create the Window
```lua
local window = library:CreateWindow({
    title = "<Window Title>"
})

--[[
    Name = <string> - Name of the Window
]]
```

### methods
- CreateTab
- Notify
- Destroy

## Tab
### Create a Tab
```lua
local tab = window:CreateTab({
    Name = "<Tab Name>"
})

--[[
    Name = <string> - Name of the Tab
]]
```
### methods
- CreateSection
- CreateLabel
- CreateButton
- CreateToggle
- CreateKeybind
- CreateSlider
- CreateTextbox

## Section
### Create a Section
```lua
local section = tab:CreateSection({
    Name = "<Section Name>"
})

--[[
    Name = <string> - Name of the Section.
]]
```
### methods
- CreateLabel
- CreateButton
- CreateToggle
- CreateKeybind
- CreateSlider
- CreateTextbox

## Label
### Create a Label
```lua
local Label tab:CreateLabel({
    Text = "<Label Name>"
})

--[[
    Text = <string> - Text displayed on the Label.
]]
```
### methods
- SetText

## Button
### Create a Button
```lua
tab:CreateButton({
    Text = "<Button Name>",
    Callback = function()
    end
})

--[[
    Text = <string> - Text displayed on the button.
    Callback = <function> - Function executed when the button is clicked.
]]
```
## Toggle
### Create a Toggle
```lua
tab:CreateToggle({
    Text = "<Toggle Name>",
    Callback = function(Value)
    end
})

--[[
    Text = <string> - Text displayed on the toggle.
    Callback = <function, args = {bool}> - Function executed, with status of the toggle when the switch is toggled.
]]
```
## Keybind
### Create a Keybind
```lua
tab:CreateKeybind({
    Text = "<Keybind Name>",
    Key = Enum.KeyCode.E, -- Default KeyCode
    Callback = function()
    end
})

--[[
    Text = <string> - Text displayed on the keybind.
    Key = <Enum.KeyCode> - Default KeyCode on the keybind.
    Callback = <function> - Function executed when the binded key is pressed.
]]
```

## Slider
### Create a Slider
```lua
tab:CreateSlider({
    Text = "<Slider Name>",
    Min = 1,
    Max = 100,
    Increment = 1,
    Default = 50,
    Callback = function(Value)
    end
})

--[[
    Text = <string> - Text displayed on the slider.
    Min = <number> - Minimum value of the slider (smallest value possible).
    Max = <number> - Maximum value of the slider (largest value possible).
    Increment = <number> - Increased value per step of the slider.
    Callback = <function, args = {number}> - Function executed when the slider value is changed.
]]
```
## Textbox
### Create a Textbox
```lua
tab:CreateTextbox({
    Text = "<Textbox Name>",
    DefaultText = "",
    Placeholder = "Input...",
    Callback = function(Value)
    end
})

--[[
    Text = <string> - Text displayed on the Textbox.
    DefaultText = <string> - Default text value of the Textbox.
    Placeholder = <string> - Text displayed when Textbox is empty.
    Callback = <function, args = {string}> - Function executed when Textbox is unfocused (clicked off, or pressed return).
]]
```


## Notifications
```lua
win:Notify({
    Title = "<Notification Title>",
    Message = "<Notification message>",
    Delay = 5 -- Default Delay
})

--[[
    Title = <string> - Title of the notification.
    Message = <string> - Main body of the notification.
    Delay = <number> - Time (in seconds) before the notification is removed.
]]
```

