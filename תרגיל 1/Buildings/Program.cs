using Buildings;
using static Buildings.CHOICES;
using static Buildings.TRIANGLECHOICE;


Console.WriteLine("Enter 1 for retangle building, 2 for triangle building, 0 to exit");

int width;
int height;
CHOICES choice = (CHOICES)(Convert.ToInt32(Console.ReadLine()));

while (choice != EXIT)
{
    Console.WriteLine("Enter width and height");
    width = Convert.ToInt32(Console.ReadLine());
    height = Convert.ToInt32(Console.ReadLine());

    switch (choice)
    {
        case RECTANGLE:
            RectangleBuilding rectangleBuilding = new RectangleBuilding(height, width);
            if (width == height || width - height > 5 || height - width > 5)
                Console.WriteLine("area: "+rectangleBuilding.Area());
            else
                Console.WriteLine("perimeter: "+rectangleBuilding.Perimeter());
            break;

        case TRIANGLE:
            TriangleBuilding triangleBuilding = new TriangleBuilding(height, width);
            Console.WriteLine("Enter 1 for printing the triangle's perimeter, 2 for printing the triangle");
            TRIANGLECHOICE choice2 = (TRIANGLECHOICE)Convert.ToInt32(Console.ReadLine());
            switch (choice2)
            {
                case TRIANGLEPERIMETER:
                    Console.WriteLine(triangleBuilding.Perimeter());
                    break;
                case PRINTTRIANGLE:
                    triangleBuilding.PrintTriangle();
                    break;
                default:
                    Console.WriteLine("incorrect choice");
                    break;
            }
            break;
        default:
            Console.WriteLine("incorrect choice");
            break;
    }

    Console.WriteLine("Enter 1 for retangle building, 2 for triangle building, 0 to exit");
    choice = (CHOICES)(Convert.ToInt32(Console.ReadLine()));
}
