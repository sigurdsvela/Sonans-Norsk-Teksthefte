build:
	python3 build.py
	#mdbook build
	#tectonic book/*.tex
	mkdir build/crowbook
	crowbook crowbook.yaml

clean:
	mdbook clean
	rm -r ./build