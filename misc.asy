include "mount.asy";
include "blowpipe.asy";
include "stocks.asy";

mount(18.5).draw((55,150));
mount(17).draw((115,150));
mount(16).draw((175,150));

blowpipe(200).draw((220,0));

stock(bass_stock_length).draw((0, 0), all_labels = false);
stock(tenor_stock_length).draw((55, 0), all_labels = false);
stock(chanter_stock_length).draw((110, 0), all_labels = false);
stock(blowpipe_stock_length).draw((165, 0), all_labels = true);

makepaper(origin = (-35,-10), size = (letter_size.y, letter_size.x));
