unitsize(1mm);

real ferrule_length = 22;
real large_ferrule_diameter = 35;
real small_ferrule_diameter = 32;
real ferrule_thickness = 1;

real stock_bore_diameter = 20;
real stock_bottom_diameter = 40;
real stock_top_diameter = large_ferrule_diameter;
real stock_notch_height = 14;
real stock_notch_width = 6;
real stock_notch_depth = 3;
real stock_bottom_corner_radius = 8;

real bass_stock_length = 180;
real tenor_stock_length = 135;
real chanter_stock_length = 105;
real blowpipe_stock_length = 85;

real reed_seat_depth = 12;
real reed_seat_taper_delta = .5;
real hemp_stop_length = 3;
real hemp_section_length = 25;
real hemp_section_depth = .5;
real mount_length = 23;
real mount_thread_length = 15;
real mount_thread_diameter = 22;
real mount_diameter = 48;
real mount_ring_diameter = 30;
real mount_ring_step = 1;
real mount_beak_radius = 7;
real mount_cove_radius = 4.5;
real mount_bead_radius = 3;
real mount_bead_center_height = 6;
real mount_bead_center_diameter = 28;
real mount_bead_inclination = 8;
real mount_minimum_diameter = 26;

real bass_drone_bottom_bore_diameter = 7.9375;
real bass_drone_bottom_length = 300;
real bass_drone_bottom_slide_length = 98;
real bass_drone_bottom_slide_diameter = 17;
real bass_drone_bottom_tenon_length = 35;
real bass_drone_bottom_tenon_diameter = 18.5;
real bass_drone_bottom_body_min_diameter = 22;
real bass_drone_bottom_body_max_diameter = mount_minimum_diameter;
real bass_drone_bottom_reed_seat_diameter = 10.5;

real tenor_drone_bottom_bore_diameter = 7.9375;
real tenor_drone_bottom_length = 230;
real tenor_drone_bottom_slide_length = 77;
real tenor_drone_bottom_slide_diameter = 16;
real tenor_drone_bottom_tenon_length = 28;
real tenor_drone_bottom_tenon_diameter = 18.5;
real tenor_drone_bottom_body_min_diameter = 21;
real tenor_drone_bottom_body_max_diameter = mount_minimum_diameter;
real tenor_drone_bottom_reed_seat_diameter = 10;

real drone_top_cap_band_width = 5;
real drone_top_outer_cap_height = 11;
real drone_top_inner_cap_height = 6;
real drone_top_inner_cap_bead_radius = 1;
real drone_top_bell_depth = 24;
real drone_top_cord_groove_depth = 8;
real drone_top_cord_groove_height = 7;
real drone_top_cord_groove_cap_height = 6.5;
real drone_top_cord_groove_cap_radius = 3.5;

real bass_drone_top_chamber_diameter = 19.05;
real bass_drone_top_chamber_length = 103;
real bass_drone_top_bore_diameter = 12.7;
real bass_drone_top_length = 295;
real bass_drone_top_bell_top_diameter = 48;
real bass_drone_top_bell_top_length = 26;
real bass_drone_top_ferrule_diameter = large_ferrule_diameter;
real bass_drone_top_shoulder_height = 108;
real bass_drone_top_shoulder_diameter = 36;
real bass_drone_top_neck_diameter = 23;
real bass_drone_top_neck_length = 116;
real bass_drone_top_bell_diameter = 26;
real bass_drone_top_bushing_diameter = 15.5;

real tenor_drone_top_chamber_diameter = 17.4625;
real tenor_drone_top_chamber_length = 84;
real tenor_drone_top_bore_diameter = 12.7;
real tenor_drone_top_length = 202;
real tenor_drone_top_bell_top_diameter = 46;
real tenor_drone_top_bell_top_length = 24;
real tenor_drone_top_ferrule_diameter = small_ferrule_diameter;
real tenor_drone_top_shoulder_height = 81;
real tenor_drone_top_shoulder_diameter = 35;
real tenor_drone_top_neck_diameter = 22;
real tenor_drone_top_neck_length = 54;
real tenor_drone_top_bell_diameter = 22;
real tenor_drone_top_bushing_diameter = 14;

real bass_drone_middle_chamber_diameter = bass_drone_top_chamber_diameter;
real bass_drone_middle_chamber_length = 101;
real bass_drone_middle_bore_diameter = 11.1125;
real bass_drone_middle_length = 297;
real bass_drone_middle_ferrule_diameter = large_ferrule_diameter;
real bass_drone_middle_shoulder_height = 106;
real bass_drone_middle_shoulder_diameter = 37;
real bass_drone_middle_neck_diameter = mount_minimum_diameter;
real bass_drone_middle_slide_length = 97;
real bass_drone_middle_slide_diameter = bass_drone_bottom_slide_diameter;

real blowpipe_bore_diameter = 9.525;
real blowpipe_thread_diameter = 14.2875;
real blowpipe_thread_length = 13;
real blowpipe_tip_diameter = 19;
real blowpipe_base_diameter = mount_minimum_diameter;
real blowpipe_tenon_diameter = 18.5;
real blowpipe_tenon_length = 28;

pair letter_size = (215.9, 279.4);
pair legal_size = (215.9, 355.6);

void makepaper(pair origin = (0,0), pair size = letter_size)
{
    clip(box(origin, shift(origin) * size));
    fixedscaling(origin, shift(origin) * size);
}
