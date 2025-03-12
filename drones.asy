import CAD;
include "part.asy";

Part drone_bottom(
    real bore_diameter,
    real length,
    real slide_length,
    real slide_diameter,
    real tenon_length,
    real tenon_diameter,
    real body_min_diameter,
    real body_max_diameter,
    real reed_seat_diameter
)
{
    real body_length = length - slide_length - tenon_length;

    Part d;

    d.addpabs(reed_seat_diameter / 2, 0);
    d.addp(x = -reed_seat_taper_delta, y = reed_seat_depth);
    d.addp(x = bore_diameter / 2, xabs = true);
    d.addp(y = length, yabs = true);
    d.addp(x = slide_diameter / 2, xabs = true);
    d.addp(y = -hemp_stop_length);
    d.addp(x = -hemp_section_depth);
    d.addp(y = -hemp_section_length);
    d.addp(x = hemp_section_depth);
    d.addpabs(slide_diameter / 2, length - slide_length - mount_length + mount_thread_length);
    d.addp(x = mount_thread_diameter / 2, xabs = true);
    d.addp(y = -mount_thread_length);
    d.addp(x = body_max_diameter / 2, xabs = true);
    d.addpabs(body_min_diameter / 2, tenon_length + body_length / 2);
    d.tail().curve = true;
    d.addpabs(body_max_diameter / 2, tenon_length + mount_length);
    d.addp(x = mount_thread_diameter / 2, xabs = true);
    d.addp(y = -mount_thread_length);
    d.addp(x = tenon_diameter / 2, xabs = true);
    d.addp(y = tenon_length - hemp_stop_length, yabs = true);
    d.addp(x = -hemp_section_depth);
    d.addp(y = hemp_stop_length, yabs = true);
    d.addp(x = hemp_section_depth);
    d.addp(y = 0, yabs = true);

    d.length = Dimension(body_max_diameter / 2, 0, length, 5);
    d.bottom = reed_seat_diameter;
    d.top = bore_diameter;

    d.xdims.push(Dimension.symmetrical(length, bore_diameter, 5, inches = true));
    d.xdims.push(Dimension.symmetrical(length, slide_diameter, 25));
    d.xdims.push(Dimension.symmetrical(0, tenon_diameter, -15));
    d.xdims.push(Dimension.symmetrical(0, mount_thread_diameter, -25));
    d.xdims.push(Dimension.symmetrical(0, body_max_diameter, -35));

    d.ydims.push(Dimension(body_max_diameter / 2, length, d.points[9].pos.y, 5));
    d.ydims.push(Dimension(body_max_diameter / 2, d.points[15].pos.y, d.points[16].pos.y, 5));
    d.ydims.push(Dimension(body_max_diameter / 2, d.points[16].pos.y, 0, 5));

    return d;
}

Part drone_top(
    real chamber_diameter,
	real chamber_length,
	real bore_diameter,
	real length,
	real bell_top_diameter,
	real bell_top_length,
	real ferrule_diameter,
	real shoulder_height,
	real shoulder_diameter,
	real neck_diameter,
	real neck_length,
    real bell_diameter
)
{
    Part d;

    real cord_groove_cap_bottom = shoulder_height + neck_length;
    real cord_groove_cap_top = cord_groove_cap_bottom +
         drone_top_cord_groove_cap_height * 2 + drone_top_cord_groove_height;

    d.addpabs(chamber_diameter / 2, 0);
    d.addp(y = chamber_length);
    d.addp(x = bore_diameter / 2, xabs = true);
    d.addp(y = length - drone_top_inner_cap_height - drone_top_bell_depth, yabs = true);
    d.addpabs(bell_diameter / 2, length - drone_top_outer_cap_height);
    d.tail().curve = true;
    d.addpabs(bell_diameter / 2, length - drone_top_inner_cap_height);
    d.addp(x = bell_top_diameter / 2 - drone_top_cap_band_width * 2, xabs = true);
    d.addp(y = drone_top_inner_cap_height);
    d.addp(x = drone_top_cap_band_width);
    d.addp(y = -drone_top_outer_cap_height);
    d.addp(x = drone_top_cap_band_width);
    d.addp(y = length - bell_top_length, yabs = true);
    d.addp(x = -1, y = -1);
    d.tail().curve = true;
    d.addpabs(neck_diameter / 2, cord_groove_cap_top);
    d.addp(x = drone_top_cord_groove_depth - drone_top_cord_groove_cap_radius);
    d.addp(y = -drone_top_cord_groove_cap_radius);
    d.arcp(drone_top_cord_groove_cap_radius, 90, 0);
    d.addp(x = drone_top_cord_groove_cap_radius);
    d.addp(y = cord_groove_cap_top - drone_top_cord_groove_cap_height, yabs = true);
    d.addp(x = -drone_top_cord_groove_depth);
    d.addp(y = -drone_top_cord_groove_height);
    d.addp(x = drone_top_cord_groove_depth);
    d.addp(y = drone_top_cord_groove_cap_radius - drone_top_cord_groove_cap_height);
    d.addp(x = -drone_top_cord_groove_cap_radius);
    d.arcp(drone_top_cord_groove_cap_radius, 0, -90);
    d.addp(x = neck_diameter / 2, y = -drone_top_cord_groove_cap_radius, xabs = true);
    d.addp(y = -1);
    d.tail().curve = true;
    d.addpabs(shoulder_diameter / 2, shoulder_height);
    d.addpabs(ferrule_diameter / 2, ferrule_length);
    d.addp(x = -ferrule_thickness);
    d.addp(y = -ferrule_length);

    d.length = Dimension(bell_top_diameter / 2, 0, length, 5);
    d.bottom = chamber_diameter;
    d.top = bell_top_diameter - drone_top_cap_band_width * 2;

    d.xdims.push(Dimension.symmetrical(0, chamber_diameter, -15, inches = true));
    d.xdims.push(Dimension.symmetrical(0, ferrule_diameter, -25));
    d.xdims.push(Dimension.symmetrical(0, shoulder_diameter, -35));
    d.xdims.push(Dimension.symmetrical(length - drone_top_bell_depth - drone_top_inner_cap_height, bore_diameter, 5, inches = true));
    d.xdims.push(Dimension.symmetrical(length, bell_diameter, 5));
    d.xdims.push(Dimension.symmetrical(length, bell_top_diameter, 25));
    d.xdims.push(Dimension(length, bell_top_diameter / 2 - drone_top_cap_band_width * 2, bell_top_diameter / 2 - drone_top_cap_band_width, 5));
    d.xdims.push(Dimension(length, bell_top_diameter / 2 - drone_top_cap_band_width, bell_top_diameter / 2, 5));
    d.xdims.push(Dimension.symmetrical(cord_groove_cap_top, neck_diameter + drone_top_cord_groove_depth * 2, 5));
    d.xdims.push(Dimension.symmetrical(cord_groove_cap_bottom + drone_top_cord_groove_cap_height, neck_diameter, 3));

    d.ydims.push(Dimension(bore_diameter / 2, 0, chamber_length, 0));
    d.ydims.push(Dimension(bell_top_diameter / 2, ferrule_length, 0, 5));
    d.ydims.push(Dimension(bell_top_diameter / 2, shoulder_height, ferrule_length, 5));
    d.ydims.push(Dimension(bell_top_diameter / 2, length, length - drone_top_outer_cap_height, 5));
    d.ydims.push(Dimension(bell_top_diameter / 2, length - drone_top_outer_cap_height, length - bell_top_length, 5));
    d.ydims.push(Dimension(bell_top_diameter / 2, length - bell_top_length, cord_groove_cap_top, 5));
    d.ydims.push(Dimension(bell_top_diameter / 2, cord_groove_cap_top, cord_groove_cap_top - drone_top_cord_groove_cap_height, 5));
    d.ydims.push(Dimension(bell_top_diameter / 2, cord_groove_cap_top - drone_top_cord_groove_cap_height, cord_groove_cap_top - drone_top_cord_groove_cap_height - drone_top_cord_groove_depth, 5));
    d.ydims.push(Dimension(bell_diameter / 2, length - drone_top_inner_cap_height, length, 5));

    return d;
}

Part drone_middle()
{
    Part d;

    d.addpabs(bass_drone_middle_chamber_diameter / 2, 0);
    d.addp(y = bass_drone_middle_chamber_length);
    d.addp(x = bass_drone_middle_bore_diameter / 2, xabs = true);
    d.addp(y = bass_drone_middle_length, yabs = true);
    d.addp(x = bass_drone_middle_slide_diameter / 2, xabs = true);
    d.addp(y = -hemp_stop_length);
    d.addp(x = -hemp_section_depth);
    d.addp(y = -hemp_section_length);
    d.addp(x = hemp_section_depth);
    d.addp(y = bass_drone_middle_length - bass_drone_middle_slide_length - mount_length + mount_thread_length, yabs = true);
    d.addp(x = mount_thread_diameter / 2, xabs = true);
    d.addp(y = -mount_thread_length);
    d.addp(x = bass_drone_neck_diameter / 2, xabs = true);
    d.addp(y = -1);
    d.tail().curve = true;
    d.addpabs(bass_drone_middle_shoulder_diameter / 2, y = bass_drone_middle_shoulder_height);
    d.addpabs(bass_drone_middle_ferrule_diameter / 2, y = ferrule_length);
    d.addp(x = -ferrule_thickness);
    d.addp(y = -ferrule_length);

    d.length = Dimension(bass_drone_middle_shoulder_diameter / 2, 0, bass_drone_middle_length, 5);
    d.bottom = bass_drone_middle_chamber_diameter;
    d.top = bass_drone_middle_bore_diameter;

    d.xdims.push(Dimension.symmetrical(0, bass_drone_middle_chamber_diameter, -15, inches = true));
    d.xdims.push(Dimension.symmetrical(0, bass_drone_middle_ferrule_diameter, -25));
    d.xdims.push(Dimension.symmetrical(0, bass_drone_middle_shoulder_diameter, -35));
    d.xdims.push(Dimension.symmetrical(bass_drone_middle_length, bass_drone_middle_bore_diameter, 5, inches = true));
    d.xdims.push(Dimension.symmetrical(bass_drone_middle_length, bass_drone_middle_slide_diameter, 25));

    d.ydims.push(Dimension(bass_drone_middle_bore_diameter / 2, 0, bass_drone_middle_chamber_length, 0));
    d.ydims.push(Dimension(bass_drone_middle_shoulder_diameter / 2, ferrule_length, 0, 5));
    d.ydims.push(Dimension(bass_drone_middle_shoulder_diameter / 2, bass_drone_middle_shoulder_height, ferrule_length, 5));
    d.ydims.push(Dimension(bass_drone_middle_shoulder_diameter / 2, bass_drone_middle_length, bass_drone_middle_length - bass_drone_middle_slide_length - mount_length + mount_thread_length, 5));

    return d;
}
