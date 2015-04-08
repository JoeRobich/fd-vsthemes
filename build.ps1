Add-Type -A 'System.IO.Compression.FileSystem';

$currentDirectory = Get-Location;
[IO.Directory]::SetCurrentDirectory($currentDirectory);

Remove-Item Build -recurse
New-Item Build -type directory

New-Item Build/VsDarkFullTheme -type directory
Copy-Item VsDarkUI/* Build/VsDarkFullTheme -recurse
Copy-Item VsDarkSyntax/* Build/VsDarkFullTheme -recurse -ErrorAction SilentlyContinue
Copy-Item 'Build/VsDarkFullTheme/$(BaseDir)/Settings/Themes/VsDark.fdi' 'Build/VsDarkFullTheme/$(BaseDir)/Settings/Themes/CURRENT'
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsDarkFullTheme', 'Build\VsDarkFullTheme.fdz');
Remove-Item Build/VsDarkFullTheme -recurse

New-Item Build/VsBlueFullTheme -type directory
Copy-Item VsBlueUI/* Build/VsBlueFullTheme -recurse
Copy-Item VsLightSyntax/* Build/VsBlueFullTheme -recurse -ErrorAction SilentlyContinue
Copy-Item 'Build/VsBlueFullTheme/$(BaseDir)/Settings/Themes/VsBlue.fdi' 'Build/VsBlueFullTheme/$(BaseDir)/Settings/Themes/CURRENT'
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsBlueFullTheme', 'Build\VsBlueFullTheme.fdz');
Remove-Item Build/VsBlueFullTheme -recurse

New-Item Build/VsLightFullTheme -type directory
Copy-Item VsLightUI/* Build/VsLightFullTheme -recurse
Copy-Item VsLightSyntax/* Build/VsLightFullTheme -recurse -ErrorAction SilentlyContinue
Copy-Item 'Build/VsLightFullTheme/$(BaseDir)/Settings/Themes/VsLight.fdi' 'Build/VsLightFullTheme/$(BaseDir)/Settings/Themes/CURRENT'
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsLightFullTheme', 'Build\VsLightFullTheme.fdz');
Remove-Item Build/VsLightFullTheme -recurse

New-Item Build/VsDarkSyntaxTheme -type directory
Copy-Item VsDarkSyntax/* Build/VsDarkSyntaxTheme -recurse
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsDarkSyntaxTheme', 'Build\VsDarkSyntaxTheme.fdz');
Remove-Item Build/VsDarkSyntaxTheme -recurse

New-Item Build/VsLightSyntaxTheme -type directory
Copy-Item VsLightSyntax/* Build/VsLightSyntaxTheme -recurse
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsLightSyntaxTheme', 'Build\VsLightSyntaxTheme.fdz');
Remove-Item Build/VsLightSyntaxTheme -recurse

$hash = Get-FileHash Build/VsDarkFullTheme.fdz -Algorithm MD5;
Write-Host 'VsDarkFullTheme.fdz hash: ' $hash.Hash;

$hash = Get-FileHash Build/VsBlueFullTheme.fdz -Algorithm MD5;
Write-Host 'VsBlueFullTheme.fdz hash: ' $hash.Hash;

$hash = Get-FileHash Build/VsLightFullTheme.fdz -Algorithm MD5;
Write-Host 'VsLightFullTheme.fdz hash: ' $hash.Hash;

$hash = Get-FileHash Build/VsDarkSyntaxTheme.fdz -Algorithm MD5;
Write-Host 'VsDarkSyntaxTheme.fdz hash: ' $hash.Hash;

$hash = Get-FileHash Build/VsLightSyntaxTheme.fdz -Algorithm MD5;
Write-Host 'VsLightSyntaxTheme.fdz hash: ' $hash.Hash;
