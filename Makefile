drawings=$(addsuffix .pdf,tenor bass misc)

all: $(drawings)

tenor.pdf bass.pdf:: drones.asy

misc.pdf:: mount.asy blowpipe.asy stocks.asy drones.asy

VIEW ?=

ifeq ($(VIEW),)
  VIEW_OPTION=
else
  VIEW_OPTION=V
endif

%.pdf: %.asy dimensions.asy part.asy
	asy -$(VIEW_OPTION)f pdf $<

clean:
	$(RM) $(drawings)

.PHONY: all clean
