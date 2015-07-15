##############################################################################################################
#
# The class calcualte the Fibonacci in two ways, the normal way and using a memoization techinque,
# Then will test the time for calucating each,
#
#
##############################################################################################################

require 'benchmark'
require 'memoist'

class Fibonacci
  extend Memoist

  def initialize
    @fib_array = [0,1]
  end

  #Using  memoizations technique - where n > 0;
  #The array starts at 0, so all the fibonacci squences start at 1 instead.
  def get_fib(nth)
    return @fib_array[nth] unless !@fib_array.include?(nth)

    #if it doesn't exist calculate it recursively and save it
    @fib_array[nth] = get_fib(nth-1) + get_fib(nth-2)

    return @fib_array[nth]
  end

  def get_fib_old(nth)
    return (nth > 2)? (get_fib_old(nth-1)+get_fib_old(nth-2)) : 1
  end

  def memoist_fib(nth)
    return (nth > 2)? (get_fib_old(nth-1)+get_fib_old(nth-2)) : 1
  end
  memoize :memoist_fib


end

fibth = 35
fib = Fibonacci.new


Benchmark.bmbm do |x|
  x.report ("Normal Fib"){fib.get_fib_old(fibth)}
  x.report ("Cashed Fib"){fib.get_fib(fibth)}
  x.report ("Gem Mem Fib"){fib.memoist_fib(fibth)}
end

###########################################################################
# Rehearsal -----------------------------------------------
#           Normal Fib    1.330000   0.020000   1.350000 (  1.369870)
# Cashed Fib    0.150000   0.000000   0.150000 (  0.154217)
# Gem Mem Fib   1.280000   0.000000   1.280000 (  1.294117)
# -------------------------------------- total: 2.780000sec
#
# user     system      total        real
# Normal Fib    1.250000   0.010000   1.260000 (  1.257070)
# Cashed Fib    0.060000   0.000000   0.060000 (  0.063963)
# Gem Mem Fib   0.000000   0.000000   0.000000 (  0.000027)