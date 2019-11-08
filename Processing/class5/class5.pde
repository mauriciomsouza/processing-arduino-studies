JSONObject json;
JSONArray tweets;
int iterator = 0;
PImage mapimg;

float clat = 0;
float clon = 0;

int ww = 1024;
int hh = 512;

int zoom = 1;


float mercX(float lon) {
  lon = radians(lon);
  float a = (256 / PI) * pow(2, zoom);
  float b = lon + PI;
  return a * b;
}

float mercY(float lat) {
  lat = radians(lat);
  float a = (256 / PI) * pow(2, zoom);
  float b = tan(PI / 4 + lat / 2);
  float c = PI - log(b);
  return a * c;
}

void setup() {
  size(1024,512, P2D);
  //String url = "https://api.mapbox.com/styles/v1/mapbox/dark-v9/static/" +
  //  clon + "," + clat + "," + zoom + "/" +
  //  ww + "x" + hh +
  //  "?access_token=pk.eyJ1IjoiY29kaW5ndHJhaW4iLCJhIjoiY2l6MGl4bXhsMDRpNzJxcDh0a2NhNDExbCJ9.awIfnl6ngyHoB3Xztkzarw";
  //mapimg = loadImage(url, "jpg");
  //translate(width/2, height/2);
  //imageMode(CENTER);
  //image(mapimg, 0, 0);
}


void draw() {
  
  
  delay(300);
  json = loadJSONObject("data.json");
  tweets = json.getJSONArray("tweets");
  println(tweets.size());
  for (int i = 0; i < tweets.size(); i++) {
    
    JSONObject tweet = tweets.getJSONObject(i); 

    float lat = tweet.getFloat("lat");
    float lng = tweet.getFloat("lng");
    
    
    float cx = mercX(clon);
    float cy = mercY(clat);
  
    float x = mercX(lng) - cx;
    float y = mercY(lat) - cy;
    
    println(x,y);
  
    fill(255,120,0);
    ellipse(x, y,10,10);
    
  }
  

}
