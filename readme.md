# Example LaTeX Build system

Automating the building of LaTeX documents.

Requirments:

- make (provides an interface)
- scons (to handle dependencies)
- inkscape (to render figures)
- inotifytools (for automatic rebuilding)

Invoking `make` with the rest of the dependencies installed will compile the document.
