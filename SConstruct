import os
from pathlib import Path

main = "main"

figures = Path("figures")

# Tell scons how many cores we have to play with
if os.cpu_count() is not None:
    SetOption("num_jobs", max(1, os.cpu_count() - 1))

# Tell scons how to render our figures
inkscape = Builder(
    action="inkscape --export-area-page --export-filename=$TARGET $SOURCE"
)

# Let scons access latex, use inkscape to compile figures
env = Environment(ENV=os.environ, BUILDERS={"Fig": inkscape})
env["PDFLATEX"] = "xelatex"

# Build our document from notes.tex
document = env.PDF(target=main + ".pdf", source=main + ".tex")
# Delete our document once done building not before, places nicer with document viewers
env.Precious(document)

# Add all svg files in the figures directory to the dependency graph
for folder, _, files in os.walk(figures / "svg"):
    folder = Path(folder).relative_to(figures / "svg")
    for figure in files:
        input = figures / "svg" / folder / figure
        output = (figures / "pdf" / folder / figure).with_suffix(".pdf")
        fig = env.Fig(str(output), str(input))
        env.Depends(document, fig)

# vim: set filetype=python:
