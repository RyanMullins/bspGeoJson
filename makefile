minify ?= ./node_modules/uglify-js/bin/uglifyjs
lint ?= jshint

all: d3.bspGeoJson.min.js

%.min.js: %.js
	$(minify) $< > $@

lint:
	$(lint) --verbose d3.bspGeoJson.js

clean:
	rm -f *.min.js