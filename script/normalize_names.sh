
Open($1)

fontname  = $fontname
version   = $fontversion

# Fix for rejected EOT's in IE8:
# http://stackoverflow.com/questions/12449512/why-does-one-of-these-font-face-render-in-ie8-but-the-others-dont/12459447#12459447
# http://fontforge.org/scripting-alpha.html#SetFontNames
SetFontNames($fontname,$fontname,$fontname,"","",version)

# Save.
Generate($2)
