# whiteboard-svg-to-png
 Bulk converter for Microsoft Whiteboard SVG files to high quality PNG files

# Why is this better than the default export?
 Whiteboard can export a low resolution PNG file which isn't much use for sharing because you probably can't read much on it. It does offer an SVG export however it exports the entire canvas, a bit like a full length whiteboard on a wall, and not just the content you care about. Plus the edges of this big canvas often have a border which makes trimming it a little less straightforward.

# How does this work?
 When you run this script, it will look for all svg files in all subdirectories, and produce high quality png image files alongside the svg files. This is useful if you have hundreds of exported whiteboards organised in various folders.

# What is needed?
- Powershell. It comes with Windows.
  - The ability to run Powershell scripts.
- Download Inkscape for Windows. The portable (compressed archive) version is fine if you don't want to install anything.
- Download Imagemagick for Windows. The portable version is fine if you don't want to install it.