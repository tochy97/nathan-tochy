#include <GL/glew.h>
#include <GL/freeglut.h>
#include <iostream>

using namespace std;

const int width = 1280;
const int height = 960;

void OnInit()
{
  glClearColor(1,0,0,0);
  cout<<"Initialization successfull"<<endl;
}

void OnShutdown()
{
  cout<<"Shutdown successfull"<<endl;
}

void OnResize(int nw, int nh)
{
}

void OnRender()
{
  glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
  glutSwapBuffers();
}

int main(int argc, char** argv)
{
  //Create Window
  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA); // Double allows for smoother rendering
  glutInitContextVersion(3,0); // OpenGL v3.0
  glutInitContextFlags(GLUT_CORE_PROFILE | GLUT_DEBUG); // allows for debugging og message callback
  glutInitContextProfile(GLUT_FORWARD_COMPATIBLE);
  glutInitWindowSize(800, 600);
  glutCreateWindow("Test 1.0");

  //Check if system has compatible OpenGL version
  glewExperimental = GL_TRUE;
  GLenum err = glewInit();
  glutSwapBuffers();
  if(GLEW_OK != err)
  {
    cerr<<"Error"<< glewGetErrorString(err)<<endl;
  }
  else if(GLEW_VERSION_3_0)
  {
    cout<<"Driver supports OpenGL 3.0\n Details: " << endl;
  }
  cout<<"\tUsing glew "<<glewGetString(GLEW_VERSION) <<endl;
  cout<<"\tVendor: "<<glGetString (GL_VENDOR)<<endl;
  cout<<"\tRenderer: "<<glGetString (GL_RENDERER)<<endl;
  cout<<"\tVersion: "<<glGetString (GL_VERSION)<<endl;
  cout<<"\tGLSL:"<<glGetString(GL_SHADING_LANGUAGE_VERSION)<<endl;

  OnInit();
  glutCloseFunc(OnShutdown);
  glutDisplayFunc(OnRender);
  glutReshapeFunc(OnResize);
  //glutMainLoop();
  return 0;
}
