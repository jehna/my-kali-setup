PACKAGES = $(shell find . -maxdepth 1 -type d -exec test -d "{}/DEBIAN" \; -print) nessus rustscan

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

NESSUS_VERSION = 10.8.3
NESSUS_SHA256 = 053f2c364e419d32954fcb3f3fdf32990d42e39d9a87a18624e35b904dd86d0e

nessus.deb:
	curl --request GET \
  --url 'https://www.tenable.com/downloads/api/v2/pages/nessus/files/Nessus-$(NESSUS_VERSION)-ubuntu1804_aarch64.deb' \
  --output 'nessus.deb'
	echo "$(NESSUS_SHA256) nessus.deb" | sha256sum --check || { \
		echo "SHA256 verification failed"; \
		rm nessus.deb; \
		exit 1; \
	}

	# Add enabling Nessus service to postinst
	dpkg-deb -R nessus.deb nessus
	echo "systemctl start nessusd" >> nessus/DEBIAN/postinst
	dpkg-deb --build nessus
	rm -rf nessus


clean:
	rm -f *.deb
	rm -rf rustscan/target
	rm -rf nessus
