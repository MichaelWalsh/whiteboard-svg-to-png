# whiteboard-svg-to-png
 Bulk converter for Microsoft Whiteboard SVG files to high quality PNG files

# Why is this better than the default export?
 Whiteboard can export a low resolution PNG file which isn't much use for sharing because you probably can't read much on it. It does offer an SVG export however it exports the entire canvas, a bit like a full length whiteboard on a wall, and not just the content you care about. Plus the edges of this big canvas often have a border which makes trimming it a little less straightforward.

# How does this work?
 When you run this script, it will look for all svg files in all subdirectories, and produce high quality png image files alongside the svg files. This is useful if you have hundreds of exported whiteboards organised in various folders.

# What is needed?
- Powershell. It comes with Windows.
  - The ability to run Powershell scripts.
- Download Inkscape for Windows. The portable (compressed archive) version is fine if you don't want to install anything. [You can get it from here.](https://inkscape.org/release/inkscape-1.0.1/windows/64-bit/compressed-7z/dl/)
  - You might need [the free 7-zip tool](https://www.7-zip.org/) to unpack it. 
- Download Imagemagick for Windows. The portable version is fine if you don't want to install it.

# How do I get Inkscape?
 1. [Inkscape website](https://inkscape.org/release/)
 2. Windows
 3. 64 Bit
 4. Compressed archive in 7z format. (easiest method, but if you want to play with inkscape you can also install it too)
 5. Use [7-zip](https://www.7-zip.org/download.html) to unpack the file. Go to your downloads, right click the inkscape file, select 7-zip; Extract to ...

# How do I get Imagemagick?
 1. [Imagemagick download page](https://imagemagick.org/script/download.php)
 2. Scroll down to the bottom
 3. There will be a file similar to [ImageMagick-7.0.10-57-portable-Q16-x64.zip](https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.10-57-portable-Q16-x64.zip) and download it
 4. Extract it somewhere

# How do I get the script?
 1. [On this page](https://github.com/MichaelWalsh/whiteboard-svg-to-png) click the green Code ⬇ button and download zip.
 2. If you have a github account, give it a star so I know someone used it. _If not, no worries either._
 3. Place the **batch-convert-svg.ps1** file where you save all of your whiteboard exports. 
 4. Open the file with a text editor like notepad and update the location of where you saved Inkscape and Imagemagick.
 5. Start -> Powershell and type **Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned**
    press Y to accept
 6. Now you can right click the batch-convert-svg.ps1 file and select Run with Powershell