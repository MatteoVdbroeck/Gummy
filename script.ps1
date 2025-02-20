# Maak een onzichtbaar venster
$Win32Hide = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
Add-Type -Name Win32Utils -Namespace Win32Functions -MemberDefinition $Win32Hide
$Win32Functions::ShowWindow((Get-Process -Id $PID).MainWindowHandle, 0)

# Zet het volume op maximum
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Audio {
    [DllImport("user32.dll")]
    public static extern void keybd_event(byte bVk, byte bScan, int dwFlags, int dwExtraInfo);

    public static void VolumeUp() {
        for (int i = 0; i < 50; i++) {
            keybd_event(0xAF, 0, 1, 0); // 0xAF is de Volume Up toets
            System.Threading.Thread.Sleep(50);
        }
    }
}
"@ -Language CSharp

[Audio]::VolumeUp()

# Oneindige loop voor de prank
while ($true) {
    Start-Sleep -Seconds 10  # Wacht 10 minuten

    # Open Microsoft Edge en speel YouTube-link af
    Start-Process 'msedge' -ArgumentList 'https://youtu.be/astISOttCQ0?si=q88g6EFfcYVpakwJ&t=45'

    Start-Sleep -Seconds 6  # Wacht 6 seconden

    # Sluit Edge
    Stop-Process -Name 'msedge' -ErrorAction SilentlyContinue

    Start-Sleep -Seconds 10  # Wacht 4 minuten
}
