
FUNCS = \
  funcs/count.h funcs/cutgrep.h funcs/file.h funcs/flatten.h funcs/head.h \
  funcs/index.h funcs/math.h funcs/zip.h funcs/filter.h funcs/sum.h funcs/if.h \
  funcs/sort.h funcs/misc.h funcs/avg.h funcs/array.h funcs/map.h funcs/minmax.h \
  funcs/hist.h funcs/reverse.h funcs/rand.h funcs/time.h funcs/ngram.h funcs/explode.h

INCLUDE = \
  atom.h command.h deps.h exec.h funcs.h infer.h object.h parse.h tab.h type.h 

SRC = tab.cc help.cc

CXX ?= g++

tab: $(SRC) $(INCLUDE) $(FUNCS)
	$(CXX) -std=c++11 -O3 -Wall -Iaxe -pthread -lm $(SRC) -o tab

dist: $(SRC) $(INCLUDE) $(FUNCS)
	$(CXX) -std=c++11 -O3 -Wall -Iaxe -Wl,--whole-archive -lpthread -Wl,--no-whole-archive -lm -pthread $(SRC) -static -o tab-linux-x86_64
	strip tab-linux-x86_64

install: tab
	strip tab
	cp tab /usr/local/bin/

clean:
	rm tab
