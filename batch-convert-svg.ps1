# Michael Walsh
# 2021/01/12
# batch-convert-svg.ps1
# Version 1.1
# https://github.com/MichaelWalsh/whiteboard-svg-to-png
# LGPL 2.1; keep author attribution and link back to repo in your modifications

# This script can convert the high resolution SVG output files of Microsoft Whiteboard into high quality PNG files
# It uses the portable version of inkscape and imagemagick


# This script takes all .svg files in all nested folders
# and generates a high quality png file in-place beside them
# then trims the whitespace out of those files

# When you download the portable versions of inkscape and imagemagick
# you can use Windows Explorer to copy and paste the full locations below
# remember they must end with inkscape.com and convert.exe

$inkscape_com_path="C:\Users\yourusername\Downloads\inkscape-1.0.1-x64\inkscape\bin\inkscape.com"
$imagemagick_path="c:\Users\yourusername\Downloads\ImageMagick-7.0.10-59-portable-Q16-x64\convert.exe"

# the DPI argument makes the file resolution much bigger, and allows for content to be clear and easy to read when zoomed in 
# reduce this number if the files are too big
$dpi="500"

Get-ChildItem -path .\ -filter *.svg -recurse | ForEach-Object {
	$full_svg_path = $_.FullName
	$full_png_path = $full_svg_path
	$full_png_path = $full_png_path -replace ".{3}$" #strip file extension
	$full_png_path = $full_png_path + 'png' #make a png file

	if (!(Test-Path $full_png_path)) {
		echo "Running inkscape to convert $full_svg_path"
        # inkspace is very good at exporting svg files to png
        start-Process -FilePath $inkscape_com_path -Wait -NoNewWindow -ArgumentList("`"$full_svg_path`"", "--export-filename=`"$full_png_path`"", "--export-dpi=$dpi")
		
		if (!(Test-Path $full_png_path)) {
			echo "OH NO! File didn't get turned into a png: $full_svg_path"
			continue
		}
		echo "Trimming whitespace from $full_png_path"
        # This calls the imagemagick convert tool to try and remove whitespace and allow for a managable resolution file
        # it replaces the png file in place. 
        # -shave 30x30 removes the 30 pixels from each of the borders. 
        #  that's needed as a small border is there preventing a whitespace crop
        # -fuzz allows the cropping tool a bit more leeway in deciding what's a background and what may be a dot
        # -trim tries to remove whitespace from all 4 sides
        # +repage then recalculates the canvas size after the trim so the file will be valid

		start-Process -FilePath $imagemagick_path -Wait -NoNewWindow -ArgumentList("`"$full_png_path`"","-shave 30x30", "-fuzz 10%", "-trim", "+repage", "`"$full_png_path`"")
	}
}
