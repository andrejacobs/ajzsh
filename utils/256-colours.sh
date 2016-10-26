#!/bin/bash
# Helper for choosing an ansi colour code to use in the terminal
# http://misc.flogisoft.com/bash/tip_colors_and_formatting

for fgbg in 38 48 ; do #Foreground/Background
	for color in {0..256} ; do #Colors
		#Display the color
		printf "\033[${fgbg};5;${color}m ${color}\t\033[0m"
		#Display 10 colors per lines
		if [ $((($color + 1) % 10)) == 0 ] ; then
			echo #New line
		fi
	done
	echo #New line
done
 
exit 0
