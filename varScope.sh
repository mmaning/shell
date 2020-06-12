#!/bin/bash

var=1
func(){
   local localvar=1 # local scope only valid inside of the funciton, recommended use
   var=2      # default gloable scope will overwriten the var defined earlier
   echo "Inside function: localvar=" $localvar
   echo "Inside function: var=" $var
}
func
echo "outside function: localvar=" $localvar
echo "Outside function: var=" $var
