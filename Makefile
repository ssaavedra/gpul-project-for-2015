
OUTDIR=build
EVALSTR="(require 'ox-ioslide)"


all: clean build

build: src/plan.org
	cp -r res build
	cd build && cp ../src/plan.org .
	cd build && emacs --batch --eval "(progn(require 'cl)(package-initialize))" --file plan.org -f org-ioslide-export-to-html --kill
	rm build/plan.org
	cd build && mv plan.html index.html

upload-github: build
	cd build && git init . && git add . && git commit -m "GH-pages lonely commit at $(date)"
	cd build && git push -f git@github.com:ssaavedra/gpul-project-for-2015 HEAD:gh-pages

clean:
	rm -fr $(OUTDIR)
