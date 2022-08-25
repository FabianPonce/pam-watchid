VERSION = 2
LIBRARY_NAME = pam_watchid.so
DESTINATION = /usr/local/lib/pam
TARGET = apple-darwin20.1.0
ARCH=$(shell arch)

all:
	swiftc watchid-pam-extension.swift -o $(LIBRARY_NAME) -target $(ARCH)-$(TARGET) -emit-library

install: all
	mkdir -p $(DESTINATION)
	install -o root -g wheel -m 444 $(LIBRARY_NAME) $(DESTINATION)/$(LIBRARY_NAME).$(VERSION)
