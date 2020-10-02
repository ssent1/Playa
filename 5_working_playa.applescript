-- working as at 20200420-002649 -------------------------------------------------



tell application "System Events"
    tell process "Tiny Player"
        name of every menu of menu bar 1
    end tell
end tell

Result {"Apple", "Tiny Player", "File", "Playback", "Window", "Help"}

set tinyplayerState to ""
if application "Tiny Player" is running then
    tell application "Tiny Player" to set tinyplayerState to "playing"
    else
    tell application "Tiny Player" to set tinyplayerState to "not_playing"
end if

-- NOT WORKING ----------------------------------------------

tell application "System Events"
    tell process "Tiny Player"
        set frontmost to true
        click menu item "Play" of menu "Playback" of menu bar 1
    end tell
end tell

-- not working
set tinyplayerState to ""
if application "Tiny Player" is running then
    tell application "Tiny Player" to set tinyplayerState to "playing"
else
    set tinyplayerState to "not_playing"
end if




if menu item "Play" is running then
    tell application "System Events"
        tell process "Tiny Player"
            set frontmost to true
            click menu item "Pause" of menu "Playback" of menu bar 1
        end tell
    end tell
else
    tell application "System Events"
        tell process "Tiny Player"
            set frontmost to true
            click menu item "Play" of menu "Playback" of menu bar 1
        end tell
    end tell
end if

-- [Mac Automation Scripting Guide: Automating the User Interface](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/AutomatetheUserInterface.html)
