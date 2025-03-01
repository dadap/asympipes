drawings=$(addsuffix .pdf,stocks)

all: $(drawings)

%.pdf: %.asy dimensions.asy
	asy -Vf pdf $<

clean:
	$(RM) $(drawings)

.PHONY: all clean
