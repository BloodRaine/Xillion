//
//  gameClass.swift
//  Xillion
//
//  Created by Robbie Merillat on 12/4/16.
//  Copyright © 2016 Robbie Merillat. All rights reserved.
//
import UIKit
import Foundation

class Zork {                                               // Create Zork class
    
    var Input : String = "Hello"                           // User input
    var out: String = "Bye"
    var prize : String =  "You have escaped the dungeon!"; // Endgame prize phrase
    var changeRooms : Int = 0                              // determines what room you are currently in
    
    var dead: Bool = false                                 // If you are dead, thend dead = 1, else dead = 0
    var key: Bool = false                                  // If you have picked up the key to open the door yet
    var matches: Bool = false                              // If you have found the matches
    var lantern: Bool = false                              // If you have lit the lantern
    var barrel: Bool = false                               // If you have opened the barrel
    var door: Bool = false                                 // If you have opened the door
    var nightstand: Bool = false;                          // If you have opened the door
    //var items = [String]()
    
    
    func Introduction() -> String {                         // Intro function
        var str = "                                                Xillion Developed by Mobius\n"
        str += "                                                        December 5, 2016\n"
        str += "                                                           Please Enjoy\n"
        str += "                         In order to play this game, simply input basic actions.\n\n\n"
        
        str += "You find yourself standing in a room. You have no memory of who you are, where you are, or how you got there.\n\n"
        str += "Everything is pitch black except for a sliver of light filtering through what seems to be the crack below a door.\n\n"
        
        return str
    }
    
    func Room1(action : String) -> String {              // Function for things you can do in room 1
        var str: String = ""
        
        if (action == "check room" || action == "search" || action == "look around" ||
            action == "explore" || action == "search room" || action == "inspect room") {
            
            if (lantern == true) {
                str += "The now illuminated room reveals itself to you in the light of the lantern. The cot looks rather uncomfortable.In one corner of the room barrels stack the wall, strange markings are scrawled upon the sides of each one. Strange symbols\nin a foreign tounge. ";
                str += "Beside the bed is a small wooden nightand is covered in cobwebs.\nYou can see a drawer in the nightstand.\nYou determine that this room is some sort of small cellar.\n"
            }
                
            else {
                str += "You fumble around the room, feeling for anything tangible. The walls are slick with dew and cold to the touch.\nTo your right is a stack of large round wooden objects. A cot lays in a corner of the room with what seems to be a nightstand next to it. You feel the form of a lantern resting on the stand.\n"
            }
        }
            
        else if (action == "peer through crack" || action == "inspect crack" || action == "look through crack") {
            str += "You can see a dimly lit hallway receeding into the distance.\n"
        }
            
        else if (action == "listen") {
            str += "You can hear soft chanting from somewhere far beyond the door.\n"
        }
            
        else if (action == "pocket" || action == "check pockets" || action == "check pocket") {
            str += "You find some matches and an old wooden pipe in your pocket.\n"
            matches = true
        }
            
        else if (action == "smoke" || action == "smoke cig" || action == "cig") {
            if (matches == true) {
                str += "You don't have anything to smoke.\n"
            }
            else {
                str += "Not a valid action\n"
            }
        }
            
        else if ((action == "nightstand") || (action == "search nightstand") || (action == "check nightstand") ||
            (action == "open crate") || (action == "check crate") || (action == "inspect crate")) {
            str += "You discover a drawer in the nightstand\n"
        }
            
        else if (action == "open drawer" || action == "open nightstand") {
            nightstand = true
            str += "You open the drawer of the nightstand, within, there rests an old wrought iron key\n"
        }
            
        else if (action == "close drawer" || action == "close nightstand") {
            nightstand = false
            str += "You close the drawer to the nightstand.\n"
        }
            
        else if (action == "pick up" || action == "pick up key" || action == "key"){
            if (nightstand == true) {
                key = true
                str += "you pick up the key\n"
            }
            else {
                str += "There is nothing to pick up.\n"
            }
        }
            
        else if (action == "lantern" || action == "check lantern" || action == "light lantern") {
            str += "The lantern is covered in cobwebs, it is evident that it has not been used in quite some time.\n"
            if (matches == true){
                str += "You strike a match and light the lantern, light fills the room.\n"
                lantern = true
            }
            else {
                str += "It seems that you will need a way to light the lantern\n"
            }
        }
            
        else if ((action == "Open Door") || (action == "open door") || (action == "door")) {
            if (key == true) {
                str += "You open the door. Dim light floods into the room from the hallway ahead.\n"
                door = true
            }
            else {
                str += "You reach out to turn the door knob.......The door is locked.\n"
            }
        }
            
        else if ((action == "Close Door") || (action == "close door")) {
            if (key == true) {
                str += "You close the door. The room darkens from the loss of light.\n"
                door = false
            }
        }
            
        else if (action == "look through door") {
            str +=  "A long hallway stretches out ahead of you. Along the sides of the wall are candelbras holding candles illuminating the\nhallway in a dim orange light."
            str += "That far side of the hall is too dark and far off to see.\n"
        }
            
        else if (action == "go west" || action == "move west") {
            
            if (door == true) {
                str += "You leave the cellar and move into the hallway.\n"
                //changeRooms = 1;
                str += "Currently, that is all I have. Thank you so much for playing!!!!"
            }
            else {
                str += "You walk right into the door squishing your face into the wooden planks...... 'ow that hurt'.\n"
            }
            
        }
        
        else if (action == "lay down" || action == "lay on cot" || action == "sleep") {
            str += "You lay down for a nice long nap. As you slumber a dark shadow looms over your body. You never wake from that sleep.\n"
                dead = true;
            str += "you have died!\n"
        }
        
        else if (action == "check barrel" || action == "check barrels" || action == "inspect barrels") {
            str += "Barrels!\n"
        }
            
        else if (action == "open barrel") {
            barrel = true
            str +=  "Inside the barrel is a dark liquid.\n"
            if (lantern == true) {
                str += "You hold the lantern over the barrel and see that the liquid is a deep red. It looks like blood.\n"
            }
        }
            
        else if barrel == true && action == "drink" {
             str += "You drink deep from the dark liquid. The taste of iron runs down your throat......... you start to feel sick\n"
        }
    
        else if (action == "close barrel") {
            str += "You put the lid back on the barrel\n"
            barrel = false
        }
            
        else {
            if (action != "quit") {
                str += "Not a valid action"
            }
        }
        
        return str
    }
    
    func Room2(s : String) -> String {                      // Function for things you can do in room 2
        return ""
    }
    func Hall1(s : String) -> String {                      // Function for things you can do in room 3
        return ""
    }
    func Hall2(s : String) -> String {                      // Function for things you can do in room 4
        return ""
    }
    
    func SetInput(input: String) {                         // Function for user input
        // take text from the text field, and set the input to that.
        self.Input = input
    }
    
    func GetInput() -> String {        // Function for getting the input to be used in room functions
        return ""
    }
    
    func GetCharInput() -> Character {
        return "a"
    }
    
    func turn () -> String {
        
        switch (changeRooms) {             // Different rooms in dungeon
        case 0:
            out = self.Room1(action: Input)                  // First room
            break
        case 1:
            out = self.Room2(s: Input)                 // Second Room
            break
        case 2:
            out = self.Hall1(s: Input)                  // Third room / hall
            break
        case 3:
            out = self.Hall2(s: Input)                  // Fourth Room / hall
            break
        default:
            out = "That is not a valid action\n"
            break
        }
        
        return out
    }
   /*
    func PlayZork(textView: UITextView, input: UITextField) {    // Function to begin playing game.
        
        var playAgain: Character = "Y"                       // create replay character
        
        while (playAgain == "y" || playAgain == "Y") {       // Loop for replay
            
            textView.text.append(Introduction())        // Call the introduction function
            
            while (dead != true) {            // While your character is not dead do the following
                if action == 1 {
                    
                    let s = GetInput()
                    var out: String
                    textView.text.append("I got here!")
     
                    switch (changeRooms) {             // Different rooms in dungeon
                    case 0:
                        out = self.Room1(s: s)                  // First room
                        textView.text.append(out)
                        if (self.dead == true) {
                            textView.text.append("You have died\n")
                        }
                        break
                    case 1:
                        out = self.Room2(s: s)                 // Second Room
                        textView.text.append(out)
                        if (self.dead == true) {
                            textView.text.append("You have died\n")
                        }
                        break
                    case 2:
                        out = self.Hall1(s: s)                  // Third room / hall
                        textView.text.append(out)
                        if (self.dead == true) {
                            textView.text.append("You have died\n")
                        }
                        break
                    case 3:
                        out = self.Hall2(s: s)                  // Fourth Room / hall
                        textView.text.append(out)
                        if (self.dead == true) {
                            textView.text.append("You have died\n")
                        }
                        break
                    default:
                        textView.text.append("That is not a valid action\n")
                        break
                    }
 
                }
            }
            
            textView.text.append("would you like to play again? (enter Y or N)\n") // Ask for replay
            playAgain = GetCharInput()
            if (playAgain == "y" || playAgain == "Y") { // Reset character to alive and in room 1
                self.changeRooms = 0;
                self.dead = false;
            }
            playAgain = "N"
        }

    }
 */
    
}                                                   // End class
