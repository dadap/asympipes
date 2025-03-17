include "dimensions.asy";
include "part.asy";

Part mount(
    real hole_diameter
)
{
    Part m;

    m.addpabs(mount_thread_diameter / 2, 0);
    m.addp(y = mount_thread_length);
    m.addp(x = hole_diameter / 2, xabs = true);
    m.addp(y = mount_length, yabs = true);
    m.addp(x = mount_ring_diameter / 2, xabs = true);
    m.addp(x = mount_ring_step / 2, y = -mount_ring_step);
    m.addp(x = mount_diameter / 2 - mount_beak_radius, y = -mount_beak_radius, xabs = true);
    m.arcp(mount_beak_radius, 90, 0);
    m.addp(x = mount_cove_radius / 2, y = -mount_cove_radius);
    m.arcp(mount_cove_radius, 90, 180 - mount_bead_inclination);
    m.addpabs(mount_bead_center_diameter / 2, mount_bead_center_height);
    m.arcp(mount_bead_radius, 90 - mount_bead_inclination, -90 - mount_bead_inclination);
    m.addpabs(mount_minimum_diameter / 2, 0);

    m.length = Dimension(mount_diameter / 2, 0, mount_length, 3);
    m.bottom = mount_thread_diameter;
    m.top = hole_diameter;
    m.x0_alternate_length = true;

    m.xdims.push(Dimension.symmetrical(mount_length, hole_diameter, -5));
    m.xdims.push(Dimension.symmetrical(0, mount_thread_diameter, 2));
    m.xdims.push(Dimension.symmetrical(0, mount_minimum_diameter, -5));
    m.xdims.push(Dimension.symmetrical(mount_length, mount_ring_diameter, 3));

    m.ydims.push(Dimension(mount_bead_center_diameter / 2 + mount_bead_radius,
        mount_bead_center_height + mount_bead_radius,
        mount_bead_center_height - mount_bead_radius, 2));
    m.ydims.push(Dimension(mount_bead_center_diameter / 2 + mount_bead_radius,
        mount_bead_center_height - mount_bead_radius, 0, 2));
    m.ydims.push(Dimension(mount_diameter / 2, mount_thread_length, 0, 3));

    return m;
}
