# DESTDIR is used to install into a different root directory
DESTDIR?=/

# Specify the kernel directory to use
KERNELDIR?=/lib/modules/$(shell uname -r)/build

# Need the absolute directory do the driver directory to build kernel modules
DRIVERDIR?=$(shell pwd)/src

# Where kernel drivers are going to be installed
MODULEDIR?=/lib/modules/$(shell uname -r)/kernel/drivers/usb/misc


# Build all target
all: driver

# Driver compilation
driver:
	@echo "\n::\033[32m Compiling Razer kernel modules\033[0m"
	@echo "========================================"
	make -C $(KERNELDIR) SUBDIRS=$(DRIVERDIR) modules

# Clean target
clean:
	make -C $(KERNELDIR) SUBDIRS=$(DRIVERDIR) clean

# Install kernel modules
install:
	@echo "\n::\033[34m Installing Razer kernel modules\033[0m"
	@echo "====================================================="
	@install -v -D -m 644 -g root -o root $(DRIVERDIR)/razerkbd.ko $(DESTDIR)/$(MODULEDIR)/razerkbd.ko
	@install -v -D -m 644 -g root -o root $(DRIVERDIR)/razermouse.ko $(DESTDIR)/$(MODULEDIR)/razermouse.ko
	@install -v -D -m 644 -g root -o root $(DRIVERDIR)/razerfirefly.ko $(DESTDIR)/$(MODULEDIR)/razerfirefly.ko

# Remove kernel modules
uninstall:
	@echo "\n::\033[34m Uninstalling Razer kernel modules\033[0m"
	@echo "====================================================="
	@rm -f $(DESTDIR)/$(MODULEDIR)/razerkbd.ko
	@rm -f $(DESTDIR)/$(MODULEDIR)/razermouse.ko
	@rm -f $(DESTDIR)/$(MODULEDIR)/razerfirefly.ko
