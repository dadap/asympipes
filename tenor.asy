include "dimensions.asy";
include "drones.asy";

draw_drone_bottom(
    (0,0),
    tenor_drone_bottom_bore_diameter,
    tenor_drone_bottom_length,
    tenor_drone_bottom_slide_length,
    tenor_drone_bottom_slide_diameter,
    tenor_drone_bottom_tenon_length,
    tenor_drone_bottom_tenon_diameter,
    tenor_drone_bottom_body_min_diameter,
    tenor_drone_bottom_body_max_diameter,
    tenor_drone_bottom_reed_seat_diameter
);

draw_drone_top(
    (80,0),
    tenor_drone_top_chamber_diameter,
	tenor_drone_top_chamber_length,
	tenor_drone_top_bore_diameter,
	tenor_drone_top_length,
	tenor_drone_top_bell_top_diameter,
	tenor_drone_top_bell_top_length,
	tenor_drone_top_ferrule_diameter,
	tenor_drone_top_shoulder_height,
	tenor_drone_top_shoulder_diameter,
	tenor_drone_top_neck_diameter,
	tenor_drone_top_neck_length,
    tenor_drone_top_bell_diameter
);
