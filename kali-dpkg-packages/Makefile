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

freeze.deb: freeze/usr/share/freeze/freeze
	dpkg-deb --build freeze

freeze/usr/share/freeze/freeze: freeze/usr/share/freeze
	cd freeze/usr/share/freeze && go build -o freeze Freeze.go

freeze/usr/share/freeze:
	curl -L https://github.com/Tylous/Freeze/archive/refs/heads/main.zip -o /tmp/freeze-main.zip
	mkdir -p freeze/usr/share/
	unzip -q /tmp/freeze-main.zip -d freeze/usr/share/
	mv freeze/usr/share/Freeze-main freeze/usr/share/freeze
	rm /tmp/freeze-main.zip
	cd freeze/usr/share/freeze && go get golang.org/x/sys/windows

make-me-a-shell.deb: make-me-a-shell/usr/share/make-me-a-shell/Invoke-ConPtyShell.ps1
	dpkg-deb --build make-me-a-shell

make-me-a-shell/usr/share/make-me-a-shell/Invoke-ConPtyShell.ps1:
	mkdir -p make-me-a-shell/usr/share/make-me-a-shell
	curl -L https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -o make-me-a-shell/usr/share/make-me-a-shell/Invoke-ConPtyShell.ps1

clean:
	rm -f *.deb
	rm -rf rustscan/target
	rm -rf freeze/usr/share/freeze
