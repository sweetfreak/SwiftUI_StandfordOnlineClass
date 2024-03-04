//
//  ContentView.swift
//  Memorize-CS193p
//
//  Created by Jesse Sheehan on 2/23/24.
//

import SwiftUI
//core data is imported sometimes instead of swiftUI

//everything is a Struct in swift! It's NOT a class, though like in OOP - it just has variables and functions. no inheritance.
//there ARE classes, but they're not as necessary in Swift

//ContentView can be renamed!

//"Protocol Oriented Programming?"

//": View" means the struct behaves like a View. This is functional programming - focus on behavior not the Data!!  This struct below behaves like a View

//Any time you behave like something (in a struct), it's like a 2-sided coin. On one side, if it behaves like a view, it has to do the things a View does! So there may be multiple things it has to do.  On the other side, it gets all the things that item it's behaving like can do.

//Ex: a View HAS TO have a Body. But it CAN do much more!

// Views are the most important part of SwiftUI, it can do a million different things

struct ContentView: View {
    
    
    //"some" is the type - like an int or a string - a "some" is more vague. COmbined with View, it means it can be any kind of struct, as long as it behaves like a View.  There are thousands of Views. the "some" says "excecute this code, see what it returns, and then use that"
    var body: some View {
        //some view just lets you use multiple types and things in the body
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView(isFaceUp: true)
          
        }
        .foregroundColor(.orange)
        .padding(.all)
        
        //the curly bracket that this is in, is a Computed Property. Read-only, but still a "var", but read-only.
        // VStack {
        //            ZStack {
        //                /*Image(systemName: "globe")
        //                 .imageScale(.large)
        //                 .foregroundStyle(.tint)
        //                 .background(.purple) */
        //                RoundedRectangle(cornerRadius: 25.0)
        //                    .foregroundColor(.purple)
        //                RoundedRectangle(cornerRadius: 25.0)
        //
        //                    .strokeBorder(lineWidth: 3)
        //
        //                //this VStack is within a ZStack
        //                VStack{
        //                    Text("Light up, my dude!")
        //                        .foregroundColor(.green)
        //                        .bold()
        //                    Text("🚬😶‍🌫️").font(.largeTitle)
        //                        .padding()
        //                }
        //            }
    }
}
    
struct CardView: View {
    //for all structs, every var has to have a value!! you can give it a default value though, like below:
    @State var isFaceUp = false
    
    //@State is for TEMP purpose - it creates a pointer, so it can change it the var for now, but not like "really* change it, permanently
    //This is important becasue VIEWS ARE IMMUTABLE (they can't mutate/change)
    
    //this var has a value: it's a computed value
    //views are read only!
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            
            if isFaceUp {
                
                
                //RoundedRectangle(cornerRadius: 25.0)
                //instead use:
                base.foregroundColor(.purple)
               // RoundedRectangle(cornerRadius: 25.0)
                base
                    .strokeBorder(lineWidth: 3)
                
                //this VStack is within a ZStack
                VStack{
                    Text("Light up, my dude!")
                        .foregroundColor(.green)
                        .bold()
                    Text("🚬😶‍🌫️").font(.largeTitle)
                        
                }
            } else {
                //no foreground color specified for outer ring, so it gets the foreground from above
                
               // RoundedRectangle(cornerRadius: 25.0)
                //   .strokeBorder(lineWidth: 3)
                base//.fill() - the fill isn't necessary, because that's default
                //this VStack is within a ZStack
                VStack{
                    Text("BOGUS ")
                        .foregroundColor(.blue)
                        .bold()
                    Text("😵‍💫").font(.largeTitle)
                            
                    }
                }
            //usually would need end parentheses here for Zstack, but with trailing closure syntax, you do not!
            }
        //this is where the Z-Stack ends
        .onTapGesture /* (you could put anything here in () if you want) */ {
           //isFaceUp = !isFaceUp // THIS DOESNT WORK W/O @Statate - because self is immutable(can't be changed)
            //alternatively:
            isFaceUp.toggle() //this var is a struct! so you can use functiosn on it.
            
        }  //note the trailing closure syntax :)
        }
}
    
    


/*visual demo: a few lego structures

- legos can be stacked to build thing... a vertical stack
- Legos are Views, can be stacked
- if you have a lego helicopter, pull of the rotor and say "THIS is a lego now". It's built out of lego pieces, but not it's a rotor lego. And you have an airframe lego, a body lego, etc.
 - You can even stack all the legoes to make more legos.
 - If I'm building a helicopter lego, i can stack multiple legos to make it
 - SIMILARLY: stack multiple views to make a V-stack or vertical stack


 - creating instances of structrs named parameters:
 Examples of creating a struct (pulled from above):
 Text("Hello, my dude!")
 Image(systemName: "globe")
 
 Both of these above are like bricks. Just put its name and then paraenthese, any arguments to pass to create the struct, then close the parentheses
 
 
 Image(systemName: "globe")
 ^^ System name is naming that parameter. You don't always need it, but
 if you wrote "named" instead of systemName, it would look for an asset.
 Lots of arguments to create structs. Almost all structs have more than one way to create them - even text, too.
 
 
 Parameter Defaults - you don't have to put them in, it'll just  assume.
 
 V-Stack is same as any other view, except its taking other legos and stacking on top of them.
 
 V-Stack could use parentheses for parameters:
 
 Vstack(alignment: .leading, spacing: 20) {
 --structs here--
 }

 The curly brackets in a V-Stack mean:
 - legos come in little bags, and gorups of things are together, they have numbers on them that correlate to the structs.
 
 - The brackets are like a bag of legos - they are actually functions!
 
 Embedded functions are everywhere. Functions are passed as arguments in functional programming.
 
 That function returns a view.
 
 still have to "open it up" and "arrange it" like the legos.  They need parameters or properties, etc.
 
 It's a weird syntax. There's a post-processeing step that turns it into a tuple view.
 
 the Vstack above/tuple view returns an Image and text
 
 what's really happening is:
 
    Vstack(content: {
        Image(systemNamem ETC ETC)
        Text("Hello, my Dude")
    })
 
 
 @ViewBuilder is what turns this list of Views into a tuple view
 
    these are functions:
        .imageScale(.large)
        .foregroundColor(.orange)
 
 Not special, they're just View modifiers. You call it on a struct that behaves like a view.
 
    There are two views - the text, and an image that has had its color and scale modified. it's not just an image
 
 
 View Modifiers - the scoping or the placement matters! if you take a modifier and take it outside one view and put it in another, it'll affect things differently
 
 
*/





//don't usually need to use this
#Preview {
    ContentView()
}
