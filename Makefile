build:
	python3 scripts/build.py
	mdbook build

clean:
	rm -r ./build