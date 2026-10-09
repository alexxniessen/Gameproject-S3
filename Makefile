
# Compiler
CXX := C:/raylib/w64devkit/bin/g++.exe

# Raylib
RAYLIB_PATH := C:/raylib/raylib/src

# Automatically find all C++ files in src
SOURCES := $(wildcard src/*.cpp)
HEADERS := $(wildcard src/*.h)

# Output executable
TARGET := main.exe

# Compiler settings
CXXFLAGS := -std=c++17 -Wall -g -I$(RAYLIB_PATH)
LDFLAGS := -L$(RAYLIB_PATH)
LDLIBS := -lraylib -lopengl32 -lgdi32 -lwinmm

.PHONY: all clean

all: $(TARGET)

# Build when source or header files change
$(TARGET): $(SOURCES) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(SOURCES) -o $@ $(LDFLAGS) $(LDLIBS)

clean:
	-del /Q $(TARGET)