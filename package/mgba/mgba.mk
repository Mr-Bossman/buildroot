MGBA_VERSION = 0.9
MGBA_SITE = https://github.com/mgba-emu/mgba.git
MGBA_SITE_METHOD = git
MGBA_INSTALL_STAGING = YES
MGBA_INSTALL_TARGET = YES
#MGBA_AUTORECONF = YES
MGBA_CONF_OPTS = -DBUILD_GL=yes -DBUILD_GLES2=no -DBUILD_GLES3=no
MGBA_DEPENDENCIES = libgl libgles sdl2 glibc
#MGBA_POST_EXTRACT_HOOKS = "./autoconf.sh"


$(eval $(cmake-package))
