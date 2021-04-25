import os
from pathlib import Path

figures = Path("figures")

inkscape = Builder(
    action="inkscape --export-area-page --export-filename=$TARGET $SOURCE"
)

# Let scons access latex, use inkscape to compile figures
env = Environment(ENV=os.environ, BUILDERS={"Fig": inkscape})
env["PDFLATEX"] = "xelatex"

# Build our document from notes.tex
document = env.PDF(target="guide.pdf", source="main.tex")
# Delete our document once done building not before, places nicer with document viewers
env.Precious(document)

# Add all svg files in the figures directory to the dependency graph
for folder, _, files in os.walk(figures / "svg"):
    folder = Path(folder).relative_to(figures / "svg")
    for figure in files:
        input = figures / "svg" / folder / figure
        output = (figures / "pdf" / folder / figure).with_suffix(".pdf")
        env.Fig(str(output), str(input))
        env.Depends(document, str(input))

# vim: set filetype=python:
