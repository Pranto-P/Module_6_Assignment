import 'package:flutter/material.dart';

void main(){
  runApp(home());
}

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hm(),
    );
  }
}
class hm extends StatelessWidget {
  hm({Key? key}) : super(key: key);

  mySnackber(context, message){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }


  var myImage=[
    {"img":"https://picsum.photos/250?image=9","title":"Clicked on photo!"},
    {"img":"https://picsum.photos/250?image=9","title":"Clicked on photo!"},
    {"img":"https://picsum.photos/250?image=9","title":"Clicked on photo!"},
    {"img":"https://picsum.photos/250?image=9","title":"Clicked on photo!"},
    {"img":"https://picsum.photos/250?image=9","title":"Clicked on photo!"},
    {"img":"https://picsum.photos/250?image=9","title":"Clicked on photo!"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Photo Gallery")),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text("Welcome to My Photo Gallery!",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search'
                ),
              ),
            ),
            Container(
              child:
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 1,
                      childAspectRatio: 1
                  ),
                  itemCount: myImage.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  child: Image.network(myImage[index]["img"]!),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: ElevatedButton(onPressed: (){
                                      mySnackber(context, myImage[index]["title"]);
                                    }, child: Text("Button")),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text("Sample Photo 1"),
                subtitle: Text("Category 1"),
                leading: Icon(Icons.photo),
                tileColor: Colors.blueGrey.shade100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text("Sample Photo 2"),
                subtitle: Text("Category 2"),
                leading: Icon(Icons.photo),
                tileColor: Colors.blueGrey.shade100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text("Sample Photo 3"),
                subtitle: Text("Category 3"),
                leading: Icon(Icons.photo),
                tileColor: Colors.blueGrey.shade100,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        mySnackber(context, "Photos Uploaded Successfully!");
      },
        child: Icon(Icons.cloud_upload),
      ),
    );
  }
}