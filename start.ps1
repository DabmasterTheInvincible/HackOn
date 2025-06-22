# Check if Ollama is running
$ollamaRunning = Get-Process -Name "ollama" -ErrorAction SilentlyContinue
if (-not $ollamaRunning) {
    Start-Process "ollama" -ArgumentList "serve" -WindowStyle Hidden
    Start-Sleep -Seconds 5
}

# Pull the model (if not already present)
Start-Process "ollama" -ArgumentList "pull gemma:2b" -Wait

# Install Python dependencies
pip install -r requirements.txt

# Run your app
Start-Process "python" -ArgumentList "app.py" -WindowStyle Hidden
