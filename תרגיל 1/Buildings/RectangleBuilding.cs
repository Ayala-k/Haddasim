namespace Buildings;

internal class RectangleBuilding:Building
{
    public RectangleBuilding(int h, int w) : base(h, w) { }

    public override int Area()
    {
        return Width * Height;
    }
    public override double Perimeter()
    {
        return (Width + Height) * 2;
    }
}
