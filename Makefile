## Makefile used to merge the two LMEM extensions
MERGE_BUILD_DIR=build
CHROMIUM_DIR=chromium-addon
CHROMIUM_BUILD_DIR=${CHROMIUM_DIR}/dist
PROTO_DIR=proto-ext
PROTO_BUILD_DIR=${PROTO_DIR}/build/extension

default: update build merge

clean: clean-build clean-extensions

clean-build:
	rm -rf ${MERGE_BUILD_DIR}

clean-extensions: clean-chromium clean-proto

clean-chromium:
	rm -rf ${CHROMIUM_BUILD_DIR}

clean-proto:
	rm -rf ${PROTO_BUILD_DIR}

update: 
	## Makefile used to merge the two LMEM extensions
MERGE_BUILD_DIR=build
CHROMIUM_DIR=chromium-addon
CHROMIUM_BUILD_DIR=${CHROMIUM_DIR}/dist
PROTO_DIR=proto-ext
PROTO_BUILD_DIR=${PROTO_DIR}/build/extension

default: update build merge

clean: clean-build clean-extensions

clean-build:
	rm -rf ${MERGE_BUILD_DIR}

clean-extensions: clean-chromium clean-proto

clean-chromium:
	rm -rf ${CHROMIUM_BUILD_DIR}

clean-proto:
	rm -rf ${PROTO_BUILD_DIR}

update: 
	git submodule update --init --recursive && git submodule foreach --recursive git fetch && git submodule foreach git merge origin master

build: clean-extensions build-chromium build-proto

build-chromium:
	cd ${CHROMIUM_DIR} && npm install && gulp build

build-proto:
	cd ${PROTO_DIR} && npm install && npm run build:extension

merge: clean-build merge-build

merge-build-dir:
	mkdir ${MERGE_BUILD_DIR}

copy-chromium:
	cp -rf ${CHROMIUM_BUILD_DIR}/* ${MERGE_BUILD_DIR}

copy-proto:
	cp -rf ${PROTO_BUILD_DIR}/* ${MERGE_BUILD_DIR}

copy-manifest:
	cp manifest.json ${MERGE_BUILD_DIR}

merge-build: merge-build-dir copy-chromium copy-proto copy-manifest


build: clean-extensions build-chromium build-proto

build-chromium:
	cd ${CHROMIUM_DIR} && npm install && gulp build

build-proto:
	cd ${PROTO_DIR} && npm install && npm run build:extension

merge: clean-build merge-build

merge-build-dir:
	mkdir ${MERGE_BUILD_DIR}

copy-chromium:
	cp -rf ${CHROMIUM_BUILD_DIR}/* ${MERGE_BUILD_DIR}

copy-proto:
	cp -rf ${PROTO_BUILD_DIR}/* ${MERGE_BUILD_DIR}

copy-manifest:
	cp manifest.json ${MERGE_BUILD_DIR}

merge-build: merge-build-dir copy-chromium copy-proto copy-manifest
