# ��ȡ�ű�����Ŀ¼
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path

# ѭ��ֱ����ǰʱ�䵽��22:00
while ($true) {
    # ��ȡ��ǰʱ��
    $currentTime = Get-Date
    Write-Host "������"
    # ����Ƿ񵽴�22:00
if (($currentTime.Hour -gt 21 -or ($currentTime.Hour -eq 21 -and $currentTime.Minute -ge 30)) -and ($currentTime.Hour -lt 23 -or ($currentTime.Hour -eq 23 -and $currentTime.Minute -le 30))) {
        # ����app.exe������·��
        $appPath = Join-Path -Path $scriptDirectory -ChildPath "myapp4.exe"
        
        # ���app.exe���ڣ���������
        if (Test-Path $appPath) {
            Start-Process -FilePath $appPath
            break # ���к��˳�ѭ����ֹͣ�ű�
        } else {
            Write-Error "�޷��ҵ�$appPath"
            break # ���app.exe�����ڣ����˳��ű�
        }
    }

    # �ȴ�һ�����ټ�飨���Ը�����Ҫ�����ȴ�ʱ�䣩
    Start-Sleep -Seconds 60
}