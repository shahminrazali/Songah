$(document).on('turbolinks:load', function(){
  if($("#player-container").length > 0){
    Amplitude.init({
      "songs": [
        {
          "name": "Lights Out",
          "artist": "Khai",
          "album": "The Weatherman",
          "url": "/songs/lightup.mp3"
          "live": false,
          "cover_art_url": "images/theweatherman.jpg"
        },
        {
          "name": "Rooms",
          "artist": "Mia and Jonah",
          "album": "Rooms For Adelaide",
          "url": "/songs/lightup.mp3",
          "live": false,
          "cover_art_url": "images/roomsforadelaide.jpg"
        },
        {
          "name": "Suburban War",
          "artist": "The Arcade Fire",
          "album": "The Suburbs",
          "url": "/songs/lightup.mp3",
          "live": false,
          "cover_art_url": "images/thesuburbs.jpeg"
        }
      ],
      "default_album_art": "images/no-cover-large.png",
      "volume": .35
    });
  }
});
