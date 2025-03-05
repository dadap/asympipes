drawings=$(addsuffix .pdf,stocks tenor bass)

all: $(drawings)

tenor.pdf bass.pdf:: drones.asy

%.pdf: %.asy dimensions.asy
	asy -Vf pdf $<

clean:
	$(RM) $(drawings)

.PHONY: all clean
