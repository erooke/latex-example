MAIN=main.tex
FIGURES=figures/
SECTIONS=sections/

ALL=$(MAIN) $(FIGURES) $(SECTIONS)

all:
	@scons

clean:
	@scons --clean

watch:
	@while true; do \
		inotifywait $(ALL); \
		make all; \
		done

