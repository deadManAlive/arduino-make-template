##########################################
# change this BOARD and PORT accordingly #
##########################################
BOARD=esp32:esp32:esp32doit-devkit-v1
PORT=COM7

BUILD_PATH=./build
MAIN=./src/main
SRC=$(MAIN)/main.ino
ADC=arduino-cli

ifeq ($(OS), Windows_NT)
	RMRF=rmdir /s /q
else
	RMRF=rm -rf
endif

build: $(SRC)
	$(ADC) compile -v -b $(BOARD) --build-path $(BUILD_PATH) $(MAIN)

upload: build
	$(ADC) upload -v -p $(PORT) -b $(BOARD) --input-dir $(BUILD_PATH) $(MAIN)

clean:
	$(RMRF) build
