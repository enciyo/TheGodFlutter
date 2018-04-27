
class StaticMap {
  double latitude;
  double longitude;
  int zoomLevel;
  int scale;
  String url;

  StaticMap(double long,double lat,int zoomLevel,int scaleLevel){
    this.latitude=lat;
    this.longitude=long;
    this.zoomLevel=zoomLevel;
    this.scale=scaleLevel;
    url="https://maps.googleapis.com/maps/api/staticmap?center=$longitude,$latitude&zoom=$zoomLevel&size=1000x400&scale=$scaleLevel&key=AIzaSyAek-3gytesY8Yi77A6kyXO8o5wACNJyuI&markers=color:red%7Clabel:M%7C$longitude,$latitude";

  }
  getUrl(){
    return this.url;
  }
  addMarker(double long,double lat,String markerName,String color,List data){
    this.url=this.url+"&markers=color:$color%7Clabel:$markerName%7C$long,$lat";
  }

   String addAllMarker (List data){
    for(int i=0;i<data.length;i++) {
      double long=data[i]['longitude'];
      double lat=data[i]['latitude'];
      this.url=this.url+"&markers=color:yellow%7Clabel:R%7C$long,$lat";
    }
    return this.url;
  }


}

