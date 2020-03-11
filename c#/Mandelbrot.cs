using System;

namespace Mandelbrot {
	class Program {
		static int BAILOUT = 16;
		static int MAX_ITERATIONS = 10000;

		private static int iterate (float x, float y) {
			float cr = y - 0.5f;
			float ci = x;
			float zi = 0.0f;
			float zr = 0.0f;
			int i = 0;
			while (true) {
				i++;
				float temp = zr * zi;
				float zr2 = zr * zr;
				float zi2 = zi * zi;
				zr = zr2 - zi2 + cr;
				zi = temp + temp + ci;
				if (zi2 + zr2 > BAILOUT)
					return i;
				if (i > MAX_ITERATIONS)
					return 0;
			}
		}

		static void Main (string[] args) {
			DateTime d1 = DateTime.Now;
			int x, y;
			string output = "";

			for (y = -99; y < 99; y++) {
				for (x = -99; x < 99; x++) {
					if (iterate (x / 100.0f, y / 100.0f) == 0)
						output += "*";
					else
						output += " ";
				}
				output += "\n";
			}
			DateTime d2 = DateTime.Now;
			long diff = (long)(d2 - d1).TotalMilliseconds;
			Console.WriteLine(output + "\nC# Elapsed " + diff / 1000.0f);
		}
	}
}