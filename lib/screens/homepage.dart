import 'package:flutter/material.dart';
import 'package:wheatherappuidribble/utils/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalHeight(50.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Icon(
                      FontAwesomeIcons.bell,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          addVerticalHeight(20.0),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                  height: 180,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF161616)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Tuesday, 14 May',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      Text(
                        'Delhi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        '29｡C',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF929292),
                            fontSize: 45),
                      ),
                      Text(
                        'Sunny Cloudy',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              const Positioned(
                  top: 10,
                  right: 20,
                  bottom: 0,
                  child: Image(
                      image: NetworkImage(
                          'https://cdn2.iconfinder.com/data/icons/weather-24/256/Storm-512.png')))
            ],
          ),
          addVerticalHeight(40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    const Text(
                      'Next 14 Days',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    addHorizontalHeight(12.0),
                    const Icon(
                      Icons.navigate_next,
                      size: 24,
                    )
                  ],
                )
              ],
            ),
          ),
          addVerticalHeight(20.0),
          Card(
            child: Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  WheatherBox(imgUrl: rainImg,text: 'Rain',),
                  WheatherBox(imgUrl: thunderImg,text: 'Thunder',),
                  WheatherBox(imgUrl: windCloud,text: 'Wind Speed',),
                ],
              ),
            ),
          ),
          addVerticalHeight(14.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Temperature',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          addVerticalHeight(10.0,),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection:  Axis.horizontal,
              children: const [
                BottomBox(aboveText: '20.C',imgUrl2: imgUrl1,belowText: '10:00',),
                BottomBox(aboveText: '26.C',imgUrl2: imgUrl2,belowText: '12:00',),
                BottomBox(aboveText: '32.C',imgUrl2: imgUrl3,belowText: '16:00',),
                BottomBox(aboveText: '18.C',imgUrl2: imgUrl4,belowText: '20:00',),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomBox extends StatelessWidget {

  final String aboveText,imgUrl2,belowText;

  const BottomBox({required this.aboveText,required this.belowText , required this.imgUrl2});

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(top: 3,left: 14,right: 10),
      height: 120,
      width: 80,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.black),
      child: Column(children:  [
        Text(aboveText,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        Image(image: NetworkImage(imgUrl2)),
        Text(belowText,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
      ],),
    );
  }
}

class WheatherBox extends StatelessWidget {
  final String imgUrl,text;
   const WheatherBox({Key? key, required this.text,required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 26),
      height: 120,
      width: 80,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.black),
      child: Column(children:  [
        Image(image: NetworkImage(imgUrl)),
        Text(text,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
      ],),
    );
  }
}
