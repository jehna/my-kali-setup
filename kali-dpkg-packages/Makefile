PACKAGES = $(shell find . -maxdepth 1 -type d -exec test -d "{}/DEBIAN" \; -print) rustscan

.PHONY: all clean install

all: $(PACKAGES:=.deb)

install: $(PACKAGES:=.deb)
	sudo dpkg -i $(PACKAGES:=.deb) || sudo apt-get -f install -y

%.deb: %
	dpkg-deb --build $<

rustscan.deb: rustscan/usr/bin/rustscan
	dpkg-deb --build rustscan

rustscan/usr/bin/rustscan:
	@command -v cargo > /dev/null || { \
		echo "Cargo not found, installing..."; \
		sudo apt-get update && sudo apt-get install -y cargo; \
	}
	cargo install rustscan --target-dir rustscan/target
	mkdir -p rustscan/usr/bin
	cp -r ~/.cargo/bin/rustscan rustscan/usr/bin/

freeze.deb: freeze/usr/bin/freeze
	dpkg-deb --build freeze

freeze/usr/bin/freeze: freeze-repo
	cd freeze-repo && go build Freeze.go
	mkdir -p freeze/usr/bin
	cp freeze-repo/Freeze freeze/usr/bin/

freeze-repo:
	git clone https://github.com/Tylous/Freeze.git

clean:
	rm -f *.deb
	rm -rf rustscan/target
	rm -rf freeze/usr/bin/Freeze
	rm -rf freeze-repo
