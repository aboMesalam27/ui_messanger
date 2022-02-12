import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);
Widget getStackShape(String text, image){
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("$image")
            ),
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20)
        ),

      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(text,style: TextStyle(fontSize: 20,color: Colors.white),),
      )
    ],
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0.0,
        title: Text("Gallary",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 4 / 6,
          ),
          children: [
            getStackShape("Saved","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwgkQqqZeEyj9J1dwi9aTwNaDTVaPWcBL28Q&usqp=CAU"),
            getStackShape("Yassmen","https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            getStackShape("Esraa","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7QRI2Ca4YFTFb468FpIxBOqK4xbfKa-g5ak4jwsi4yFBuBXjkGfNa8gNgi-H9G8ouSBU&usqp=CAU"),
            getStackShape("Cat","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCXsbUwbvbDDyt-rtsoYDyFpcIHRjzgK286Q&usqp=CAU"),
            getStackShape("WhatsApp","https://images.ctfassets.net/hrltx12pl8hq/4MFiRr9vFnbWzYoNSPiYXy/fca130dd40da59b06e83ee8d5789a23e/file-converter-shutterstock.jpg"),
            getStackShape("FaceBook","https://i1.sndcdn.com/artworks-KhMr3yl7C2GVLOCv-hQns4w-t500x500.jpg"),
          ],
        ),
      ),
    );
  }
}
