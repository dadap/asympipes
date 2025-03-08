import CAD;

path drone_bottom_outline(
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
    real bore_radius = bore_diameter / 2;
    real slide_radius = slide_diameter / 2;
    real tenon_radius = tenon_diameter / 2;
    real body_min_radius = body_min_diameter / 2;
    real body_max_radius = body_max_diameter / 2;
    real reed_seat_radius = reed_seat_diameter / 2;
    real reed_seat_taper_radius = reed_seat_radius - reed_seat_taper_delta;
    real mount_thread_radius = mount_thread_diameter / 2;
    real body_length = length - slide_length - tenon_length;

    return (reed_seat_radius, 0) --
        (reed_seat_radius - reed_seat_taper_delta, reed_seat_depth) --
        (bore_radius, reed_seat_depth) --
        (bore_radius, length) --
        (slide_radius, length) --
        (slide_radius, length - hemp_stop_length) --
        (slide_radius - hemp_section_depth, length - hemp_stop_length) --
        (slide_radius - hemp_section_depth, length - hemp_stop_length - hemp_section_length) --
        (slide_radius, length - hemp_stop_length - hemp_section_length) --
        (slide_radius, length - slide_length - mount_length + mount_thread_length) --
        (mount_thread_radius, length - slide_length - mount_length + mount_thread_length) --
        (mount_thread_radius, length - slide_length - mount_length) --
        (body_max_radius, length - slide_length - mount_length) ..
        (body_min_radius, tenon_length + body_length / 2) ..
        (body_max_radius, tenon_length + mount_length) --
        (mount_thread_radius, tenon_length + mount_length) --
        (mount_thread_radius, tenon_length + mount_length - mount_thread_length) --
        (tenon_radius, tenon_length + mount_length - mount_thread_length) --
        (tenon_radius, tenon_length - hemp_stop_length) --
        (tenon_radius - hemp_section_depth, tenon_length - hemp_stop_length) --
        (tenon_radius - hemp_section_depth, hemp_stop_length) --
        (tenon_radius, hemp_stop_length) --
        (tenon_radius, 0) --
        cycle;
}

path drone_top_outline(
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
    real chamber_radius = chamber_diameter / 2;
    real bore_radius = bore_diameter / 2;
    real bell_radius = bell_diameter / 2;
    real bell_top_radius = bell_top_diameter / 2;
    real cord_groove_cap_bottom = shoulder_height + neck_length;
    real cord_groove_cap_top = cord_groove_cap_bottom +
         drone_top_cord_groove_cap_height * 2 + drone_top_cord_groove_height;
    real neck_radius = neck_diameter / 2;
    real shoulder_radius = shoulder_diameter / 2;
    real ferrule_radius = ferrule_diameter / 2;

    return (chamber_radius, 0) --
        (chamber_radius, chamber_length) --
        (bore_radius, chamber_length) --
        (bore_radius, length - drone_top_inner_cap_height - drone_top_bell_depth) ..
        {up}(bell_radius, length - drone_top_outer_cap_height) ..
        (bell_radius, length - drone_top_inner_cap_height) --
        (bell_top_radius - drone_top_cap_band_width * 2, length - drone_top_inner_cap_height) --
        (bell_top_radius - drone_top_cap_band_width * 2, length) --
        (bell_top_radius - drone_top_cap_band_width, length) --
        (bell_top_radius - drone_top_cap_band_width, length - drone_top_outer_cap_height) --
        (bell_top_radius, length - drone_top_outer_cap_height) --
        (bell_top_radius, length - bell_top_length){(-1,-1)} ..
        (neck_radius, cord_groove_cap_top){up} --
        (neck_radius + drone_top_cord_groove_depth - drone_top_cord_groove_cap_radius, cord_groove_cap_top) --
        arc((neck_radius + drone_top_cord_groove_depth - drone_top_cord_groove_cap_radius,
             cord_groove_cap_top - drone_top_cord_groove_cap_radius),
            r = drone_top_cord_groove_cap_radius, angle1=90, angle2=0) --
        (neck_radius + drone_top_cord_groove_depth, cord_groove_cap_top - drone_top_cord_groove_cap_radius) --
        (neck_radius + drone_top_cord_groove_depth, cord_groove_cap_top - drone_top_cord_groove_cap_height) --
        (neck_radius, cord_groove_cap_top - drone_top_cord_groove_cap_height) --
        (neck_radius, cord_groove_cap_bottom + drone_top_cord_groove_cap_height) --
        (neck_radius + drone_top_cord_groove_depth, cord_groove_cap_bottom + drone_top_cord_groove_cap_height) --
        (neck_radius + drone_top_cord_groove_depth, cord_groove_cap_bottom + drone_top_cord_groove_cap_radius) --
        arc((neck_radius + drone_top_cord_groove_depth - drone_top_cord_groove_cap_radius,
             cord_groove_cap_bottom + drone_top_cord_groove_cap_radius),
            r = drone_top_cord_groove_cap_radius, angle1=0, angle2=-90) --
        (neck_radius + drone_top_cord_groove_depth - drone_top_cord_groove_cap_radius, cord_groove_cap_bottom) --
        (neck_radius, cord_groove_cap_bottom){down} ..
        (shoulder_radius, shoulder_height) --
        (ferrule_radius, ferrule_length) --
        (ferrule_radius - ferrule_thickness, ferrule_length) --
        (ferrule_radius - ferrule_thickness, 0) --
        cycle;
}

path drone_middle_outline()
{
    real chamber_radius = bass_drone_middle_chamber_diameter / 2;
    real bore_radius = bass_drone_middle_bore_diameter / 2;
    real slide_radius = bass_drone_middle_slide_diameter / 2;
    real mount_thread_radius = mount_thread_diameter / 2;
    real neck_radius = bass_drone_neck_diameter / 2;
    real shoulder_radius = bass_drone_middle_shoulder_diameter / 2;
    real ferrule_radius = bass_drone_middle_ferrule_diameter / 2;

    return (chamber_radius, 0) --
        (chamber_radius, bass_drone_middle_chamber_length) --
        (bore_radius, bass_drone_middle_chamber_length) --
        (bore_radius, bass_drone_middle_length) --
        (slide_radius, bass_drone_middle_length) --
        (slide_radius, bass_drone_middle_length - hemp_stop_length) --
        (slide_radius - hemp_section_depth, bass_drone_middle_length - hemp_stop_length) --
        (slide_radius - hemp_section_depth, bass_drone_middle_length - hemp_stop_length - hemp_section_length) --
        (slide_radius, bass_drone_middle_length - hemp_stop_length - hemp_section_length) --
        (slide_radius, bass_drone_middle_length - bass_drone_middle_slide_length - mount_length + mount_thread_length) --
        (mount_thread_radius, bass_drone_middle_length - bass_drone_middle_slide_length - mount_length + mount_thread_length) --
        (mount_thread_radius, bass_drone_middle_length - bass_drone_middle_slide_length - mount_length) --
        (neck_radius, bass_drone_middle_length - bass_drone_middle_slide_length - mount_length){down} ..
        (shoulder_radius, bass_drone_middle_shoulder_height) --
        (ferrule_radius, ferrule_length) --
        (ferrule_radius - ferrule_thickness, ferrule_length) --
        (ferrule_radius - ferrule_thickness, 0) --
        cycle;
}

sCAD c = sCAD.Create(0);

void draw_drone_bottom(
    pair pos,
    real bore_diameter,
    real length,
    real slide_length,
    real slide_diameter,
    real tenon_length,
    real tenon_diameter,
    real body_min_diameter,
    real body_max_diameter,
    real reed_seat_diameter,
    bool labels = true
)
{
    path outline = drone_bottom_outline(bore_diameter, length, slide_length,
        slide_diameter, tenon_length, tenon_diameter, body_min_diameter,
        body_max_diameter, reed_seat_diameter);
    real bore_radius = bore_diameter / 2;
    real slide_radius = slide_diameter / 2;
    real body_radius = body_max_diameter / 2;
    real tenon_radius = tenon_diameter / 2;
    real mount_no_thread_length = mount_length - mount_thread_length;
    real upper_mount_thread_pos = length - slide_length - mount_no_thread_length;
    real lower_mount_thread_pos = tenon_length + mount_no_thread_length;
    real mount_thread_radius = mount_thread_diameter / 2;

    draw(shift(pos) * outline, p = c.pVisibleEdge);
    draw(shift(pos) * reflect((0,0), (0,1)) * outline, p = c.pVisibleEdge);
    draw(shift(xpart(pos) - reed_seat_diameter / 2, ypart(pos)) * ((0, 0) -- (reed_seat_diameter, 0)), p = c.pLightEdge);
    draw(shift(xpart(pos) - bore_diameter / 2, ypart(pos)) * ((0, length) -- (bore_diameter, length)), p = c.pLightEdge);

    if (labels) {
        c.MeasureParallel(
            L = inch_label(bore_diameter),
            pFrom = (-bore_radius + pos.x, length + pos.y),
            pTo = (bore_radius + pos.x, length + pos.y),
            dblDistance = 5
        );

        c.MeasureParallel(
            L = string(slide_diameter),
            pFrom = (-slide_radius + pos.x, length + pos.y),
            pTo = (slide_radius + pos.x, length + pos.y),
            dblDistance = 25
        );

        c.MeasureParallel(
            L = string(tenon_diameter),
            pFrom = (-tenon_radius + pos.x, pos.y),
            pTo = (tenon_radius + pos.x, pos.y),
            dblDistance = -10
        );

        c.MeasureParallel(
            L = string(mount_thread_diameter),
            pFrom = (-mount_thread_radius + pos.x, pos.y),
            pTo = (mount_thread_radius + pos.x, pos.y),
            dblDistance = -20
        );

        c.MeasureParallel(
            L = string(body_max_diameter),
            pFrom = (-body_radius + pos.x, pos.y),
            pTo = (body_radius + pos.x, pos.y),
            dblDistance = -30
        );

        c.MeasureParallel(
            L = string(slide_length + mount_no_thread_length),
            pFrom = (body_radius + pos.x, length + pos.y),
            pTo = (body_radius + pos.x, upper_mount_thread_pos + pos.y),
            dblDistance = 5
        );

        c.MeasureParallel(
            L = string(lower_mount_thread_pos),
            pFrom = (body_radius + pos.x, lower_mount_thread_pos + pos.y),
            pTo = (body_radius + pos.x, pos.y),
            dblDistance = 5
        );

        c.MeasureParallel(
            L = string(mount_thread_length),
            pFrom = (body_radius + pos.x, lower_mount_thread_pos + mount_thread_length + pos.y),
            pTo = (body_radius + pos.x, lower_mount_thread_pos + pos.y),
            dblDistance = 5
        );

        c.MeasureParallel(
            L = string(length),
            pFrom = (-body_radius + pos.x, pos.y),
            pTo = (-body_radius + pos.x, length + pos.y),
            dblDistance = 5
        );
    }
}

void draw_drone_top(
    pair pos,
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
    path outline = drone_top_outline(chamber_diameter, chamber_length, bore_diameter,
        length, bell_top_diameter, bell_top_length, ferrule_diameter, shoulder_height,
        shoulder_diameter, neck_diameter, neck_length, bell_diameter);
    real chamber_radius = chamber_diameter / 2;
    real bore_radius = bore_diameter / 2;
    real top_cap_radius = bell_top_diameter / 2 - drone_top_cap_band_width;

    draw(shift(pos) * outline, p = c.pVisibleEdge);
    draw(shift(pos) * reflect((0,0), (0,1)) * outline, p = c.pVisibleEdge);

    draw(shift(pos.x - chamber_radius, pos.y) * ((0, 0) -- (chamber_diameter, 0)), p = c.pLightEdge);
    draw(shift(pos.x, pos.y) * ((-top_cap_radius, length) -- (top_cap_radius, length)), p = c.pLightEdge);
}

void draw_drone_middle(pair pos)
{
    path outline = drone_middle_outline();
    real chamber_radius = bass_drone_middle_chamber_diameter / 2;
    real bore_radius = bass_drone_middle_bore_diameter / 2;

    draw(shift(pos) * outline, p = c.pVisibleEdge);
    draw(shift(pos) * reflect((0,0), (0,1)) * outline, p = c.pVisibleEdge);

    draw(shift(pos.x - chamber_radius, pos.y) * ((0,0) -- (bass_drone_middle_chamber_diameter, 0)), p = c.pLightEdge);
    draw(shift(pos.x - bore_radius, pos.y + bass_drone_middle_length) * ((0,0) -- (bass_drone_middle_bore_diameter, 0)), p = c.pLightEdge);
}
