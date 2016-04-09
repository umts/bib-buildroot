include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))

#This shouldn't be needed, but OK for temporary hack
XAPP_XINIT_CONF_OPTS += MCOOKIE=/usr/bin/mcookie
