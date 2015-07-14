# FibonacciBenchmarking.rb
Benchmarking the memoizations of Fibonacci, The aim of the class is to test the difference between
calling the fibonacci recursively with no cashing, and the other is to use memoizations.

The results proof a major difference between the each methods.


The following are the results running on my mac;

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