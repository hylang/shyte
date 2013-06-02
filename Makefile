STATIC = static
STATIC_JS = $(STATIC)/js
STATIC_CSS = $(STATIC)/css
STATIC_IMGS = $(STATIC)/imgs


all: hello deps build


hello:
	@cowsay 'Welcome to Hy!'


build: clean less


less:
	make -C less
	mv -v less/*css $(STATIC_CSS)

clean:
	rm -fr $(STATIC_CSS) $(STATIC_JS) $(STATIC_IMGS)
	mkdir -p $(STATIC_CSS) $(STATIC_JS) $(STATIC_IMGS)


devel:
	@./devel.sh


deps:
	set -e; for x in $(shell cat dependencies); do \
		echo "Checking for dependency: $$x"; \
		dpkg-query -s $$x >/dev/null 2>&1; \
	done;


.PHONY: build clean less coffee devel imgs
