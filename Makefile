build:
	python3 build.py
	mdbook build
	#mkdir build/crowbook
	#crowbook crowbook.yaml

clean:
	mdbook clean
	rm -r ./build