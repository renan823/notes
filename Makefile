TIMESTAMP := $(shell date "+%Y-%m-%d %H:%M:%S")

all:
	@git add .
	@git commit -m "backup: $(TIMESTAMP)"
	@git push origin main

