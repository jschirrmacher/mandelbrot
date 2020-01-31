BAILOUT = 16
MAX_ITERATIONS = 10000

class Mandelbrot
	
	def initialize
		output = ''
		for y in -99...99 do
			for x in -99...99 do
				i = iterate(x/100.0,y/100.0)
				if (i == 0)
					output += "*"
				else
					output += " "
				end
			end
			output += "\n"
		end
		puts output
	end

	def iterate(x,y)
		cr = y-0.5
		ci = x
		zi = 0.0
		zr = 0.0
		i = 0
		
		while(1)
			i += 1
			temp = zr * zi
			zr2 = zr * zr
			zi2 = zi * zi
			zr = zr2 - zi2 + cr
			zi = temp + temp + ci
			return i if (zi2 + zr2 > BAILOUT)
			return 0 if (i > MAX_ITERATIONS)
		end
	
	end

end

time = Time.now
Mandelbrot.new
puts
puts "Ruby #{RUBY_VERSION} Elapsed %f" % (Time.now - time)
