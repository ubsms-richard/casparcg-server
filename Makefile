build:
	tools/linux/build-in-docker
	tools/linux/extract-from-docker

clean:
	rm -rf casparcg_server || echo 2 > /dev/null

install-libs:
	mkdir -p $(DESTDIR)/usr/lib/casparcg
	cp -ar casparcg_server/lib/* $(DESTDIR)/usr/lib/casparcg/

install-common:
	mkdir -p $(DESTDIR)/usr/share/casparcg
	cp casparcg_server/casparcg.config $(DESTDIR)/usr/share/casparcg/
	mkdir -p $(DESTDIR)/var/log/casparcg $(DESTDIR)/var/lib/casparcg/template $(DESTDIR)/var/lib/casparcg/data $(DESTDIR)/var/lib/casparcg/media

install-server:
	mkdir -p $(DESTDIR)/usr/casparcg/bin
	mkdir -p $(DESTDIR)/lib/systemd/system/
	cp -ar casparcg_server/bin $(DESTDIR)/usr/casparcg/
	cp resources/linux/casparcg-server.service $(DESTDIR)/lib/systemd/system/