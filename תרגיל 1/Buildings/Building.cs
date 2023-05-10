namespace Buildings;

internal abstract class Building
{
    public Building(int h, int w)
    {
        Height = h;
        Width = w;
    }

    public abstract int Area();
    public abstract double Perimeter();

    protected int Height { get; set; }
    protected int Width { get; set; }
}