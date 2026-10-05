#NoEnv
#Persistent
#SingleInstance Force

CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

SlowDownloadImage := "D:\WabbajackAuto\download-button.png"
StandardDownloadImage := "D:\WabbajackAuto\standard-download.png"

HomeX := 50
HomeY := A_ScreenHeight - 50

Loop
{
    ; ==========================================================
    ; FIRST: Check for "Standard download" popup
    ; ==========================================================

    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %StandardDownloadImage%

    if (ErrorLevel = 0)
    {
        ; Click center of Standard Download button
        ClickX := FoundX + 85
        ClickY := FoundY + 18

        MouseMove, ClickX, ClickY, 5
        Sleep, 100
        Click

        ; Give Nexus time to start the download
        Sleep, 1000

        GoHome()
        continue
    }


    ; ==========================================================
    ; SECOND: Check for normal "Slow download" button
    ; ==========================================================

    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %SlowDownloadImage%

    if (ErrorLevel = 0)
    {
        ; Your Slow Download image is 299x36
        ClickX := FoundX + 149
        ClickY := FoundY + 18

        MouseMove, ClickX, ClickY, 5
        Sleep, 100
        Click

        Sleep, 500

        GoHome()
    }
    else
    {
        Sleep, 300
    }
}

return


GoHome()
{
    global HomeX, HomeY
    MouseMove, HomeX, HomeY, 10
}


F8::ExitApp
