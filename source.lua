-- library table
local library = {}
library.colortheme = {} -- TODO: add themes

local function clamp(value, min, max)
    return math.min(math.max(min, value), max)
end

-- Create window/gui
function library:CreateWindow(options)
    if not game then
        return print("Only use this in a roblox game. -_-")
    end

    -- setup
    local window = {}

    window.uis = game:GetService("UserInputService")
    window.tweenservice = game:GetService("TweenService")
    window.tabs = {}
    window.connections = {}

    -- Gui elements
    window.ScreenGui = Instance.new("ScreenGui")
    if not pcall(function()
        window.ScreenGui.Parent = game:GetService("CoreGui")
    end) then
        window.ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    end
    window.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    window.ScreenGui.DisplayOrder = 1

    window.MainFrame = Instance.new("Frame")
    window.MainFrame.Name = "MainFrame"
    window.MainFrame.Parent = window.ScreenGui
    window.MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    window.MainFrame.BackgroundColor3 = Color3.fromRGB(1, 12, 19)
    window.MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    window.MainFrame.BorderSizePixel = 0
    window.MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    window.MainFrame.Size = UDim2.new(0, 500, 0, 300)

    window.UICorner = Instance.new("UICorner")
    window.UICorner.Parent = window.MainFrame

    window.titlebar = Instance.new("Frame")
    window.titlebar.Name = "titlebar"
    window.titlebar.Parent = window.MainFrame
    window.titlebar.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
    window.titlebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    window.titlebar.BorderSizePixel = 0
    window.titlebar.Size = UDim2.new(1, 0, 0.100000001, 0)

    window.UICorner_2 = Instance.new("UICorner")
    window.UICorner_2.Parent = window.titlebar

    window.Frame = Instance.new("Frame")
    window.Frame.Parent = window.titlebar
    window.Frame.AnchorPoint = Vector2.new(0, 1)
    window.Frame.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
    window.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    window.Frame.BorderSizePixel = 0
    window.Frame.Position = UDim2.new(0, 0, 1, 0)
    window.Frame.Size = UDim2.new(1, 0, 0.5, 0)

    window.Title = Instance.new("TextLabel")
    window.Title.Name = "Title"
    window.Title.Parent = window.titlebar
    window.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    window.Title.BackgroundTransparency = 1.000
    window.Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    window.Title.BorderSizePixel = 0
    window.Title.Position = UDim2.new(0.0155971469, 0, 0, 0)
    window.Title.Size = UDim2.new(0.971033931, 0, 0.99999994, 0)
    window.Title.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json",Enum.FontWeight.Bold)
    window.Title.Text = (options.title or "Dreamy GUI")
    window.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    window.Title.TextSize = 15.000
    window.Title.TextXAlignment = Enum.TextXAlignment.Left

    window.Frame_2 = Instance.new("Frame")
    window.Frame_2.Parent = window.titlebar
    window.Frame_2.AnchorPoint = Vector2.new(0, 1)
    window.Frame_2.BackgroundColor3 = Color3.fromRGB(1, 12, 19)
    window.Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    window.Frame_2.BorderSizePixel = 0
    window.Frame_2.Position = UDim2.new(0, 0, 1, 0)
    window.Frame_2.Size = UDim2.new(1, 0, 0.100000001, 0)

    window.tablist = Instance.new("ScrollingFrame")
    window.tablist.Name = "tablist"
    window.tablist.Parent = window.MainFrame
    window.tablist.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
    window.tablist.BorderColor3 = Color3.fromRGB(0, 0, 0)
    window.tablist.BorderSizePixel = 0
    window.tablist.Position = UDim2.new(0, 0, 0.0999997929, 0)
    window.tablist.Size = UDim2.new(0.268675715, 0, 0.858960569, 0)
    window.tablist.AutomaticCanvasSize = Enum.AutomaticSize.Y
    window.tablist.CanvasSize = UDim2.new(0, 0, 0, 0)
    window.tablist.ScrollBarThickness = 6
    window.tablist.VerticalScrollBarInset = Enum.ScrollBarInset.Always
    window.tablist.VerticalScrollBarPosition =
        Enum.VerticalScrollBarPosition.Left
    window.UIListLayout = Instance.new("UIListLayout")
    window.UIListLayout.Parent = window.tablist
    window.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    window.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    window.Frame_7 = Instance.new("Frame")
    window.Frame_7.Parent = window.MainFrame
    window.Frame_7.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
    window.Frame_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    window.Frame_7.BorderSizePixel = 0
    window.Frame_7.Position = UDim2.new(7.12985937e-08, 0, 0.951395631, 0)
    window.Frame_7.Size = UDim2.new(0.268675715, 0, 0.0479999967, 0)

    window.UICorner_10 = Instance.new("UICorner")
    window.UICorner_10.Parent = window.Frame_7

    window.Frame_8 = Instance.new("Frame")
    window.Frame_8.Parent = window.Frame_7
    window.Frame_8.AnchorPoint = Vector2.new(1, 0)
    window.Frame_8.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
    window.Frame_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
    window.Frame_8.BorderSizePixel = 0
    window.Frame_8.Position = UDim2.new(1, 0, 0, 0)
    window.Frame_8.Size = UDim2.new(0.486956239, 0, 1, 0)

    window.NotificationHolder = Instance.new("Frame")
    window.NotificationHolder.Name = "Notification Holder"
    window.NotificationHolder.Parent = window.ScreenGui
    window.NotificationHolder.AnchorPoint = Vector2.new(1, 1)
    window.NotificationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    window.NotificationHolder.BackgroundTransparency = 1.000
    window.NotificationHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    window.NotificationHolder.BorderSizePixel = 0
    window.NotificationHolder.Position = UDim2.new(1, 0, 1, 0)
    window.NotificationHolder.Size = UDim2.new(0.174999997, 0, 1, 0)

    window.UIListLayout_4 = Instance.new("UIListLayout")
    window.UIListLayout_4.Parent = window.NotificationHolder
    window.UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
    window.UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
    window.UIListLayout_4.VerticalAlignment = Enum.VerticalAlignment.Bottom

    -- Create a notification
    function window:Notify(options)
        local notification = {}
        notification.Notification = Instance.new("Frame")
        notification.Notification.Name = "Notification"
        notification.Notification.Parent = window.NotificationHolder
        notification.Notification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        notification.Notification.BackgroundTransparency = 1.000
        notification.Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
        notification.Notification.BorderSizePixel = 0
        notification.Notification.Size = UDim2.new(1, 0, 0.125, 0)

        notification.Frame_9 = Instance.new("Frame")
        notification.Frame_9.Parent = notification.Notification
        notification.Frame_9.AnchorPoint = Vector2.new(0.5, 0.5)
        notification.Frame_9.BackgroundColor3 = Color3.fromRGB(1, 12, 19)
        notification.Frame_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
        notification.Frame_9.BorderSizePixel = 0
        notification.Frame_9.Position = UDim2.new(1.5, 0, 0.5, 0)
        notification.Frame_9.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)

        notification.UICorner_11 = Instance.new("UICorner")
        notification.UICorner_11.CornerRadius = UDim.new(0, 10)
        notification.UICorner_11.Parent = notification.Frame_9

        notification.Titlebar = Instance.new("Frame")
        notification.Titlebar.Name = "Titlebar"
        notification.Titlebar.Parent = notification.Frame_9
        notification.Titlebar.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
        notification.Titlebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
        notification.Titlebar.BorderSizePixel = 0
        notification.Titlebar.Size = UDim2.new(1, 0, 0.25, 0)

        notification.UICorner_12 = Instance.new("UICorner")
        notification.UICorner_12.CornerRadius = UDim.new(0, 20)
        notification.UICorner_12.Parent = notification.Titlebar

        notification.Frame_10 = Instance.new("Frame")
        notification.Frame_10.Parent = notification.Titlebar
        notification.Frame_10.AnchorPoint = Vector2.new(0, 1)
        notification.Frame_10.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
        notification.Frame_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
        notification.Frame_10.BorderSizePixel = 0
        notification.Frame_10.Position = UDim2.new(0, 0, 1, 0)
        notification.Frame_10.Size = UDim2.new(1, 0, 0.5, 0)

        notification.Title_2 = Instance.new("TextLabel")
        notification.Title_2.Name = "Title"
        notification.Title_2.Parent = notification.Titlebar
        notification.Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        notification.Title_2.BackgroundTransparency = 1.000
        notification.Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        notification.Title_2.BorderSizePixel = 0
        notification.Title_2.Size = UDim2.new(1, 0, 1, 0)
        notification.Title_2.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json",Enum.FontWeight.Bold)
        notification.Title_2.Text = options.Title or ""
        notification.Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        notification.Title_2.TextSize = 15.000

        notification.TextButton_5 = Instance.new("TextButton")
        notification.TextButton_5.Parent = notification.Titlebar
        notification.TextButton_5.AnchorPoint = Vector2.new(1, 0.5)
        notification.TextButton_5.BackgroundColor3 =
            Color3.fromRGB(255, 255, 255)
        notification.TextButton_5.BackgroundTransparency = 1.000
        notification.TextButton_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
        notification.TextButton_5.BorderSizePixel = 0
        notification.TextButton_5.Position = UDim2.new(0.975000024, 0, 0.5, 0)
        notification.TextButton_5.Size = UDim2.new(0, 15, 0, 15)
        notification.TextButton_5.Font = Enum.Font.FredokaOne
        notification.TextButton_5.Text = "X"
        notification.TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
        notification.TextButton_5.TextScaled = true
        notification.TextButton_5.TextSize = 14.000
        notification.TextButton_5.TextWrapped = true
        notification.TextButton_5.Activated:Connect(function()
            notification.Notification:Destroy()
        end)

        notification.Message = Instance.new("TextLabel")
        notification.Message.Name = "Message"
        notification.Message.Parent = notification.Frame_9
        notification.Message.AnchorPoint = Vector2.new(0, 1)
        notification.Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        notification.Message.BackgroundTransparency = 1.000
        notification.Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
        notification.Message.BorderSizePixel = 0
        notification.Message.Position = UDim2.new(0.0271355081, 0, 0.928112984,
                                                  0)
        notification.Message.Size = UDim2.new(0.945728898, 0, 0.678112984, 0)
        notification.Message.Font = Enum.Font.Ubuntu
        notification.Message.Text = options.Message or ""
        notification.Message.TextColor3 = Color3.fromRGB(255, 255, 255)
        notification.Message.TextSize = 14.000
        notification.Message.TextWrapped = true
        notification.Message.TextXAlignment = Enum.TextXAlignment.Center
        notification.Message.TextYAlignment = Enum.TextYAlignment.Center

        coroutine.wrap(function()
            notification.Frame_9:TweenPosition(
                UDim2.new(0.5, 0, 0.5, 0),
                Enum.EasingDirection.In,
                Enum.EasingStyle.Sine,
                0.25,
                false,
                function()
                    task.wait(options.Delay or 5)
                    if notification.Notification then
                        notification.Frame_9:TweenPosition(
                            UDim2.new(1.5, 0, 0.5, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Sine,
                            0.25,
                            false,
                            function()
                                notification.Notification:Destroy()
                            end
                        )
                    end
                end
            )
        end)()
    end

    -- Create a tab
    function window:CreateTab(options)
        local Tab = {}

        -- Gui elements
        Tab.tab = Instance.new("Frame")
        Tab.tab.Name = "tab"
        Tab.tab.Parent = window.tablist
        Tab.tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.tab.BackgroundTransparency = 1.000
        Tab.tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab.tab.BorderSizePixel = 0
        Tab.tab.Position = UDim2.new(0.052174177, 0, 0, 0)
        Tab.tab.Size = UDim2.new(1, 0, 0.100000001, 0)

        Tab.ImageLabel = Instance.new("ImageLabel")
        Tab.ImageLabel.Parent = Tab.tab
        Tab.ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.ImageLabel.BackgroundTransparency = 1.000
        Tab.ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab.ImageLabel.BorderSizePixel = 0
        Tab.ImageLabel.Size = UDim2.new(0.214019045, 0, 1, 0)
        Tab.ImageLabel.Image = "rbxassetid://14291283871"
        Tab.ImageLabel.ImageRectOffset = Vector2.new(-3, -3)
        Tab.ImageLabel.ImageRectSize = Vector2.new(30, 30)
        Tab.ImageLabel.ScaleType = Enum.ScaleType.Slice

        Tab.TextLabel = Instance.new("TextLabel")
        Tab.TextLabel.Parent = Tab.tab
        Tab.TextLabel.AnchorPoint = Vector2.new(1, 0)
        Tab.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextLabel.BackgroundTransparency = 1.000
        Tab.TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab.TextLabel.BorderSizePixel = 0
        Tab.TextLabel.Position = UDim2.new(0.999999881, 0, 0, 0)
        Tab.TextLabel.Size = UDim2.new(0.74000001, 0, 1, 0)
        Tab.TextLabel.Font = Enum.Font.SourceSansBold
        Tab.TextLabel.Text = options.Name or ""
        Tab.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextLabel.TextSize = 15.000
        Tab.TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        Tab.TextButton = Instance.new("TextButton")
        Tab.TextButton.Parent = Tab.tab
        Tab.TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextButton.BackgroundTransparency = 1.000
        Tab.TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab.TextButton.BorderSizePixel = 0
        Tab.TextButton.Size = UDim2.new(1, 0, 1, 0)
        Tab.TextButton.Font = Enum.Font.SourceSans
        Tab.TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        Tab.TextButton.TextSize = 14.000
        Tab.TextButton.TextTransparency = 1.000
        Tab.TextButton.Activated:Connect(function()
            for _,t in pairs(window.tabs) do
                t.body.Visible = false
            end
            Tab.body.Visible = true
        end)

        Tab.body = Instance.new("ScrollingFrame")
        Tab.body.Name = "body"
        Tab.body.Parent = window.MainFrame
        Tab.body.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Tab.body.ScrollingDirection = Enum.ScrollingDirection.Y
        Tab.body.ScrollBarImageColor3 = Color3.fromRGB(42, 50, 77)
        Tab.body.BackgroundColor3 = Color3.fromRGB(18, 0, 18)
        Tab.body.BackgroundTransparency = 1.000
        Tab.body.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab.body.BorderSizePixel = 0
        Tab.body.Position = UDim2.new(0.268676013, 0, 0.0999993905, 0)
        Tab.body.Size = UDim2.new(0.731323957, 0, 0.878961205, 0)
        Tab.body.CanvasSize = UDim2.new(0, 0, 0, 0)
        Tab.body.ScrollBarThickness = 6
        Tab.body.VerticalScrollBarInset = Enum.ScrollBarInset.Always
        Tab.body.Visible = (#window.tabs == 0)

        Tab.UIListLayout_2 = Instance.new("UIListLayout")
        Tab.UIListLayout_2.Parent = Tab.body
        Tab.UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
        Tab.UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

        -- Create a section widgit
        function Tab:CreateSection(options)
            local section = {}

            -- gui elements
            section.widgit_section = Instance.new("Frame")
            section.widgit_section.Name = "widgit_section"
            section.widgit_section.Parent = Tab.body
            section.widgit_section.AutomaticSize = Enum.AutomaticSize.Y
            section.widgit_section.BackgroundColor3 = Color3.fromRGB(11, 13, 20)
            section.widgit_section.BackgroundTransparency = 1.000
            section.widgit_section.BorderColor3 = Color3.fromRGB(0, 0, 0)
            section.widgit_section.BorderSizePixel = 0
            section.widgit_section.Position = UDim2.new(0, 0, 0.299596101, 0)
            section.widgit_section.Size =
                UDim2.new(0.967452049, 0, -0.01972018, 0)

            section.SectionName = Instance.new("TextLabel")
            section.SectionName.Name = "Section Name"
            section.SectionName.Parent = section.widgit_section
            section.SectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            section.SectionName.BackgroundTransparency = 1.000
            section.SectionName.BorderColor3 = Color3.fromRGB(0, 0, 0)
            section.SectionName.BorderSizePixel = 0
            section.SectionName.LayoutOrder = -1
            section.SectionName.Position = UDim2.new(0.0250004157, 0, 0, 0)
            section.SectionName.Size = UDim2.new(0, 332, 0, 26)
            section.SectionName.Font = Enum.Font.SourceSansBold
            section.SectionName.Text = options.Name or ""
            section.SectionName.TextColor3 = Color3.fromRGB(193, 193, 193)
            section.SectionName.TextSize = 14.000
            section.SectionName.TextXAlignment = Enum.TextXAlignment.Left

            section.SectionEnd = Instance.new("Frame")
            section.SectionEnd.Name = "Section End"
            section.SectionEnd.Parent = section.widgit_section
            section.SectionEnd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            section.SectionEnd.BackgroundTransparency = 1.000
            section.SectionEnd.BorderColor3 = Color3.fromRGB(0, 0, 0)
            section.SectionEnd.BorderSizePixel = 0
            section.SectionEnd.LayoutOrder = 1
            section.SectionEnd.Position =
                UDim2.new(0.0307559799, 0, 0.867346942, 0)
            section.SectionEnd.Size = UDim2.new(0, 332, 0, 13)

            section.UIListLayout_3 = Instance.new("UIListLayout")
            section.UIListLayout_3.Parent = section.widgit_section
            section.UIListLayout_3.HorizontalAlignment =
                Enum.HorizontalAlignment.Center
            section.UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

            -- widgits
            function section:CreateLabel(options)
                return window.CreateLabel(options, section.widgit_section)
            end
            function section:CreateButton(options)
                return window.CreateButton(options, section.widgit_section)
            end
            function section:CreateToggle(options)
                return window.CreateToggle(options, section.widgit_section)
            end
            function section:CreateKeybind(options)
                return window.CreateKeybind(options, section.widgit_section)
            end
            function section:CreateSlider(options)
                return window.CreateSlider(options, section.widgit_section)
            end
            function section:CreateTextbox(options)
                return window.CreateTextbox(options, section.widgit_section)
            end

            return section
        end

        -- widgits
        function Tab:CreateLabel(options)
            return window.CreateLabel(options, Tab.body)
        end
        function Tab:CreateButton(options)
            return window.CreateButton(options, Tab.body)
        end
        function Tab:CreateToggle(options)
            return window.CreateToggle(options, Tab.body)
        end
        function Tab:CreateKeybind(options)
            return window.CreateKeybind(options, Tab.body)
        end
        function Tab:CreateSlider(options)
            return window.CreateSlider(options, Tab.body)
        end
        function Tab:CreateTextbox(options)
           return window.CreateTextbox(options, Tab.body)
        end

        table.insert(window.tabs, Tab)
        return Tab
    end

    -- Create Widgits
    -- Create a label widgit
    function window.CreateLabel(options, parent)
        local label = {}

        label.widgit_label = Instance.new("Frame")
        label.widgit_label.Name = "widgit_label"
        label.widgit_label.Parent = parent
        label.widgit_label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        label.widgit_label.BackgroundTransparency = 1.000
        label.widgit_label.BorderColor3 = Color3.fromRGB(0, 0, 0)
        label.widgit_label.BorderSizePixel = 0
        label.widgit_label.Size = UDim2.new(0, 359, 0, 46)

        label.Frame_4 = Instance.new("Frame")
        label.Frame_4.Parent = label.widgit_label
        label.Frame_4.AnchorPoint = Vector2.new(0.5, 0.5)
        label.Frame_4.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
        label.Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        label.Frame_4.BorderSizePixel = 0
        label.Frame_4.Position = UDim2.new(0.5, 0, 0.5, 0)
        label.Frame_4.Size = UDim2.new(0.949999988, 0, 0.800000012, 0)

        label.UIStroke = Instance.new("UIStroke")
        label.UIStroke.Parent = label.Frame_4
        label.UIStroke.Color = Color3.fromRGB(3, 42, 58)
        label.UIStroke.Thickness = 4

        label.UICorner_5 = Instance.new("UICorner")
        label.UICorner_5.Parent = label.Frame_4

        label.TextLabel_2 = Instance.new("TextLabel")
        label.TextLabel_2.Parent = label.Frame_4
        label.TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        label.TextLabel_2.BackgroundTransparency = 1.000
        label.TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        label.TextLabel_2.BorderSizePixel = 0
        label.TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
        label.TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json",Enum.FontWeight.Bold)
        label.TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextLabel_2.TextSize = 19.000
        label.TextLabel_2.TextWrapped = true
        label.TextLabel_2.Text = options.Text or ""

        label.Visible = true
        
        -- Set label text
        function label:SetText(text)
            label.TextLabel_2.Text = text or ""
        end

        -- Toggle Visible
        function label:ToggleVisible()
            label.Visible = not label.Visible
            label.widgit_label.Visible = label.Visible
        end

        function label:SetVisible(IsVisible)
            label.Visible = IsVisible
            label.widgit_label.Visible = label.Visible
        end

        return label
    end
    -- Create a button
    function window.CreateButton(options, parent)
        local button = {}

        local widgit_button = Instance.new("Frame")
        local Frame_3 = Instance.new("Frame")
        local UICorner_3 = Instance.new("UICorner")
        local TextButton_2 = Instance.new("TextButton")
        local ImageLabel_2 = Instance.new("ImageLabel")
        local UICorner_4 = Instance.new("UICorner")
        local UIStroke = Instance.new("UIStroke")

        widgit_button.Name = "widgit_button"
        widgit_button.Parent = parent
        widgit_button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        widgit_button.BackgroundTransparency = 1.000
        widgit_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
        widgit_button.BorderSizePixel = 0
        widgit_button.Size = UDim2.new(0, 359, 0, 46)

        Frame_3.Parent = widgit_button
        Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame_3.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
        Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame_3.BorderSizePixel = 0
        Frame_3.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame_3.Size = UDim2.new(0.949999988, 0, 0.800000012, 0)

        UIStroke.Parent = Frame_3
        UIStroke.Color = Color3.fromRGB(3, 42, 58)
        UIStroke.Thickness = 4

        UICorner_3.Parent = Frame_3

        TextButton_2.Parent = Frame_3
        TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_2.BackgroundTransparency = 1.000
        TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_2.BorderSizePixel = 0
        TextButton_2.Position = UDim2.new(0.0205713864, 0, 0, 0)
        TextButton_2.Size = UDim2.new(0.855000317, 0, 1.00000012, 0)
        TextButton_2.Font = Enum.Font.SourceSansBold
        TextButton_2.Text = options.Text or ""
        TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_2.TextSize = 18.000
        TextButton_2.TextXAlignment = Enum.TextXAlignment.Left
        TextButton_2.Activated:Connect(options.Callback or (function()
            print("Button Clicked")
        end))

        
        ImageLabel_2.Parent = Frame_3
        ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel_2.BackgroundTransparency = 1.000
        ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel_2.BorderSizePixel = 0
        ImageLabel_2.Position = UDim2.new(0.875571132, 0, 0, 0)
        ImageLabel_2.Size = UDim2.new(0.12442936, 0, 1, 0)
        ImageLabel_2.Image = "rbxassetid://14125170606"
        ImageLabel_2.ImageRectOffset = Vector2.new(-15, -20)
        ImageLabel_2.ImageRectSize = Vector2.new(63, 63)
        ImageLabel_2.ScaleType = Enum.ScaleType.Slice

        UICorner_4.CornerRadius = UDim.new(1, 0)
        UICorner_4.Parent = ImageLabel_2

        button.Visible = true

        -- Toggle Visible
        function button:SetText(text)
            TextButton_2.Text = tostring(text) or "nil"
        end

        function button:ToggleVisible()
            button.Visible = not button.Visible
            widgit_button.Visible = button.Visible
        end

        function button:SetVisible(IsVisible)
            button.Visible = IsVisible
            widgit_button.Visible = button.Visible
        end

        return button
    end
    -- Create a toggle
    function window.CreateToggle(options, parent)
        local toggle = {}
        toggle.Value = false

        local widgit_toggle = Instance.new("Frame")
        local Frame_6 = Instance.new("Frame")
        local UICorner_8 = Instance.new("UICorner")
        local TextLabel_4 = Instance.new("TextLabel")
        local TextButton_4 = Instance.new("TextButton")
        local UICorner_9 = Instance.new("UICorner")
        local UIStroke = Instance.new("UIStroke")

        widgit_toggle.Name = "widgit_toggle"
        widgit_toggle.Parent = parent
        widgit_toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        widgit_toggle.BackgroundTransparency = 1.000
        widgit_toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
        widgit_toggle.BorderSizePixel = 0
        widgit_toggle.Size = UDim2.new(0, 359, 0, 46)

        Frame_6.Parent = widgit_toggle
        Frame_6.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame_6.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
        Frame_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame_6.BorderSizePixel = 0
        Frame_6.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame_6.Size = UDim2.new(0.949999988, 0, 0.800000012, 0)
        
        UIStroke.Parent = Frame_6
        UIStroke.Color = Color3.fromRGB(3, 42, 58)
        UIStroke.Thickness = 4

        UICorner_8.Parent = Frame_6

        TextLabel_4.Parent = Frame_6
        TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_4.BackgroundTransparency = 1.000
        TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel_4.BorderSizePixel = 0
        TextLabel_4.Position = UDim2.new(0.0205713864, 0, 0, 0)
        TextLabel_4.Size = UDim2.new(0.855000377, 0, 1.00000012, 0)
        TextLabel_4.Font = Enum.Font.SourceSansBold
        TextLabel_4.Text = options.Text or ""
        TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_4.TextSize = 18.000
        TextLabel_4.TextWrapped = true
        TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

        TextButton_4.Parent = Frame_6
        TextButton_4.AnchorPoint = Vector2.new(0, 0.5)
        TextButton_4.BackgroundColor3 =
            (not toggle.Value and Color3.fromRGB(1, 12, 19) or
                Color3.fromRGB(5, 92, 110))
        TextButton_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_4.BorderSizePixel = 0
        TextButton_4.Position = UDim2.new(0.903999984, 0, 0.5, 0)
        TextButton_4.Size = UDim2.new(0.063000001, 0, 0.5, 0)
        TextButton_4.Font = Enum.Font.SourceSans
        TextButton_4.Text = ""
        TextButton_4.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_4.TextSize = 14.000
        TextButton_4.Activated:Connect(function()
            toggle.Value = not toggle.Value
            local goal = {
                BackgroundColor3 = (not toggle.Value and Color3.fromRGB(1, 12, 19) or
                Color3.fromRGB(5, 92, 110))
            }
            local tweeninfo = TweenInfo.new(1)
            window.tweenservice:Create(TextButton_4, tweeninfo, goal):Play()

            if options.Callback then
                options.Callback(toggle.Value)
            else
                print("Toggled: ", toggle.Value)
            end
        end)

        UICorner_9.Parent = TextButton_4

        toggle.Visible = true

        function toggle:SetText(text)
            TextLabel_4.Text = tostring(text) or "nil"
        end

        function toggle:ToggleVisible()
            toggle.Visible = not toggle.Visible
            widgit_toggle.Visible = toggle.Visible
        end

        function toggle:SetVisible(IsVisible)
            toggle.Visible = IsVisible
            widgit_toggle.Visible = toggle.Visible
        end

        function toggle:SetState(state)
            toggle.Value = state or false
            local goal = {
                BackgroundColor3 = (not toggle.Value and Color3.fromRGB(1, 12, 19) or
                Color3.fromRGB(5, 92, 110))
            }
            local tweeninfo = TweenInfo.new(1)
            window.tweenservice:Create(TextButton_4, tweeninfo, goal):Play()
            if options.Callback then
                options.Callback(toggle.Value)
            else
                print("Toggled: ", toggle.Value)
            end
        end

        return toggle
    end
    -- Create a keybind
    function window.CreateKeybind(options, parent)
        local keybind = {}
        keybind.key = options.Key or Enum.KeyCode.E
        keybind.tracking = false

        local widgit_keybind = Instance.new("Frame")
        local Frame_5 = Instance.new("Frame")
        local UICorner_6 = Instance.new("UICorner")
        local TextLabel_3 = Instance.new("TextLabel")
        local TextButton_3 = Instance.new("TextButton")
        local UICorner_7 = Instance.new("UICorner")
        local UIStroke = Instance.new("UIStroke")

        widgit_keybind.Name = "widgit_keybind"
        widgit_keybind.Parent = parent
        widgit_keybind.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        widgit_keybind.BackgroundTransparency = 1.000
        widgit_keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
        widgit_keybind.BorderSizePixel = 0
        widgit_keybind.Size = UDim2.new(0, 359, 0, 46)

        Frame_5.Parent = widgit_keybind
        Frame_5.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame_5.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
        Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame_5.BorderSizePixel = 0
        Frame_5.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame_5.Size = UDim2.new(0.949999988, 0, 0.800000012, 0)

        UIStroke.Parent = Frame_5
        UIStroke.Color = Color3.fromRGB(3, 42, 58)
        UIStroke.Thickness = 4

        UICorner_6.Parent = Frame_5

        TextLabel_3.Parent = Frame_5
        TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_3.BackgroundTransparency = 1.000
        TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel_3.BorderSizePixel = 0
        TextLabel_3.Position = UDim2.new(0.0205713864, 0, 0, 0)
        TextLabel_3.Size = UDim2.new(0.819040596, 0, 1.00000012, 0)
        TextLabel_3.Font = Enum.Font.SourceSansBold
        TextLabel_3.Text = options.Text or ""
        TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_3.TextSize = 18.000
        TextLabel_3.TextWrapped = true
        TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

        TextButton_3.Parent = Frame_5
        TextButton_3.AnchorPoint = Vector2.new(1, 0.5)
        TextButton_3.AutomaticSize = Enum.AutomaticSize.X
        TextButton_3.BackgroundColor3 = Color3.fromRGB(1, 12, 19)
        TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_3.BorderSizePixel = 0
        TextButton_3.Position = UDim2.new(0.975, 0, 0.499999583, 0)
        TextButton_3.Size = UDim2.new(0.127387986, 0, 0.5, 0)
        TextButton_3.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json",Enum.FontWeight.Bold)
        TextButton_3.Text =
            tostring(options.Key.Name or Enum.KeyCode.E.Name)
        TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_3.TextSize = 14.000
        TextButton_3.TextWrapped = true
        TextButton_3.Activated:Connect(function()
            TextButton_3.Text = "..."
            keybind.tracking = true
        end)
        local i = window.uis.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if window.uis:GetFocusedTextBox() then
                    return
                end
                if keybind.tracking then
                    keybind.key = input.KeyCode
                    TextButton_3.Text = tostring(input.KeyCode.Name)
                    keybind.tracking = false
                else
                    if input.KeyCode == keybind.key then
                        if options.Callback then
                            options.Callback()
                        else
                            print("Key pressed", input.KeyCode.Name)
                        end
                    end
                end
            end
        end)
        table.insert(window.connections, i)

        UICorner_7.Parent = TextButton_3

        local UIPadding = Instance.new("UIPadding")

        --Properties:

        UIPadding.Parent = TextButton_3
        UIPadding.PaddingLeft = UDim.new(0, 4)
        UIPadding.PaddingRight = UDim.new(0, 4)

        keybind.Visible = true

        function keybind:ToggleVisible()
            keybind.Visible = not keybind.Visible
            widgit_keybind.Visible = keybind.Visible
        end

        function keybind:SetVisible(IsVisible)
            keybind.Visible = IsVisible
            widgit_keybind.Visible = keybind.Visible
        end

        function keybind:SetBind(key)
            keybind.key = key
            TextButton_3.Text = tostring(key.Name)
        end

        return keybind
    end
    -- Create a slider
    function window.CreateSlider(options, parent)
        local slider = {}
        slider.track = false
        slider.input = nil

        slider.widgit_slider = Instance.new("Frame")
        slider.Frame = Instance.new("Frame")
        slider.UICorner = Instance.new("UICorner")
        slider.Name = Instance.new("TextLabel")
        slider.Value = Instance.new("TextLabel")
        slider.bg = Instance.new("Frame")
        slider.UICorner_2 = Instance.new("UICorner")
        slider.Fill = Instance.new("Frame")
        slider.UICorner_3 = Instance.new("UICorner")
        slider.UIStroke = Instance.new("UIStroke")

        slider.widgit_slider.Name = "widgit_slider"
        slider.widgit_slider.Parent = parent
        slider.widgit_slider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        slider.widgit_slider.BackgroundTransparency = 1.000
        slider.widgit_slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
        slider.widgit_slider.BorderSizePixel = 0
        slider.widgit_slider.Position = UDim2.new(-0.0158702824, 0, 0.73237884, 0)
        slider.widgit_slider.Size = UDim2.new(0, 359, 0, 46)

        slider.Frame.Parent = slider.widgit_slider
        slider.Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        slider.Frame.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
        slider.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        slider.Frame.BorderSizePixel = 0
        slider.Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        slider.Frame.Size = UDim2.new(0.949999988, 0, 0.800000012, 0)

        slider.UIStroke.Parent = slider.Frame
        slider.UIStroke.Color = Color3.fromRGB(3, 42, 58)
        slider.UIStroke.Thickness = 4

        slider.UICorner.Parent = slider.Frame

        slider.Name.Name = "Name"
        slider.Name.Parent = slider.Frame
        slider.Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        slider.Name.BackgroundTransparency = 1.000
        slider.Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
        slider.Name.BorderSizePixel = 0
        slider.Name.Position = UDim2.new(0.0205713809, 0, 0, 0)
        slider.Name.Size = UDim2.new(0.490642846, 0, 0.619565547, 0)
        slider.Name.Font = Enum.Font.SourceSansBold
        slider.Name.Text = options.Text or ""
        slider.Name.TextColor3 = Color3.fromRGB(255, 255, 255)
        slider.Name.TextSize = 18.000
        slider.Name.TextWrapped = true
        slider.Name.TextXAlignment = Enum.TextXAlignment.Left

        slider.Value.Name = "Value"
        slider.Value.Parent = slider.Frame
        slider.Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        slider.Value.BackgroundTransparency = 1.000
        slider.Value.BorderColor3 = Color3.fromRGB(0, 0, 0)
        slider.Value.BorderSizePixel = 0
        slider.Value.Position = UDim2.new(0.49557507, 0, 0, 0)
        slider.Value.Size = UDim2.new(0.490642846, 0, 0.619565547, 0)
        slider.Value.Font = Enum.Font.SourceSansBold
        slider.Value.Text = tostring(clamp(options.Default, options.Min, options.Max)) or tostring(options.Min)
        slider.Value.TextColor3 = Color3.fromRGB(255, 255, 255)
        slider.Value.TextSize = 18.000
        slider.Value.TextWrapped = true
        slider.Value.TextXAlignment = Enum.TextXAlignment.Right

        slider.bg.Name = "bg"
        slider.bg.Parent = slider.Frame
        slider.bg.AnchorPoint = Vector2.new(0, 0.5)
        slider.bg.BackgroundColor3 = Color3.fromRGB(1, 12, 19)
        slider.bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
        slider.bg.BorderSizePixel = 0
        slider.bg.Position = UDim2.new(0.116999999, 0, 0.75, 0)
        slider.bg.Size = UDim2.new(0, 268, 0, 9)

        slider.UICorner_2.Parent = slider.bg

        slider.Fill.Name = "Fill"
        slider.Fill.Parent = slider.bg
        slider.Fill.BackgroundColor3 = Color3.fromRGB(4, 62, 80)
        slider.Fill.BorderColor3 = Color3.fromRGB(0, 0, 0)
        slider.Fill.BorderSizePixel = 0
        slider.Fill.Size = UDim2.new(clamp((options.Default-options.Min)/(options.Max - options.Min), 0, 1), 0, 1, 0)

        slider.bg.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                slider.track = true
            end
        end)
        slider.bg.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                slider.track = false
            end
        end)
        coroutine.wrap(function()
            while task.wait() do
                if slider.track then
                    local pos = Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y)
                    pos = pos - slider.bg.AbsolutePosition
                    local percent = clamp(pos.X / slider.bg.Size.X.Offset, 0, 1)
                    local val = math.floor(percent * (options.Max-options.Min) / options.Increment + 0.5) + options.Increment
                    
                    slider.Fill:TweenSize(
                        UDim2.new(percent, 0, 1, 0),
                        Enum.EasingDirection.Out,    -- I set it to Default (Out)
                        Enum.EasingStyle.Sine,      -- I set it to Elastic
                        0.1,                          -- I set it to 5 for a long tween
                        false,                       -- I set it just incase there is another tween happening
                        function()end                    -- Tells me if the tween is done
                    )
                    
                    if options.Callback then
                        options.Callback(val)
                    end
                    slider.Value.Text = tostring(val)
                end
            end
        end)()

        slider.UICorner_3.Parent = slider.Fill

        slider.Visible = true

        function slider:ToggleVisible()
            slider.Visible = not slider.Visible
            slider.widgit_slider.Visible = slider.Visible
        end

        function slider:SetVisible(IsVisible)
            slider.Visible = IsVisible
            slider.widgit_slider.Visible = slider.Visible
        end

        function slider:SetValue(Value)
            local percent = clamp((Value-options.Min)/(options.Max - options.Min), 0, 1)
            slider.Fill:TweenSize(
                UDim2.new(percent, 0, 1, 0),
                Enum.EasingDirection.Out,    -- I set it to Default (Out)
                Enum.EasingStyle.Sine,      -- I set it to Elastic
                0.1,                          -- I set it to 5 for a long tween
                false,                       -- I set it just incase there is another tween happening
                function()end                    -- Tells me if the tween is done
            )
            slider.Value.Text = tostring(clamp(Value, options.Min, options.Max))
        end

        return slider
    end
    -- Create a textbox
    function window.CreateTextbox(options, parent)
        local textbox = {}

        local widgit_textbox = Instance.new("Frame")
        local Frame = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local TextLabel = Instance.new("TextLabel")
        local TextBox = Instance.new("TextBox")
        local UICorner_2 = Instance.new("UICorner")
        local UIStroke = Instance.new("UIStroke")

        widgit_textbox.Name = "widgit_textbox"
        widgit_textbox.Parent = parent
        widgit_textbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        widgit_textbox.BackgroundTransparency = 1.000
        widgit_textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
        widgit_textbox.BorderSizePixel = 0
        widgit_textbox.Position = UDim2.new(-0.0158702824, 0, 0.526431739, 0)
        widgit_textbox.Size = UDim2.new(0, 359, 0, 46)

        Frame.Parent = widgit_textbox
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.BackgroundColor3 = Color3.fromRGB(2, 26, 37)
        Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame.BorderSizePixel = 0
        Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame.Size = UDim2.new(0.949999988, 0, 0.800000012, 0)

        UIStroke.Parent = Frame
        UIStroke.Color = Color3.fromRGB(3, 42, 58)
        UIStroke.Thickness = 4

        UICorner.Parent = Frame

        TextLabel.Parent = Frame
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0.0205713809, 0, 0, 0)
        TextLabel.Size = UDim2.new(0.490642846, 0, 1.00000012, 0)
        TextLabel.Font = Enum.Font.SourceSansBold
        TextLabel.Text = options.Text or ""
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 18.000
        TextLabel.TextWrapped = true
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        TextBox.Parent = Frame
        TextBox.AnchorPoint = Vector2.new(1,0)
        TextBox.AutomaticSize = Enum.AutomaticSize.X
        TextBox.BackgroundColor3 = Color3.fromRGB(1, 12, 19)
        TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextBox.BorderSizePixel = 0
        TextBox.Position = UDim2.new(0.975, 0, 0.244564399, 0)
        TextBox.Size = UDim2.new(0.1, 0, 0.5, 0)
        TextBox.Font = Enum.Font.Ubuntu
        TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
        TextBox.PlaceholderText = options.Placeholder or ""
        TextBox.Text = options.DefaultText or ""
        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.TextSize = 14.000
        TextBox.TextXAlignment = Enum.TextXAlignment.Right
        TextBox.FocusLost:Connect(function()
            if options.Callback then
                options.Callback(TextBox.Text)
            end
        end)

        local UIPadding = Instance.new("UIPadding")

        --Properties:

        UIPadding.Parent = TextBox
        UIPadding.PaddingLeft = UDim.new(0, 4)
        UIPadding.PaddingRight = UDim.new(0, 4)

        UICorner_2.Parent = TextBox

        textbox.Visible = true

        function textbox:ToggleVisible()
            textbox.Visible = not textbox.Visible
            widgit_textbox.Visible = textbox.Visible
        end

        function textbox:SetVisible(IsVisible)
            textbox.Visible = IsVisible
            widgit_textbox.Visible = textbox.Visible
        end

        function textbox:SetText(Text)
            TextBox.Text = tostring(Text) or "nil"
        end

        return textbox
    end

    -- Destroy the window
    function window:Destroy()
        window.ScreenGui:Destroy()
        for i,v in pairs(window.connections) do
            v:Disconnect()
        end
        window = nil
    end

    window.Visible = true

    function window:ToggleVisible()
        window.Visible = not window.Visible
        window.MainFrame.Visible = window.Visible
    end

    function window:SetVisible(IsVisible)
        window.Visible = IsVisible
        window.MainFrame.Visible = window.Visible
    end

    -- make window dragable
    coroutine.wrap(function()
        local gui = window.Title

        local dragging
        local dragInput
        local dragStart
        local startPos

        local function update(input)
            local delta = input.Position - dragStart
            window.MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end

        gui.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = window.MainFrame.Position
                
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        gui.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        window.uis.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)
    end)()

    return window
end

-- return 
--return library


local win = library:CreateWindow({title = "Dreamy GUI Library"})

local tab = win:CreateTab({Name = "Tab Name"})
local section = tab:CreateSection({Name = "Section Name"})
local toggle = section:CreateToggle({Text = "toggle me"})

local settings = win:CreateTab({Name = "Settings"})
settings:CreateButton({
    Text = "Destroy GUI",
    Callback = function()
        win:Destroy()
    end
})
settings:CreateKeybind({
    Text = "Toggle GUI",
    Key = Enum.KeyCode.LeftControl, -- Default KeyCode
    Callback = function()
        win:ToggleVisible()
    end
})