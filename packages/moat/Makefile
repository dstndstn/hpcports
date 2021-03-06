
include ../pkg_defs.make

# Package parameters

PKG_NAME = moat

PKG_FORMAT = git
PKG_GIT_CLONE = git clone git@github.com:tskisner/MOAT.git
PKG_GIT_CHECKOUT = git checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = MOAT

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./autogen.sh; \
	host=""; \
	if [ "x$(HPCP_CROSS_HOST)" != "x" ]; then \
		host="--host=$(HPCP_CROSS_HOST)"; \
	fi; \
	dyn="--disable-shared --enable-static --enable-all-static"; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		dyn=""; \
	fi; \
	if [ "x$(VENDOR)" = "xapple" ]; then \
		CC="$(CC)" CFLAGS="$(CFLAGS)" \
		CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
		F77="$(F77)" FFLAGS="$(FFLAGS)" \
		FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
		OPENMP_CFLAGS="$(OMPFLAGS)" \
		OPENMP_FCFLAGS="" \
		OPENMP_CXXFLAGS="$(OMPFLAGS)" \
		LIBTOOLFLAGS="$(LIBTOOLFLAGS)" \
		FLIBS="$(FLIBS)" FCLIBS="$(FCLIBS)" \
		LDFLAGS="$(LDFLAGS) -L$(boost_PREFIX)/lib" LIBS="$(LIBS)" \
		MPICXX="$(MPICXX)" \
		./configure $${dyn} $${host} \
		--with-fftw-libs="$(fftw_LIBS_CXX)" \
		--with-accelerate-libs="$(APPLE_LIBS_CXX)" \
		--with-papi-cpp=no \
		--disable-fortran \
		--with-boost=$(boost_PREFIX) \
		--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION); \
	fi; \
	if [ "x$(VENDOR)" = "xamd" ]; then \
		CC="$(CC)" CFLAGS="$(CFLAGS)" \
		CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
		F77="$(F77)" FFLAGS="$(FFLAGS)" \
		FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
		OPENMP_CFLAGS="$(OMPFLAGS)" \
		OPENMP_FCFLAGS="" \
		OPENMP_CXXFLAGS="$(OMPFLAGS)" \
		LIBTOOLFLAGS="$(LIBTOOLFLAGS)" \
		FLIBS="$(FLIBS)" FCLIBS="$(FCLIBS)" \
		LDFLAGS="$(LDFLAGS) -L$(boost_PREFIX)/lib" LIBS="$(LIBS)" \
		MPICXX="$(MPICXX)" \
		./configure $${dyn} $${host} \
		--with-fftw-cpp=no \
		--with-acml-libs="$(AMD_LIBS_CXX)" \
		--with-papi-cpp=no \
		--with-boost=$(boost_PREFIX) \
		--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION); \
	fi; \
	if [ "x$(VENDOR)" = "xintel" ]; then \
		CC="$(CC)" CFLAGS="$(CFLAGS)" \
		CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
		F77="$(F77)" FFLAGS="$(FFLAGS)" \
		FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
		OPENMP_CFLAGS="$(OMPFLAGS)" \
		OPENMP_FCFLAGS="" \
		OPENMP_CXXFLAGS="$(OMPFLAGS)" \
		LIBTOOLFLAGS="$(LIBTOOLFLAGS)" \
		FLIBS="$(FLIBS)" FCLIBS="$(FCLIBS)" \
		LDFLAGS="$(LDFLAGS) -L$(boost_PREFIX)/lib" LIBS="$(LIBS)" \
		MPICXX="$(MPICXX)" \
		./configure $${dyn} $${host} \
		--with-fftw-cpp=no \
		--with-mkl-libs="$(INTEL_LIBS_CXX) $(OMPFLAGS) $(FCLIBS)" \
		--with-papi-cpp=no \
		--with-boost=$(boost_PREFIX) \
		--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION); \
	fi; \
	if [ "x$(VENDOR)" = "x" ]; then \
		CC="$(CC)" CFLAGS="$(CFLAGS)" \
		CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
		F77="$(F77)" FFLAGS="$(FFLAGS)" \
		FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
		OPENMP_CFLAGS="$(OMPFLAGS)" \
		OPENMP_FCFLAGS="" \
		OPENMP_CXXFLAGS="$(OMPFLAGS)" \
		LIBTOOLFLAGS="$(LIBTOOLFLAGS)" \
		FLIBS="$(FLIBS)" FCLIBS="$(FCLIBS)" \
		LDFLAGS="$(LDFLAGS) -L$(boost_PREFIX)/lib" LIBS="$(LIBS)" \
		MPICXX="$(MPICXX)" \
		./configure $${dyn} $${host} \
		--with-fftw-libs="$(fftw_LIBS_CXX)" \
		--with-papi-cpp=no \
		--with-boost=$(boost_PREFIX) \
		--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION); \
	fi


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) LIBTOOLFLAGS="$(LIBTOOLFLAGS)"


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) LIBTOOLFLAGS="$(LIBTOOLFLAGS)" install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



