SRC_DIR = .
OBJ_DIR = build
BIN_DIR = bin

CXX = g++
CXXFLAGS = -Wall -Wextra -Og -g

.PHONY: all build_dirs clean server client

all: server client

build_dirs:
	mkdir -p $(OBJ_DIR) $(BIN_DIR)

$(OBJ_DIR)/hashtable.o: $(SRC_DIR)/hashtable.cpp | build_dirs
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/server.o: $(SRC_DIR)/server.cpp | build_dirs
	$(CXX) $(CXXFLAGS) -c $< -o $@

server: $(OBJ_DIR)/server.o $(OBJ_DIR)/hashtable.o
	$(CXX) $(CXXFLAGS) -o $(BIN_DIR)/server $^

client: $(OBJ_DIR)/hashtable.o | build_dirs
	$(CXX) $(CXXFLAGS) $(SRC_DIR)/client.cpp -o $(BIN_DIR)/client

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
