PATH = /bin
scripts = dmenu-shutdown

clean:
	rm -f $(PATH)/$(scripts)
install:
	cp $(scripts) $(PATH)/$(scripts)
