 
# functional programming


library(tidyverse)


# === basic functions

my_fn = function(x){
  3**x
}
my_fn(3)

my_fun.2 = function(x,y){
  x + y
}
my_fun.2(2,3)


my_fun.3 = function(x){
  if( x > 10){ stop("x is over limit") 
  }
  else if(x > 5){ return(x*2)
  }
  
  y = x - 1 # outside the function
  for (i in 1:5) {
    y = y*2
  }
  y
}
my_fun.3(11)
my_fun.3(4)


my_fn.4 = function(x, y=3){
  x * y
}
my_fn.4(3)
my_fn.4(4,6)


my_fn.5 = function(){
  x = round( runif(10, min = 3, max= 50) ) 
  y = round( rnorm(10, mean = 17, sd=2 ) ) 
  z = x ** y
  # print(z)
  print(x)
  print(y)
  s = sample(x, 2, replace = T)
  sy = sample()
  return(s)
}

my_fn.5()

n = 1:5
map_dbl(n, function(x){ x * 2})

m = beepr::beep(sound = 2)
for (i in n) {
  
  beepr::beep(sound = i)
  print(i)
}







