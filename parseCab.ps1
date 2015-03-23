# First get a list of all the cabs using something like
# Get-ChildItem ".\" -recurse | where {$_.extension -eq ".cab"} | % {Write-Output $_.FullName >> out.txt}
# Clean up the output of where the cabs are stored and store it in out.txt, like below.  The out.txt should be the directory in which the cab lives

$cabs = Get-ChildItem -Path (Read-Host -prompt 'Enter Path Where Updates Reside') -recurse | where {$_.extension -eq ".cab" -or $_.extension -eq ".msu"} | % {Write-Output $_.FullName}

$image_dir = "C:\mount\"

foreach (
	    $file in $cabs
	)
		{
		    (Start-process -filepath "c:\windows\system32\dism.exe" -ArgumentList "-image:$image_dir -add-package -packagepath:$file" -wait -passthru).ExitCode
		}


#$cabs
