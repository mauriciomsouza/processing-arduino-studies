JSONObject json;
JSONArray tweets;
int iterator = 0;
PImage mapimg;

var clat = 0;
var clon = 0;

var lat = 0;
var lon

void setup() {
  size(800,800);
  mapimg = loadImage("mapimg.png");
}


void draw() {
  image(mapimg,0,0);
  delay(100);
  json = loadJSONObject("data.json");
  println("DATA UPDATED");
  tweets = json.getJSONArray("tweets");
  for (int i = 0; i < tweets.size(); i++) {
    
    JSONObject tweet = tweets.getJSONObject(i); 

    float lat = tweet.getFloat("lat");
    float lng = tweet.getFloat("lng");
    
    float x = map(lat, -90, 90, 0, width);
    float y = map(lng, 0, 180, 0, height);
    fill(255);
    ellipse(x, y, 10,10);
    
  }
  

}
