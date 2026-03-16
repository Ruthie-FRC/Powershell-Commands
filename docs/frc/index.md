# FRC PowerShell Automation

PowerShell is a powerful automation shell that FRC (FIRST Robotics Competition) teams can use to streamline everyday development and competition-day tasks on Windows machines.

<div class="grid cards" markdown>

-   :material-robot:{ .lg .middle } **WPILib & GradleRIO**

    ---

    Build your robot code, run toolchain install tasks, and manage GradleRIO versions from the terminal.

    [:octicons-arrow-right-24: WPILib dev tasks](wpilib-dev.md)

-   :material-lan-connect:{ .lg .middle } **roboRIO Utilities**

    ---

    SSH into your roboRIO, transfer files with SCP, collect logs, and deploy or clean up artifacts.

    [:octicons-arrow-right-24: roboRIO utilities](roborio.md)

-   :material-wifi:{ .lg .middle } **Network Checks**

    ---

    Ping the robot, resolve mDNS names, verify firewall rules, and diagnose connection problems.

    [:octicons-arrow-right-24: Networking](networking.md)

-   :material-wrench:{ .lg .middle } **Troubleshooting**

    ---

    Fix `JAVA_HOME` issues, clear Gradle caches, reinstall toolchains, and more.

    [:octicons-arrow-right-24: Troubleshooting](troubleshooting.md)

</div>

---

## Why PowerShell for FRC?

Most FRC teams use Windows for their development machines, and PowerShell 7 ships built-in. Using PowerShell for FRC automation gives you:

- **One language for everything** — the same shell that manages Windows services, users, and the registry can also SSH into your roboRIO, invoke Gradle builds, and parse JSON telemetry logs.
- **Scripted competition-day prep** — verify network settings, ping the robot, and pre-check driver station configuration in a single script.
- **Reusable functions** — wrap complex `ssh`/`scp` one-liners into clearly-named functions that any team member can run safely.

---

## Quick-Start: Connect to Your Robot

```powershell
# Test whether the roboRIO is reachable (replace 9999 with your team number)
Test-Connection roboRIO-9999-FRC.local -Count 1 -Quiet

# Open an interactive SSH session
ssh admin@roboRIO-9999-FRC.local

# Or use the fixed IP (10.TE.AM.2 format)
ssh admin@10.99.99.2
```

---

## Reusable FRC Module

All of the helpers documented in this section are packaged together in the `FrcTools` PowerShell module, located at [`scripts/frc/FrcTools.psm1`](https://github.com/Ruthie-FRC/Powershell-Commands/blob/main/scripts/frc/FrcTools.psm1) in this repository.

### Install the module

```powershell
# From the repo root — import for the current session
Import-Module .\scripts\frc\FrcTools.psm1

# Optionally copy to your PowerShell module path for permanent availability
$dest = "$HOME\Documents\PowerShell\Modules\FrcTools"
New-Item -ItemType Directory -Path $dest -Force | Out-Null
Copy-Item .\scripts\frc\FrcTools.ps* $dest
Import-Module FrcTools
```

### List available commands

```powershell
Get-Command -Module FrcTools
```

---

!!! tip "Team number format"
    Throughout these docs, **`####`** stands for your four-digit FRC team number. Replace it with your actual number wherever you see it — for example, team 9999 uses `roboRIO-9999-FRC.local` and IP `10.99.99.2`.
