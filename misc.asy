include "mount.asy";
include "blowpipe.asy";

mount(18.5).draw((0,0));
mount(17).draw((0,75));
mount(16).draw((0,150));

blowpipe(200).draw((60,0));

makepaper(origin = (-85, -45));
