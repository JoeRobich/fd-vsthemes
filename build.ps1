Add-Type -A 'System.IO.Compression.FileSystem';

$currentDirectory = Get-Location;
[IO.Directory]::SetCurrentDirectory($currentDirectory);

#Make Build Directory
Remove-Item Build -recurse
New-Item Build -type directory

#Create initial dark full theme fdz
New-Item Build/VsDarkFullTheme -type directory
Copy-Item VsDarkUI/* Build/VsDarkFullTheme -recurse
Copy-Item VsDarkSyntax/* Build/VsDarkFullTheme -recurse -ErrorAction SilentlyContinue
Copy-Item 'Build/VsDarkFullTheme/$(BaseDir)/Settings/Themes/VsDark.fdi' 'Build/VsDarkFullTheme/$(BaseDir)/Settings/Themes/CURRENT'
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsDarkFullTheme', 'Build\VsDarkFullTheme.fdz');

#Create initial dark syntax theme fdz
New-Item Build/VsDarkSyntaxTheme -type directory
Copy-Item VsDarkSyntax/* Build/VsDarkSyntaxTheme -recurse
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsDarkSyntaxTheme', 'Build\VsDarkSyntaxTheme.fdz');

#Move dark full theme to dark full theme so it will be deployed with other full themes
New-Item 'Build/VsDarkFullTheme/$(BaseDir)/Settings/Themes/FullThemes' -type directory
Move-Item Build/VsDarkFullTheme.fdz 'Build/VsDarkFullTheme/$(BaseDir)/Settings/Themes/FullThemes/VsDarkFullTheme.fdz'

#Copy dark syntax theme to dark full theme so it will be deployed with other syntax themes
New-Item 'Build/VsDarkFullTheme/$(BaseDir)/Settings/Themes/SyntaxThemes' -type directory
Copy-Item Build/VsDarkSyntaxTheme.fdz 'Build/VsDarkFullTheme/$(BaseDir)/Settings/Themes/SyntaxThemes/VsDarkSyntaxTheme.fdz'

#Recreate dark full theme fdz
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsDarkFullTheme', 'Build\VsDarkFullTheme.fdz');
Remove-Item Build/VsDarkFullTheme -recurse

#Move dark syntax theme to dark syntax theme so it will be deployed with other syntax themes
New-Item 'Build/VsDarkSyntaxTheme/$(BaseDir)/Settings/Themes/SyntaxThemes' -type directory
Move-Item Build/VsDarkSyntaxTheme.fdz 'Build/VsDarkSyntaxTheme/$(BaseDir)/Settings/Themes/SyntaxThemes/VsDarkSyntaxTheme.fdz'

#Recreate dark syntax theme fdz
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsDarkSyntaxTheme', 'Build\VsDarkSyntaxTheme.fdz');
Remove-Item Build/VsDarkSyntaxTheme -recurse

#Create initial blue full theme fdz
New-Item Build/VsBlueFullTheme -type directory
Copy-Item VsBlueUI/* Build/VsBlueFullTheme -recurse
Copy-Item VsLightSyntax/* Build/VsBlueFullTheme -recurse -ErrorAction SilentlyContinue
Copy-Item 'Build/VsBlueFullTheme/$(BaseDir)/Settings/Themes/VsBlue.fdi' 'Build/VsBlueFullTheme/$(BaseDir)/Settings/Themes/CURRENT'
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsBlueFullTheme', 'Build\VsBlueFullTheme.fdz');

#Create initial light full theme fdz
New-Item Build/VsLightFullTheme -type directory
Copy-Item VsLightUI/* Build/VsLightFullTheme -recurse
Copy-Item VsLightSyntax/* Build/VsLightFullTheme -recurse -ErrorAction SilentlyContinue
Copy-Item 'Build/VsLightFullTheme/$(BaseDir)/Settings/Themes/VsLight.fdi' 'Build/VsLightFullTheme/$(BaseDir)/Settings/Themes/CURRENT'
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsLightFullTheme', 'Build\VsLightFullTheme.fdz');

#Create initial light syntax theme fdz
New-Item Build/VsLightSyntaxTheme -type directory
Copy-Item VsLightSyntax/* Build/VsLightSyntaxTheme -recurse
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsLightSyntaxTheme', 'Build\VsLightSyntaxTheme.fdz');

#Move blue full theme to blue full theme so it will be deployed with other full themes
New-Item 'Build/VsBlueFullTheme/$(BaseDir)/Settings/Themes/FullThemes' -type directory
Move-Item Build/VsBlueFullTheme.fdz 'Build/VsBlueFullTheme/$(BaseDir)/Settings/Themes/FullThemes/VsBlueFullTheme.fdz'

#Copy light syntax theme to blue full theme so it will be deployed with other syntax themes
New-Item 'Build/VsBlueFullTheme/$(BaseDir)/Settings/Themes/SyntaxThemes' -type directory
Copy-Item Build/VsLightSyntaxTheme.fdz 'Build/VsBlueFullTheme/$(BaseDir)/Settings/Themes/SyntaxThemes/VsLightSyntaxTheme.fdz'

#Recreate blue full theme fdz
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsBlueFullTheme', 'Build\VsBlueFullTheme.fdz');
Remove-Item Build/VsBlueFullTheme -recurse

#Move blue full theme to light full theme so it will be deployed with other full themes
New-Item 'Build/VsLightFullTheme/$(BaseDir)/Settings/Themes/FullThemes' -type directory
Move-Item Build/VsLightFullTheme.fdz 'Build/VsLightFullTheme/$(BaseDir)/Settings/Themes/FullThemes/VsLightFullTheme.fdz'

#Copy light syntax theme to light full theme so it will be deployed with other syntax themes
New-Item 'Build/VsLightFullTheme/$(BaseDir)/Settings/Themes/SyntaxThemes' -type directory
Copy-Item Build/VsLightSyntaxTheme.fdz 'Build/VsLightFullTheme/$(BaseDir)/Settings/Themes/SyntaxThemes/VsLightSyntaxTheme.fdz'

#Recreate light full theme fdz
[IO.Compression.ZipFile]::CreateFromDirectory('Build\VsLightFullTheme', 'Build\VsLightFullTheme.fdz');
Remove-Item Build/VsLightFullTheme -recurse

#Move light syntax theme to light syntax theme so it will be deployed with other syntax themes
New-Item 'Build/VsLightSyntaxTheme/$(BaseDir)/Settings/Themes/SyntaxThemes' -type directory
Move-Item Build/VsLightSyntaxTheme.fdz 'Build/VsLightSyntaxTheme/$(BaseDir)/Settings/Themes/SyntaxThemes/VsLightSyntaxTheme.fdz'

#Recreate light syntax theme fdz
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
