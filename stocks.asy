include "dimensions.asy";
include "part.asy";

Part stock(real length)
{
    Part s;

    s.addpabs(stock_bore_diameter / 2, 0);
    s.addp(y = length);
    s.addp(x = stock_top_diameter / 2 - ferrule_thickness, xabs = true);
    s.addp(y = -ferrule_length);
    s.addp(x = ferrule_thickness);
    s.addpabs(stock_bottom_diameter / 2, stock_notch_height + stock_notch_width);
    s.addp(x = -stock_notch_depth);
    s.addp(y = -stock_notch_width);
    s.addp(x = stock_notch_depth);
    s.addp(y = stock_bottom_corner_radius, yabs = true);
    s.addp(x = -stock_bottom_corner_radius);
    s.arcp(stock_bottom_corner_radius, 0, -90);

    s.length = Dimension(stock_bottom_diameter / 2, 0, length, 5);

    s.xdims.push(Dimension.symmetrical(0, stock_bore_diameter, 25));
    s.xdims.push(Dimension.symmetrical(length, stock_top_diameter, 5));
    s.xdims.push(Dimension.symmetrical(0, stock_bottom_diameter, -10));

    s.ydims.push(Dimension(stock_bottom_diameter / 2, 0, stock_notch_height, -10));
    s.ydims.push(Dimension(stock_bottom_diameter / 2, s.points[8].pos.y, s.points[5].pos.y, -10));
    s.ydims.push(Dimension(stock_bottom_diameter / 2, s.points[3].pos.y, s.points[1].pos.y, -10));

    s.bottom = stock_bore_diameter;
    s.top = stock_bore_diameter;

    return s;
}

stock(bass_stock_length).draw((50, 20), all_labels = false);
stock(tenor_stock_length).draw((105, 20), all_labels = false);
stock(chanter_stock_length).draw((160, 20), all_labels = false);
stock(blowpipe_stock_length).draw((215, 20), all_labels = true);
