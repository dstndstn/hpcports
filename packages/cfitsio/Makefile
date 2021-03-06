
include ../pkg_defs.make

# Package parameters

PKG_NAME = cfitsio

PKG_FORMAT = tar
PKG_TAR = cfitsio3390.tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/cfitsio3390.tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = cfitsio

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_installname.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	host=""; \
	if [ "x$(HPCP_CROSS_HOST)" != "x" ]; then \
		host="--host=$(HPCP_CROSS_HOST)"; \
	fi; \
	./configure $${host} \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	FC="$(F77)" FFLAGS="$(FFLAGS)" \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE); \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		$(MAKE) shared; \
	fi; \
	$(MAKE) fpack; \
	$(MAKE) funpack


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) install; \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/bin; \
	cp fpack funpack $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/bin/


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



