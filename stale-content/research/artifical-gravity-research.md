Artificial gravity, as it is usually conceived, is the inertial reaction to the centripetal acceleration that acts on a body in circular motion. Artificial-gravity environments are often characterized in terms of four parameters:

- **Radius** from the center of rotation.
- **Angular Velocity** or “spin rate.”
- **Tangential Velocity** or “rim speed.”
- **Centripetal Acceleration** or “gravity level.”

These four parameters are interdependent: specifying values for any two of them determines the values of the other two as well.

The calculator assigns a priority to each parameter. Whenever you input a value, that parameter receives the highest priority. The calculator recomputes the two parameters with the lowest priorities – the two values least recently specified by you. It displays text beneath each parameter to describe how it determined the value.

The calculator doesn’t update anything until your input is complete. Depending on your browser, you may need to press <Tab> or <Enter>, or click the mouse outside the text input area, to trigger the update.

You can select the measurement unit for each parameter. When you change a parameter’s unit, the calculator converts the numeric value while holding the physical quantity constant. If you want to specify a parameter value in a unit other than the current selection, select the unit first, and then input the numeric value.

The calculator displays the formulae as proportions, designated by the symbol ∝. If the angular velocity unit is radians/second, and if the other three parameter units are consistent (all meters and seconds, or all feet and seconds), then the proportion is actually a numeric equality =. (You can verify this by selecting consistent units.) Else, there’s a constant multiplier (not displayed) to account for the unit conversions.

The colored “LED” in front of each parameter indicates how its value compares to the “[comfort zone](https://www.artificial-gravity.com/sw/SpinCalc/)” for artificial gravity, as proposed by several [authors](https://www.artificial-gravity.com/sw/SpinCalc/):

The value is too high for comfort or will require deliberate adaptation.

The value may be too high for immediate comfort – authors disagree. A period of adaptation may be necessary.

The value is in the comfort zone, with little or no adaptation.

The value may be too low for immediate comfort – authors disagree. A period of adaptation may be necessary.

The value is too low for comfort or will require deliberate adaptation.

If you resize the browser window, the formulae and LEDs may disappear temporarily. They’ll reappear as you continue to change parameter values. You can also reset everything by reloading the page.

## Comfort Criteria

It should be noted at the outset that, in orbital habitat design, the choice is *not* between artificial gravity and Earth gravity, but rather, between artificial gravity and microgravity. Upon entering microgravity, about half of all astronauts endure “space adaptation syndrome” that lasts from one to three days [[Connors, Harrison, Akins](https://www.artificial-gravity.com/sw/SpinCalc/), 1985; [Merz](https://www.artificial-gravity.com/sw/SpinCalc/), 1986]. A similar period of adaptation to artificial gravity seems reasonable, considering the substantial health benefits that it offers versus prolonged weightlessness. It may not be necessary to provide immediate perfect “comfort” in artificial gravity, especially in small exploration-class vehicles with select crew.

Deliberate architectural design for the unusual conditions of artificial gravity ought to aid adaptation and improve the habitability of the environment [[Hall](https://www.artificial-gravity.com/sw/SpinCalc/), 2006].

The calculator’s comfort indicators are based on the following criteria:

[Untitled](https://www.notion.so/dee7778e6aff4602805e2c4a2337d183)

**Radius** Because centripetal acceleration – the nominal artificial gravity – is directly proportional to radius, inhabitants will experience a head-to-foot “gravity gradient”. To minimize the gradient, maximize the radius.

**Angular Velocity** The cross-coupling of normal head rotations with the habitat rotation can lead to dizziness and motion sickness. To minimize this cross-coupling, minimize the habitat’s angular velocity.

[Graybiel](https://www.artificial-gravity.com/sw/SpinCalc/) [1977] conducted a series of experiments in a 15-foot-diameter “slow rotation room” and observed:

> In brief, at 1.0 rpm even highly susceptible subjects were symptom-free, or nearly so. At 3.0 rpm subjects experienced symptoms but were not significantly handicapped. At 5.4 rpm, only subjects with low susceptibility performed well and by the second day were almost free from symptoms. At 10 rpm, however, adaptation presented a challenging but interesting problem. Even pilots without a history of air sickness did not fully adapt in a period of twelve days.

On the other hand, [Lackner and DiZio](https://www.artificial-gravity.com/sw/SpinCalc/) [2003] found that:

> sensory-motor adaptation to 10 rpm can be achieved relatively easily and quickly if subjects make the same movement repeatedly. This repetition allows the nervous system to gauge how the Coriolis forces generated by movements in a rotating reference frame are deflecting movement paths and endpoints and to institute corrective adaptations.

**Tangential Velocity** When people or objects move within a rotating habitat, they’re subjected to Coriolis accelerations that distort the apparent gravity. For relative motion in the plane of rotation, the ratio of Coriolis to centripetal acceleration is twice the ratio of the relative velocity to the habitat’s tangential velocity. To minimize this ratio, maximize the habitat’s tangential velocity.

**Centripetal Acceleration** The centripetal acceleration must have some minimum value to offer any practical advantage over weightlessness. One common criterion is to provide adequate floor traction. The minimum required to preserve health remains unknown. For reasons of cost as well as comfort, the maximum should generally not exceed 1 g.

Hill & Schnitzer don’t explain their minimum limit of 0.035 g. Compared to the others, it’s an outlier that appears to be an arbitrary lower bound on their logarithmic graph.

Gilruth doesn’t explain his maximum limit of 0.9 g. It may be to allow for additional Coriolis accelerations without exceeding a total of 1.0 g. This would be better addressed by minimizing the Coriolis accelerations, by maximizing the tangential velocity. In particular, in a large rotating colony with high tangential velocity and low Coriolis acceleration, there should be no comfort problem with a centripetal acceleration of 1.0 g.

I have no data on the upper limit of “comfortable” acceleration. I’ve guesstimated values at which the indicator should transition from green to yellow to red. You may think that I’ve set these limits too low. However, I’m interested in the maximum acceleration that would be comfortable for normal activity within the habitat. This is undoubtedly less than the maximum acceleration tolerable while seated in a padded chair.

## References

[Connors, Mary M.; Harrison, Albert A.; Akins, Faren R.](https://www.artificial-gravity.com/sw/SpinCalc/) (1985). Living Aloft: Human Requirements for Extended Spaceflight (NASA SP-483, p. 35-51). NASA Scientific and Technical Information Branch.

[Cramer, D. Bryant](https://www.artificial-gravity.com/sw/SpinCalc/) (1985). Physiological Considerations of Artificial Gravity. In A. C. Cron (Ed.), Applications of Tethers in Space, Williamsburg, Virginia, USA, 15-17 June 1983 (NASA CP-2364, vol. 1, p. 3·95-3·107). NASA Scientific and Technical Information Branch.

[Gilruth, Robert R.](https://www.artificial-gravity.com/sw/SpinCalc/) (1969). Manned Space Stations – Gateway to our Future in Space. In S. F. Singer (Ed.), Manned Laboratories in Space (p. 1-10). Springer-Verlag.

[Gordon, Theodore J.; Gervais, Robert L.](https://www.artificial-gravity.com/sw/SpinCalc/) (1969). Critical Engineering Problems of Space Stations. In S. F. Singer (Ed.), Manned Laboratories in Space (p. 11-32). Springer-Verlag.

[Graybiel, Ashton](https://www.artificial-gravity.com/sw/SpinCalc/) (1977). Some Physiological Effects of Alternation Between Zero Gravity and One Gravity. In J. Grey (Ed.), Space Manufacturing Facilities (Space Colonies): Proceedings of the Princeton / AIAA / NASA Conference, May 7-9, 1975 (p. 137-149). American Institute of Aeronautics and Astronautics.

[Hall, Theodore W.](https://www.artificial-gravity.com/sw/SpinCalc/) (2006). Artificial Gravity Visualization, Empathy, and Design (AIAA 2006-7321). 2nd International Space Architecture Symposium (SAS 2006), AIAA Space 2006 Conference & Exposition, San Jose, California, USA, 19-21 September 2006. American Institute of Aeronautics and Astronautics.  [PDF](http://www.artificial-gravity.com/AIAA-2006-7321.pdf)

[Hill, Paul R.; Schnitzer, Emanuel](https://www.artificial-gravity.com/sw/SpinCalc/) (1962 September). Rotating Manned Space Stations. In, Astronautics (vol. 7, no. 9, p. 14-18). American Rocket Society.

[Lackner, James R.; DiZio, Paul A.](https://www.artificial-gravity.com/sw/SpinCalc/) (2003). Adaptation to Rotating Artificial Gravity Environments. In, Journal of Vestibular Research (vol. 13, p. 321-330). IOS Press.

[Merz, Beverly](https://www.artificial-gravity.com/sw/SpinCalc/) (1986 October 17). The Body Pays a Penalty for Defying the Law of Gravity. In, Journal of the American Medical Association (vol. 256, no. 15, p. 2040-2041). American Medical Association.

[Stone, Ralph W.](https://www.artificial-gravity.com/sw/SpinCalc/) (1973). An Overview of Artificial Gravity. In A. Graybiel (Ed.), Fifth Symposium on the Role of the Vestibular Organs in Space Exploration, Pensacola, Florida, USA, 19-21 August 1970 (NASA SP-314, p. 23-33). NASA Scientific and Technical Information Division.
