/*
    Project 1 PuppyEmotions
    by: Alvin Tran

    Demonstrate how state machines function by demonstrating several different states and displaying images of puppies along with animations
*/

//Image variables
PImage img;
PImage [] imageList;

//Global variable for font
PFont f;

//State machines that determines display
int state;//will change
final int normal=0;
final int mad=1;
final int sad=2;
final int happy=3;
final int sick=4;
final int scared=5;

//Timer
int startMillis;

//Constants for Zs
int zX;
int zY;

//Different colors to be used
color black=color(0, 0, 0);
color lightskyblue=color(135, 206, 250);
color red=color(255, 0, 0);
color lightgreen=color(102, 255, 102);
color yellow=color(255, 255, 0);
color white=color(255, 255, 255);

//Constant place for tears
float tearX1;
float tearY1;
float tearX2;
float tearY2;
float tearX3;
float tearY3;

//Constant place for blood-drops
float bloodX1;
float bloodY1;
float bloodX2;
float bloodY2;
float bloodX3;
float bloodY3;

//Constant place for sun rays    
float tLRayX1;
float tLRayX2;
float tLRayX3;       

float tRRayX1;
float tRRayX2;
float tRRayX3;       

float tRayY1;
float tRayY2;
float tRayY3;

float bLRayX1;
float bLRayX2;
float bLRayX3;

float bRRayX1;
float bRRayX2;
float bRRayX3;

float bRayY1;
float bRayY2;
float bRayY3;

//Constant for sighs
float sighX;
float sighY;

//Constants for Eyebrow lines
int lX1;
int lX2;
int lY1;
int lY2;

int rX1;
int rX2;
int rY1;
int rY2;


void setup(){
    print("Puppy Emotions");

    imageMode(CENTER);
  
    size(1024, 800);
    
    imageList=new PImage[6];
    imageList[0]=loadImage("Assets/SleepyPuppy1.jpg");             
    imageList[1]=loadImage("Assets/MadPuppy1.jpg");
    imageList[2]=loadImage("Assets/SadPuppy1.jpg");
    imageList[3]=loadImage("Assets/HappyPuppy1.jpg");
    imageList[4]=loadImage("Assets/SickPuppy1.jpg");  
    imageList[5]=loadImage("Assets/ScaredPuppy1.jpg");
    img=imageList[0];
    
    imageMode(CENTER);
    textAlign(CENTER);
    //f is created here
    f=createFont("Helvetica", 36, true);
    
    //Millis for timer
    startMillis=millis();
    
    //Constant place for Zs
    zX=860;
    zY=522;
    
    //Constant place for tears
    tearX1=(440);
    tearY1=(290);
    tearX2=(422);
    tearY2=(310);
    tearX3=(446);
    tearY3=(340);
    
    //Constant place for blood-drops
    bloodX1=(660);
    bloodY1=(480);
    bloodX2=(655);
    bloodY2=(490);
    bloodX3=(666);
    bloodY3=(493);     
    
    //Constant place for sun rays       
    tLRayX1=(225);
    tLRayX2=(277);
    tLRayX3=(173);       
    
    tRRayX1=(795);
    tRRayX2=(749);
    tRRayX3=(865);       

    tRayY1=(151);
    tRayY2=(104);
    tRayY3=(39);       
    
    bLRayX1=(302);
    bLRayX2=(248); 
    bLRayX3=(197);       
    
    bRRayX1=(720);
    bRRayX2=(778);
    bRRayX3=(854);       

    bRayY1=(718);
    bRayY2=(672);      
    bRayY3=(770);     
    
    //Constant place for sighs
    sighX=567;
    sighY=563;
    
    //Constant place for eyebrow lines
    lX1=555;
    lX2=524;
    lY1=367;
    lY2=348;    
    
    rX1=574;
    rX2=543;
    rY1=365;
    rY2=341;
  }  

void draw(){
  /*if(mousePressed)//Able to check coordinates with mouse
  {
    int x=mouseX;
    int y=mouseY;
    println("X: "+x+" Y: "+y);
  }*/

  if(state==normal)
  {
    drawNormal();
  }
  else if(state==mad)
  {
    drawMad();
  }
  else if(state==sad)
  {
    drawSad();
  }
  else if(state==happy)
  {
    drawHappy();
  }
  else if(state==sick)
  {
    drawSick();
  }
  else if(state==scared)
  {
    drawScared();
  }
}

void drawNormal(){//Normal display
    background(black);
    image(img, width/2, height/2);  
    
    textFont(f);       
    fill(black);
    text("What's your mood today?", width/2, 100);  
    fill(black);
    text("1=Mad, 2=Sad, 3=Happy, 4=Sick, 5=Scared, 0=Reset/Normal", width/2, 705);
    
    ZZZ();
}

void ZZZ(){//Draws Zs on Menu screen    
  fill(black);
  text("ZZZ...", zX, zY); 
  
  if(millis()<=startMillis+1000)
  {
    zX-=5;
    zY-=5;
  }
  else 
  {    
    zX=860;
    zY=522;
    startMillis=millis();
  }
}

void drawMad(){//Normal display
    background(red);
    image(img, width/2, height/2);    
    
    textFont(f);       
    fill(black);
    text("I am mad!", width/2, 75);  
         
     Blood();
}

void Blood(){//Animates blood drops
   fill(red);
   triangle(bloodX1, bloodY1, bloodX2, bloodY2, bloodX3, bloodY3);//Left side
   triangle(bloodX1, bloodY1+20, bloodX2, bloodY2+20, bloodX3, bloodY3+20);
   
   triangle(bloodX1+20, bloodY1, bloodX2+20, bloodY2, bloodX3+20, bloodY3);//Right side
   triangle(bloodX1+20, bloodY1+20, bloodX2+20, bloodY2+20, bloodX3+20, bloodY3+20);

   if(bloodY1<=1180||bloodY2<=1180||bloodY3<=1180)
   {
     bloodY1+=10;
     bloodY2+=10;
     bloodY3+=10;
   }
   else
   {
     bloodX1=(660);
     bloodY1=(480);
     bloodX2=(655);
     bloodY2=(490);
     bloodX3=(666);
     bloodY3=(493);   
   }
 }

void drawSad(){//Screen that displays upon sad state
    background(black);
    image(img, width/2, height/2);    
    
    textFont(f);       
    fill(lightskyblue);
    text("It's so sad today.", width/2, 50);     
        
    Tears();
}

void Tears(){//Animates tear drops
   fill(lightskyblue );
   triangle(tearX1, tearY1, tearX2, tearY2, tearX3, tearY3);//Top left side    
   triangle(tearX1, tearY1+120, tearX2, tearY2+120, tearX3, tearY3+120);//Bottom left side
    
   triangle(tearX1+200, tearY1-15, tearX2+200, tearY2-15, tearX3+200, tearY3-15);//Top tight side    
   triangle(tearX1+200, tearY1-15+120, tearX2+200, tearY2-15+120, tearX3+200, tearY3-15+120);//Bottom right side

   if(tearY1<=700||tearY2<=700||tearY3<=700)
   {
     tearY1+=10;     
     tearY2+=10;
     tearY3+=10;
   }
   else
   {
     tearX1=(440);
     tearY1=(290);
     tearX2=(422);
     tearY2=(310);
     tearX3=(446);
     tearY3=(340);
   }
}

void drawHappy(){//Screen that appears upon happy state
    background(lightgreen);    
            
    Rays();
            
    image(img, width/2, height/2);
    
    textFont(f);       
    fill(black);
    text("I'm so happy!", width/2, 80);        
}

void Rays(){//Animates sun rays    
  float pictureDiameter=width/1.35;    

  fill(yellow);
  ellipse((width/2), (height/2), pictureDiameter, pictureDiameter);    
    
  triangle(tLRayX1, tRayY1, tLRayX2, tRayY2, tLRayX3, tRayY3);//Top left ray    
  triangle(tRRayX1, tRayY1, tRRayX2, tRayY2, tRRayX3, tRayY3);//Top right ray

  triangle(bLRayX1, bRayY1, bLRayX2, bRayY2, bLRayX3, bRayY3);//Bottom left ray    
  triangle(bRRayX1, bRayY1, bRRayX2, bRayY2, bRRayX3, bRayY3);//Bottom right ray

  if(tRayY3<=5||bRayY3<=800)
   {
     tRayY3+=10;     
     bRayY3+=10;     
   }
   else if(tRayY3>=40||bRayY3>=770)
   {
     tRayY3-=10;
     bRayY3-=10;
   }
}

void drawSick(){//Screen that appears upon sick state
    background(lightskyblue);
    image(img, width/2, height/2);     
               
    textFont(f);       
    fill(black);
    text("I need a sick day.", width/2, 50);
    
    Sigh();
}

void Sigh(){//Animates sigh puffs  
  fill(white);
  float pictureDiameter=width/50.35;    
  ellipse((sighX), (sighY), pictureDiameter, pictureDiameter);      
  ellipse((sighX), (sighY-60), pictureDiameter, pictureDiameter);   

  if(sighY>=100)
  {
    sighY-=15;
  }
  else
  {
    sighY=563;
  }
}

void drawScared(){//Screen that appears upon scared state
    background(black);
    image(img, width/2, height/2);    
    
    textFont(f);       
    fill(lightskyblue);
    text("I'm so scared!", width/2, 50); 
    
    Eyebrows();
}

void Eyebrows(){//Draws Zs on Menu screen    
  fill(black);
  line(lX1, lY1, lX2, lY2);//Left line  
  line(rX1, rY1, rX2, rY2);//Right line

  if(millis()<=startMillis+500)
  {
    lX2-=10;
    lY2-=5;    
    rX2-=10;
    rY2-=5;
  }
  else 
  {    
    lX2=524;
    lY2=348;    
    rX2=543;
    rY2=341;
    startMillis=millis();
  }
}

void keyPressed(){//Sets state and image that appears
  if(key=='1')
  {
    state=mad;
    img=imageList[1];
  }
  else if(key=='2')
  {
    state=sad;
    img=imageList[2];
  }
  else if(key=='3')
  {
    state=happy;
    img=imageList[3];
  }
  else if(key=='4')
  {
    state=sick;
    img=imageList[4];
  }
  else if(key=='5')
  {
    state=scared;
    img=imageList[5];
  }
  else if(key=='0')
  {
    state=normal;
    img=imageList[0];
  }
 }
