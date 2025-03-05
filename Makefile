drawings=$(addsuffix .pdf,stocks tenor)

all: $(drawings)

tenor.pdf:: drones.asy

%.pdf: %.asy dimensions.asy
	asy -Vf pdf $<

clean:
	$(RM) $(drawings)

.PHONY: all clean
