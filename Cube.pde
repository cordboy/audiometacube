class Cube {
  float x;
  float y;
  float z;

  float nx;
  float ny;
  float nz;  

  float speedX;
  float speedY;
  float speedZ;

  float power;
  float jitter;
  float j_amount = 25;

  boolean xplode = false;

  //Contructor

  Cube(float _y, float  _x, float  _z) {

    y = _y - p_number/2;
    x = _x - p_number/2;
    z = _z - p_number/2;
  }


  //Functions

  void move(float a) {

    power = a*1000;
    jitter = random(-1*(a*j_amount), a*j_amount);

    nx += speedX;
    ny += speedY;
    nz += speedZ;

    if (xplode == true) {
      speedX+= random(-0.01, 0.01);
      speedY+= random(-0.02, 0.02);
      speedZ+= random(-0.03, 0.03);
    }
    if (xplode == false) {
      speedX = 0;
      speedY = 0;
      speedZ = 0;

      nx = lerp(nx, 0, 0.03);
      ny = lerp(ny, 0, 0.03);
      nz = lerp(nz, 0, 0.03);      
    }
  }

  void xplosion() {


    if (power > 15) {
      xplode = true;
    }
    else {
      xplode = false;
    }
    
    power = lerp(power, 0, 0.1);
  }




  void display() {
    stroke(255);
    strokeWeight(2+power/75);
    point(y+ny+jitter, x+nx+jitter, z+nz+jitter);
    println(speedX, power, xplode);
  }
}