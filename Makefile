PROJECT = GPGPreferences
TARGET = GPGPreferences
PRODUCT = GPGPreferences.prefPane/Contents/MacOS/GPGPreferences
VPATH = build/Release
LIBMACGPG_BUILD_PATH = ./Dependencies/Libmacgpg/build
all: $(PRODUCT)

$(PRODUCT): Source/* Resources/* Resources/*/* $(PROJECT).xcodeproj
	@xcodebuild -project $(PROJECT).xcodeproj -target $(TARGET) build $(XCCONFIG)

debug: Source/* Resources/* Resources/*/* $(PROJECT).xcodeproj
	@xcodebuild -project $(PROJECT).xcodeproj -target $(TARGET) -configuration Debug build $(XCCONFIG)

clean:
	rm -rf "./build"
	# Cleanup Libmacgpg if necessary.
	@test -d "$(LIBMACGPG_BUILD_PATH)" && rm -rvf "$(LIBMACGPG_BUILD_PATH)" || exit 0
