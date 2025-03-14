import CAD;

struct Dimension {
    real distance;
    real p1;
    real p2;
    real labeldistance;
    bool inches;

    void operator init (
        real distance,
        real p1,
        real p2,
        real labeldistance,
        bool inches = false
    )
    {
        this.distance = distance;
        this.p1 = p1;
        this.p2 = p2;
        this.labeldistance = labeldistance;
        this.inches = inches;
    }

    static Dimension symmetrical(
        real distance,
        real l,
        real labeldistance,
        bool inches = false
    )
    {
        return Dimension(distance, -l / 2, l / 2, labeldistance, inches);
    }

    Label label(real distance)
    {
    /* Format label in mm (default) or inches: the bore diameter measurements
     * are all inch-based since the measurements I took on my pipes map more
     * convincingly to round-ish fractional inch based figures than round-ish
     * metric ones, and it was therefore more convenient to source suitably
     * sized reamers from fractional inch measurements than metric. */
        string s;
        real mm = abs(p2 - p1);
        int dd = distance < 0 ? -5 : 0;

        if (inches) {
            int denominator = 128;
            int numerator = (int) (denominator * mm / 25.4);
            string whole = "";
            string part;

            while (numerator % 2 == 0) {
                numerator #= 2;
                denominator #= 2;
            }

            if (numerator > denominator) {
                whole = string(numerator # denominator) + " ";
            }

            part = string(numerator % denominator) + "/" + string(denominator);

            s = whole + part + " in.";
        } else {
            s = string(mm);
        }

        return shift(inches ? (0,-9 + dd) : (0,-2 + dd)) * scale(.8) * Label(s);
    }
};

struct Point {
    pair pos;
    real radius;
    real a1;
    real a2;
    bool curve;

    void operator init (
        pair pos,
        real radius = 0,
        real a1 = 0,
        real a2 = 0,
        bool curve = false
    )
    {
        this.pos = pos;
        this.radius = radius;
        this.a1 = a1;
        this.a2 = a2;
        this.curve = curve;
    }

    path path()
    {
        if (radius > 0) {
            return arc(pos, radius, a1, a2);
        }

        return pos;
    }
}

struct Part {
    Point[] points;
    Dimension[] xdims;
    Dimension[] ydims;
    Dimension length;
    real bottom;
    real top;

    Point tail()
    {
        return points[points.length - 1];
    }

    void addp(real x = 0, real y = 0, bool xabs = false, bool yabs = false)
    {
        pair origin = points.length > 0 ? tail().pos : (0,0);
        Point p = Point((xabs ? x : x + origin.x, yabs ? y : y + origin.y));

        points.push(p);
    }

    void addpabs(real x, real y)
    {
        points.push(Point((x,y)));
    }

    void arcp(real radius, real a1, real a2)
    {
        tail().radius = radius;
        tail().a1 = a1;
        tail().a2 = a2;
    }

    void draw(pair pos, bool length_label = true, bool all_labels = true)
    {
        sCAD c = sCAD.Create(0);
        path outline;

        for(int i = 0; i < points.length; i += 1) {
            if (!points[i].curve && i < points.length - 1 && points[i+1].curve) {
                outline = outline -- points[i].path() -- points[i].path();
            } else if (points[i].curve && i < points.length - 1) {
                outline = outline .. points[i].path() .. points[i+1].path();
                i += 1;
            } else {
                outline = outline -- points[i].path();
            }
        }

        outline = outline -- cycle;

        draw(shift(pos) * outline, p = c.pVisibleEdge);
        draw(shift(pos) * reflect((0,0),(0,1)) * outline, p = c.pVisibleEdge);
        draw(shift(pos.x - bottom / 2, pos.y) * ((0,0) -- (bottom, 0)),
            p = c.pLightEdge);
        draw(shift(pos.x - top / 2, pos.y + length.p2) * ((0,0) -- (top, 0)),
            p = c.pLightEdge);

        if (length_label || all_labels) {
            c.MeasureParallel(
                L = length.label(length.labeldistance),
                pFrom = shift(pos) * (-length.distance, length.p1),
                pTo = shift(pos) * (-length.distance, length.p2),
                dblDistance = length.labeldistance
            );
        }

        if (all_labels) {
            for (Dimension d : xdims) {
                c.MeasureParallel(
                    L = d.label(d.labeldistance),
                    pFrom = shift(pos) * (d.p1, d.distance),
                    pTo = shift(pos) * (d.p2, d.distance),
                    dblDistance = d.labeldistance
                );
            }
            for (Dimension d : ydims) {
                c.MeasureParallel(
                    L = d.label(d.labeldistance),
                    pFrom = shift(pos) * (d.distance, d.p1),
                    pTo = shift(pos) * (d.distance, d.p2),
                    dblDistance = d.labeldistance
                );
            }
        }
    }
};
