#Requires AutoHotkey v2.0

; --- State ---
PathValues := [""]  ; Start with one empty path

; --- Build and show GUI ---
BuildGui()

BuildGui() {
    global app, PathValues

    ; Destroy old GUI if it exists
    try app.Destroy()

    app := Gui("AlwaysOnTop", "PATH Variable Injector")
    app.SetFont("s10", "Segoe UI")
    app.MarginX := 15
    app.MarginY := 10

    app.Add("Text", "w360 section", "Paths to add:")

    ; Create a row for each path value
    for i, val in PathValues {
        editOpts := "w300 h25 xs y+5 section"
        ed := app.Add("Edit", editOpts, val)
        ed.Name := "Path" . i

        ; + button on the last row, - button on non-first rows
        if (i = PathValues.Length) {
            addBtn := app.Add("Button", "w25 h25 ys x+5", "+")
            addBtn.OnEvent("Click", AddRow)
        }
        if (PathValues.Length > 1) {
            removeBtn := app.Add("Button", "w25 h25 ys x+2", Chr(0x2212))  ; minus sign
            idx := i
            removeBtn.OnEvent("Click", RemoveRow.Bind(idx))
        }
    }

    ; Inject button
    app.Add("Button", "w360 h40 xs y+15", "Inject into User PATH").OnEvent("Click", ExecutePathAddition)

    app.Show()
}

; --- Save current edit values back to PathValues ---
SaveValues() {
    global app, PathValues
    for i, val in PathValues {
        try {
            ctrl := app["Path" . i]
            PathValues[i] := ctrl.Value
        }
    }
}

; --- Add a new row ---
AddRow(*) {
    SaveValues()
    PathValues.Push("")
    BuildGui()
}

; --- Remove a row ---
RemoveRow(idx, *) {
    global PathValues
    SaveValues()
    PathValues.RemoveAt(idx)
    if (PathValues.Length = 0)
        PathValues.Push("")
    BuildGui()
}

; --- Inject into PATH ---
ExecutePathAddition(*) {
    global app, PathValues
    SaveValues()

    try {
        currentPath := RegRead("HKEY_CURRENT_USER\Environment", "Path")
    } catch {
        currentPath := ""
    }

    newPath := currentPath
    addedCount := 0

    for i, val in PathValues {
        cleanPath := Trim(val)
        if (cleanPath = "")
            continue

        if !InStr(";" . newPath . ";", ";" . cleanPath . ";") {
            if (newPath != "" && SubStr(newPath, -1) != ";")
                newPath .= ";"
            newPath .= cleanPath
            addedCount++
        }
    }

    if (addedCount == 0) {
        MsgBox("No new paths to add. They might already be in your PATH, or the boxes were empty.", "Hold up", "Iconi")
        return
    }

    RegWrite(newPath, "REG_EXPAND_SZ", "HKEY_CURRENT_USER\Environment", "Path")
    SendMessage(0x1A, 0, StrPtr("Environment"), , "ahk_id 0xFFFF")

    verifyPath := RegRead("HKEY_CURRENT_USER\Environment", "Path")
    if (verifyPath == newPath) {
        MsgBox("Path is imported! Successfully injected " . addedCount . " new folder(s). W.", "Success", "Iconi")
        app.Destroy()
    } else {
        MsgBox("Something went wrong writing to the registry. L.", "Error", "IconX")
    }
}
