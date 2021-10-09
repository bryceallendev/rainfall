# Build, run, and test rainfall

.PHONY: all
all : rainfall

rainfall : rainfall.o
	g++ -std=c++17 -Wall rainfall.o -o rainfall

rainfall.o : rainfall.cpp
	g++ -std=c++17 -Wall -c rainfall.cpp

.PHONY: run
run : rainfall
	./rainfall < rainfall.csv

.PHONY: test
test : rainfall
	./rainfall < rainfall.csv > testrun.txt
	diff report.txt testrun.txt
	@rm -f testrun.txt

.PHONY: clean
clean :
	@rm -f rainfall rainfall.o
