# Flying Rig
#### Codename: Magic Carpet Ride
New setup of the flying rig that works pretty decently after version 772.

**This works best on desktop**, but is usable in VR with some practice.  
The problem with VR comes when you tilt your head side-to-side; this causes you to spin in the direction your head is tilted.

Old SDK2 Version that uses a `Configurable Joint` can be found [in the old repo here](https://github.com/Erumite/Eremite_VRC/tree/master/Assets/Eremite/AvatarPrefabs/FlyingRig).

Improved a bit with some constraint magic to allow control:
* Look up to gain altitude.
* Look down to fly downward/land.
* Toggle the flying off for quick descent.
* Smooth hovering while standing still, very slow altitude loss.
* Worlds without jumping - You can take off by stepping off of something or bumping against the wall while looking up.
* Only enables *locally* for best performance for others.

### Preview, kinda:
![](https://i.imgur.com/7M90HU5.png)

### Setup
1. Drag the `DesktopFlyingPrefab` prefab into the scene.
2. Drag the `lolfly` game object into the avatar root (alongside armature/body)
3. On the `pitterpat` game object, set the rotation constraint to the avatar's head.
4. See the `takeoff` and `not-flying` animations in the example to see a possible way to set up your SDK3 animator.

**Optional**:
5. Disable the mesh renderer for `lolfly/pitterpat` and add your own effects.  It's just there to demo how it works.
6. Tweak the `Weight` value of the `Rotation Constraint` to fine-tune how it adjusts to gain/lower altitude.  
  * A `1.0` value exactly matches head rotation (doesn't go straight up/down in Desktop)
  * A lower value doesn't gain/lose altitude as fast, but is less likely to YEET you around.


### Troubleshooting
*(This looks like a lot of things that can go wrong, but overall it's very stable.)*

Your mileage may vary depending on the walking/running/crouching/etc animation that you are using, as well as your rig setup.

**Make sure you have no problems with your humanoid rig** first and foremost.  Enforcing T-Pose can help with this.

This works fantastically with my custom walk animation, but the default walk/run for VR Chat may act strangely; Looking downward causes the avatar to shoot forward pretty quickly.  This may be desirable for some people as a way to speed-boost around a map, so play with different movement animations until you find something that fits the flying style you want.

If you want pure smooth flying with no odd boosting, try tweaking the settings on a custom walk animation with as little root transform modification as possible.

![](https://i.imgur.com/dcejmDv.png)

SDK2 used to have problems with falling and bumping the collider since enabling and disabling the game object didn't allow collision.  This should be fine in AV3 since the object is disabled when not in use.

You can jump to gain altitude faster **while moving**, but stationary jumping will likely launch you sideways.  If you find yourself in free fall, try moving forward and jumping to get control back.
