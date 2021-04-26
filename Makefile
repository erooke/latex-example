MAIN=main.tex
FIGURES=figures/
SECTIONS=sections/

ALL=$(MAIN) $(FIGURES) $(SECTIONS)

.PHONY: all clean check watch

all:
	@scons

clean:
	@scons --clean

check:
	@find . -name "*.tex" -exec aspell --home-dir=. -t -c  {} \;

watch:
	@while true; do \
		inotifywait $(ALL); \
		make all; \
		done

