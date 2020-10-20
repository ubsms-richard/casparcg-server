build:
	tools/linux/build-in-docker
	tools/linux/extract-from-docker

clean:
	rm -rf casparcg_server || echo 2 > /dev/null

install-libs:
	mkdir -p $(DESTDIR)/opt/casparcg
	cp -ar casparcg_server/lib $(DESTDIR)/opt/casparcg/lib

install-common:
	mkdir -p $(DESTDIR)/opt/casparcg
	cp casparcg_server/casparcg.config $(DESTDIR)/opt/casparcg/
	mkdir -p $(DESTDIR)/opt/casparcg/log $(DESTDIR)/opt/casparcg/template $(DESTDIR)/opt/casparcg/data $(DESTDIR)/opt/casparcg/media

install-server:
	cp -ar casparcg_server/bin $(DESTDIR)/opt/casparcg/bin
	cp resources/linux/casparcg-server.service $(DESTDIR)/lib/systemd/system/

install:
	install-server install-common install-libs