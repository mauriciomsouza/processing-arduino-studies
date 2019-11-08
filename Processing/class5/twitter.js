var fs = require('fs'); //importo o filesystem
var Twit = require('twit'); //importo os endpoints do twitter
var GoogleMapsAPI = require("googlemaps");
var config = require('./config'); //importo api keys
var limiter = 10;

var publicConfig = {
    key: 'AIzaSyCvIO0-2jl2R7mx8I_8MlLWpiu1gUtR6IY',
    stagger_time:       1000, // for elevationPath
    encode_polylines:   false,
    secure:             true, // use https
  };
  
var gmAPI = new GoogleMapsAPI(publicConfig);
console.log("Google Maps API configurada...");

// const googleMapsClient = require('@google/maps').createClient({
//     key: 'AIzaSyCcUZZNtQ6RZ03uHqsAhy3oGeBnJyppjK8'
//   });

var T = new Twit(config); //conecto com o twitter usando as api keys
console.log("Twitter API configurada...");

var stream = T.stream('statuses/filter', { track: 'vasco' }); // defino o streaming e a palavra buscada

console.log("Iniciando streaming de tweets:")
stream.on('tweet', function (tweet) {

    var new_tweet = JSON.stringify(tweet.user.location);

    if (new_tweet == null) {
        
    } else {
        var geocodeParams = {
            "address":    new_tweet,
          };
           
          gmAPI.geocode(geocodeParams, function(err, result){
            var inner_1 = result["results"];
            if (inner_1 == undefined) {
              console.log('SEM RESULTADO');
            } else {
              var inner_2 = inner_1[0];
              if (inner_2 == undefined) {
                
              } else {
                console.log('NOVO TWEET');
                if (limiter < 200) {
                  var data = fs.readFileSync('./data.json', 'utf8');
                  var file = JSON.parse(data);
                  file.tweets.push(inner_2.geometry.location);
                  var file_str = JSON.stringify(file);
                  fs.writeFileSync('./data.json', file_str);
                  limiter++;
                } else {
                  var data = fs.readFileSync('./data.json', 'utf8');
                  var file = JSON.parse(data);
                  file.tweets.shift();
                  file.tweets.push(inner_2.geometry.location);
                  var file_str = JSON.stringify(file);
                  fs.writeFileSync('./data.json', file_str);
                  limiter++;
                }
                
                file.tweets.shift();
              }
              
            }
           
          });
    }
    
});