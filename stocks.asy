import CAD;
include "dimensions.asy";

sCAD c = sCAD.Create(0);

path stock_outline(real length)
{
    real bore_radius = stock_bore_diameter / 2;
    real bottom_radius = stock_bottom_diameter / 2;
    real top_radius = stock_top_diameter / 2;

    return
        (bore_radius, 0) --
        (bore_radius, length) --
        (top_radius - ferrule_thickness, length) --
        (top_radius - ferrule_thickness, length - ferrule_length) --
        (top_radius, length - ferrule_length) --
        (bottom_radius, stock_notch_height + stock_notch_width) --
        (bottom_radius - stock_notch_depth, stock_notch_height + stock_notch_width) --
        (bottom_radius - stock_notch_depth, stock_notch_height) --
        (bottom_radius, stock_notch_height) --
        (bottom_radius, stock_bottom_corner_radius) --
        arc((bottom_radius - stock_bottom_corner_radius, stock_bottom_corner_radius),
            r = stock_bottom_corner_radius, angle1 = 0, angle2 = -90) --
        cycle;
}

void draw_stock(real length, pair pos, bool length_label = true, bool all_labels=false)
{
    path outline = stock_outline(length);
    real bore_radius = stock_bore_diameter / 2;
    real x = xpart(pos);
    real y = ypart(pos);

    draw(shift(pos) * outline, p = c.pVisibleEdge);
    draw(shift(pos) * reflect((0,0), (0,1)) * outline, p = c.pVisibleEdge);
    draw(shift(pos) * shift(-bore_radius, 0) *
        box((0, 0),(stock_bore_diameter, length)), p = c.pLightEdge);

    if (length_label || all_labels) {
        c.MeasureParallel(
            L = string(length),
            pFrom = (-bore_radius + x, y),
            pTo = (-bore_radius + x, y + length),
            dblDistance = 15
        );
    }

    if (all_labels) {
        real bore_radius = stock_bore_diameter / 2;
        real top_radius = stock_top_diameter / 2;
        real bottom_radius = stock_bottom_diameter / 2;

        c.MeasureParallel(
            L = string(stock_bore_diameter),
            pFrom = (-bore_radius + x, y),
            pTo = (bore_radius + x, y),
            dblDistance = 25
        );
        c.MeasureParallel(
            L = string(stock_top_diameter),
            pFrom = (-top_radius + x, y + length - ferrule_length),
            pTo = (top_radius + x, y + length - ferrule_length),
            dblDistance = 30
        );
        c.MeasureParallel(
            L = string(stock_bottom_diameter),
            pFrom = (-bottom_radius + x, y + stock_bottom_corner_radius),
            pTo = (bottom_radius + x, y + stock_bottom_corner_radius),
            dblDistance = -20
        );
        c.MeasureParallel(
            L = string(ferrule_length),
            pFrom = (top_radius - ferrule_thickness + x, y + length - ferrule_length),
            pTo = (top_radius - ferrule_thickness + x, y + length),
            dblDistance = -10
        );
        c.MeasureParallel(
            L = string(stock_notch_height + stock_notch_width),
            pFrom = (bottom_radius - stock_notch_depth + x, y),
            pTo = (bottom_radius - stock_notch_depth + x, y + stock_notch_height + stock_notch_width),
            dblDistance = -20
        );
        c.MeasureParallel(
            L = string(stock_notch_width),
            pFrom = (bottom_radius - stock_notch_depth + x, y + stock_notch_height),
            pTo = (bottom_radius - stock_notch_depth + x, y + stock_notch_height + stock_notch_width),
            dblDistance = -10
        );
    }
}

draw_stock(bass_stock_length, (50,20));
draw_stock(tenor_stock_length, (105,20));
draw_stock(chanter_stock_length, (160,20));
draw_stock(blowpipe_stock_length, (215,20), all_labels = true);
