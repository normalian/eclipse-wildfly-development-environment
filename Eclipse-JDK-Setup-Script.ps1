function DLUnzip {
  $zipUrl  = $args[0]
  $zipName = [System.IO.Path]::GetFileName($zipUrl)
  $basedir = $args[1]
  Set-Location $basedir

  # ZIP download
  $zipPath = [System.IO.Path]::Combine($basedir, $zipName)
  Write-Output "Downloading start... $args"
  Invoke-WebRequest -Uri $zipUrl -OutFIle $zipPath

  # ZIP expansion
  $sh = New-Object -ComObject Shell.Application
  $unzipDirObj = $sh.NameSpace($basedir)
  $zipPathObj = $sh.NameSpace($zipPath)
  Write-Output "expansion zip file... $zipPath"
  $unzipDirObj.CopyHere($zipPathObj.Items())
}

#create folders for JDK and Eclipse
mkdir c:\opt
mkdir c:\opt\workspace

#download and uznip Eclipse and JDK
$jdkeclipseHome  = "c:\opt\"
$eclipseUrl      = $Args[0] # "http://mirrors.neusoft.edu.cn/eclipse/technology/epp/downloads/release/mars/2/eclipse-jee-mars-2-win32-x86_64.zip"
$jdkUrl          = $Args[1] # "http://azure.azulsystems.com/zulu/zulu8.13.0.5-jdk8.0.72-win_x64.zip"
$username        = $Args[2] # 

DLUnzip $jdkUrl $jdkeclipseHome
DLUnzip $eclipseUrl $jdkeclipseHome

# add PATH environment variable
$user_path = [Environment]::GetEnvironmentVariable('PATH', 'Machine')
$user_path += ";$jdkeclipseHome" + [System.IO.Path]::GetFileNameWithoutExtension($jdkUrl) + "\bin"
[Environment]::SetEnvironmentVariable('PATH', $user_path, 'Machine')

# create JAVA_HOME environment variable
$java_home = [Environment]::GetEnvironmentVariable('JAVE_HOME', 'Machine')
$java_home = $jdkeclipseHome + [System.IO.Path]::GetFileNameWithoutExtension($jdkUrl)
[Environment]::SetEnvironmentVariable('JAVA_HOME', $java_home, 'Machine')

# Create Eclipse shortcut to Desktop, but below still dosen't work. 
$objShell = New-Object -ComObject WScript.Shell
$strFileName = "C:\Users\$username\Desktop\Eclipse.lnk"
$strTargetPath = "$jdkeclipseHome\eclipse\eclipse.exe"
$arguments = "-data $jdkeclipseHome\workspace"
$objShortCut = $objShell.CreateShortcut($strFileName)
$objShortCut.TargetPath = $strTargetPath
$objShortCut.Arguments = $arguments 
$objShortCut.Save()

Write-Output "end script"