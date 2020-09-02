build:
	python3 build.py
	mdbook build

clean:
	mdbook clean
	rm -r ./build