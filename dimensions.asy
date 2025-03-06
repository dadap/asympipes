unitsize(1mm);

real ferrule_length = 22;
real large_ferrule_diameter = 35;
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
real mount_length = 22;
real mount_thread_length = 15;
real mount_thread_diameter = 22;

real bass_drone_bottom_bore_diameter = 7.9375;
real bass_drone_bottom_length = 300;
real bass_drone_bottom_slide_length = 98;
real bass_drone_bottom_slide_diameter = 17;
real bass_drone_bottom_tenon_length = 35;
real bass_drone_bottom_tenon_diameter = 18.5;
real bass_drone_bottom_body_min_diameter = 22;
real bass_drone_bottom_body_max_diameter = 27;
real bass_drone_bottom_reed_seat_diameter = 10.5;

real tenor_drone_bottom_bore_diameter = 7.9375;
real tenor_drone_bottom_length = 230;
real tenor_drone_bottom_slide_length = 77;
real tenor_drone_bottom_slide_diameter = 16;
real tenor_drone_bottom_tenon_length = 28;
real tenor_drone_bottom_tenon_diameter = 18.5;
real tenor_drone_bottom_body_min_diameter = 21;
real tenor_drone_bottom_body_max_diameter = 26;
real tenor_drone_bottom_reed_seat_diameter = 10;

/* Helper functions for converting measurements from mm to inches: the bore
 * diameter measurements are all inch-based since the measurements I took on
 * my pipes map more convincingly to round-ish fractional inch based figures
 * than round-ish metric ones, and it was therefore more convenient to source
 * suitably sized reamers from fractional inch measurements than metric. */

pair fractional_inches(real mm)
{
    int denominator = 128;
    int numerator = (int) (denominator * mm / 25.4);

    while (numerator % 2 == 0) {
        numerator = quotient(numerator, 2);
        denominator = quotient(denominator, 2);
    }

    return (numerator, denominator);
}

string inch_label(real mm)
{
    pair inches = fractional_inches(mm);
    int numerator = (int) inches.x;
    int denominator = (int) inches.y;
    string whole = "";
    string part = string(numerator % denominator) + "/" + string(denominator);

    if (numerator > denominator) {
        whole = string(numerator # denominator) + " ";
    }

    return whole + part + " in.";
}
