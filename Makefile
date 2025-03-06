drawings=$(addsuffix .pdf,stocks tenor bass)

all: $(drawings)

tenor.pdf bass.pdf:: drones.asy

VIEW ?=

ifeq ($(VIEW),)
  VIEW_OPTION=
else
  VIEW_OPTION=V
endif

%.pdf: %.asy dimensions.asy
	asy -$(VIEW_OPTION)f pdf $<

clean:
	$(RM) $(drawings)

.PHONY: all clean
