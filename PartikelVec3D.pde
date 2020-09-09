class Vec{ 
  float x, y, z; 
 
 Vec(float X, float Y, float Z){ 
    x = X; 
    y = Y; 
    z = Z; 
  } 
void add (Vec v){ 
    x = x + v.x; 
    y = y + v.y; 
    z = z + v.z; 
  } 
void subtract(Vec v){ 
    x = x - v.x; 
    y = y - v.y; 
    z = z - v.z; 
  }    
void multiply (float m){ 
    x = x*m; 
    y = y*m; 
    z = z*m; 
  }  
float distance (Vec v){ 
    float d = sqrt (pow(v.x-x, 2) + pow(v.y-y, 2) + pow(v.z-z, 2)); 
    return d; 
  } 
float magnitute (){ 
    float d = sqrt (pow(x, 2) + pow(y,2 ) + pow(z, 2)); 
    return d; 
  } 
void set(Vec v) { 
    x = v.x; 
    y = v.y; 
    z = v.z; 
  }   
} 
