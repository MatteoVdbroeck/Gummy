# Zet het volume op maximum
$shell = New-Object -ComObject WScript.Shell
for ($i=1; $i -le 50; $i++) {
    $shell.SendKeys([char]175)  # Volume omhoog
    Start-Sleep -Milliseconds 50
}

# Functie om Microsoft Edge te openen en video af te spelen
function Play-YouTube {
    Write-Host "[INFO] Opening Microsoft Edge..."
    Start-Process 'msedge' -ArgumentList 'https://youtu.be/astISOttCQ0?si=TX334-dMI0UU1nPm'
    Start-Sleep -Seconds 6  # Wacht 6 seconden zodat de video begint
    Write-Host "[INFO] Closing Microsoft Edge..."
    Stop-Process -Name 'msedge' -ErrorAction SilentlyContinue
}

# Eerste uitvoering
Write-Host "[INFO] Volume set to maximum."
Write-Host "[INFO] Waiting 10 minutes before starting prank..."
Start-Sleep -Seconds 10  # Wacht 10 minuten
Play-YouTube

# Oneindige prank loop
while ($true) {
    Write-Host "[INFO] Waiting 4 minutes before repeating..."
    Start-Sleep -Seconds 1
    0  # Wacht 4 minuten
    Play-YouTube
}
