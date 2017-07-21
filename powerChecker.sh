 #!/bin/bash

    while true
    do
        export DISPLAY=:0.0;
        battery_level=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage:" | grep -Po '[0-9]*'`;
        notAc=`upower -i /org/freedesktop/UPower/devices/line_power_AC0 | grep -E online: | grep -Po no`;
	
	   echo "not connected to ac Power";
        
           echo "Battery Level is now: " $battery_level;
   
        
           if [ "$notAc" = "no" ] &&[ $battery_level -le 50 ] && [ $battery_level -ge 30 ]; then
               notify-send "Power" "You need to consider finding a socket. Remaining battry level is ${battery_level}%." --icon=dialog-information -t 1000
                # sleep 20
             fi
	   
	   if [ $battery_level -le 30 ] && [ $battery_level -ge 15 ]; then
		 notify-send "Power" "Did you find that socket yet? Remaining battry level is ${battery_level}%." --icon=dialog-information -t 1000
                sleep 20
             

	   elif [ $battery_level -le 15 ] && [ $battery_level -ge 7 ]; then
               notify-send "Power" "I warned enough. Next time it's going to be ugly. Remaining battry level is ${battery_level}%." --icon=dialog-information -t 1000
                sleep 20
             
        
	   elif [ $battery_level -le 7 ]; then
		 notify-send "Power" "Hope you're happy now!!  Remaining battry level is too low!! ${battery_level}%." --icon=dialog-information -t 3000
		 
                 sleep 20
		 sudo pm-hibernate
             
	   else
	       echo 'nothing to say'
	   fi
           sleep 300 # 300 seconds or 5 minutes
	
    done
