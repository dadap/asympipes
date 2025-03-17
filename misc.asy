include "mount.asy";
include "blowpipe.asy";
include "stocks.asy";
include "drones.asy";

mount(18.5).draw((165,100));
mount(17).draw((165,135));
mount(16).draw((165,170));
label(Label("4x"), (165, 115));
label(Label("2x"), (165, 150));
label(Label("2x"), (165, 185));

blowpipe(200).draw((220,0));

stock(bass_stock_length).draw((0, 0), all_labels = false);
stock(tenor_stock_length).draw((55, 0), all_labels = false);
stock(chanter_stock_length).draw((110, 0), all_labels = false);
stock(blowpipe_stock_length).draw((165, 0), all_labels = true);
label(Label("2x"), (55,5));

drone_top_outer_cap(bass_drone_top_bell_top_diameter).draw((55,185));
drone_top_outer_cap(tenor_drone_top_bell_top_diameter).draw((55,150));
label(Label("2x"), (55,153));

drone_top_inner_cap(
    bass_drone_top_bell_top_diameter,
    bass_drone_top_bushing_diameter
).draw((105,185));
drone_top_inner_cap(
    tenor_drone_top_bell_top_diameter,
    tenor_drone_top_bushing_diameter
).draw((105,150));
label(Label("2x"), (105,153));

makepaper(origin = (-35,-10), size = (letter_size.y, letter_size.x));
