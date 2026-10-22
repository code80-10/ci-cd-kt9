CXX := g++
TARGET := build/app.exe
SOURCE := src/main.cpp
DEBUG ?= 0

ifeq ($(DEBUG),1)
  CXXFLAGS := -std=c++17 -Wall -Wextra -g -O0 -DDEBUG
  MODE := DEBUG
else
  CXXFLAGS := -std=c++17 -Wall -Wextra -O2
  MODE := RELEASE
endif

.PHONY: all clean run

all: $(TARGET)

$(TARGET): $(SOURCE)
	@mkdir -p build
	@echo Building in $(MODE) mode
	$(CXX) $(CXXFLAGS) $(SOURCE) -o $(TARGET)

run: all
	./$(TARGET)

clean:
	@rm -rf build
