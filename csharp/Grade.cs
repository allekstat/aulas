class Grade
{
    static int width;
    static int height;
    static int channels;
    static char[] buffer;
    static void Init(int width, int height, int channels)
    {
        Grade.width = width;
        Grade.height = height;
        Grade.channels = channels;
        Grade.buffer = new char[width * height * channels];
    }
    static void Draw()
    {
        for (int y = 0; y < Grade.height; y++)
        {
            for (int x = 0; x < Grade.width; x++) System.Console.Write(Grade.buffer[y * Grade.width + x * Grade.channels]);
            if (y + 1 < Grade.height) System.Console.WriteLine();
        }
    }
    static void Fill()
    {
        System.Console.Clear();
    }
    static void Pixel(int x, int y) { Grade.buffer[y * Grade.height + x * Grade.channels] = '#'; }
    static void Clear() { System.Console.Clear(); }
    static void Pause() { System.Console.ReadKey(true); }
    static void Main()
    {
        Init(16, 10, 1);
        Pixel(0, 0);
        Pixel(1, 1);
        Pixel(1, 2);
        Pixel(2, 3);
        Pixel(2, 4);
        Pixel(2, 5);
        Draw();
        Pause();
    }
}