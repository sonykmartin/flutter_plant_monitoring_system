import 'package:flutter/material.dart';
import 'package:plant/InputData.dart';

class CropsPage extends StatefulWidget {
  const CropsPage({Key? key}) : super(key: key);

  @override
  _CropsPageState createState() => _CropsPageState();
}

class _CropsPageState extends State<CropsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD8A818), 
      body: Container(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          
          child: Column(
            
            children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text("CROPS",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w800),),
                ],
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   CropCard(
                  imagePath: 'assets/images/tomato.jpg', 
                  cropName: 'Tomato',
                ),
                CropCard(
                  imagePath: 'assets/images/beans.jpg', 
                  cropName: 'Beans',
                ),
                ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   CropCard(
                  imagePath: 'assets/images/chilly.jpg', 
                  cropName: 'Chilly',
                ),
                CropCard(
                  imagePath: 'assets/images/brinjal.jpg', 
                  cropName: 'Brinjal',
                ),
                ],
               ),
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 CropCard(
                imagePath: 'assets/images/cauliflower.jpg', 
                cropName: 'Cauliflower',
              ),
              CropCard(
                imagePath: 'assets/images/cabbage.jpg', 
                cropName: 'Cabbage',
              ),
              ],
             ),
            ],
          ),
        ),
      ),
    );
  }
}


class CropCard extends StatelessWidget {
  final String imagePath;
  final String cropName;

  CropCard({
    required this.imagePath,
    required this.cropName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return InputDataScreen();
        }));
      },
      child: HoverCard(
        imagePath: imagePath,
        cropName: cropName,
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String imagePath;
  final String cropName;

  HoverCard({
    required this.imagePath,
    required this.cropName,
  });

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(
            widget.imagePath,
            width: 145,
            height: 110,
            fit: BoxFit.cover,
          ),
          Text(
            widget.cropName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_){
               return InputDataScreen();
            }));
          },
          child: Text('Details'),
        ),
        ],
      ),
    );
  }
}
