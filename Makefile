CUDACXX=nvcc
CUDACXXFLAGS=-arch=sm_70 -O3
CXXFLAGS=-march=native -fopenmp
NSYS=nsys profile
NSYSFLAGS=--stats=true --force-overwrite=true

all: streams

streams: streams.cu
	$(CUDACXX) $(CUDACXXFLAGS) -Xcompiler="$(CXXFLAGS)" streams.cu -o streams

profile: streams
	$(NSYS) $(NSYSFLAGS) -o streams-report ./streams


clean:
	rm -f streams *.qdrep *.sqlite
