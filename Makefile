PATH = /bin
scripts = dmenu-shutdown

clean:
	sudo rm -f $(PATH)/$(scripts)
install:
	sudo cp $(scripts) $(PATH)/$(scripts)
