//Name: Jeffery Hu
//Date: Thursday, May 21, 2020.
//File name: MyCreationByJefferyHu_FinalISP
//Teacher: Ms. Basaraba
//Description: This program uses different draw commands to animate a spider, two flies, an ant, and two bees interacting with each other through a short story. The story first starts off when Anty and The Fly Twins meet up to go on an adventure. They want to go further than they've ever gone before. After venturing off, they find an interesting tree they've never seen before. When they wander towards the tree, they discover it has a beehive and a peach on top of one of its branches! Luckly, there aren't any bees home. Anty has never seen a peach before, so The Fly Twins squeeze by the beehive to bring down the peach for Anty to see. Anty also tries to get a better view by scuttling under a sleeping spider. However, when the fly twins get to the peach, an arguement breaks out because Fly One wants to take a bite out of the peach. To stop them, Fly Two pushes Fly One, but a little too hard, which causes Fly One to bump into the beehive. This causes the sleeping spider to wake up and take a bite out of Anty, who sprintes away screaming. The bump into the beehive also results in two angry bees flying back to chase the fly twins. The fly twins barely manage to escape the angry bees and fly away, with Anty running as fast as they can below them.

//Declaration of variables
int spiderX = 290; // Declare an integer named spiderX, assign it the value 290 (to represent the x coordinate of the spider)
int spiderY = 390; // Declare an integer named spiderY, assign it the value 390 (to represent the y coordinate of the spider)
byte spiderSpeed = 1; // Declare a byte named spiderSpeed, assign it the value 1 (to represent the speed the spider is moving vertically)
byte biteSpeed = 0; // Declare a byte named biteSpeed, assign it the value 0 (to represent the speed at which the spider travels vertically when biting the ant)
int antX = 740; // Declare an integer named antX, assign it the value 740 (to represent the X coordinate of the ant)
int antTurnX = 440; // Declare an integer named antTurnX, assign it the value 440 (to represent the X coordinate of the ant after it turns and faces right)
final byte antSpeed = -1; // Declare a constant byte named antSpeed, assign it the value -2 (to represent the speed the ant is moving)
int beeX = 650; // Declare an integer named beeX, assign it the value 650 (to represent the x coordinate of the first bee)
int beeY = 290; // Declare an integer named beeY, assign it the value 290 (to represent the y coordinate of the first bee)
int beeTwoX = 390; // Declare an integer named beeTwoX, assign it the value 390 (to represent the x coordinate of the second bee)
int beeTwoY = -60; // Declare an integer named beeTwoY, assign it the value -60 (to represent the y coordinate of the second bee)
int flyX = 800; // Declare an integer named flyX, assign it the value 800 (to represent the x coordinate of the first fly)
int flyY = 180; // Declare an integer named flyY, assign it the value 180 (to represent the y coordinate of the first fly)
int flyTwoX = 900; // Declare an integer named flyTwoX, assign it the value 900 (to represent the x coordinate of the second fly)
int flyTwoY = 180; // Declare an integer named flyTwoY, assign it the value 180 (to represent the y coordinate of the second fly)
byte beeWings = 1; // Declare a byte named beeWings, assign it the value 1 (to give the appearance the bee wings are flapping by rapidly changing their colour)
byte flyWings = 1; // Declare a byte named flyWings, assign it the value 1 (to give the appearance the fly wings are flapping by rapidly changing their colour)
boolean flyPointOne = false; // Declare a boolean named flyPointOne, assign it the value false (to record if the second fly has reached its first waypoint in its animation)
boolean moveScreen = false; // Declare a boolean named moveScreen, assign it the value false (to record if the first backgound needs to move to the main background)
boolean pollinate = false; // Declare a boolean named pollinate, assign it the value false (to record if the bee has pollinated the sunflower on the main background)
boolean bite = false; // Declare a boolean named bite, assign it the value false (to record if the spider has bitten the ant)
boolean biteTwo = false; // Declare a boolean named biteTwo, assign it the value false (to record if the spider has tried to bite the ant a second time)
boolean dodge = false; // Declare a boolean named dodge, assign it the value false (to record if fly One has started its animation to go through the gab between the two bees at the end)
boolean moveFinal = false; // Declare a boolean named moveFinal, assign it the value false (to record if the characters are ready to move back to the first/end background)
boolean theEnd = false; // Declare a boolean named theEnd, assign it the value false (to record if its ready for the ending text to be displayed)
int loopCount = 1; // Declare an integer named loopCount, assign it the value 1 (to represent the amount of times the void draw has been run (excluding the title page))
int titleCount = 1; // Declare an integer named titleCount, assign it the value 1 (to represent the amount of times the titlePage has been run)
PFont title; // Declare a PFont named title (to represent the font used for the title)
PFont dialogueOne; // Declare a PFont named dialogueOne (to represent the font used for the first round of dialogue)
PFont dialogues; // Declare a PFont named title (to represent the font used for the dialogue between characters (except for the first round))
PFont end; // Declare a PFont named end (to represent the font used for the ending text)

//Setup
void setup()
{
  //Start of main program
  size(800, 500); // The display size is 800 wide and 500 high
  frameRate(60); // Execute draw() 60 times a second
  noStroke(); // No borders on the shape
  dialogues = loadFont("ComicSansMS-48.vlw"); // Loads the font onto 'dialogues'
}

//draw()
void draw() {
  while (titleCount < 120) { // While the title has been run less than 100 times
    firstBackground(); // Calls the firstBackground() method
    titlePage(); // Calls the titlePage() method
    break;
  }
  while (titleCount >= 120 && moveScreen == false) { // While the title has been run less 100 or more times times and movingScreen is false
    firstBackground();
    ant(); // Calls the ant() method
    flyOne(); // Calls the flyOne() method
    flyTwo(); // Calls the flyTwo() method
    movingMainScreen(); // Calls the movingMainScreen() method
    beginDialogue();
    break;
  } 
  while (moveScreen == true && loopCount <= 1697) { // While movingScreen is true and loopCount is less than or equal to 1697
    mainBackground(); // Calls the myBackground() method
    ant(); // Calls the ant() method
    bee(); // Calls the bee() method
    flyOne(); // Calls the flyOne() method
    flyTwo(); // Calls the flyTwo() method
    spider(); // Calls the spider() method
    findingPeach(); // Calls the findingPeach() method
    secondDialogue(); // Calls the secondDialogue() method
    break;
  } 
  while (loopCount > 1697 && loopCount < 2005) { // While loopCount is greater than 1697 and less than 2005
    mainBackground(); // Calls the myBackground() method
    ant(); // Calls the ant() method
    bee(); // Calls the bee() method
    flyOne(); // Calls the flyOne() method
    flyTwo(); // Calls the flyTwo() method
    spider(); // Calls the spider() method
    thirdDialogue(); // Calls the thirdDialogue() method
    hittingPeach(); // Calls the hittingPeach() method
    forthDialogue(); // Calls the forthDialogue() method
    break;
  }
  while (loopCount > 2004 && moveFinal == false) { // While loopCount is greater than 2004 and moveFinal is false
    mainBackground();
    antTurn(); // Calls the ant() method
    bee(); // Calls the bee() method
    beeTwo(); // Calls the beeTwo() method
    flyOneTurn(); // Calls the flyOne() method
    flyTwoTurn(); // Calls the flyTwo() method
    spider(); // Calls the spider() method
    chase(); // Calls the chase() method
    break;
  }
  while (moveFinal == true && theEnd == false) { // While moveFinal is true and theEnd is false
    firstBackground();
    antTurn(); // Calls the ant() method
    bee(); // Calls the bee() method
    beeTwo(); // Calls the beeTwo() method
    flyOneTurn(); // Calls the flyOne() method
    flyTwoTurn(); // Calls the flyTwo() method
    finalGetaway(); // Calls the finalGetaway() method
    break;
  }
  while (theEnd == true) { // While theEnd is true
    firstBackground(); // Calls the firstBackground() method
    endMessage(); // Calls the endMessage() method
    break;
  }
}

//First and last background - includes a sunflower, the sun, and some grass
void firstBackground() {
  background(#49A8F0); // Colour the background light blue

  //sun
  for (int sunDim = 180; sunDim>0; sunDim--) { // for loop to colour the sun without using fill()
    strokeWeight(4); // Set the strokeWeight to 2
    stroke(#ECFC0A); // Set the stroke to bright yellow
    ellipse(800, 0, sunDim, sunDim); // Draws the sun
  }

  //grass
  for (int grassDim = 800; grassDim>0; grassDim--) {  // for loop to colour the grass without using fill()
    stroke(#4DF054); // Set the stroke to light green
    rect(0, 480, grassDim, 20); // Draws the grass
  }

  //sunflower
  //stem
  for (int stemWidth = 6; stemWidth>0; stemWidth--) { // for loop to colour the stem of the sunflower without using fill()
    stroke(#1D9D15); // Set the stroke to dark green
    rect(730, 420, stemWidth, 60); // Draws the stem
  }
  //pedals
  for (int vertPedalX = 723; vertPedalX<743; vertPedalX++) { // for loop to colour the pedals of the sunflower without using fill()
    stroke(#E5DC23); // Set the stroke to yellow
    quad(vertPedalX, 420, 733, 385, 743, 420, 733, 450); // Draws the vertical pedals
  }

  for (int diaPedalX = 740; diaPedalX>718; diaPedalX--) { // for loop to colour the pedals of the sunflower without using fill()
    quad (708, 395, diaPedalX, 415, 760, 440, 730, 430); // Draws the diagonal pedal going from the top left to bottum right
  }

  for (int diaPedalY = 430; diaPedalY>415; diaPedalY--) {
    quad (760, 395, 730, 415, 708, 440, 740, diaPedalY); // Draws the diagonal pedal going from the top right to bottum left
  }

  for (int horPedalY = 430; horPedalY > 410; horPedalY--) {
    quad(733, 410, 767, 420, 733, horPedalY, 699, 420); // Draws the horizontal pedals
  }

  //flower
  for (int flowerDim = 20; flowerDim>0; flowerDim--) { // for loop to colour the middle of the sunflower without using fill()
    stroke(#BC7D1E); // Set the stroke to light brown
    ellipse(733, 420, flowerDim, flowerDim); // Draws the seed of the sunflower
  }
}

//Main background - includes a sun, sunflower, tree, peach, beehive, and grass - where most of the action takes place 
void mainBackground() {
  background(#49A8F0); // Colour the background light blue

  //sun
  for (int sunDim = 180; sunDim>0; sunDim--) { // for loop to colour the sun without using fill()
    strokeWeight(4); // Set the strokeWeight to 2
    stroke(#ECFC0A); // Set the stroke to bright yellow
    ellipse(800, 0, sunDim, sunDim); // Draws the sun
  }

  //sunflower
  //stem
  for (int stemWidth = 6; stemWidth>0; stemWidth--) { // for loop to colour the stem of the sunflower without using fill()
    stroke(#1D9D15); // Set the stroke to dark green
    rect(730, 420, stemWidth, 60); // Draws the stem
  }
  //pedals
  for (int vertPedalX = 723; vertPedalX<743; vertPedalX++) { // for loop to colour the pedals of the sunflower without using fill()
    stroke(#E5DC23); // Set the stroke to yellow
    quad(vertPedalX, 420, 733, 385, 743, 420, 733, 450); // Draws the vertical pedals
  }

  for (int diaPedalX = 740; diaPedalX>718; diaPedalX--) { // for loop to colour the pedals of the sunflower without using fill()
    quad (708, 395, diaPedalX, 415, 760, 440, 730, 430); // Draws the diagonal pedal going from the top left to bottum right
  }

  for (int diaPedalY = 430; diaPedalY>415; diaPedalY--) {
    quad (760, 395, 730, 415, 708, 440, 740, diaPedalY); // Draws the diagonal pedal going from the top right to bottum left
  }

  for (int horPedalY = 430; horPedalY > 410; horPedalY--) {
    quad(733, 410, 767, 420, 733, horPedalY, 699, 420); // Draws the horizontal pedals
  }

  //flower
  for (int flowerDim = 20; flowerDim>0; flowerDim--) { // for loop to colour the middle of the sunflower without using fill()
    stroke(#BC7D1E); // Set the stroke to light brown
    ellipse(733, 420, flowerDim, flowerDim); // Draws the seed of the sunflower
  }

  //beehive
  //stem
  strokeWeight(3); // Set the strokeWeight to 3
  for (int branchWidth = 16; branchWidth>0; branchWidth--) { // for loop to colour the stem of the beehive without using fill()
    stroke(#C67426); // Set the stroke to light brown
    rect(250, 60, branchWidth, 30); // Draws the stem of the beehive
  }

  //hive
  for (int topHiveDim = 90; topHiveDim>0; topHiveDim--) { // for loop to colour the top of the beehive without using fill()
    stroke(#EDC72D); // Set the stroke to yellow
    ellipse(258, 100, topHiveDim, 50); // Draws the top part of the hive
  }

  for (int midHiveDim = 75; midHiveDim>0; midHiveDim--) { // for loop to colour the middle of the beehive without using fill()
    ellipse(258, 140, midHiveDim, 50); // Draws the middle part of the hive
  }

  for (int midHiveDim = 55; midHiveDim>0; midHiveDim--) { // for loop to colour the bottum of the beehive without using fill()
    ellipse(258, 180, midHiveDim, 40); // Draws the bottum part of the hive
  }

  //beehive hole 
  for (int holeDim = 35; holeDim>0; holeDim--) { // for loop to colour the hole in the beehive without using fill()
    stroke(#D3A115); // Set the stroke to dark yellow
    ellipse(258, 140, holeDim, 35); // Draws the hole in the beehive
  }

  //grass
  for (int grassDim = 800; grassDim>0; grassDim--) {  // for loop to colour the grass without using fill()
    stroke(#4DF054); // Set the stroke to light green
    rect(0, 480, grassDim, 20); // Draws the grass
  }

  //tree
  //trunk
  for (int trunkX = 210; trunkX>=0; trunkX-=2) { // for loop to colour the tree trunk without using fill()
    strokeWeight(2); // Set the strokeWeight to 2
    stroke(#764619); // Set the stroke to dark brown
    quad(0, 500, 0, 460, trunkX-60, 460, trunkX, 500); // Draws the bottum trunk (the part sticking out) of the tree
  }
  //body
  for (int treeX = 150; treeX>=0; treeX--) { // for loop to colour the tree body without using fill()
    quad(0, 460, treeX, 460, treeX-40, 270, 0, 270); // Draws the bottum part of the body of the tree (up to the bottum branch)
    quad(0, 320, treeX-40, 320, treeX-40, 270, 0, 270); // Draws the body of the tree next to the bottum branch
    quad(treeX-40, 270, 0, 270, 0, 80, treeX-70, 80); // Draws the top part of the body of the tree (up to the top branch)
    quad(0, 0, treeX-75, 0, treeX-70, 80, 0, 80); // Draws the very top part of the tree
  }
  //bottum branch
  for (int botBranchY = 300; botBranchY>=245; botBranchY--) { // for loop to colour the bottum branch of the tree without using fill()
    strokeWeight(3); // Set the strokeWeight to 3
    beginShape(); // Draws the bottum branch
    vertex(110, botBranchY+20);
    bezierVertex(120, botBranchY-10, 340, botBranchY, 340, 250);
    bezierVertex(340, 245, 95, 240, 110, 270);
    endShape();
  }
  //top branch
  for (int botBranchY = 70; botBranchY>=15; botBranchY--) { // for loop to colour the top branch of the tree without using fill()
    beginShape(); // Draws the top branch
    vertex(80, botBranchY+20);
    bezierVertex(120, botBranchY-10, 340, botBranchY, 340, 20);
    bezierVertex(340, 15, 95, 10, 80, 40);
    endShape();
  }
  //peach
  for (int dimension = 30; dimension>=0; dimension--) { // for loop to colour the peach on the top branch without using fill()
    stroke(#FFA836); // Set the stroke to orange
    ellipse(122, 240, dimension, dimension); // Draws the peach sitting on the top branch
  }
}

//Spider-Draws the spider and its sleeping speech bubble
void spider() {
  //silk
  strokeWeight(4); // Set the strokeWeight to 4
  stroke(#BCB7A7); // Set the stroke to silver
  line(spiderX, 285, spiderX, spiderY-75); // Draws the thread of silk that holds up the spider

  //body
  fill(0); // Colour its body black
  stroke(0); // Set the stroke to black
  strokeWeight(1); // Set the strokeWeight to 1
  ellipse(spiderX, spiderY-50, 50, 50); // Draws the body of the spider
  fill(#D80E07); // Colour the mark on the body of the spider red
  arc(spiderX, spiderY-70, 25, 60, radians(0), radians(180)); // Draws the main part of the mark on the body of the spider
  arc(spiderX, spiderY-70, 25, 8, radians(180), radians(360)); // Rounds out the back of the mark on the body of the spider

  //legs
  //left leg
  fill(0);
  quad(spiderX-50, spiderY-75, spiderX-45, spiderY-75, spiderX-45, spiderY-105, spiderX-50, spiderY-105); // top left leg
  quad(spiderX-20, spiderY-65, spiderX-23, spiderY-60, spiderX-50, spiderY-75, spiderX-45, spiderY-77); // top left leg
  quad(spiderX-20, spiderY-50, spiderX-20, spiderY-55, spiderX-52, spiderY-55, spiderX-55, spiderY-50); // middle top left leg
  quad(spiderX-52, spiderY-55, spiderX-55, spiderY-50, spiderX-70, spiderY-80, spiderX-65, spiderY-80); // middle top left leg
  quad(spiderX-20, spiderY-40, spiderX-20, spiderY-45, spiderX-55, spiderY-45, spiderX-52, spiderY-40); // middle bottum left leg
  quad(spiderX-55, spiderY-45, spiderX-52, spiderY-40, spiderX-65, spiderY-10, spiderX-70, spiderY-10); // middle bottum left leg
  quad(spiderX-50, spiderY-17, spiderX-45, spiderY-15, spiderX-45, spiderY+12, spiderX-50, spiderY+12); // bottum left leg
  quad(spiderX-20, spiderY-35, spiderX-17, spiderY-32, spiderX-45, spiderY-15, spiderX-50, spiderY-17); // bottum left leg
  //right leg
  quad(spiderX+50, spiderY-75, spiderX+45, spiderY-77, spiderX+45, spiderY-105, spiderX+50, spiderY-105); // top right leg
  quad(spiderX+20, spiderY-65, spiderX+23, spiderY-60, spiderX+50, spiderY-75, spiderX+45, spiderY-77); // top right leg
  quad(spiderX+20, spiderY-50, spiderX+20, spiderY-55, spiderX+52, spiderY-55, spiderX+55, spiderY-50); // middle top right leg
  quad(spiderX+52, spiderY-55, spiderX+55, spiderY-50, spiderX+70, spiderY-80, spiderX+65, spiderY-80); // middle top right leg
  quad(spiderX+20, spiderY-40, spiderX+20, spiderY-45, spiderX+55, spiderY-45, spiderX+52, spiderY-40); // middle bottum left leg
  quad(spiderX+55, spiderY-45, spiderX+52, spiderY-40, spiderX+65, spiderY-10, spiderX+70, spiderY-10); // middle bottum left leg
  quad(spiderX+50, spiderY-17, spiderX+45, spiderY-15, spiderX+45, spiderY+12, spiderX+50, spiderY+12); // bottum left leg
  quad(spiderX+20, spiderY-35, spiderX+17, spiderY-32, spiderX+45, spiderY-15, spiderX+50, spiderY-17); // bottum left leg

  //face
  ellipse(spiderX, spiderY-15, 36, 36); // Draws the spider's head
  fill(#D80E07); // Colour the spider's eyes and fangs red
  ellipse(spiderX-7, spiderY-10, 10, 10); // Draws the spider's left eye
  ellipse(spiderX+7, spiderY-10, 10, 10); // Draws the spider's right eye
  triangle(spiderX-10, spiderY, spiderX-2, spiderY+2, spiderX-6, spiderY+12); // Draws the spider's left fang
  triangle(spiderX+10, spiderY, spiderX+2, spiderY+2, spiderX+6, spiderY+12); // Draws the spider's right fang

  //eye lids
  if (loopCount < 1905) { // If the loopCount is less than 1905 (when the fly One bumps into the beehive)
    fill(0); // Colour the eye lid black
    ellipse(spiderX-7, spiderY-15, 10, 15); // Spider's left eye lid
    ellipse(spiderX+7, spiderY-15, 10, 15); // Spider's right eye lid
  }

  //Sleep dialogue
  if (loopCount >= 1200 && loopCount < 1770) { // if the loopcount is equal to or greater than 1200 and less than 1770
    noStroke(); // No borders on shapes
    fill(255); // Colour the speech bubble white
    triangle(spiderX, spiderY+15, spiderX-10, spiderY+30, spiderX+10, spiderY+30); // Draws the triangle at the bottum of the speech bubble
    ellipse(spiderX, spiderY+48, 140, 45); // Draws the speech bubble
    fill(0); // Colour the dialogue black
    textFont(dialogues); // Set the font to "dialogues"
    textSize(20); // Set the textSize to 20
    text("Zzzzzzz....", spiderX-50, spiderY+55); // Draws the text
  }
}

//Draws the ant, its bite, and its scream
void ant() {
  fill(#B91313); // Colour the ant red
  noStroke(); // No border on the shapes

  //body
  ellipse(antX+170, 435, 50, 30); // Draws the behind of the ant
  ellipse(antX+135, 435, 35, 25); // Draws the body of the ant

  //head
  pushMatrix();
  translate(antX+110, 433); // Set the rotation point to (540, 433)
  rotate(100); // rotate the ant's head 100 degrees
  ellipse(0, 0, 40, 25); // Draw the ants head
  popMatrix();

  //antenas
  stroke(0); // Set the stroke to black
  strokeWeight(1);
  noFill(); // Do not fill the inside of the arc
  arc(antX+88, 438, 30, 70, radians(265), radians(335)); // left antena
  arc(antX+93, 435, 30, 70, radians(265), radians(335)); // right antena

  //face 
  fill(0); // Colour the ant's legs black
  ellipse(antX+107, 430, 8, 8); // eye
  triangle(antX+92, 441, antX+92, 434, antX+85, 445); // top fang
  triangle(antX+100, 447, antX+94, 444, antX+87, 447); // bottum fang

  //legs
  quad(antX+126, 446, antX+110, 461, antX+126, 476, antX+118, 461); // left leg
  quad(antX+136, 446, antX+152, 461, antX+136, 476, antX+142, 461); // middle leg
  quad(antX+156, 446, antX+172, 461, antX+156, 476, antX+162, 461); // right leg

  //bite
  if (bite==true) { // if bite is true
    fill(#49A8F0); // Colour the bite light blue (the same as the backgound so it will blend in)
    noStroke(); // No borders on shapes
    ellipse (290, 425, 20, 15); // draws the bite
    fill(255); // Colour the speech bubble white
    triangle(antX+81, 447, antX+71, 420, antX+31, 420); // Draws the speech bubble
    ellipse(antX+26, 415, 120, 50); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(20); // Set the textSize to 20
    text("Aaahhhhh", antX-23, 420); // Draws the text after being bitten
  }
}

// Draws the ant after it has turned around, its bite, and its scream 
void antTurn() {
  fill(#B91313); // Colour the ant red
  noStroke(); // No border on the shapes

  //body
  ellipse(antTurnX-170, 435, 50, 30); // Draws the behind of the ant
  ellipse(antTurnX-135, 435, 35, 25); // Draws the body of the ant

  //head
  pushMatrix();
  translate(antTurnX-110, 433); // Set the rotation point to (540, 433)
  rotate(-100); // rotate the ant's head 100 degrees
  ellipse(0, 0, 40, 25); // Draw the ants head
  popMatrix();

  //face 
  fill(0); // Colour the ant's legs black
  ellipse(antTurnX-107, 430, 8, 8); // eye
  triangle(antTurnX-92, 441, antTurnX-92, 434, antTurnX-85, 445); // top fang
  triangle(antTurnX-100, 447, antTurnX-94, 444, antTurnX-87, 447); // bottum fang

  //antenas
  stroke(0); // Set the stroke to black
  strokeWeight(1);
  noFill(); // Do not fill the inside of the arc
  arc(antTurnX-88, 438, 30, 70, radians(205), radians(275)); // left antena
  arc(antTurnX-93, 435, 30, 70, radians(205), radians(275)); // right antena

  //legs
  fill(0); // Colour the ant's legs black
  quad(antTurnX-126, 446, antTurnX-110, 461, antTurnX-126, 476, antTurnX-118, 461); // left leg
  quad(antTurnX-136, 446, antTurnX-152, 461, antTurnX-136, 476, antTurnX-142, 461); // middle leg
  quad(antTurnX-156, 446, antTurnX-172, 461, antTurnX-156, 476, antTurnX-162, 461); // right leg

  //bite 
  fill(#49A8F0); // Colour the bite light blue (the same as the backgound so it will blend in)
  noStroke(); // No borders on shapes
  ellipse (antTurnX-141, 425, 20, 15); // bite
  fill(255); // colour the speech bubble white
  triangle(antTurnX-81, 447, antTurnX-71, 420, antTurnX-31, 420); // Draws the speech bubble
  ellipse(antTurnX-26, 415, 120, 50); // Draws the speech bubble
  fill(0); // colour the text black
  textSize(20); // Set the textSize to 20
  text("Aaahhhhh", antTurnX-75, 420); // Draws the text inside the speech bubble
}

//Draws the bee with its flapping wings and changing face
void bee() {
  //beeWings
  noStroke(); // no borders on shapes
  if (beeWings == 1) { // If beeWings is equal to 1
    fill(#C6BCBC); // Colour the wings light grey
    beeWings = 2; // Set beeWings to 2
  } else if (beeWings == 2) { // If beeWings is equal to 2
    fill(#988A8A); // Colour the wings dark grey
    beeWings=1; // Set beeWings to 1
  }
  bezier(beeX-10, beeY+5, beeX-50, beeY-40, beeX-60, beeY+30, beeX-15, beeY+35); // main left wing
  bezier(beeX+10, beeY+5, beeX+50, beeY-40, beeX+60, beeY+30, beeX+15, beeY+35); // main right wing
  ellipse(beeX-25, beeY+40, 25, 25); // bottum left wing
  ellipse(beeX+25, beeY+40, 25, 25); // bottum right wing

  //stinger
  fill(#FFF815); // Colour the stinger yellow
  triangle(beeX-8, beeY+55, beeX+8, beeY+55, beeX, beeY+65); // Draws the stinger

  //body
  //To get the colour pattern:
  fill(0); // Set fill to black
  beginShape(); // Draws the third black section of the bee from the top
  vertex(beeX-19, beeY+48);
  bezierVertex(beeX-25, beeY+5, beeX+25, beeY+5, beeX+19, beeY+48);
  bezierVertex(beeX+16, beeY+60, beeX-16, beeY+60, beeX-19, beeY+48);
  endShape();

  fill(#FFF815); // Set fill to yellow
  beginShape(); // Draws the second yellow section of the bee from the top
  vertex(beeX-20, beeY+42);
  bezierVertex(beeX-25, beeY+5, beeX+25, beeY+5, beeX+20, beeY+42);
  bezierVertex(beeX+16, beeY+52, beeX-16, beeY+52, beeX-20, beeY+42);
  endShape();

  fill(0); // Set fill to black
  beginShape(); // Draws the second black section of the bee from the top
  vertex(beeX-21, beeY+34);
  bezierVertex(beeX-20, beeY+5, beeX+20, beeY+5, beeX+21, beeY+34);
  bezierVertex(beeX+6, beeY+44, beeX-16, beeY+44, beeX-21, beeY+34);
  endShape();

  fill(#FFF815); // Set fill to yellow
  beginShape(); // Draws the first yellow section of the bee from the top
  vertex(beeX-20, beeY+25);
  bezierVertex(beeX-20, beeY+5, beeX+20, beeY+5, beeX+20, beeY+25);
  bezierVertex(beeX+16, beeY+35, beeX-16, beeY+35, beeX-20, beeY+25);
  endShape();

  fill(0); // Set fill to black
  beginShape(); // Draws the first black section of the bee from the top
  vertex(beeX-15, beeY+17);
  bezierVertex(beeX-20, beeY+5, beeX+20, beeY+5, beeX+15, beeY+17);
  bezierVertex(beeX+16, beeY+25, beeX-16, beeY+25, beeX-15, beeY+17);
  endShape();

  //antenas
  fill(0); // colour the antenas black
  quad(beeX-10, beeY-5, beeX-5, beeY-5, beeX-13, beeY-25, beeX-18, beeY-25); // left antena
  quad(beeX, beeY-5, beeX+5, beeY-5, beeX+13, beeY-35, beeX+8, beeY-35); // right antena
  //top of the antena
  fill(#FFF815); // colour the circular top of the antenas yellow
  ellipse(beeX-15, beeY-25, 8, 8); // top of left antena
  ellipse(beeX+11, beeY-35, 8, 8); // top of right antena

  //head
  noStroke(); // No borders on shapes
  fill(#FFF815); // Colour the head of the bee yellow
  ellipse(beeX, beeY, 25, 25); // head

  //face
  fill(0); // colour the eyes black
  ellipse(beeX-5, beeY-3, 6, 6); // left eye
  ellipse(beeX+5, beeY-3, 6, 6); // right eye
  stroke(0); // Set stroke to black
  noFill(); // Don't fill the arc
  if (loopCount > 1500) { // If loopCount is greater than 1500 (after the bee disappears from the screen, so that when it comes back after fly one bumps into the beehive it will have a frown)
    arc(beeX, beeY+7, 14, 8, radians(180), radians(360)); // frown
  } else { // Otherwise (if the bee is still pollinating)
    arc(beeX, beeY+3, 15, 8, radians(10), radians(170)); // smile
  }
}

void beeTwo() {
  noStroke(); // No borders on shapes
  if (beeWings == 1) { // If beeWings is equal to 1
    fill(#C6BCBC); // Colour the wings light grey
  } else if (beeWings == 2) { // If beeWings is equal to 2
    fill(#988A8A); // Colour the wings dark grey
  }
  bezier(beeTwoX-10, beeTwoY+5, beeTwoX-50, beeTwoY-40, beeTwoX-60, beeTwoY+30, beeTwoX-15, beeTwoY+35); // main left wing
  bezier(beeTwoX+10, beeTwoY+5, beeTwoX+50, beeTwoY-40, beeTwoX+60, beeTwoY+30, beeTwoX+15, beeTwoY+35); // main right wing
  ellipse(beeTwoX-25, beeTwoY+40, 25, 25); // bottum left wing
  ellipse(beeTwoX+25, beeTwoY+40, 25, 25); // bottum right wing

  //stinger
  fill(#FFF815); // Colour the stinger yellow
  triangle(beeTwoX-8, beeTwoY+55, beeTwoX+8, beeTwoY+55, beeTwoX, beeTwoY+65); // Draws the stinger

  //Body
  //To get the colour pattern:
  fill(0); // Set fill to black
  beginShape(); // Draws the third black section of the bee from the top
  vertex(beeTwoX-19, beeTwoY+48);
  bezierVertex(beeTwoX-25, beeTwoY+5, beeTwoX+25, beeTwoY+5, beeTwoX+19, beeTwoY+48);
  bezierVertex(beeTwoX+16, beeTwoY+60, beeTwoX-16, beeTwoY+60, beeTwoX-19, beeTwoY+48);
  endShape();

  fill(#FFF815); // Set fill to yellow
  beginShape(); // Draws the second yellow section of the bee from the top
  vertex(beeTwoX-20, beeTwoY+42);
  bezierVertex(beeTwoX-25, beeTwoY+5, beeTwoX+25, beeTwoY+5, beeTwoX+20, beeTwoY+42);
  bezierVertex(beeTwoX+16, beeTwoY+52, beeTwoX-16, beeTwoY+52, beeTwoX-20, beeTwoY+42);
  endShape();

  fill(0); // Set fill to black
  beginShape(); // Draws the second black section of the bee from the top
  vertex(beeTwoX-21, beeTwoY+34);
  bezierVertex(beeTwoX-20, beeTwoY+5, beeTwoX+20, beeTwoY+5, beeTwoX+21, beeTwoY+34);
  bezierVertex(beeTwoX+6, beeTwoY+44, beeTwoX-16, beeTwoY+44, beeTwoX-21, beeTwoY+34);
  endShape();

  fill(#FFF815); // Set fill to yellow
  beginShape(); // Draws the first yellow section of the bee from the top
  vertex(beeTwoX-20, beeTwoY+25);
  bezierVertex(beeTwoX-20, beeTwoY+5, beeTwoX+20, beeTwoY+5, beeTwoX+20, beeTwoY+25);
  bezierVertex(beeTwoX+16, beeTwoY+35, beeTwoX-16, beeTwoY+35, beeTwoX-20, beeTwoY+25);
  endShape();

  fill(0); // Set fill to black
  beginShape(); // Draws the first black section of the bee from the top
  vertex(beeTwoX-15, beeTwoY+17);
  bezierVertex(beeTwoX-20, beeTwoY+5, beeTwoX+20, beeTwoY+5, beeTwoX+15, beeTwoY+17);
  bezierVertex(beeTwoX+16, beeTwoY+25, beeTwoX-16, beeTwoY+25, beeTwoX-15, beeTwoY+17);
  endShape();

  //antenas
  fill(0); // colour the antenas black
  quad(beeTwoX-10, beeTwoY-5, beeTwoX-5, beeTwoY-5, beeTwoX-13, beeTwoY-25, beeTwoX-18, beeTwoY-25); // left antena
  quad(beeTwoX, beeTwoY-5, beeTwoX+5, beeTwoY-5, beeTwoX+13, beeTwoY-35, beeTwoX+8, beeTwoY-35); // right antena
  //top of the antena
  fill(#FFF815); // colour the circular top of the antenas yellow
  ellipse(beeTwoX-15, beeTwoY-25, 8, 8); // top of left antena
  ellipse(beeTwoX+11, beeTwoY-35, 8, 8); // top of right antena

  //head
  noStroke(); // No borders on shapes
  fill(#FFF815); // Set fill to yellow
  ellipse(beeTwoX, beeTwoY, 25, 25); // head

  //face
  fill(0); // colour the eyes black
  ellipse(beeTwoX-5, beeTwoY-3, 6, 6); // left eye
  ellipse(beeTwoX+5, beeTwoY-3, 6, 6); // right eye
  stroke(0); // Set stroke to black
  noFill(); // Don't fill the arc
  arc(beeTwoX, beeTwoY+7, 14, 8, radians(180), radians(360)); // draws the frown
}

//Draws the first fly and its flapping wings
void flyOne() {
  // Wings
  //To get the effect of flapping wings:
  if (flyWings == 1) { // If flyWings is equal to 1
    fill(#C6BCBC); // Colour the wings light grey
  } else if (flyWings == 2) { // If flyWings is equal to 1
    fill(#737379); // Colour the wings dark grey
  }
  stroke(#787978); // Set the stroke to dark grey
  bezier(flyX-15, flyY-10, flyX-13, flyY-70, flyX+10, flyY-50, flyX-2, flyY-10); // left wing
  bezier(flyX-5, flyY-10, flyX+10, flyY-60, flyX+35, flyY-60, flyX+10, flyY-10); // right wing

  //legs
  fill(0); // Colour the legs black
  noStroke(); // No borders on shapes
  if (loopCount > 1891 && loopCount < 1896) { // Bend the legs when Fly One crashes onto a branch of a tree (if loopCount is greater than 1891 and less than 1896)
    quad(flyX-9, flyY+10, flyX-3, flyY+12, flyX-9, 242, flyX-15, 242); // top of first leg
    quad(flyX+3, flyY+10, flyX+9, flyY+12, flyX+3, 242, flyX-3, 242); // top of second leg
    quad(flyX+17, flyY+8, flyX+23, flyY+8, flyX+15, 242, flyX+9, 242); // top of second leg
    quad(flyX-9, 242, flyX-15, 242, flyX-7, 248, flyX-1, 248); // bottum of first leg
    quad(flyX+3, 242, flyX-3, 242, flyX+5, 248, flyX+11, 248); // bottum of second leg
    quad(flyX+15, 242, flyX+9, 242, flyX+17, 248, flyX+23, 248); // bottum of second leg
  } else { // Otherwise
    quad(flyX-9, flyY+10, flyX-3, flyY+12, flyX-9, flyY+22, flyX-15, flyY+22); // top of first leg
    quad(flyX-9, flyY+22, flyX-15, flyY+22, flyX-7, flyY+32, flyX-1, flyY+32); // bottum of first leg
    quad(flyX+3, flyY+10, flyX+9, flyY+12, flyX+3, flyY+22, flyX-3, flyY+22); // top of second leg
    quad(flyX+3, flyY+22, flyX-3, flyY+22, flyX+5, flyY+32, flyX+11, flyY+32); // bottum of second leg
    quad(flyX+17, flyY+8, flyX+23, flyY+8, flyX+15, flyY+22, flyX+9, flyY+22); // top of second leg
    quad(flyX+15, flyY+22, flyX+9, flyY+22, flyX+17, flyY+32, flyX+23, flyY+32); // bottum of second leg
  }

  //head
  fill(#1A5A10); // Colour the head  and body emerald green
  ellipse(flyX-30, flyY, 26, 26); // head

  //body
  ellipse(flyX, flyY, 50, 30); // body
  arc(flyX+30, flyY, 36, 24, radians(-90), radians(270)); // back body

  //face
  fill(#0D047C); // fill the eye dark blue
  ellipse(flyX-33, flyY-3, 7, 7); // eye
  fill(0); // colour the mouth black
  triangle(flyX-42, flyY+3, flyX-33, flyY+3, flyX-39, flyY+10); // mouth
}

//Draws the first fly after it turns and its flapping wings
void flyOneTurn() {
  // Wings
  //To get the effect of flapping wings:
  if (flyWings == 1) { // If flyWings is equal to 1
    fill(#C6BCBC); // Colour the wings light grey
  } else if (flyWings == 2) { // If flyWings is equal to 1
    fill(#737379); // Colour the wings dark grey
  }
  stroke(#787978); // Set the stroke to dark grey
  bezier(flyX+15, flyY-10, flyX+13, flyY-70, flyX-10, flyY-50, flyX+2, flyY-10); // left wing
  bezier(flyX+5, flyY-10, flyX-10, flyY-60, flyX-35, flyY-60, flyX-10, flyY-10); // right wing

  //legs
  fill(0); // Colour the legs black
  noStroke(); // No borders on shapes
  quad(flyX+9, flyY+10, flyX+3, flyY+12, flyX+9, flyY+22, flyX+15, flyY+22); // top of first leg
  quad(flyX+9, flyY+22, flyX+15, flyY+22, flyX+7, flyY+32, flyX+1, flyY+32); // bottum of first leg
  quad(flyX-3, flyY+10, flyX-9, flyY+12, flyX-3, flyY+22, flyX+3, flyY+22); // top of second leg
  quad(flyX-3, flyY+22, flyX+3, flyY+22, flyX-5, flyY+32, flyX-11, flyY+32); // bottum of second leg
  quad(flyX-17, flyY+8, flyX-23, flyY+8, flyX-15, flyY+22, flyX-9, flyY+22); // top of second leg
  quad(flyX-15, flyY+22, flyX-9, flyY+22, flyX-17, flyY+32, flyX-23, flyY+32); // bottum of second leg

  //head
  fill(#1A5A10); // Colour the head and body emerald green
  ellipse(flyX+30, flyY, 26, 26); // head

  //body
  ellipse(flyX, flyY, 50, 30); // body
  arc(flyX-30, flyY, 36, 24, radians(-90), radians(270)); // back body

  //face
  fill(#0D047C); // fill the eye dark blue
  ellipse(flyX+33, flyY-3, 7, 7); // eye
  fill(0); // colour the mouth black
  triangle(flyX+42, flyY+3, flyX+33, flyY+3, flyX+39, flyY+10); // mouth
}

//Draws the second fly and its animations
void flyTwo() {
  // Wings
  //To get the effect of flapping wings:
  if (flyWings == 1) { // If flyWings is equal to 1
    fill(#C6BCBC); // Colour the wings light grey
    flyWings = 2; // Set flyWings to 2
  } else if (flyWings == 2) { // If flyWings is equal to 2
    fill(#737379); // Colour the wings dark grey
    flyWings = 1; // Set flyWIngs to 1
  }

  stroke(#787978); // Set the stroke to dark grey
  bezier(flyTwoX-15, flyTwoY-10, flyTwoX-13, flyTwoY-70, flyTwoX+10, flyTwoY-50, flyTwoX-2, flyTwoY-10); // left wing
  bezier(flyTwoX-5, flyTwoY-10, flyTwoX+10, flyTwoY-60, flyTwoX+35, flyTwoY-60, flyTwoX+10, flyTwoY-10); // right wing

  //legs
  fill(0); // Colour the legs black
  noStroke(); //No borders on shapes
  quad(flyTwoX-9, flyTwoY+10, flyTwoX-3, flyTwoY+12, flyTwoX-9, flyTwoY+22, flyTwoX-15, flyTwoY+22); // top of first leg
  quad(flyTwoX-9, flyTwoY+22, flyTwoX-15, flyTwoY+22, flyTwoX-7, flyTwoY+32, flyTwoX-1, flyTwoY+32); // bottum of first leg
  quad(flyTwoX+3, flyTwoY+10, flyTwoX+9, flyTwoY+12, flyTwoX+3, flyTwoY+22, flyTwoX-3, flyTwoY+22); // top of second leg
  quad(flyTwoX+3, flyTwoY+22, flyTwoX-3, flyTwoY+22, flyTwoX+5, flyTwoY+32, flyTwoX+11, flyTwoY+32); // bottum of second leg
  quad(flyTwoX+17, flyTwoY+8, flyTwoX+23, flyTwoY+8, flyTwoX+15, flyTwoY+22, flyTwoX+9, flyTwoY+22); // top of second leg
  quad(flyTwoX+15, flyTwoY+22, flyTwoX+9, flyTwoY+22, flyTwoX+17, flyTwoY+32, flyTwoX+23, flyTwoY+32); // bottum of second leg

  //head
  fill(#1A5A10); // Colours the head and body emerald green
  ellipse(flyTwoX-30, flyTwoY, 26, 26); // head

  //body
  ellipse(flyTwoX, flyTwoY, 50, 30); // body
  arc(flyTwoX+30, flyTwoY, 36, 24, radians(-90), radians(270)); // back body

  //face
  fill(#0D047C); // fill the eye dark blue
  ellipse(flyTwoX-33, flyTwoY-3, 7, 7); // eye
  fill(0); // colour the mouth black
  triangle(flyTwoX-42, flyTwoY+3, flyTwoX-33, flyTwoY+3, flyTwoX-39, flyTwoY+10); // mouth
}

//Draws the second fly after it turns and its flapping wings
void flyTwoTurn() {
  // Wings
  //To get the effect of flapping wings:
  if (flyWings == 1) { // If flyWings is equal to 1
    fill(#C6BCBC); // Colour the wings light grey
    flyWings = 2; // Set flyWings to 2
  } else if (flyWings == 2) { // If flyWings is equal to 2
    fill(#737379); // Colour the wings dark grey
    flyWings = 1; // Set flyWIngs to 1
  }

  stroke(#787978); // Set the stroke to dark grey
  bezier(flyTwoX+15, flyTwoY-10, flyTwoX+13, flyTwoY-70, flyTwoX-10, flyTwoY-50, flyTwoX+2, flyTwoY-10); // left wing
  bezier(flyTwoX+5, flyTwoY-10, flyTwoX-10, flyTwoY-60, flyTwoX-35, flyTwoY-60, flyTwoX-10, flyTwoY-10); // right wing

  //legs
  fill(0); // Colour the legs black
  noStroke(); // No borders on shapes
  quad(flyTwoX+9, flyTwoY+10, flyTwoX+3, flyTwoY+12, flyTwoX+9, flyTwoY+22, flyTwoX+15, flyTwoY+22); // top of first leg
  quad(flyTwoX+9, flyTwoY+22, flyTwoX+15, flyTwoY+22, flyTwoX+7, flyTwoY+32, flyTwoX+1, flyTwoY+32); // bottum of first leg
  quad(flyTwoX-3, flyTwoY+10, flyTwoX-9, flyTwoY+12, flyTwoX-3, flyTwoY+22, flyTwoX+3, flyTwoY+22); // top of second leg
  quad(flyTwoX-3, flyTwoY+22, flyTwoX+3, flyTwoY+22, flyTwoX-5, flyTwoY+32, flyTwoX-11, flyTwoY+32); // bottum of second leg
  quad(flyTwoX-17, flyTwoY+8, flyTwoX-23, flyTwoY+8, flyTwoX-15, flyTwoY+22, flyTwoX-9, flyTwoY+22); // top of second leg
  quad(flyTwoX-15, flyTwoY+22, flyTwoX-9, flyTwoY+22, flyTwoX-17, flyTwoY+32, flyTwoX-23, flyTwoY+32); // bottum of second leg

  //head
  fill(#1A5A10); // Colour the head and body emerald green
  ellipse(flyTwoX+30, flyTwoY, 26, 26); // head

  //body
  ellipse(flyTwoX, flyTwoY, 50, 30); // body
  arc(flyTwoX-30, flyTwoY, 36, 24, radians(-90), radians(270)); // back body

  //face
  fill(#0D047C); // fill the eye dark blue
  ellipse(flyTwoX+33, flyTwoY-3, 7, 7); // eye
  fill(0); // colour the mouth black
  triangle(flyTwoX+42, flyTwoY+3, flyTwoX+33, flyTwoY+3, flyTwoX+39, flyTwoY+10); // mouth
}

//Animation & Pages

// Draws all the text for the title page
void titlePage() {
  //title
  title = loadFont("Jokerman-Regular-48.vlw"); // load the font onto 'title'
  fill(255); // Colour the text white
  textFont(title); // set the font to title
  textSize(65); // set textSize to 65
  text("THE ADVENTURE", 130, 170); // Draws the title
  //author
  textSize(30); // set textSize to 30
  text("Created by: Jeffery Hu", 230, 260); // Draws the name of the author
  //titleCount
  titleCount += 1; //Add one to titleCount each time(so this screen disappears after serveral seconds)
}

// Draws the animations of the characters during the first scene from when they enter the screen up until when the background changes
void movingMainScreen() {

  //loopCount
  loopCount += 1; // Add 1 to loopCount each time

  //moveScreen
  if (flyX == -20) { // If flyX is -20 (After the first fly has gone out the left side of the screen)
    moveScreen = true; // Set moveScreen to true
  }

  //ant animations
  if (loopCount < 400 || loopCount > 800) { // If the loopCount is greater than 800 or less than 400 (skiping 400-800 as that is when the dialogue occurs)
    antX += antSpeed; // add antSpeed to antX each time (to move the ant forward)
  }

  //fly One animation
  if (flyX > 550) { // If flyX is greater than 550
    flyX -=1; // Subtract 1 from flyX each time (to move it forward to the point where it will start moving down (after it sees Anty))
  } else if (flyX <= 550 && flyX > 450) { // Otherwise, if flyX is equal to or less than 550 and flyX is greater than 450
    flyX -=1; // Subtract 1 from flyX each time (to bring fly One to the point where it will start talking to Anty)
    flyY +=1;  // Subtract 1 from flyY each time (to make it fly diagonally)
  }

  //fly Two animation
  if (flyTwoX > 500|| loopCount>900) { // if flyTwoX is greater than 500 or loopCount is greater than 900
    flyTwoX -=1; // Subtract 1 from flyTwoX each time (to make fly Two move forward before and after the first dialogue)
  }

  //continuation of animation after dialogue
  //Fly one animation
  if (loopCount>850 && flyY > 180) { // if loopCount is greater than 850 and flyY is greater than 180 (to move fly One diagonally back up and in line with fly Two)
    flyX -= 1; // Subtract 1 from flyX each time
    flyY -= 1; // Subtract 1 from flyY each time
  }

  if (loopCount>950 && flyY == 180) { // If loopCount is greater than 950 and flyY is equal to 180 (after flyY is back level with flyTwoY)
    flyX -= 1; // subtract 1 from flyX each time (to move it forwards)
  }

  //reset the values for the next screen
  if (moveScreen == true) { // if moveScreen is true
    flyX += 800; // Add 800 to flyX
    flyTwoX += 800; // Add 800 to flyTwoX
    antX += 800; // Add 800 to antX
  }
}

// Draws the speech bubbles and texts during the first round of dialogue
void beginDialogue() {

  //font
  dialogueOne = loadFont("CenturyGothic-Bold-48.vlw"); // Loads the font onto 'dialogueOne'

  //Anty dialogue
  if (loopCount>400 && loopCount<500) { // If the loopCount is greater than 400 and less than 500
    fill(255); // Colour the speech bubble white
    triangle(420, 440, 370, 415, 390, 380); // Draws the speech bubble
    ellipse(350, 400, 130, 80); // Draws the speech bubble
    fill(0); // Colour the text black
    textFont(dialogueOne); // Sets 'dialogueOne' as the current font
    textSize(20); // Set the textSize to 20
    text("Hi Fly Twins!", 298, 402); // Draws the text
  }

  //Fly one dialogue
  if (loopCount>500 && loopCount<650) { // If the loopCount is greater than 500 and less than 650
    fill(255); // Colour the speech bubble white
    triangle(405, 285, 360, 275, 380, 240); // Draws the speech bubble
    ellipse(330, 240, 150, 100); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(17); // Set the textSize to 17
    text("  Hi Anty! Are\n you ready for\nan adventure?", 272, 225); // Draws the text
  }

  //Anty dialogue
  if (loopCount>650 && loopCount<700) { // If the loopCount is greater than 650 and less than 700
    fill(255); // Colour the speech bubble white
    triangle(420, 440, 370, 415, 390, 380); // Draws the speech bubble
    ellipse(350, 400, 130, 80); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(25); // Set the textSize to 25
    text("Yeah!", 317, 405); // Draws the text
  }

  //Fly Two dialogue
  if (loopCount>700 && loopCount<800) { // If the loopCount is greater than 700 and less than 800
    fill(255); // Colour the speech bubble white
    triangle(455, 185, 400, 170, 430, 140); // Draws the speech bubble
    ellipse(390, 140, 130, 80); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(25); // Set the textSize to 25
    text("Let's go!", 345, 145); // Draws the text
  }
}

//Second animation that takes the characters across the main background as they find the peach. Stops when they squeeze past the beehive and start talking. It stops halfway through as there is a second dialogue.
void findingPeach() {

  //spider animation
  spiderY += spiderSpeed; // Add spiderSpeed to spiderY each time
  if (spiderY == 400 || spiderY == 370) { // If spiderY gets too low or too high
    spiderSpeed *= -1; // Make the spider change directions (e.g. if it was going up, it will now be going down)
  }

  //loopCount
  loopCount +=1; // Add one to loopCount each time

  //ant animations
  if (antX>400) { // If antX is greater than 400
    antX -= 2; // add antSpeed to antX each time (to move the ant forward until 400 where it starts talking)
  }

  //bee animations
  if (beeX < 732) { // If beeX is greater than 732  
    beeX+=2; // Subtract to beeX each time (to move it horizontally so it is above the sunflower)
  }
  if (beeX == 732 && beeY == 356 && loopCount > 1420) { // If the bee reaches the waypoint for the sunflower and starts pollunating
    pollinate = true;
  }
  if (beeX == 732 && beeY < 355 && pollinate == false) { // If the bee is hovering above the sunflower and hasn't pollinated it yet
    beeY += 2; // Add 2 to beeY each time (to bring it down to the sunflower)
  } else if (pollinate == true && beeY > 300) { // After the bee has pollinated and beeY is greater than 300 (it needs to go up)
    beeY -= 2; // Subtract 2 from beeY each time (to bring it back up above the sunflower)
  } else if (pollinate == true && beeY == 300 && beeX < 900) { // If the bee has pollinated and beeY is equal to 300 and beeX is less than 900 (if it pollunated and is at the correct vertical altitude above the sunflower)
    beeX += 2; // Add 2 to beeX to bring it off the screen as it is searching for other sunflowers
  }

  //fly one animations
  if (flyX > 480 && flyY > 100) { // If flyX is greater than 480 or flyY is greater than 100
    flyX -= 3; // Subtract 4 from flyX each time
    flyY -= 1; // Subtract 1 from flyY each time (to bring it to the correct position to talk)
  }

  //fly two animations
  if (flyTwoX > 660 && flyPointOne == false) { // If flyTwoX is greater than 660 and flyPointOne is false (the fly hasn't reached its first waypoint)
    flyTwoX -= 3; // Subtract 3 each time
  } else if (flyTwoX == 660) { // If flyTwoX is equal to 660
    flyPointOne = true; // Set flyPointOne to true
  }
  if (flyPointOne == true && flyTwoY < 218 && loopCount < 1550) { // If flyPointOne is true (it has reached its first waypoint) and flyTwoY is less than 222 and loopCount is less than 1550
    flyTwoX -= 3; // Subtract 3 from flyTwoX each time
    flyTwoY += 1; // Add 3 to flyTwoY each time
  }

  // AFTER the second dialogue
  //Fly two animations
  if (loopCount > 1550 && flyTwoX > 188) { // If loopCount is greater than 1550 and flyTwoX > 1888 (Brings beeTwo forward past the beehive)
    flyTwoX -= 4; // Subtract 4 from flyTwoX each time
  }
  if (flyTwoX > 160 && flyTwoX <= 188 && loopCount > 1500) { // If flyTwo is past the bee hive (flyTwoX is greater than 160 and flyTwoX less than or equal to 188 and loopCount greater than 1500)
    flyTwoX -= 1; // Subtract 1 from flyTwoX each time
  }
  if (flyTwoX < 188 && flyTwoY > 125 && loopCount > 1550) { // If flyTwo is past the bee hive (flyTwoX less than 188 and flyTwoY greater than 125 and loopCount greater than 1550)
    flyTwoY -= 3; // Subtract 3 from flyTwoY each time
  }

  //fly one animations
  if (loopCount > 1570 && flyY <= 214) { // If fly Two has already moved and flyY is not yet at the correct altitude needed to squeeze past the beehive (loopCount is greater than 1570 and flyY is less than or equal to 214)
    flyY += 2; //Add 2 to flyY each time
  }

  if (loopCount > 1570 && flyX > 200) { // If fly Two has already moved and flyX is not near the peach (loopCount is greater than 1570 and flyX is greater than 200)
    flyX -= 2; // Subtract 2 from flyX each time
  }

  if (loopCount > 1550 && flyX > 180 && flyY == 216) { // If the dialogue has finished and flyY is at the correct altitude and has squeezed by the beehive but not super close to the peach (loopCount is greater than 1550 and flyX greater than 180 and flyY is equal to 216)
    flyX -= 2; // Subtract 2 from FlyX each time
  }
}

// Draws the speech bubbles and text in the second round of dialogue (this dialogue happens in the middle of the animations in the findingpeach() method)
void secondDialogue() {  
  // Fly Two dialogue
  if (loopCount>1435 && loopCount<1470) { // If the loopCount is between 1435 and 1470
    fill(255); // Colour the speech bubbles white
    triangle(flyTwoX-47, flyTwoY+3, flyTwoX-50, flyTwoY-25, flyTwoX-80, flyTwoY-15); // Draws the speech bubble
    ellipse(flyTwoX-104, flyTwoY-42, 150, 75); // Draws the speech bubble
    fill(0); // Colour the text black
    textFont(dialogues); // Set the font to dialogues
    textSize(17); // Set the textSize to 17
    text("        WOW!\nLook its a peach!!", flyTwoX-168, flyTwoY-52); //Draws the text
  }
  // Ant dialogue
  if (loopCount>1470 && loopCount<1500) { // If the loopCount is between 1470 and 1500
    fill(255); // Colour the speech bubbles white
    triangle(480, 447, 470, 420, 430, 420); // Draws the speech bubble
    ellipse(425, 410, 110, 60); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(17); // Set the textSize to 17
    text(" Really?!?\nCan I see?", antX-12, 403); //Draws the text
  }
  // Fly One dialogue
  if (loopCount>1500 && loopCount<1530) { // If the loopCount is between 1500 and 1530
    fill(255); // Colour the speech bubbles white
    triangle(flyX-47, flyY+3, flyX-50, flyY-25, flyX-80, flyY-15); // Draws the speech bubble
    ellipse(flyX-104, flyY-42, 150, 75); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(17); // Set the textSize to 17
    text(" Let's bring it\ndown for Anty.", flyX-160, flyY-50); //Draws the text
  }
  // Fly Two dialogue
  if (loopCount>1530 && loopCount<1550) { // If the loopCount is between 1530 and 1550
    fill(255); // Colour the speech bubbles white
    triangle(flyTwoX-47, flyTwoY+3, flyTwoX-50, flyTwoY-25, flyTwoX-80, flyTwoY-15); // Draws the speech bubble
    ellipse(flyTwoX-104, flyTwoY-42, 150, 75); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(25); // Set the textSize to 25
    text("Ok", flyTwoX-120, flyTwoY-40); //Draws the text
  }
}

// Draws the speech bubbles and text in the third dialogue - after the flies are past the beehive and near the peach
void thirdDialogue() {

  //LoopCount
  loopCount += 1; // Add 1 to loopCount each time

  noStroke(); // No borders on the speech bubbles
  if (loopCount > 1697 && loopCount < 1730) { // If the loopCount is between 1697 and 1730
    //Fly One dialogue
    fill(255); // Colour the speech bubbles white
    triangle(flyX-47, flyY+3, flyX-50, flyY-25, flyX-80, flyY-15); // Draws the speech bubble
    ellipse(flyX-104, flyY-42, 160, 75); // Draws the speech bubble
    fill(0); // Colour the text black
    textFont(dialogues); // Set the font to 'dialogues'
    textSize(17); // Set the textSize to 17
    text("WOW, the peach\nlooks SO GOOD!!", flyX-170, flyY-50); //Draws the text
  } else if (loopCount > 1730 && loopCount < 1770) { // If the loopCount is between 1730 and 1770
    //Ant dialogue
    fill(255); // Colour the speech bubbles white
    triangle(antX+81, 447, antX+71, 420, antX+31, 420); // Draws the speech bubble
    ellipse(antX+26, 410, 135, 75); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(15); // Set the textSize to 15
    text("    I'm going to\nget a better view.", antX-34, 400); //Draws the text
  } else if (loopCount > 1770 && loopCount < 1800) { // If the loopCount is between 1770 and 1800
    //Fly One dialogue
    fill(255); // Colour the speech bubbles white
    triangle(flyX-47, flyY+3, flyX-50, flyY-25, flyX-80, flyY-15); // Draws the speech bubble
    ellipse(flyX-104, flyY-42, 160, 75); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(20); // Set the textSize to 20
    text("I just want\n  to eat it!", flyX-155, flyY-50); //Draws the text
  } else if (loopCount > 1800 && loopCount < 1840) { // If the loopCount is between 1770 and 1800
    //Fly Two dialogue
    fill(255); // Colour the speech bubbles white
    triangle(flyTwoX-47, flyTwoY+3, flyTwoX-50, flyTwoY-25, flyTwoX-80, flyTwoY-15); // Draws the speech bubble
    ellipse(flyTwoX-104, flyTwoY-42, 150, 75); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(15); // Set the textSize to 15
    text(" No!! We have\n   to bring it\ndown for Anty.", flyTwoX-155, flyTwoY-58); //Draws the text
  } else if (loopCount > 1840 && loopCount < 1870) { // If the loopCount is between 1840 and 1870
    //Fly One dialogue
    fill(255); // Colour the speech bubbles white
    triangle(flyX-47, flyY+3, flyX-50, flyY-25, flyX-80, flyY-15); // Draws the speech bubble
    ellipse(flyX-104, flyY-42, 160, 60); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(20); // Set the textSize to 20
    text("Just ONE bite...", flyX-175, flyY-40); //Draws the text
  } else if (loopCount > 1870 && loopCount < 1900) { // If the loopCount is between 1870 and 1900
    //Fly Two dialogue
    fill(255); // Colour the speech bubbles white
    triangle(flyTwoX-47, flyTwoY+3, flyTwoX-50, flyTwoY-25, flyTwoX-80, flyTwoY-15); // Draws the speech bubble
    ellipse(flyTwoX-104, flyTwoY-42, 120, 75); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(30); // Set the textSize to 30
    text("STOP!!", flyTwoX-150, flyTwoY-32);//Draws the text
  }

  while (loopCount > 1770 && antX > 150) { // While Anty has spoken and he is not below the spider (While loopCount is greater than 1770 and antX greater than 150)
    antX -= 2; // Subtract 2 from antX each time (to make it move forwards)
    break;
  }
}

// Includes all the animations after the third round of dialogues until Fly One hits the bee hive
void hittingPeach() {
  if (loopCount > 1870 && flyTwoY < 188 && loopCount <= 1890) { // Fly Two hitting Fly One (if loopCount is greater than 1870 and flyTwoY less than 188 and loopCount less than or equal to 1890)
    flyTwoY += 3; // Add 3 to flyTwoY each time (to make Fly Two fly down to bump into fly One (to stop them from eating the peach))
    flyX -= 1; // Subtract one from flyX each time (to make Fly One fly closer to the peach to take a bite)
  } else if (loopCount > 1890 && flyY-28 >= flyTwoY && flyY <= 220 && loopCount <= 1893) { // Fly Two bouncing up and Fly One crashing into the tree after being hit
    flyY += 3; // Add 3 to flyY each time (to make it crash into a tree)
    flyTwoY -= 10; // Subtract 10  from flyTwoY (to make it bounce up after bumping into Fly One)
  }
  if (loopCount > 1893 && flyX < 194 && loopCount <= 1903) { // Fly One bouncing off the tree branch and hitting the beehive (if loopCount greater than 1893 but equal to or less than 1903 and flyX less than 194)
    flyX += 4; //Add 4 to flyX each time
    flyY -= 2; // Subtract 2 from flyY each time
  } else if (loopCount > 1903 && flyX > 176) { // Fly One bouncing off the beehive back to its original position (if loopCount greater than 1903 and flyX greater than 176)
    flyTwoY -= 2; // Subtract 2 from flyTwoY each time
    flyX -= 3; // Subtract 3 from flyX each time
    flyY += 1; // Add 1 to flyY each time
  }
  while (loopCount > 1970 && spiderY < 420 && bite == false) { // While Anty is talking during the forth dialogue and the spider hasn't bitten Anty yet
    spiderY += biteSpeed; // Add biteSpeed to spiderY each time
    biteSpeed += 1; // Add 1 to biteSpeed each time (to make the spider travel faster as it gains momentum)
    break;
  }
  if (spiderY == 421) { // If spider Y is at the position where its fangs have gone into Anty (if spiderY is equal to 421)
    bite = true; // Set bite to true
  }
  while (bite == true && spiderY > 390) { // To return the spider to its original position after it bit Anty (while bite is true and spiderY is greater than 390)
    spiderY -= 1; // Subtract 1 from spiderY each time
    break;
  }

  //Bee animations
  while (loopCount > 1905) { // Bring the bee back so that it enters the screen shortly after Fly One bumps into the beehive (If loopCount is greater than 1905)
    beeX -= 2; // Subtract 2 from beeX each time
    break;
  }
}

// Draws the speech bubbles and text during the forth round of dialogue
void forthDialogue() {
  if (loopCount>1893 && loopCount < 1908) {
    //Fly One dialogue after being pushed by Fly Two
    fill(255); // Colour the speech bubbles white
    triangle(flyX-47, flyY+3, flyX-50, flyY-20, flyX-65, flyY-5); // Draws the speech bubble
    ellipse(flyX-95, flyY-25, 100, 50); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(20); // Set the textSize to 20
    text("Aaahhh", flyX-132, flyY-22); // Draws the text
  } else if (loopCount > 1911 && loopCount < 1940) {
    //Fly Two dialogue
    fill(255); // Colour the speech bubbles white
    triangle(flyTwoX-47, flyTwoY+3, flyTwoX-50, flyTwoY-25, flyTwoX-65, flyTwoY-15); // Draws the speech bubble
    ellipse(flyTwoX-104, flyTwoY-42, 150, 75); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(15); // Set the textSize to 15
    text(" YOU JUST\nRAN  INTO\nA BEEHIVE!!", flyTwoX-150, flyTwoY-58); // Draws the text
  } else if (loopCount > 1940 && loopCount < 1960) {
    //Fly One dialogue
    fill(255); // Colour the speech bubbles white
    triangle(flyX-47, flyY+3, flyX-50, flyY-25, flyX-80, flyY-15); // Draws the speech bubble
    ellipse(flyX-104, flyY-35, 120, 60); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(25); // Set the textSize to 25
    text("Uh oh...", flyX-150, flyY-27); // Draws the text
  } else if (loopCount > 1960 && loopCount < 1980) {
    //Anty dialogue
    fill(255); // Colour the speech bubbles white
    triangle(antX+81, 447, antX+71, 420, antX+31, 420); // Draws the speech bubble
    ellipse(antX+26, 415, 120, 50); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(20); // Set the textSize to 20
    text("What happ-", antX-28, 420); // Draws the text
  } else if (loopCount > 1980 && loopCount < 2000) {
    //Fly Two dialogue
    fill(255); // Colour the speech bubbles white
    triangle(flyX-47, flyY+3, flyX-50, flyY-25, flyX-80, flyY-15); // Draws the speech bubble
    ellipse(flyX-104, flyY-32, 120, 60); // Draws the speech bubble
    fill(0); // Colour the text black
    textSize(25); // Set the textSize to 25
    text("RUN!", flyX-135, flyY-25); // Draws the text
  }
}

// Draws all the animations after the forth round of dialogue up until the characters fly past the right side of the screen. Animations include flying past the beehive, dodging bees, and flying across the screen
void chase() {
  // Loop Count
  loopCount += 1; // Add 1 to loopCount each time

  //Ant animation
  antTurnX += 4; // Anty running away

  //Spider animations
  //Spider second bite attempt
  while (loopCount < 2011) { // Until the spider has reached its original position (while loopCount is less than 2011)
    spiderY -= 1; // Subtract 1 from spiderY each time
    break;
  }
  while (spiderY < 420 && biteTwo == false && loopCount > 2015) { // Second bite attempt after the spider has returned to its original position (while spiderY is less than 420 and biteTwo is equal to false and loopCount greater than 2015)
    spiderY += biteSpeed; // Add biteSpeed to spiderY each time
    biteSpeed += 1; // Add 1 to biteSpeed each time (to make the spider move faster as it gains momentum)
    break;
  }
  if (spiderY == 426) { // If the spider has attempted to eat Anty again (if spiderY is equal to 426)
    biteTwo = true; // set biteTwo to true
  }
  while (biteTwo == true && spiderY > 390) { // Return the spider to its original position after its second attempt to bite Anty (while biteTwo is true and spiderY is greater than 390)
    spiderY -= 1; // Subtract 1 from spiderY each time
    break;
  }

  //Fly One animations
  while (flyY < 215 && loopCount < 2008) { // Fly One getting out of the beehive (while flyY is less than 215 and loopCount is less than 2008)
    flyY += 2; // Add 2 to flyY each time
    flyX += 2; // Add 2 to flyX each time
    break;
  }
  while (flyY == 215 && flyX < 450) { // Fly One flying across the screen until when it has to dodge the bees (while flyY is equal to 215 and flyX is less than 450)
    flyX += 5; // Add 5 to flyX each time
    break;
  }
  while (flyX >= 450 && flyY >= 100) { // dodge over the bee (while flyX is greater than or equal to 450 and flyY is greater than or equal to 100)
    flyY -= 5; // Subtract 5 from flyY each time
    flyX += 5; // Add 5 from flyX each time
    dodge = true; // Set dodge to true
    break;
  }

  while (flyY == 95 && loopCount > 2079) { // Fly One flies horizontally out of sight once it gets above the bee One (while flyY is equal 95 and loopCount is greater than 2079) 
    flyX += 5; // Add 5 to flyX each time
    break;
  }

  //Fly Two animations
  while (flyTwoY < 215 && loopCount > 2015 && loopCount < 2032) { // Fly Two getting out of the beehive after Fly One  (while flyTwoY is less than 215 and loopCount is greater than 2015 and loopCount is less than 2032)
    flyTwoY += 4; // Add 4 to flyTwoY each time
    flyTwoX += 2; // Add 2 to flyTwoX each time
    break;
  }
  while (flyTwoY == 215 && flyTwoX < 450) { // Fly Two flying across the screen until it needs to dodge the bees (while flyTwoY is equal to 215 and flyTwoX is less than 450)
    flyTwoX += 5; // Add 5 to flyTwoX each time
    break;
  }

  while (flyTwoX >= 450 && flyTwoY <= 350) { // Fly Two dodging under the bees after they move up to intercept Fly One
    flyTwoY += 5; // Add 5 to flyTwoY each time
    flyTwoX += 5; // Add 5 to flyTwoX each time
    break;
  }

  while (flyTwoY == 355 && loopCount >= 2087) { // Fly Two sprinting out of sight horizontally after it reaches a low enough altitude to escape the bees ( while flyTwoY is equal to 355 and loopCount is greater than or equal to 2087) 
    flyTwoX += 5; // Add 5 to flyTwoX each time
    break;
  }

  // Bee One animations
  while (loopCount < 2080 && beeX > 550) { // Flying towards the flies and its beehive (while loopCount is less than 2080 and beeX is greater than 550)
    beeX -=1; // Subtract 1 from beeX each time
    beeY -=1; // Subtract 1 from beeY each time
    break;
  }
  while (dodge == true && beeY > 160 && loopCount < 2095) { // Lunging at Fly One after it gets close (while dodge is true and beeY is greater than 160 and loopCount is less than 2095)
    beeX -=2; // Subtract 2 from beeX each time
    beeY -=2; // Subtract 2 from beeY each time
    break;
  }
  while (loopCount > 2095 && beeY < 320) { // Flying Down to chase after Fly Two after Fly One just narrowly escapes (while loopCount is greater than 2095 and beeY is less than 320)
    beeX +=2; // Add 2 to beeX each time
    beeY +=3; // Add 3 to beeY each time
    break;
  }
  while (beeY == 322) { // After getting to the same altitude as Fly Two, horizontally chasing after it
    beeX +=4; 
    break;
  }

  //Bee Two animations
  if (dodge == false) { // Traveling Down to cut off the Fly Twins' escape route (if dodge is false)
    beeTwoX += 1; // Add 1 to beeTwoX each time
    beeTwoY += 1; // Add 1 to beeTwoY each time
  } else if (dodge == true && beeTwoY < 75) { // Lunging at Fly One once it comes close (if dodge is true and beeTwoY is less than 75)
    beeTwoX +=2; // Add 2 to beeTwoX each time
    beeTwoY +=2; // Add 2 to beeTwoY each time
  } else if (beeTwoY == 75) { // After getting onto the same vertical altitude as Fly One, chasing after it (if beeTwoY is equal to 75)
    beeTwoX +=4; // Add 4 to beeTwoX each time
  }

  //Recalibrating positions before switching screens
  if (beeTwoX >= 800) { // If Bee One flew past the right edge of the screen (if beeTwoX is greater than or equal to 800)
    flyX -= 800; // Subtract 800 from flyX
    flyTwoX -= 800; // Subtract 800 from flyTwoX
    beeX -= 800; // Subtract 800 from beeX
    beeTwoX -= 800; // Subtract 800 from beeTwoX
    antTurnX -= 800; // Subtract 800 from antTurnX
    moveFinal = true; // set moveFinal to true
  }
}

// The animations of Fly One, Fly Two, and Anty being chased across the final screen by Bee One and Bee Two
void finalGetaway() {
  //Fly one animations
  flyX += 2; // Add 2 to flyX each time (to move it forward across the screen)

  //Fly Two animations
  flyTwoX +=2; // Add 2 to flyTwoX each time (to move it forward across the screen)

  //Bee One animations
  beeX += 1; // Add 1 to beeX each time (to move it forward across the screen in pursuit of Fly Two)

  //Bee Two animations
  beeTwoX += 1; // Add 1 to beeTwoX each time (to move it forward across the screen in pursuit of Fly One)

  //Ant animations
  antTurnX += 1; // Add 1 to antTurnX each time (to move it froward across the screen)

  //End screen evaluation
  if (beeX - 50 >= 800) { // If the last character (Bee One) has flew past the right side of the screen (if beeX minus 50 is greater than or equal to 800) 
    theEnd = true; // Set 'theEnd' to 'true'
  }
}

// Displays The Ending Text
void endMessage() {
  //Ending Message
  end = loadFont("ComicSansMS-Bold-48.vlw"); // load the font onto 'end'
  fill(255); // Colour the text white
  textFont(end); // Set the font to 'end'
  textSize(80); // Set the textSize to 80
  text("THE END.", 210, 170); // Writes the ending message
  textSize(30); // Set the textSize to 30
  text("Created by: Jeffery Hu", 230, 260); // Writes the author's name
  //End of main program
}
