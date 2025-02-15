CFLAGS += -Iminizip -I../libplist/include -I.
CXXFLAGS := $(CFLAGS) -std=c++17

src := $(wildcard *.cpp)
src += minizip/ioapi.c minizip/zip.c minizip/unzip.c
ldid_src += ldid/ldid.cpp ldid/lookup2.c

%.c.o : %.c
	$(CC) $(CFLAGS) $(EXTRA_FLAGS) -o $@ -c $<

%.cpp.o : %.cpp
	$(CXX) $(CXXFLAGS) $(EXTRA_FLAGS) -o $@ -c $<

objs := $(src) $(ldid_src)
objs := $(addsuffix .o, $(objs))
AltSign.a : $(objs)
	ar rcs $@ $^

clean:
	rm -f $(objs) AltSign.a
