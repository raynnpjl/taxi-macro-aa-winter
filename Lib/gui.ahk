#Requires AutoHotkey v2
#Include %A_ScriptDir%\Lib\guidegui.ahk
#Include %A_ScriptDir%\Lib\mainsettingsui.ahk
#Include %A_ScriptDir%\Lib\webhooksettings.ahk

GemsEarned := 0
ShibuyaFood := 0
TraitRerolls := 0
StatChips := 0
SuperStatChips := 0
GreenEssence := 0
ColoredEssence := 0
CurrentChallenge := "None"
MinimizeImage := "Lib\Images\minimize.png"
CloseImage := "Lib/Images/close.png"
TaxiImage := "Lib\Images\faxi pfp.png"
DiscordImage := "Lib\Images\Discord-Logo.png"
lastlog := ""
MainGUI := Gui("-Caption +Border +AlwaysOnTop", "Taxi Winter Event Farm")

MainGUI.BackColor := "0c000a"
MainGUI.SetFont("s9 bold", "Segoe UI")

CloseAppButton := MainGUI.Add("Picture", "x910 y8 w60 h34 +BackgroundTrans cffffff", DiscordImage)
CloseAppButton.OnEvent("Click", (*) => OpenDiscord())

MinimizeButton:= MainGUI.Add("Picture", "x1000 y22 w37 h9 +BackgroundTrans cffffff", MinimizeImage)
MinimizeButton.OnEvent("Click", (*) => MinimizeGUI())

CloseAppButton := MainGUI.Add("Picture", "x1052 y10 w30 h32 +BackgroundTrans cffffff", CloseImage)
CloseAppButton.OnEvent("Click", (*) => ExitApp())

GuideBttn := MainGui.Add("Button", "x830 y632 w238 cffffff +BackgroundTrans +Center", "How to use?")
GuideBttn.OnEvent("Click", (*) => OpenGuide())

SettingsButton := MainGUI.Add("Button", "x710 y633 cffffff Choose1 +Center", "Open Settings")
SettingsButton.OnEvent("Click", (*) => OpenSettings())

drawOutline(GuiName, X, Y, W, H, Color1 := "White", Color2 := "White", Thickness := 1)
{	
	%GuiName%.AddProgress("x" X " y" Y " w" W " h" Thickness " Background" Color1) 
	%GuiName%.AddProgress("x" X " y" Y " w" Thickness " h" H " Background" Color1) 
	%GuiName%.AddProgress("x" X " y" Y + H - Thickness " w" W " h" Thickness " Background" Color2) 
	%GuiName%.AddProgress("x" X + W - Thickness " y" Y " w" Thickness " h" H " Background" Color2) 	
}

drawLine(GuiName, X, Y, W, H, Color1 := "Black") 
{
	%GuiName%.AddProgress("x" X " y" Y " w" W " h" H " Background" Color1)
}

drawOutline("MainGUI", 830, 60, 238, 250)


MainGUI.Add("Picture", "x820 y-20 w90 h90 +BackgroundTrans cffffff", TaxiImage)

MainGUI.AddProgress("c0x7e4141 x8 y27 h602 w800", 100) ; box behind roblox, credits to yuh for this idea
WinSetTransColor("0x7e4141 255", MainGUI)

userOption := MainGUI.Add("DropDownList", "x835 y50 cffffff Choose1", ["Unit Setup", "Unit Priority", "Card Selector"])
userOption.OnEvent("Change", (*) => UpdateGroupBox())

; Add controls for Unit Setup
enabled1 := MainGUI.Add("Checkbox", "x840 y80 cffffff", "Slot 1")
enabled2 := MainGUI.Add("Checkbox", "x840 y110 cffffff", "Slot 2")
enabled3 := MainGUI.Add("Checkbox", "x840 y140 cffffff", "Slot 3")
enabled4 := MainGUI.Add("Checkbox", "x840 y170 cffffff", "Slot 4")
enabled5 := MainGUI.Add("Checkbox", "x840 y200 cffffff", "Slot 5")
enabled6 := MainGUI.Add("Checkbox", "x840 y230 cffffff", "Slot 6")

placement1 := MainGUI.Add("DropDownList", "x1020 y80  w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement2 := MainGUI.Add("DropDownList", "x1020 y110 w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement3 := MainGUI.Add("DropDownList", "x1020 y140 w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement4 := MainGUI.Add("DropDownList", "x1020 y170 w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement5 := MainGUI.Add("DropDownList", "x1020 y200 w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement6 := MainGUI.Add("DropDownList", "x1020 y230 w40 cffffff Choose3", [1, 2, 3, 4, 5])

placement1text := MainGUI.Add("Text", "x940 y80 h60 cffffff +BackgroundTrans", "Placements: ")
placement2text := MainGUI.Add("Text", "x940 y110 h60 cffffff +BackgroundTrans", "Placements: ")
placement3text := MainGUI.Add("Text", "x940 y140 h60 cffffff +BackgroundTrans", "Placements: ")
placement4text := MainGUI.Add("Text", "x940 y170 h60 cffffff +BackgroundTrans", "Placements: ")
placement5text := MainGUI.Add("Text", "x940 y200 h60 cffffff +BackgroundTrans", "Placements: ")
placement6text := MainGUI.Add("Text", "x940 y230 h60 cffffff +BackgroundTrans", "Placements: ")

; Add controls for Unit priority
unitpriority1text := MainGUI.Add("Text", "x840 y85 cffffff +BackgroundTrans", "Slot1(Upg): ")
unitpriority2text := MainGUI.Add("Text", "x840 y115 cffffff +BackgroundTrans", "Slot2(Upg): ")
unitpriority3text := MainGUI.Add("Text", "x840 y145 cffffff +BackgroundTrans", "Slot3(Upg): ")
unitpriority4text := MainGUI.Add("Text", "x840 y175 cffffff +BackgroundTrans", "Slot4(Upg): ")
unitpriority5text := MainGUI.Add("Text", "x840 y205 cffffff +BackgroundTrans", "Slot5(Upg): ")
unitpriority6text := MainGUI.Add("Text", "x840 y235 cffffff +BackgroundTrans", "Slot6(Upg): ")
placementpriority1text := MainGUI.Add("Text", "x960 y85 cffffff +BackgroundTrans", "Slot1(P): ")
placementpriority2text := MainGUI.Add("Text", "x960 y115 cffffff +BackgroundTrans", "Slot2(P): ")
placementpriority3text := MainGUI.Add("Text", "x960 y145 cffffff +BackgroundTrans", "Slot3(P): ")
placementpriority4text := MainGUI.Add("Text", "x960 y175 cffffff +BackgroundTrans", "Slot4(P): ")
placementpriority5text := MainGUI.Add("Text", "x960 y205 cffffff +BackgroundTrans", "Slot5(P): ")
placementpriority6text := MainGUI.Add("Text", "x960 y235 cffffff +BackgroundTrans", "Slot6(P): ")

unitpriority1 := MainGUI.Add("DropDownList", "x910 y80  w40 cffffff Choose1", [0, 1, 2, 3, 4, 5, 6])
unitpriority2 := MainGUI.Add("DropDownList", "x910 y110 w40 cffffff Choose2", [0, 1, 2, 3, 4, 5, 6])
unitpriority3 := MainGUI.Add("DropDownList", "x910 y140 w40 cffffff Choose3", [0, 1, 2, 3, 4, 5, 6])
unitpriority4 := MainGUI.Add("DropDownList", "x910 y170 w40 cffffff Choose4", [0, 1, 2, 3, 4, 5, 6])
unitpriority5 := MainGUI.Add("DropDownList", "x910 y200 w40 cffffff Choose5", [0, 1, 2, 3, 4, 5, 6])
unitpriority6 := MainGUI.Add("DropDownList", "x910 y230 w40 cffffff Choose6", [0, 1, 2, 3, 4, 5, 6])
placementpriority1 := MainGUI.Add("DropDownList", "x1020 y80 w40 cffffff Choose1", [1, 2, 3, 4, 5, 6])
placementpriority2 := MainGUI.Add("DropDownList", "x1020 y110 w40 cffffff Choose2", [1, 2, 3, 4, 5, 6])
placementpriority3 := MainGUI.Add("DropDownList", "x1020 y140 w40 cffffff Choose3", [1, 2, 3, 4, 5, 6])
placementpriority4 := MainGUI.Add("DropDownList", "x1020 y170 w40 cffffff Choose4", [1, 2, 3, 4, 5, 6])
placementpriority5 := MainGUI.Add("DropDownList", "x1020 y200 w40 cffffff Choose5", [1, 2, 3, 4, 5, 6])
placementpriority6 := MainGUI.Add("DropDownList", "x1020 y230 w40 cffffff Choose6", [1, 2, 3, 4, 5, 6])

; Add controls for Card Selector
candymultiplier1 := MainGUI.add("Checkbox", "x840 y80 cffffff", "Prioritise Candy Multiplier")
card1text := MainGUI.Add("Text", "x840 y100 cffffff", "new_path")
card2text := MainGUI.Add("Text", "x840 y130 cffffff", "health")
card3text := MainGUI.Add("Text", "x840 y160 cffffff", "regen")
card4text := MainGUI.Add("Text", "x840 y190 cffffff", "speed")
card5text := MainGUI.Add("Text", "x840 y220 cffffff", "exp_death")
card6text := MainGUI.Add("Text", "x960 y100 cffffff", "range")
card7text := MainGUI.Add("Text", "x960 y130 cffffff", "attack")
card8text := MainGUI.Add("Text", "x960 y160 cffffff", "cooldown")
card9text := MainGUI.Add("Text", "x960 y190 cffffff", "shield")
card10text := MainGUI.Add("Text", "x960 y220 cffffff", "yen")

card1 := MainGUI.Add("DropDownList", "x910 y100 w40 cffffff Choose1", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
card2 := MainGUI.Add("DropDownList", "x910 y130 w40 cffffff Choose2", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
card3 := MainGUI.Add("DropDownList", "x910 y160 w40 cffffff Choose3", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
card4 := MainGUI.Add("DropDownList", "x910 y190 w40 cffffff Choose4", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
card5 := MainGUI.Add("DropDownList", "x910 y220 w40 cffffff Choose5", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
card6 := MainGUI.Add("DropDownList", "x1020 y100 w40 cffffff Choose6", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
card7 := MainGUI.Add("DropDownList", "x1020 y130  w40 cffffff Choose7", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
card8 := MainGUI.Add("DropDownList", "x1020 y160 w40 cffffff Choose8", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
card9 := MainGUI.Add("DropDownList", "x1020 y190 w40 cffffff Choose9", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
card10 := MainGUI.Add("DropDownList", "x1020 y220 w40 cffffff Choose10", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

; Initially hide Card Selector controls
candymultiplier1.Visible := false
card1.Visible := false
card2.Visible := false
card3.Visible := false
card4.Visible := false
card5.Visible := false
card6.Visible := false
card7.Visible := false
card8.Visible := false
card9.Visible := false
card10.Visible := false
card1text.Visible := false
card2text.Visible := false
card3text.Visible := false
card4text.Visible := false
card5text.Visible := false
card6text.Visible := false
card7text.Visible := false
card8text.Visible := false
card9text.Visible := false
card10text.Visible := false

; Inititally hide Unit Priority controls
unitpriority1text.Visible := false
unitpriority2text.Visible := false
unitpriority3text.Visible := false
unitpriority4text.Visible := false
unitpriority5text.Visible := false
unitpriority6text.Visible := false

placementpriority1text.Visible := false
placementpriority2text.Visible := false
placementpriority3text.Visible := false
placementpriority4text.Visible := false
placementpriority5text.Visible := false
placementpriority6text.Visible := false

unitpriority1.Visible := false
unitpriority2.Visible := false
unitpriority3.Visible := false
unitpriority4.Visible := false
unitpriority5.Visible := false
unitpriority6.Visible := false

placementpriority1.Visible := false
placementpriority2.Visible := false
placementpriority3.Visible := false
placementpriority4.Visible := false
placementpriority5.Visible := false
placementpriority6.Visible := false

; Initially show Unit Setup controls
enabled1.Visible := true
enabled2.Visible := true
enabled3.Visible := true
enabled4.Visible := true
enabled5.Visible := true
enabled6.Visible := true
placement1.Visible := true
placement2.Visible := true
placement3.Visible := true
placement4.Visible := true
placement5.Visible := true
placement6.Visible := true
placement1text.Visible := true
placement2text.Visible := true
placement3text.Visible := true
placement4text.Visible := true
placement5text.Visible := true
placement6text.Visible := true

UpdateGroupBox() {
    global userOption
    global enabled1, enabled2, enabled3, enabled4, enabled5, enabled6
    global placement1, placement2, placement3, placement4, placement5, placement6
    global candymultiplier1, card1, card2, card3, card4, card5, card6, card7, card8, card9, card10
    global unitpriority1, unitpriority2, unitpriority3, unitpriority4, unitpriority5, unitpriority6
    global placementpriority1, placementpriority2, placementpriority3, placementpriority4, placementpriority5, placementpriority6

    selectedOption := userOption.Text

    if (selectedOption = "Unit Setup") {
        ; Show Unit Setup controls
        enabled1.Visible := true
        enabled2.Visible := true
        enabled3.Visible := true
        enabled4.Visible := true
        enabled5.Visible := true
        enabled6.Visible := true
        placement1.Visible := true
        placement2.Visible := true
        placement3.Visible := true
        placement4.Visible := true
        placement5.Visible := true
        placement6.Visible := true
        placement1text.Visible := true
        placement2text.Visible := true
        placement3text.Visible := true
        placement4text.Visible := true
        placement5text.Visible := true
        placement6text.Visible := true


        ; Hide Card Selector controls
        candymultiplier1.Visible := false
        card1.Visible := false
        card2.Visible := false
        card3.Visible := false
        card4.Visible := false
        card5.Visible := false
        card6.Visible := false
        card7.Visible := false
        card8.Visible := false
        card9.Visible := false
        card10.Visible := false
        card1text.Visible := false
        card2text.Visible := false
        card3text.Visible := false
        card4text.Visible := false
        card5text.Visible := false
        card6text.Visible := false
        card7text.Visible := false
        card8text.Visible := false
        card9text.Visible := false
        card10text.Visible := false

        ; Hide Unit Priority controls
        unitpriority1text.Visible := false
        unitpriority2text.Visible := false
        unitpriority3text.Visible := false
        unitpriority4text.Visible := false
        unitpriority5text.Visible := false
        unitpriority6text.Visible := false

        placementpriority1text.Visible := false
        placementpriority2text.Visible := false
        placementpriority3text.Visible := false
        placementpriority4text.Visible := false
        placementpriority5text.Visible := false
        placementpriority6text.Visible := false

        unitpriority1.Visible := false
        unitpriority2.Visible := false
        unitpriority3.Visible := false
        unitpriority4.Visible := false
        unitpriority5.Visible := false
        unitpriority6.Visible := false
        unitpriority6.Visible := false

        placementpriority1.Visible := false
        placementpriority2.Visible := false
        placementpriority3.Visible := false
        placementpriority4.Visible := false
        placementpriority5.Visible := false
        placementpriority6.Visible := false

    } else if (selectedOption = "Card Selector") {
        ; Hide Unit Setup controls
        enabled1.Visible := false
        enabled2.Visible := false
        enabled3.Visible := false
        enabled4.Visible := false
        enabled5.Visible := false
        enabled6.Visible := false
        placement1.Visible := false
        placement2.Visible := false
        placement3.Visible := false
        placement4.Visible := false
        placement5.Visible := false
        placement6.Visible := false
        placement1text.Visible := false
        placement2text.Visible := false
        placement3text.Visible := false
        placement4text.Visible := false
        placement5text.Visible := false
        placement6text.Visible := false


        ; Show Card Selector controls
        candymultiplier1.Visible := true
        card1.Visible := true
        card2.Visible := true
        card3.Visible := true
        card4.Visible := true
        card5.Visible := true
        card6.Visible := true
        card7.Visible := true
        card8.Visible := true
        card9.Visible := true
        card10.Visible := true
        card1text.Visible := true
        card2text.Visible := true
        card3text.Visible := true
        card4text.Visible := true
        card5text.Visible := true
        card6text.Visible := true
        card7text.Visible := true
        card8text.Visible := true
        card9text.Visible := true
        card10text.Visible := true

        ; Hide Unit Priority controls
        unitpriority1text.Visible := false
        unitpriority2text.Visible := false
        unitpriority3text.Visible := false
        unitpriority4text.Visible := false
        unitpriority5text.Visible := false
        unitpriority6text.Visible := false

        placementpriority1text.Visible := false
        placementpriority2text.Visible := false
        placementpriority3text.Visible := false
        placementpriority4text.Visible := false
        placementpriority5text.Visible := false
        placementpriority6text.Visible := false

        unitpriority1.Visible := false
        unitpriority2.Visible := false
        unitpriority3.Visible := false
        unitpriority4.Visible := false
        unitpriority5.Visible := false
        unitpriority6.Visible := false
        unitpriority6.Visible := false

        placementpriority1.Visible := false
        placementpriority2.Visible := false
        placementpriority3.Visible := false
        placementpriority4.Visible := false
        placementpriority5.Visible := false
        placementpriority6.Visible := false

    } else if (selectedOption = "Unit Priority") {
        ; Hide Unit Setup controls
        enabled1.Visible := false
        enabled2.Visible := false
        enabled3.Visible := false
        enabled4.Visible := false
        enabled5.Visible := false
        enabled6.Visible := false
        placement1.Visible := false
        placement2.Visible := false
        placement3.Visible := false
        placement4.Visible := false
        placement5.Visible := false
        placement6.Visible := false
        placement1text.Visible := false
        placement2text.Visible := false
        placement3text.Visible := false
        placement4text.Visible := false
        placement5text.Visible := false
        placement6text.Visible := false


        ; Hide Card Selector controls
        candymultiplier1.Visible := false
        card1.Visible := false
        card2.Visible := false
        card3.Visible := false
        card4.Visible := false
        card5.Visible := false
        card6.Visible := false
        card7.Visible := false
        card8.Visible := false
        card9.Visible := false
        card10.Visible := false
        card1text.Visible := false
        card2text.Visible := false
        card3text.Visible := false
        card4text.Visible := false
        card5text.Visible := false
        card6text.Visible := false
        card7text.Visible := false
        card8text.Visible := false
        card9text.Visible := false
        card10text.Visible := false

        ; Show Unit Priority controls
        unitpriority1text.Visible := true
        unitpriority2text.Visible := true
        unitpriority3text.Visible := true
        unitpriority4text.Visible := true
        unitpriority5text.Visible := true
        unitpriority6text.Visible := true

        placementpriority1text.Visible := true
        placementpriority2text.Visible := true
        placementpriority3text.Visible := true
        placementpriority4text.Visible := true
        placementpriority5text.Visible := true
        placementpriority6text.Visible := true

        unitpriority1.Visible := true
        unitpriority2.Visible := true
        unitpriority3.Visible := true
        unitpriority4.Visible := true
        unitpriority5.Visible := true
        unitpriority6.Visible := true
        unitpriority6.Visible := true

        placementpriority1.Visible := true
        placementpriority2.Visible := true
        placementpriority3.Visible := true
        placementpriority4.Visible := true
        placementpriority5.Visible := true
        placementpriority6.Visible := true
    }
}

SaveConfigBttn := MainGUI.Add("Button", "x850 y270 w198 h30 cffffff +Center", "Save Configuration")
SaveConfigBttn.OnEvent("Click", (*) => SaveConfig())




MainGUI.Add("GroupBox", "x830 y320 w238 h210 cfffd90 ", "Activity Log ")
ActivityLog := MainGUI.Add("Text", "x830 y340 w238 h300 r11 cffffff +BackgroundTrans +Center", "Macro Launched")



MainGUI.Add("GroupBox", "x830 y540 w238 h80 cfffd90 ", "Keybinds")
KeyBinds := MainGUI.Add("Text", "x830 y560 w238 h300 r7 cffffff +BackgroundTrans +Center", "F1 - Fix Roblox Position `n F2 - Start Macro `n F3 - Stop Macro")

MainGUI.SetFont("s16 bold", "Segoe UI")

MainGUI.Add("Text", "x12 y632 w800 cWhite +BackgroundTrans", "Winter Event Macro v1.1 - Taxi Macro")

MainGUI.Show("x27 y15 w1100 h665")

AddToLog(text) {
    global lastlog
    SendActivityLogsStatus := FileRead(SendActivityLogsFile, "UTF-8")
    ActivityLog.Value := text "`n" ActivityLog.Value
    if FileExist(SendActivityLogsFile) && (SendActivityLogsStatus = "1") {
        lastlog := text
        WebhookLog()
    } 
}

MinimizeGUI() {
    WinMinimize("Taxi Winter Event Farm")
}

OpenDiscord() {
    Run("https://discord.gg/UB9AaPzqdq")
}

SaveConfig() {
    global enabled1, enabled2, enabled3, enabled4, enabled5, enabled6
    global placement1, placement2, placement3, placement4, placement5, placement6
    global card1, card2, card3, card4, card5, card6, card7, card8, card9, card10

    ; Open file for writing
    File := FileOpen("Lib\Settings\config.txt", "w")
    if !File {
        AddToLog("Failed to save the configuration.")
        return
    }

    ; Write each setting to the file
    File.WriteLine("Enabled1=" enabled1.Value)
    File.WriteLine("Enabled2=" enabled2.Value)
    File.WriteLine("Enabled3=" enabled3.Value)
    File.WriteLine("Enabled4=" enabled4.Value)
    File.WriteLine("Enabled5=" enabled5.Value)
    File.WriteLine("Enabled6=" enabled6.Value)

    File.WriteLine("Placement1=" placement1.Text)
    File.WriteLine("Placement2=" placement2.Text)
    File.WriteLine("Placement3=" placement3.Text)
    File.WriteLine("Placement4=" placement4.Text)
    File.WriteLine("Placement5=" placement5.Text)
    File.WriteLine("Placement6=" placement6.Text)

    File.WriteLine("candymultiplier1=" candymultiplier1.Value)
    File.WriteLine("Card1=" card1.Text)
    File.WriteLine("Card2=" card2.Text)
    File.WriteLine("Card3=" card3.Text)
    File.WriteLine("Card4=" card4.Text)
    File.WriteLine("Card5=" card5.Text)
    File.WriteLine("Card6=" card6.Text)
    File.WriteLine("Card7=" card7.Text)
    File.WriteLine("Card8=" card8.Text)
    File.WriteLine("Card9=" card9.Text)
    File.WriteLine("Card10=" card10.Text)

    File.WriteLine("UnitPriority1=" unitpriority1.Text)
    File.WriteLine("UnitPriority2=" unitpriority2.Text)
    File.WriteLine("UnitPriority3=" unitpriority3.Text)
    File.WriteLine("UnitPriority4=" unitpriority4.Text)
    File.WriteLine("UnitPriority5=" unitpriority5.Text)
    File.WriteLine("UnitPriority6=" unitpriority6.Text)

    File.WriteLine("PlacementPriority1=" placementpriority1.Text)
    File.WriteLine("PlacementPriority2=" placementpriority2.Text)
    File.WriteLine("PlacementPriority3=" placementpriority3.Text)
    File.WriteLine("PlacementPriority4=" placementpriority4.Text)
    File.WriteLine("PlacementPriority5=" placementpriority5.Text)
    File.WriteLine("PlacementPriority6=" placementpriority6.Text)

    File.Close()
    AddToLog("Configuration saved successfully.")
}

LoadConfig() {
    global enabled1, enabled2, enabled3, enabled4, enabled5, enabled6
    global placement1, placement2, placement3, placement4, placement5, placement6
    global candymultiplier1, card1, card2, card3, card4, card5, card6, card7, card8, card9, card10
    global unitpriority1, unitpriority2, unitpriority3, unitpriority4, unitpriority5, unitpriority6
    global placementpriority1, placementpriority2, placementpriority3, placementpriority4, placementpriority5, placementpriority6

    if !FileExist("Lib\Settings\config.txt") {
        AddToLog("No configuration file found. Default settings will be used.")
        return
    }

    ; Open file for reading
    file := FileOpen("Lib\Settings\config.txt", "r", "UTF-8")
    if !file {
        AddToLog("Failed to load the configuration.")
        return
    }

    ; Read settings from the file
    while !file.AtEOF {
        line := file.ReadLine()
        if RegExMatch(line, "Enabled(\d)=(\d+)", &match) {
            slot := match.1
            value := match.2
            enabledgui := "Enabled" slot
            enabledgui := %enabledgui%
            enabledgui.Value := value ; Set checkbox value
        }
        if RegExMatch(line, "Placement(\d)=(\d+)", &match) {
            slot := match.1
            value := match.2
            placementgui := "Placement" slot
            placementgui := %placementgui%
            placementgui.Text := value ; Set dropdown value
        }
        if RegExMatch(line, "Card(\d+)=(\d+)", &match) {
            slot := match.1
            value := match.2
            cardgui := "Card" slot
            cardgui := %cardgui%
            cardgui.Text := value ; Set dropdown value
        }
        if RegExMatch(line, "candymultiplier(\d)=(\d+)", &match) {
            slot := match.1
            value := match.2
            candygui := "candymultiplier" slot
            candygui := %candygui%
            candygui.Value := value ; Set dropdown
        }
        if RegExMatch(line, "UnitPriority(\d+)=(\d+)", &match) {
            slot := match.1
            value := match.2
            unitprioritygui := "UnitPriority" slot
            unitprioritygui := %unitprioritygui%
            unitprioritygui.Text := value ; Set dropdown
        }
        if RegExMatch(line, "PlacementPriority(\d+)=(\d+)", &match) {
            slot := match.1
            value := match.2
            placementprioritygui := "PlacementPriority" Slot
            placementprioritygui := %placementprioritygui%
            placementprioritygui.Text := value ; Set dropdown
        }
        
    }

    file.Close()
    AddToLog("Configuration loaded successfully.")
}

LoadConfig()

