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
        (tenon_radius, tenon_length) --
        (tenon_radius - hemp_section_depth, tenon_length) --
        (tenon_radius - hemp_section_depth, hemp_stop_length) --
        (tenon_radius, hemp_stop_length) --
        (tenon_radius, 0) --
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
    real reed_seat_diameter
)
{
    path outline = drone_bottom_outline(bore_diameter, length, slide_length,
        slide_diameter, tenon_length, tenon_diameter, body_min_diameter,
        body_max_diameter, reed_seat_diameter);

    draw(shift(pos) * outline, p = c.pVisibleEdge);
    draw(shift(pos) * reflect((0,0), (0,1)) * outline, p = c.pVisibleEdge);
    draw(shift(xpart(pos) - reed_seat_diameter / 2, ypart(pos)) * ((0, 0) -- (reed_seat_diameter, 0)), p = c.pLightEdge);
    draw(shift(xpart(pos) - bore_diameter / 2, ypart(pos)) * ((0, length) -- (bore_diameter, length)), p = c.pLightEdge);
}
