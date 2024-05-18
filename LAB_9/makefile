CC = g++
CFLAGS = -Wall -Wextra -pedantic -std=c++11
LDFLAGS = -lm

SRC = main.cpp

TARGET = matrix_mult

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET) $(LDFLAGS)

ss:
	g++ -S main.cpp -masm=intel -o main.s

clean:
	rm -f $(TARGET)
