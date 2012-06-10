

STAGE = staging_$(TARGET)


prefetch :
	@$(MAKE) pkg-prefetch > /dev/null 2>&1


fetch : prefetch
	@if [ ! -e $(POOL)/$(PKG_COMPRESSED) ]; then \
		echo "$(HPCP)  $(PKG_NAME):  Fetching"; \
		echo "$(HPCP)    FAILED:  fetching of $(PKG_NAME) not yet implemented!"; \
	fi;


extract : fetch
	@if [ ! -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		echo "$(HPCP)  $(PKG_NAME):  Extracting"; \
		if [ -e $(POOL)/$(PKG_COMPRESSED) ]; then \
			mkdir -p $(STAGE); \
			cd $(STAGE); \
			rm -f log.*; \
			$(PKG_XTAR) $(POOL)/$(PKG_COMPRESSED) > log.extract 2>&1; \
			if [ ! -e $(PKG_UNCOMPRESSED) ]; then \
				echo "$(HPCP)    FAILED:  extracted source $(PKG_UNCOMPRESSED) was not created."; \
			else \
				touch state.extract; \
			fi; \
		fi; \
	fi


patch : extract
	@if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		if [ -e $(STAGE)/state.extract ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Patching"; \
			cd $(STAGE)/$(PKG_UNCOMPRESSED); \
			rm -f log.patch; \
			for pfile in $(PKG_PATCHES); do \
				$(PATCH) -p1 < $${pfile} >> ../log.patch 2>&1; \
			done; \
			touch ../state.patch && \
			rm ../state.extract; \
		fi; \
	fi


configure : patch
	@if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		if [ -e $(STAGE)/state.patch ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Configuring"; \
			$(MAKE) pkg-configure > $(STAGE)/log.configure 2>&1 && \
			touch $(STAGE)/state.configure && \
			rm $(STAGE)/state.patch; \
		fi; \
	fi


build : configure uninstall
	@if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		if [ -e $(STAGE)/state.configure ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Building"; \
			cd $(STAGE)/$(PKG_UNCOMPRESSED); \
			$(MAKE) > ../log.build 2>&1 && \
			touch ../state.build && \
			rm ../state.configure; \
		fi; \
	fi


preinstall : build
	@$(MAKE) pkg-preinstall


install : preinstall
	@if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		if [ -e $(STAGE)/state.build ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Installing"; \
			cd $(STAGE)/$(PKG_UNCOMPRESSED); \
			$(MAKE) install > ../log.install 2>&1 && \
			touch ../state.install && \
			rm ../state.build; \
		fi; \
	fi


clean :
	@if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		if [ -e $(STAGE)/state.build ]; then \
			echo "$(HPCP)  $(PKG_NAME):  Cleaning"; \
			$(MAKE) pkg-clean > $(STAGE)/log.clean 2>&1 && \
			touch $(STAGE)/state.configure && \
			rm $(STAGE)/state.build && \
			rm $(STAGE)/log.build; \
		else \
			if [ -e $(STAGE)/state.install ]; then \
				echo "$(HPCP)  $(PKG_NAME):  Cleaning"; \
				$(MAKE) pkg-clean > $(STAGE)/log.clean 2>&1 && \
				touch $(STAGE)/state.configure && \
				rm $(STAGE)/state.install && \
				rm -f $(STAGE)/log.install && \
				rm -f $(STAGE)/log.build; \
			fi; \
		fi; \
	fi


uninstall :
	@echo "$(HPCP)  $(PKG_NAME):  Uninstalling"; \
	if [ -e $(STAGE)/$(PKG_UNCOMPRESSED) ]; then \
		if [ -e $(STAGE)/state.install ]; then \
			touch $(STAGE)/state.build && \
			rm $(STAGE)/state.install && \
			rm -f $(STAGE)/log.install; \
		fi; \
	fi; \
	rm -rf $(PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


purge :
	@echo "$(HPCP)  $(PKG_NAME):  Purging"; \
	rm -rf $(STAGE)

