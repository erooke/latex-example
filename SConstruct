import os
from pathlib import Path

main = "main"

# Tell scons how many cores we have to play with
if os.cpu_count() is not None:
    SetOption("num_jobs", max(1, os.cpu_count() - 1))


# Let scons access latex, use inkscape to compile figures
env = Environment(ENV=os.environ)
env["PDFLATEX"] = "xelatex"

# Build our document from notes.tex
document = env.PDF(target=main + ".pdf", source=main + ".tex")
# Delete our document once done building not before, places nicer with document viewers
env.Precious(document)

env.Depends(document, SConscript("figures/SConscript"))

# vim: set filetype=python:
