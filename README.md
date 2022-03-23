# StimuStat

StimuStat is a design application that demonstrates changes in temperature throughout the design of a Model Home for Stimulation which rethinks the rules of the thermostat with the goal of promoting stimulation rather than comfort and idleness. Temperature changes are based on the presence of people and their activity, the flow of air vertically and horizontally, and the building thermostat’s built in responses. StimuStat was built using Processing.

https://user-images.githubusercontent.com/92185211/159753689-20cc0197-8f51-472c-8f44-f9e7dd126126.mp4

User controls:
- LEFT mouse click: adds a person (visually represented by a dot)
- RIGHT mouse click on a person: activate's the person's activity
- SHIFT + LEFT mouse click on a person: deletes the person

![floor-plans](https://user-images.githubusercontent.com/92185211/159753756-a9ac1966-5a3f-41d0-b84e-d374aa157b7d.png)

The architecture:
- consists of pods 0-10 which are enclosed rooms
- and zones 1-9 (layed out in a 3x3 grid) which are the open spaces around the pods 
- pods 0-5 are on the first floor (first floor is displayed on the left)
- pods 6-10 are on the second floor (second floor is displayed on the right)
- pod 0 has an opening to pod 6 above it on the second floor
- pod 4 has an opening to pod 10 above it on the second floor
- pod 5 is entirely outdoors
- each pod links to all of the zones it's in with second floor pods linking to the zones below it
- and vise versa, each zone links to any pod that is in it
- tubes from pods 0 and 4 bring warm air to pod 5
- heat dispersion naturally occurs between zones as they are not physically divided by walls
- pods, on the other hand, contain the heat within themselves

This Model Home for Stimulation redefines how a thermostat works in order to create a level of discomfort which promotes activity. A typical thermostat constantly tries to keep the space at a comfortable temperature. In this architecture, we do the opposite. 

Rules of the Thermostat:
- If a pod is at a comfortable temperature for too long, the thermostat increases or decreases the temperature of its corresponding zone(s) 
- If a zone is at a comfortable temperature for too long, the thermostat increases or decreases the temperature of its corresponding pod(s) 
- If a pod is too hot, the thermostat decreases the temperature of its corresponding zone(s)
- If a zone is too hot, the thermostat decreases the temperature of its corresponding pod(s)
