PATH = /bin
scripts = dmenu-shutdown dmenu-brightness

clean:
	rm -f $(foreach script,$(scripts),$(PATH)/$(script))
install:
	cp -t $(PATH) $(scripts)
