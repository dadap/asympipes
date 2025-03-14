include "dimensions.asy";
include "part.asy";

Part blowpipe(
    real length
)
{
    Part b;

    b.addpabs(blowpipe_bore_diameter / 2, 0);
    b.addp(y = length);
    b.addp(x = blowpipe_thread_diameter / 2, xabs = true);
    b.addp(y = -blowpipe_thread_length);
    b.addp(x = blowpipe_tip_diameter / 2, xabs = true);
    b.addp(y = -1);
    b.tail().curve = true;
    b.addpabs(blowpipe_base_diameter / 2, blowpipe_tenon_length + mount_length);
    b.addp(x = mount_thread_diameter / 2, xabs = true);
    b.addp(y = -mount_thread_length);
    b.addp(x = blowpipe_tenon_diameter / 2, xabs = true);
    b.addp(y = blowpipe_tenon_length - hemp_stop_length, yabs = true);
    b.addp(x = -hemp_section_depth);
    b.addp(y = hemp_stop_length, yabs = true);
    b.addp(x = hemp_section_depth);
    b.addp(y = 0, yabs = true);

    b.length = Dimension(blowpipe_base_diameter / 2, 0, length, 3);

    return b;
}
