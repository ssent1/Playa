property lastActiveApp : ""

on send_command(player, command)
    run script "tell application \"" & player & "\" to " & command
    set lastActiveApp to player
end send_command

on alfred_script(q)
    set tinyplayerState to ""
    if application "Tiny Player" is running then
        tell application "Tiny Player" to set tinyplayerState to (player state as text)
    end if
    set itunesState to ""
    if application "iTunes" is running then
        tell application "iTunes" to set itunesState to (player state as text)
    end if
    set spotifyState to ""
    if application "Spotify" is running then
        tell application "Spotify" to set spotifyState to (player state as text)
    end if
    tell application "System Events"
        set frontmostApp to item 1 of (get name of processes whose frontmost is true)
    end tell
    
    if tinyplayerState is equal to "playing" then
        send_command("Tiny Player", q)
    else if itunesState is equal to "playing" then
    if itunesState is equal to "playing" then
        send_command("iTunes", q)
    else if spotifyState is equal to "playing" then
        send_command("Spotify", q)
    else if frontmostApp is equal to "Tiny Player" or frontmostApp is equal to "iTunes" or frontmostApp is equal to "Spotify" then
        send_command(frontmostApp, q)
    else if lastActiveApp is equal to "Tiny Player" then
        send_command("Tiny Player", q)
    else if lastActiveApp is equal to "iTunes" then
        send_command("iTunes", q)
    else if lastActiveApp is equal to "Spotify" then
        send_command("Spotify", q)
    end if
    
    if (lastActiveApp is not equal to "" and q is equal to "playpause" or "play" or "pause") then
        set currentState to (run script "tell application \"" & lastActiveApp & "\" to return (player state as text)")
        if currentState is equal to "playing" then
            set currentState to "▶"
        else
            set currentState to "❚❚"
        end if
        return currentState & "  " & lastActiveApp
    end if
    
end alfred_script