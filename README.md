# Utilities

A collection of utilities that used to be scattered across 10+ repos for no reason. Now it's all-in-one.

---

## Useful Links

| What | Link |
|------|------|
| Copilot quota check | <https://github.com/settings/copilot/features> |
| Get Shit Done (GSD) | <https://github.com/gsd-build/get-shit-done> |
| Claude orchestrated template | <https://github.com/josipjelic/orchestrated-project-template> |
| LiveBench (AI benchmarks) | <https://livebench.ai/#/> |

---

## PATH Injector

AHK v2 utility to manage and inject paths into the user `PATH` environment variable.

- [Pathfix.ahk](path%20fix/Pathfix.ahk)
IF IT doesnt work you can use the goatedass powershell script

```powershell
$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")

[Environment]::SetEnvironmentVariable("Path", "$oldPath;C:\Users\wikiepeidia\.local\bin", "User")
```

---

## VSCode Tools

**Build Tools launcher** — Batch file that boots VSCode with MSVC Build Tools path pre-configured.

- [VSCODECVSWHERE.bat](VSCODE-TOOLS-main/VSCODECVSWHERE.bat)

**Clang tasks.json** — VSCode task config for Clang compilation.

- [tasks.json](VSCODE-TOOLS-main/task%20json%20for%20clang/tasks.json)

**Git ignore sync** — VSCode task that removes cached files matching `.gitignore` (like JetBrains does automatically).

- [tasks.json](VSCODE-TOOLS-main/task%20for%20git%20ignore/tasks.json)

```bash
git ls-files -i -c --exclude-standard | xargs -r git rm -r --cached
```

---

## Task Scheduler Toggler

Toggle a scheduled task called `SHUTDOWN` on/off.

- [SHUTDOWN.bat](tasksched-toggler-main/SHUtDOWN.bat)

---

## Fastfetch Prebuilts

Pre-compiled fastfetch builds.

- <https://github.com/wikiepeidia/fastfetch-precomplied-builds>

---

## Windows Sound Changer

Registry file to swap Windows system sounds.

- [README](WINSOUND/README.md)
- [winsound.reg](WINSOUND/winsound.reg)
- [Regex reference screenshot](WINSOUND/media/screenshot_1706513970.png)

---

## PowerShell Scripts

> Run this first to allow script execution:
>
> ```powershell
> Set-ExecutionPolicy -ExecutionPolicy Bypass
> ```

### File Shuffler

Randomly shuffle all files in a folder by extension.

- [roblox.font.suffle.ps1](powershell%20stuffs/roblox.font.suffle.ps1)

```powershell
.\roblox.font.suffle.ps1 "C:\path\to\folder" "*.ttf"
```

### Temp File Cleaner

Delete common temp files.

- [clean.trash.ps1](powershell%20stuffs/clean.trash.ps1)

### Clipboard Clearer

Clear the clipboard.

- [clipboardclearer.bat](powershell%20stuffs/clipboardclearer.bat)

### Duplicate File Deleter

Hash-based duplicate file detection and deletion.

- [duplicate file deleter.ps1](powershell%20stuffs/duplicate%20file%20deleter.ps1)

```powershell
& '.\duplicate file deleter.ps1' "C:\path\to\folder"
```

---

## Roblox Utilities

Lua script to mass-destroy audio assets by ID.

- [audio destroyer.lua](ROBLOX/audio%20destroyer.lua)
