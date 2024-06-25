# chbg
Change the background for powershell!
So it's just a ps1 script...

## Usage
1. Put the 'chbg.ps1' script with pictures together in a directory.
2. Config the chbg.ps1 correctly (edit $imagesDirectory="D:\Powershell-BG" to your images path).
3. Define a function in powershell profile. ([Get default path of it](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.4)) Add a function to profile. e.g Add 'function chbg { D:\Powershell-BG\chbg.ps1 }' to profile.
4. Restart the powershell then enter 'chbg'.
