host = $(shell hostname)
password = $(shell echo '${IRC_PASSWORD}' | sed -e 's/[\/&]/\\&/g')
storj_passphrase = $(shell echo '${STORJ_PASSPHRASE}' | sed -e 's/[\/&]/\\&/g')

all : weechat/irc.conf irssi/config systemd/storjshare.service

weechat/irc.conf :
	sed weechat/irc.conf.in -e s/HOST/$(host)/ -e s/IRC_PASSWORD/$(password)/ \
		> weechat/irc.conf

irssi/config :
	sed irssi/config.in -e s/HOST/$(host)/ -e s/IRC_PASSWORD/$(password)/ \
		> irssi/config

systemd/storjshare.service :
	sed systemd/storjshare.service.in -e 's/PASSPHRASE_PLACEHOLDER/$(storj_passphrase)/' \
		> systemd/storjshare.service

clean :
	rm weechat/irc.conf irssi/config systemd/storjshare.service
