var json;
var tweets;
var iterator = 0;
var mapimg;

var clat = 0;
var clon = 0;

var lat = -22.9793591;
var lon =  -43.2422456;

var zoom = 1;

function preload() {
  mapimg = loadImage("https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/0,0,1/1024x1024?access_token=pk.eyJ1IjoibWF1cmljaW9zb3V6YSIsImEiOiJjazA1bzd0YXAwMnRkM29scWdtNnR2ZGEwIn0.FFD5njkyez2PY6t7jKuxiw");
}

function setup() {
  createCanvas(1024,1024);
  translate(width / 2, height / 2);
  imageMode(CENTER);
  image(mapimg, 0, 0);

  
  var cx = mercX(clon);
  var cy = mercY(clat);
  
  var x = mercX(lon) - cx;
  var y = mercY(lat) - cy;
  
  fill(255,120,0);
  ellipse(x, y, 10, 10);
  
  console.log(x, y);
}


function draw() {

  //json = loadJSONObject("data.json");
  //println("DATA UPDATED");
  //tweets = json.getJSONArray("tweets");
  //for (int i = 0; i < tweets.size(); i++) {
    
  //  JSONObject tweet = tweets.getJSONObject(i); 

  //  float lat = tweet.getFloat("lat");
  //  float lng = tweet.getFloat("lng");
    
  //  float x = map(lat, -90, 90, 0, width);
  //  float y = map(lng, 0, 180, 0, height);
  //  fill(255);
  //  ellipse(x, y, 10,10);
    
  //}
  

}

function mercX(lon) {
  lon = radians(lon);
  var a = (256/PI)*pow(2, zoom);
  var b = lon + PI;
  return a * b;
  
}

function mercY(lat) {
  lat = radians(lat);
  var a = (256/PI)*pow(2, zoom);
  var b = tan(PI/4 + lat/2);
  var c = PI - log(b);
  return a * c;
}
