/*
  Simple_Draw_Lines_PDF
  Written by Scott Kildall
  September 2017
  
  Draws some simple shapes w/lines, export to PDF
*/

import processing.pdf.*;

//-- used in keyPressed() as flag to save to PDF
boolean recordToPDF = false;

//-- do any sort of setup functions here
void setup() {
  size(1000,800);
  rectMode(CENTER);
}

void draw() {
  //-- draw background elements
  // Background of 0 = back, background of 255 = white
  background(255);
  
  if( recordToPDF ) {
    beginRecord(PDF, "saved_file.pdf");
  }
  
  //-- Draws a row of squares
  stroke(0,0,0);      // color of the stroke
  strokeWeight(1);          // thickness of the line
  noFill();
  
  drawRowSquares(5, 100, 10);
 
  //-- This draws a centered circle 
  drawCenteredCircle(30);
  
   //-- check the flag to record to PDF
  if( recordToPDF ) {
    endRecord();
    recordToPDF = false;
    background(0);    // flash to black so we can indicate that we are recording
  } 
}

//-- draw a centered circle
 void drawCenteredCircle( int diameter) {
   ellipse(width/2, height/2, diameter, diameter);
 }
 
 // draw a row of squares
 void drawRowSquares(int num, int h, int edgeSize) {
   //-- like white space between framed pictures
   int spaceBetween = width/(num +1);
   
   for( int i = 0; i < num; i++ )   {
     strokeWeight(1);
     rect( spaceBetween * (i+1), h, edgeSize, edgeSize );
   }
 }
 
 //-- when user pressed the SPACE bar, set recordToPDF = true and we will save to PDF in the draw functions
void keyPressed() {
  if( key == ' ' )
    recordToPDF = true;
}