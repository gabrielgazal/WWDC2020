//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
import PlaygroundSupport
import BookCore

PlaygroundPage.current.liveView = instantiateThirdPage()
//#-end-hidden-code

/*:
 
 As we have seen, when a set of notes is played together that is a chord. But those notes played together can not be any notes, they must fit one in each other in a way that when heard together they sound harmonic. There are lots of ways to play different chords, and we're going to talk about one of those right now.
 
 One of the most basic kinds of chords are the **triads**. Triads are the chords formed by three different notes played together and are the base to most of the songs we hear out there. Let's assemble the ***C Major*** chord together as we proceed, for this we must do the following:
 
 * The first step is to choose the ***TONIC***. This is the note that will serve as base for picking the other two. In our case we'll have the *C* as our ***Tonic***;
 * The second step is to find the ***THIRD***. This is the note that defines if the chord is a  **Major** or a **Minor** chord. For our example, the third will be the *E*;
 * Last but not least, we must find the ***FIFTH***. This is the note that is seven half-steps after the **tonic**. A half-step is the space between each note, to count them you must also consider the accidentals (they're called *sharps - #* and *flats - b*), wich we won't talk about in this playground. For the *C Major* chord the fifth will be the *G*.
 
 And that's it! Now you know how to assemble one Triad. In case it got a little confusing you can look at the schematic down below:
 
 ![Triads](triads.png)
 
 Now go ahead and see it for yourself:
 
 Tap **Run my code** and swipe on the top picker to change between some of the basic chords. At the bottom of the screen you can see wich notes compose the chosen chord. You can also see a simulation of the note's waves overlaping in each chord.
 
*/
