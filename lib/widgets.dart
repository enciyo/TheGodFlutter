import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'apiClient.dart';
import 'showMap.dart';

class States {

  Map dataMenu;


  Widget firstScreen(BuildContext context, String staticmap,ApiClient apiClient) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Yakınlardaki Restoran"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Column(
        children: <Widget>[
          new Container(

            child : new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              fit: BoxFit.fill,
              image: staticmap,

            ),
          ),
          new Expanded(
              child: new ListView.builder(
                itemCount: apiClient.getData().length,
                itemBuilder: (context,int index){
                  return new ListTile(
                    title: new Text(apiClient.getData()[index]['restoran']),
                    subtitle: new Text(apiClient.getData()[index]['menu'].toString()),
                    trailing:new IconButton(icon: new Icon(Icons.location_on),onPressed: (){
                      print("Tıklandı");
                      showMap.launchbrowser(apiClient.getData()[index]['longitude'], apiClient.getData()[index]['latitude']);
                    },),
                    leading: new Image.network(apiClient.getData()[index]['imgloc'].toString(),width: 100.0,),

                    onTap: (){

                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>secondScreen(context, apiClient,index) ));
                    },

                  );
                },
              )
          )
        ],
      ),
    );
  }

  Widget secondScreen(BuildContext context,ApiClient apiClient,int index){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(apiClient.getData()[index]['restoran'].toString()),
        backgroundColor: Colors.red,
      ),
      body: new ListView.builder(
        itemCount: apiClient.getDataMEnu(index).length,
        itemBuilder: (BuildContext context,int i){
          return new ListTile(
            title: new Text(apiClient.getDataMEnu(index)[i].toString()),
            trailing: new Text(apiClient.getMenuFiyat(index)[i].toString()+" TL"),
          );
        },
      ),

    );
  }
}
