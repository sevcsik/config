host = $(shell hostname)
password = $(IRC_PASSWORD)

all : weechat/irc.conf irssi/config

weechat/irc.conf :
	sed weechat/irc.conf.in -e s/HOST/$(host)/ -e s/IRC_PASSWORD/$(password)/ \
		> weechat/irc.conf

irssi/config :
	sed irssi/config.in -e s/HOST/$(host)/ -e s/IRC_PASSWORD/$(password)/ \
		> irssi/config

clean :
	rm weechat/irc.conf irssi/config
