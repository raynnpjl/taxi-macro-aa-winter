#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\imageForCS.ahk
#Include %A_ScriptDir%\Lib\OCR-main\Lib\OCR.ahk

SendMode "Event"
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
UnitExistence:="|<>*91$66.btzzzzzzyDzXlzzzzzzyDzXlzzzzzzyDzXlzzzyzzyDbXlUS0UM3UC1XlUA0UE30A1XlW4EXl34AMXlX0sbXXC80XVX4MbXX6A1U3UA0bk30ARk7UC0bk3UA1sDUz8bw3kC1zzbyszzzzzzzzbw1zzzzzzzzby3zzzzzzzzzzjzzzzzzU"
MaxUpgrade:="|<>*134$53.0000000007U3k00000TUDk00001XUsk000033XVU0000636300800A3M6TzwS0M3UDrjRa0k70S0AS61U40s0EMAD001U0k0Ty41331k1zwA6673k7zsQAAS7UTzkwsMQC0TzVzkk0M0Tz3zVk0kETy7z3k1VkzwTz7kX7nzzzzzzzzzzzzzzzzzzw"
MaxUpgrade2:="|<>*146$47.D07U0001z0Tk000371lU00067z3zzzzw7w7zzzzs7kDzzzzk7UTzSzzUC0w0MwD081k0UkS00301U1w82663U3sMAAC7UDkssMwD0zVvkksQ0z3zVU0k0y7z3U1UUwDy7U33VszyDX6Dbzzzzzzzzzzzzzzzy"
MaxUpgrade3:="|<>*91$49.Dk7s00004M3600006633000031X1U0001UP0nzr3kkD0PzynAM3UD06D3A0U70331a00301U1X20VVUs1lVUklsS1kkssMwD0kMSQAC70AA/u603036413U1UUn20Vs0ksNX0My4NqMTUDnzzlwU"
VoteStart:="|<>*95$38.ryzzzzlz7zlzwDVzwTzXszz7zsSC30Q7770E40klU410C8sklVXUACAM0w7X360T1s1kEbsz0Q40zDsTVUM"
LobbyText:="|<>*134$56.0000000000k00U10000T00y1w000Cs0RkvU003606AAM000lU1X36000AMzMwlswS36zyDwTzjslw7WD4ST6AS0M1k33lX7060A0MMPlkkVX366DwQS8sFkk3z772C4QC1zlkkV327UTw40M0k1wDz1UC0Q0z3zsQ7WD4TkzzzzzzzzwTzzzzzzzy7zzzzzzzzXzzzzzzzzszs"
AreasText:="|<>*108$36.zs007zyzztzzwTzzzzwTzTzzsA4613tA421/k4M0F3k4M4FXXUQ603bmy713zzzzzzU"
MatchmakeUI:="|<>*129$83.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUzzzzzzzzzzzzz0zzzzzzzw7zzzw1zzzzzzzkDzzzs3zzzzzzzUTzzzs7zzzzzzz0zzzzkTzzzzzzy1zzzzzzzzzzzzw3zzzzzzzzzzzzs7zzzzzzzzzzzzkDy0Tw7UsDzzzzUTk0Ds7007zzzz0z00DUA007zzzy1w00D0M007zzzw3k00S0k00Dzzzs7U00Q1U00DzzzkC0S0s3060TzzzUQ1y0k60y0zzzz0s7w1UA1y1zzzy1kDs30M3w3zzzw3UTk60k7s7zy7k70TUA1UDkDzs70C0Q0s30TUTzk00S001k60z0zzU01w007UA1y1zz007w00D0M3w3zz00Dw00y0k7s7zz01zw03y1kDkDzzU7zy0Tw7UzkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
CaptchaExistence:="|<>*100$131.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzzzzzzzs3zzzzzzzzzzzkDzzzzzzz01zzzzzzy7zzzUTzzzzzzs00zzzzzzs7zzz0zzzzzzzU01zzzzzzkDzzy1zzzzzzy003zzzzzzUTzzw3zzzzzzs007zzzzzz0zzzs7zzzzzzk7wTzzzzzy1zyTkDzzzzzz0Tzz0UsEDk0DU7UEDz0Uzy1zzw01U0DU0S0300Dw01zw3zzk0300C00s0600Dk03zsDzz00600C01U0A00T007zkTzw00A00A0200M00Q00DzUzzs30M3US1w1lk70s30Tz0zzkD0kDUw3s7zUT1kD0zy1zzUz1UT1s7kTz0y3Uz1zw1zz1w30y3kDUzy1w31w3zw1zC1s61s7UT0zw3s61s7zs0sA00A00D0y0Es7kA00Dzs00A00M00y0C00kDUQ00Tzs00M00k01y0A01UT0s00zzs00s01U07w0Q030y3s01zzs03s0300zw1w0C1w7s03zzw0TwCC1rzy3y1y7wDwCDzzzzzzzw3zzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzzUTzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzy3zzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Matchmaking:="|<>*93$73.zzzzzzzzzzzzzzlzzzsszzzzk08zzzwATzzzs04Tzzy6Dzzzw03zzzz3zzzzy7zzzzzVzzzzz3zX4DwElW7w8U7lU3s0Mk1w0E1sk0w0AM0Q080wM0A06A06040SAC6736737W7z6D37VX3VXl3zX7VVklXkkkVzlXkk0MlsM0EzslsQ0AMwC08zwMwC06AS7U4TyATDlb6DbxXzzzzzzzzzzzlzzzzzzzzzzs0zzzzzzzzzzw0zzzzzzzzzzy0zzzzzzzzzzzty"
ClaimText:="|<>*127$71.00000000000000A7s01y000007zTs07w00000Tzlk0AQ00003k7VU0MM0000D03300kk0000Q0667zXzsw01k0AAzzzzzy031ysTrjTSyS0C7zky0AA0EQ0QCTVs0MM00Q0ss73U0kk00M1lkC711VVUUk3VnwC73333VU73zsQS666737y3tksQAAAC7zy01Uk0MMMQDzy030k0kkksTzy061U1VVVkzzz0y3kX77XXzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
LoadingScreen:="|<>*98$87.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwTzzzzzzzzzzzzX3zszzzzzszXzzsMTz7zzzzz7wDzz3XzszzzzzszVzzsTzz7zzzzz7wDkz3bwMz3szbszXs1sQS07U73sT7wS07XXU0w0QT7s03UkQQMA7b3Vkz00QD3XX3kzwCCDs03XwQQMz7s1llz7wQTXXX7sw0C4TszXXwQQMz73VsXz7wQD3XX3kswD0TszXk0wQQ0731w7z7wT0DXXU0s0DUzszXw3wQT17UFyDzzzzzzzzzzzzzlzzzzzzzzzzzzzgTw"


F1:: {
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(27, 15, 800, 600, RobloxWindow)
        Sleep 50
    }
    if WinExist("Taxi Winter Event Farm") {
        Sleep 50
        WinActivate("Taxi Winter Event Farm")
        Sleep 100
    }
  
}

F2:: InitializeMacro()

InitializeMacro() {
    global MacroStartTime := A_TickCount

    if WinExist("Taxi Auto-Challenge") {
        WinActivate("Taxi Auto-Challenge")
    }

    if WinExist(RobloxWindow) {
        WinMove(27, 15, 800, 600, RobloxWindow)
        WinActivate(RobloxWindow)
        Sleep 100
    }
    else {
        MsgBox("You must have ROBLOX open in order to start the macro (microsoft roblox doesnt work)", "Error T4", "+0x1000", )
        return
    }

    if (ok:=FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
        GoToRaids()
    }
    else {
        MsgBox("You must be in the lobby with default camera angle to start the macro.", "Error T3", "+0x1000", )
        return
    }
    
}

BetterClick(x, y, LR := "Left") { ; credits to yuh for this, lowk a life saver
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick(LR, -1, 0, , , , "R")
    Sleep(50)
}

GoToRaids() {
    loop {
        ; go to xmas map
        if (ok:=FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
            AddToLog("Found LoadingScreen, stopping loop")
            break
        }
        if (ok:=FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
            AddToLog("Found VoteStart, stopping loop")
            break
        }
        if (ok:=FindText(&X, &Y, 338, 505, 536, 572, 0, 0, ClaimText)) ; daily reward
            {
            BetterClick(406, 497)
            Sleep 3000
        }
        SendInput ("{Tab}")
        BetterClick(89, 302)
        Sleep 2000
        SendInput ("{a up}")  
        ; go to teleporter
        Sleep 100  
        SendInput ("{a down}")
        Sleep 6000
        SendInput ("{a up}")
        KeyWait "a" ; Wait for "w" to be fully processed
        ;sacred planet act 4
        Sleep 1200
        BetterClick(469, 340) ; play
        Sleep 2000
        AntiCaptcha()
    }
    LoadedLoop()
    StartedLoop()
    OnSpawnSetup()
    TryPlacingUnits()

}

F3:: {
    Reload()
}

; Define the rectangle coordinates
global startX := 100, startY := 500, endX := 700, endY := 350
global startY2 := 200, endY2:= 350
global step := 50 ; Step size for grid traversal
global successfulCoordinates := [] ; Array to store successful placements
global successThreshold := 3 ; Number of successful placements needed

PlaceUnit(x, y, slot := 1) {
    SendInput(slot)
    Sleep 50
    BetterClick(x, y)
    Sleep 50
    SendInput("q")
    
    ; Check if placement is successful
    if IsPlacementSuccessful() {
        Sleep 15
        return true
    }
    return false
}

IsPlacementSuccessful() {
    
    Sleep 1000
    if (ok:=FindText(&X, &Y, 78, 182, 400, 451, 0, 0, UnitExistence)) {
        AddToLog("placed unit successfully")
        BetterClick(329, 184) ; close upg menu
        return true
    }
    return false
}

TryPlacingUnits() {
    global startX, startY, startY2, endX, endY, endY2, step, successfulCoordinates
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    tempPlacementPriorityArray := [] ; No need for global, only using locally
    placementPriorityArray := [] ; No need for global, only using locally

    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    y2 := startY2 ; Initialize y2 only once

    ;Sort by placement_priority
    SortByPlacementPriority(a) {
        loop {
            swapped := 0
            loop a.Length - 1
                if (a[A_Index].placement_priority > a[A_Index + 1].placement_priority) {
                    a.InsertAt(A_Index, a[A_Index + 1])
                    a.RemoveAt(A_Index + 2)
                    swapped := 1
                }
        } until !swapped
    }


    ; Iterate through all slots (1 to 6) for placement priority
    for slotNum in [1, 2, 3, 4, 5, 6] {
        placementpriority := "PlacementPriority" slotNum
        placementpriority := %placementpriority%
        placementpriority := placementpriority.Text
        tempPlacementPriorityArray.push( {unit: slotNum, placement_priority: placementpriority} )
    }

    SortByPlacementPriority(tempPlacementPriorityArray)

    for ele in tempPlacementPriorityArray {
        placementPriorityArray.push(ele.unit)
    }

    alternatingPlacement := 0

    ; Iterate through all slots (1 to 6)
    for slotNum in placementPriorityArray {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text
        unitpriority := "UnitPriority" slotNum
        unitpriority:= %unitpriority%
        unitpriority := unitpriority.Text
        
        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }
        
        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")
        
        placementCount := 0

        ; Continue placement for the current slot
        while (placementCount < placements && y >= endY && y2 <= endY2) { ; Rows
            while (placementCount < placements && x <= endX) { ; Columns
                if (ok:=FindText(&cardX, &cardY, 325, 205, 630, 270, 0, 0, pick_card)) {
                    cardSelector()
                }
                if (alternatingPlacement = 0) {
                    if PlaceUnit(x, y2, slotNum) {
                    placementCount++
                    successfulCoordinates.Push({ unit_priority: unitpriority, x: x, y: y2 }) ; Track successful placements
                    }
                }
                if (alternatingPlacement = 1) {
                    if PlaceUnit(x, y, slotNum) {
                    placementCount++
                    successfulCoordinates.Push({ unit_priority: unitpriority, x: x, y: y }) ; Track successful placements
                    }
                }
                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby  condition.")
                    return LobbyLoop()
                }
                Reconnect()
                x += step - 20 ; Move to the next column
            }
            if x > endX {
                x := startX ; Reset x for the next row
                if (alternatingPlacement = 0) {
                    y2 += (step + 25) ; Move to the next row, upwards
                    alternatingPlacement += 1
                }

                else {
                    y -= (step + 25) ; Move to the next row, downwards
                    alternatingPlacement -= 1
                }
            }
            Reconnect()
        }
        
        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        Reconnect()
    }
    
    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

UpgradeUnits() {
    global successfulCoordinates

    ;Sort by unit_priority
    SortByUnitPriority(a) {
        loop {
            swapped := 0
            loop a.Length - 1
                if (a[A_Index].unit_priority > a[A_Index + 1].unit_priority) {
                    a.InsertAt(A_Index, a[A_Index + 1])
                    a.RemoveAt(A_Index + 2)
                    swapped := 1
                }
        } until !swapped
    }

    SortByUnitPriority(successfulCoordinates)

    AddToLog("Beginning unit upgrades.")

    while true { ; Infinite loop to ensure continuous checking
        for index, coord in successfulCoordinates {
            if (ok:=FindText(&cardX, &cardY, 325, 205, 630, 270, 0, 0, pick_card)) {
                cardSelector()
            }

            if (coord.unit_priority = 0) {
                loop {
                    if (ok:=FindText(&cardX, &cardY, 325, 205, 630, 270, 0, 0, pick_card)) {
                        cardSelector()
                    }
                    
                    UpgradeUnit(coord.x, coord.y)

                    if ShouldStopUpgrading() {
                        AddToLog("Found return to lobby, going back.")
                        successfulCoordinates := []
                        return LobbyLoop()
                    }

                    if IsMaxUpgrade() {
                        AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y)
                        successfulCoordinates.RemoveAt(index) ; Remove the coordinate
                        BetterClick(326, 180)
                        break ; end loop
                    }

                    sleep(200)

                    BetterClick(348, 391) ; next
                    BetterClick(565, 563) ; move mouse
                }
                continue ; Skip to the next coordinate
            }

            UpgradeUnit(coord.x, coord.y)

            if ShouldStopUpgrading() {
                AddToLog("Found return to lobby, going back.")
                successfulCoordinates := []
                return LobbyLoop()
            }

            if IsMaxUpgrade() {
                AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y)
                successfulCoordinates.RemoveAt(index) ; Remove the coordinate
                continue ; Skip to the next coordinate
            }

            Sleep(200)

            BetterClick(348, 391) ; next
            BetterClick(565, 563) ; move mouse
        }

        ;After unit all maxed, continue checking for select card
        if (ok:=FindText(&cardX, &cardY, 325, 205, 630, 270, 0, 0, pick_card)) {
            cardSelector()
        }

        ; If all units are maxed, still check for stopping condition
        if successfulCoordinates.Length = 0 {
            BetterClick(348, 391) ; next
            if ShouldStopUpgrading() {
                AddToLog("Stopping due to finding lobby  condition.")
                return LobbyLoop()
            }
            Sleep(2000) ; Prevent excessive looping
        }

        Reconnect()
    }
}


UpgradeUnit(x, y) {
    BetterClick(x, y - 3)
    BetterClick(264, 363) ; upgrade
    BetterClick(264, 363) ; upgrade
    BetterClick(264, 363) ; upgrade
}

IsMaxUpgrade() {
    Sleep 500
    if (ok:=FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade) or (ok:=FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade2)) or (ok:=FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade3)))
        {
        return true
        }
}

ShouldStopUpgrading(sleepamount := 300) {
    Sleep sleepamount
    if CheckForLobbyButton() {
        BetterClick(376, 117)
        InitiateWebhook()
        return true
    }
}

FindAndClickColor(targetColor := 0x006783, searchArea := [0, 0, A_ScreenWidth, A_ScreenHeight]) {
    ; Extract the search area boundaries
    x1 := searchArea[1], y1 := searchArea[2], x2 := searchArea[3], y2 := searchArea[4]

    ; Perform the pixel search
    if (PixelSearch(&foundX, &foundY, x1, y1, x2, y2, targetColor, 0)) {
        ; Color found, click on the detected coordinates
        BetterClick(foundX, foundY, "Right")
        AddToLog("Color found and clicked at: X" foundX " Y" foundY)
        return true
            
    } else {
    }
}


F4:: {
    InitiateWebhook()
}

LookDown() {
    MouseMove(400, 300)
    loop 20 {
        SendInput("{WheelUp}")
        Sleep 50
    }
    Sleep 200
    MouseGetPos(&x, &y)
    MouseMove(400, 300)
    SendInput(Format("{Click {} {} Left}", x, y + 150))

    loop 20 {
        SendInput("{WheelDown}")
        Sleep 50
    }
}

LoadedLoop() {
    AddToLog("Waiting to load in")
    loop {
        Sleep 1000
        if (ok:=FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
            {
                AddToLog("Loaded in")
              Sleep 1000
              BetterClick(350, 103) ; click yes
              BetterClick(350, 100) ; click yes
              BetterClick(350, 97) ; click yes
              break
            }
            Reconnect()
    }
}

StartedLoop() {
    loop {
        Sleep 1000
        if (ok:=FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
            {
                continue
            }
            AddToLog("Game started")
        break
    }
}

LobbyLoop() {
    loop {
        Sleep 1000
        if (ok:=FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText))
            {
              break
            }
            Reconnect()
    }
    AddToLog("Returned to lobby, going back to raids")
    return GoToRaids()
}

CheckForLobbyButton() {
    if (ok:=FindText(&X, &Y, 273, 103, 482, 214, 0, 0, LobbyText))
        {
          return true
        }
}

CloseChat() {
    SendInput("/")
    Sleep 250
    SendInput("{Enter}")
    Sleep 250
    x := 138, y := 32
    BetterClick(x, y)
}

TPtoSpawn() {
    BetterClick(27, 574) ; setings
    Sleep 1000
    BetterClick(400, 287)
    Sleep 600
    loop 4 {
        Sleep 150
        SendInput("{WheelDown 1}") ; scroll
    }
    Sleep 600
    BetterClick(523, 271) ; tp to spawn
    Sleep 600
    BetterClick(582, 150) ; exit settings

}

Positioning() {
    SendInput ("{w up}")  
    ; go to spot
    Sleep 100  
    SendInput ("{w down}")

    Sleep 1800
    SendInput ("{w up}")

    SendInput ("{a up}")  
    ; go to spot
    Sleep 100  
    SendInput ("{a down}")

    Sleep 200
    SendInput ("{a up}")
    AddToLog("Positioned")
}

AntiCaptcha() {

    ; Perform OCR on the defined region directly
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309)

    ; Display OCR results
    if ocrResult {
        BetterClick(414, 342)
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
            sleep 100
            BetterClick(585, 190)
            sleep 50
            BetterClick(585, 190)
            return
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        for char in StrSplit(captcha) {
            Send(char)
            Sleep(Random(350, 950))  ; Optional delay between each keypress
        }
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }

    BetterClick(309, 386) ; select
    Sleep 1500
    BetterClick(383, 221)
    Sleep 500

    sleep 6000
     if (ok:=FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
        return
    }
    if (ok:=FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
        return
    }

    AddToLog("Walking to ensure the UI pops up again if it didnt matchmake")
    loop 3 {
        SendInput ("{d up}")  
        ; go to teleporter
        Sleep 100  
        SendInput ("{d down}")
        Sleep 200
        SendInput ("{d up}")
        KeyWait "d" ; Wait for "d" to be fully processed
        Sleep 100
        SendInput ("{a up}")  
        ; go to teleporter
        Sleep 100  
        SendInput ("{a down}")
        Sleep 300
        SendInput ("{a up}")
        KeyWait "a" ; Wait for "a" to be fully processed
        }
        Sleep 1500
    if (ok:=FindText(&X, &Y, 221, 206, 403, 355, 0, 0, MatchmakeUI))
        {
            AddToLog("Retrying in 30 seconds as captcha failed")
            Sleep 20000
        }
    return
}

TapToMove(toggle) {
 
    SendInput("{Esc}")
    Sleep 1000
    BetterClick(246, 91)
    Sleep 500
    SendInput("{Down}")
    Sleep 100
    SendInput("{Down}")
    Sleep 500
    if (toggle) {
        SendInput("{Right}")
        Sleep 400
        SendInput("{Right}")
    }
    else {
        SendInput("{Left}")
        Sleep 400
        SendInput("{Left}")
    }
    Sleep 500
    SendInput("{Esc}")
    Sleep 1000
}

OnSpawnSetup() {
    SendInput ("{Tab}")
    LookDown()
    Sleep 200
    TPtoSpawn()
    Sleep 200
    TapToMove(true)
    Sleep 200
    AddToLog("Attempting to move to spot")
    loop 40 {
        Sleep 200
        
        if FindAndClickColor() {
            break
        }
    }
    Sleep 4000
    TapToMove(false)
}

;Added by @raynnpjl
cardSelector() {
    ;Sort by card_priority
    SortByCardPriority(a) {
        loop {
            swapped := 0
            loop a.Length - 1
                if (a[A_Index].card_priority > a[A_Index + 1].card_priority) {
                    a.InsertAt(A_Index, a[A_Index + 1])
                    a.RemoveAt(A_Index + 2)
                    swapped := 1
                }
        } until !swapped
    }

    ; Iterate through all slots (1 to 6)
    newCardOrder:= []
    arrayOfCardObj := []
    for cardNum in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] {
        card := "Card" cardNum
        card := %card%
        card := card.Text
        
        newCardOrder.Push(card)
    }

    new_path_card := {card_name: "new_path", card_pic: new_path, card_priority: newCardOrder[1]}
    health_card := {card_name: "enemy health", card_pic: health, card_priority: newCardOrder[2]}
    regen_card := {card_name: "enemy regen", card_pic: regen, card_priority: newCardOrder[3]}
    speed_card := {card_name: "speed buff", card_pic: shield, card_priority: newCardOrder[4]}
    explosive_death_card := {card_name: "explosive death", card_pic: explosive_death, card_priority: newCardOrder[5]}
    range_card := {card_name: "range buff", card_pic: range, card_priority: newCardOrder[6]}
    attack_card := {card_name: "attack buff", card_pic: attack, card_priority: newCardOrder[7]}
    cooldown_card := {card_name: "cooldown buff", card_pic: cooldown, card_priority: newCardOrder[8]}
    shield_card := {card_name: "enemy shield", card_pic: shield, card_priority: newCardOrder[9]}
    yen_card := {card_name: "extra yen", card_pic: yen, card_priority: newCardOrder[10]}

    arrayOfCardObj.push(new_path_card)
    arrayOfCardObj.push(health_card)
    arrayOfCardObj.push(regen_card)
    arrayOfCardObj.push(speed_card)
    arrayOfCardObj.push(explosive_death_card)
    arrayOfCardObj.push(range_card)
    arrayOfCardObj.push(attack_card)
    arrayOfCardObj.push(cooldown_card)
    arrayOfCardObj.push(shield_card)
    arrayOfCardObj.push(yen_card)
    SortByCardPriority(arrayOfCardObj) ;Sort in ascending order

    candymultiplier := "candymultiplier" 1
    candymultiplier := %candymultiplier%
    candymultiplier := candymultiplier.Value

    AddToLog("Picking card")

    if (ok:=FindText(&X, &Y, 78, 182, 400, 451, 0, 0, UnitExistence)) {
        BetterClick(329, 184) ; close upg menu
        sleep 100
    }
    Click "256 242 0" ; Card Select 1
    sleep 100
    Click "403 242 0" ; Card Select 2
    sleep 100
    Click "547 242 0" ; Card Select 3
    sleep 100
    BetterClick(59, 572) ; Untarget Mouse
    sleep 500

    if (candymultiplier = 1) {
        AddToLog("Detected prioritise candy multiplier enabled")
        if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, new_path)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, candy150)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 35, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, candy70)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 45, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, candy30)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 45, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[1].card_pic)) {
            AddToLog("No candy multiplier found")
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[2].card_pic)) {
            AddToLog("No candy multiplier found")
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[3].card_pic)) {
            AddToLog("No candy multiplier found")
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[4].card_pic)) {
            AddToLog("No candy multiplier found")
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[5].card_pic)) {
            AddToLog("No candy multiplier found")
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[6].card_pic)) {
            AddToLog("No candy multiplier found")
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[7].card_pic)) {
            AddToLog("No candy multiplier found")
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[8].card_pic)) {
            AddToLog("No candy multiplier found")
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[9].card_pic)) {
            AddToLog("No candy multiplier found")
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600 0, 0, arrayOfCardObj[10].card_pic)) {
            AddToLog("No candy multiplier found")
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else {
            AddToLog("Failed to pick a card")
        }
    }

    else if !(candymultiplier = 1) {
        AddToLog("Detected prioritise candy multiplier disabled")
        if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[1].card_pic)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[2].card_pic)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[3].card_pic)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[4].card_pic)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[5].card_pic)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[6].card_pic)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[7].card_pic)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[8].card_pic)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600, 0, 0, arrayOfCardObj[9].card_pic)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else if (ok:=FindText(&cardX, &cardY, 1, 1, 800, 600 0, 0, arrayOfCardObj[10].card_pic)) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog("Succesfully picked card")
            sleep 5000
        }
        else {
            AddToLog("Failed to pick a card")
        }
    }
    else {
        AddToLog("Failed to pick a card")
    }
}

Reconnect() {   
    ; Check for Disconnected Screen
    color := PixelGetColor(519, 329) ; Get color at (519, 329)
    if (color = 0x393B3D) {
        AddToLog("Disconnected! Attempting to reconnect...")

        ; Use Roblox deep linking to reconnect
        Run("roblox://placeID=" 8304191830)
        Sleep 2000
        if WinExist(RobloxWindow) {
            WinMove(27, 15, 800, 600, RobloxWindow)
            WinActivate(RobloxWindow)
            Sleep 1000
        }
                    loop {
                        AddToLog("Reconnecting to Roblox...")
                        Sleep 15000
                        if (ok:=FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
                            AddToLog("Reconnected Succesfully!")
                            return GoToRaids() ; Check for challenges in the lobby
                        }
                        else {
                            Reconnect()
                        }
                    }
    }
}
