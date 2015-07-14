##############################################################################################################
#
# The class calcualte the Fibonacci in two ways, the normal way and using a memoization techinque,
# Then will test the time for calucating each,
#
#
##############################################################################################################

require 'benchmark'

class Fibonacci
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

end

fibth = 40
fib = Fibonacci.new
Benchmark.bmbm do |x|
  x.report("Nomal Fib") {fib.get_fib_old(fibth)}
  x.report("Memo Fib") {fib.get_fib(fibth)}
end
##############################################################################################################
#
#               Rehearsal ---------------------------------------------
#               Nomal Fib  13.670000   0.040000  13.710000 ( 13.897558)
#               Memo Fib    0.620000   0.010000   0.630000 (  0.627383)
#               ----------------------------------- total: 14.340000sec
#
#               user     system      total        real
#               Nomal Fib  13.420000   0.030000  13.450000 ( 13.554259)
#               Memo Fib    0.580000   0.000000   0.580000 (  0.597131)
#
##############################################################################################################