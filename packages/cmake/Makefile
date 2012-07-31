
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = cmake

PKG_FORMAT = tar
PKG_TAR = cmake-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.cmake.org/files/v2.8/cmake-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = cmake-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./configure \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make


