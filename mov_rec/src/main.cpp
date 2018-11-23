#include <stdlib.h>
#include <GL/glut.h>
#include <iostream>

using namespace std;

float xr = 0, yr = 0; // controlls movements

// display handles the display of the object
void rect()
{
    glClear(GL_COLOR_BUFFER_BIT); // clear the buffer currently enabled for color writing
    glColor3f(0,0,1); // sets the color with alpha at 1.0 (full intensity)

    glBegin(GL_QUADS); // sets the object to be a rectangle
    glVertex2f(200+xr,100+yr); // sets the x and y cordinates of a vertex defaulting z to 0 and w to 1
    glVertex2f(300+xr,100+yr);
    glVertex2f(300+xr,200+yr);
    glVertex2f(200+xr,200+yr);
    glEnd();

    glFlush(); // force execution of GL commands in finite time and clears all buffers
    glutPostRedisplay();
    glutSwapBuffers();
}

// specialKey is the keyboard controlling function
void specialKey(int key, int x, int y)
{
  switch(key)
  {
    case GLUT_KEY_UP: // up key
      yr++; // move up
      cout << yr << endl;
      glutPostRedisplay(); // redisplay the window on the next iteration
      break;
    case GLUT_KEY_DOWN: // down key
      yr--; // move down
      cout << yr << endl;
      glutPostRedisplay();
      break;
    case GLUT_KEY_LEFT: // left key
      xr--; // move left
      cout << xr << endl;
      glutPostRedisplay();
      break;
    case GLUT_KEY_RIGHT: // right key
      xr++; // move rightswitch(key)
      cout << xr << endl;
      glutPostRedisplay();
      break;
  }
}

int main(int argc, char** argv)
{
  glutInit(&argc,argv); // initializes the GLUT library
  glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB); // sets the initial display mode to show colors RGBa (red, green, blue, alpha)
  // and display on a double buffer window (allows for transfer of 2 blocks of data at a time)
  glutInitWindowSize(500,500); // sets window size
  glutInitWindowPosition(600, 300); // sets window position
  glutCreateWindow("Move Test"); // creates the window

  glutDisplayFunc(rect); // callback for display functions

  glClearColor(150,150,0,0); // specifies what RGBa (red, green, blue, alpha) color to clear the color buffer
  gluOrtho2D(0.0,400,0.0,400); // defines the cordinates for left, right, top and bottom clipping planes for a 2D orthogonal viewing region
  glutSpecialFunc(specialKey); // keyboard callback function

  glutMainLoop(); // stats the GLUT event processing loop
  return 0;
}
