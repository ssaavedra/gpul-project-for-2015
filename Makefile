
OUTDIR=build
EVALSTR="(require 'ox-ioslide)"


all: build

build: clean src/plan.org
	cp -r res build
	cd build && cp ../src/plan.org .
	cd build && emacs plan.org -f org-ioslide-export-to-html --kill

clean:
	rm -r $(OUTDIR)
