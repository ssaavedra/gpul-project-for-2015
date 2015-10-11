
OUTDIR=build
EVALSTR="(require 'ox-ioslide)"


all: build

build: clean src/plan.org
	cp -r res build
	cd build && cp ../src/plan.org .
	cd build && emacs plan.org -f org-ioslide-export-to-html --kill
	rm build/plan.org
	cd build && mv plan.html index.html

clean:
	rm -r $(OUTDIR)
