# Avatar Camera Drone
**Fly a drone around and see from its perspective.**

Performance: <img src="https://i.imgur.com/PVUCZQR.png" width="24"/> Excellent  
*The base drone system doesn't contain anything that triggers the performance ranking system*

**Addons** might cause the performance rank to dip though. These things will affect the ranking:  
<img src="https://i.imgur.com/zK7p4wv.png" width="24"/> Good - Adding additional materials/meshes for visual effects (NightVision, etc)  
<img src="https://i.imgur.com/KH1tTxY.png" width="24"/> Poor - Adding a light to the drone (even though it's local-only).

### Drone System & Readme Under Construction


#### Animator Notes

Trying to handle this with as few synced animator values as possible.

Syncing is not needed as the majority of the animations are played locally for performance.


**Animator Notes**:
```
INT - DroneToggles
 - Enable/Disable/Reset
   * 1 = Enable Drone DT
   * 2 = Disable Drone
   * 3 = Drone Return
   * 4 = Enable Drone VR
 - Toggle Addons:
   * 5 = All OFF
   * 6 = Light Toggle
   * 7 = Toggle NightVision
   * 8 = Homing Mode

FLOAT - droneSpeed
  - Set the speed of the drone
    * 0.0 = pretty darn slow
    * 1.0 = zoom zoom zoom
```
