# 获取脚本所在目录
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path

# 循环直到当前时间到达22:00
while ($true) {
    # 获取当前时间
    $currentTime = Get-Date
    Write-Host "工作中"
    # 检查是否到达22:00
if (($currentTime.Hour -gt 21 -or ($currentTime.Hour -eq 21 -and $currentTime.Minute -ge 30)) -and ($currentTime.Hour -lt 23 -or ($currentTime.Hour -eq 23 -and $currentTime.Minute -le 30))) {
        # 构建app.exe的完整路径
        $appPath = Join-Path -Path $scriptDirectory -ChildPath "myapp4.exe"
        
        # 如果app.exe存在，则运行它
        if (Test-Path $appPath) {
            Start-Process -FilePath $appPath
            break # 运行后退出循环，停止脚本
        } else {
            Write-Error "无法找到$appPath"
            break # 如果app.exe不存在，则退出脚本
        }
    }

    # 等待一分钟再检查（可以根据需要调整等待时间）
    Start-Sleep -Seconds 60
}