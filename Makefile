
OUTDIR=build
EVALSTR="(require 'ox-ioslide)"


all: build

build: clean src/plan.org
	cp -r res build
	cd build && cp ../src/plan.org .
	cd build && emacs plan.org -f org-ioslide-export-to-html --kill
	rm build/plan.org
	cd build && mv plan.html index.html

upload-github: build
	cd build && git init . && git add . && git commit -m "GH-pages lonely commit at $(date)"
	cd build && git push git@github.com:ssaavedra/gpul-project-for-2015 HEAD:gh-pages

clean:
	rm -r $(OUTDIR)
