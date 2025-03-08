include "dimensions.asy";
include "drones.asy";

draw_drone_bottom(
    (0,0),
    bass_drone_bottom_bore_diameter,
    bass_drone_bottom_length,
    bass_drone_bottom_slide_length,
    bass_drone_bottom_slide_diameter,
    bass_drone_bottom_tenon_length,
    bass_drone_bottom_tenon_diameter,
    bass_drone_bottom_body_min_diameter,
    bass_drone_bottom_body_max_diameter,
    bass_drone_bottom_reed_seat_diameter
);

draw_drone_middle((75,0));

draw_drone_top(
    (150,0),
    bass_drone_top_chamber_diameter,
	bass_drone_top_chamber_length,
	bass_drone_top_bore_diameter,
	bass_drone_top_length,
	bass_drone_top_bell_top_diameter,
	bass_drone_top_bell_top_length,
	bass_drone_top_ferrule_diameter,
	bass_drone_top_shoulder_height,
	bass_drone_top_shoulder_diameter,
	bass_drone_top_neck_diameter,
	bass_drone_top_neck_length,
    bass_drone_top_bell_diameter
);
