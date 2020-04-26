# Dependencies to treat as commands and not files/folders.
.PHONY: install uninstall

# make install
install:
	# Build the image
	docker build --compress --force-rm --no-cache --pull --rm --tag aminnairi/elm:latest .

# make uninstall
uninstall:
	# Removes the image
	docker rmi -f aminnairi/elm
