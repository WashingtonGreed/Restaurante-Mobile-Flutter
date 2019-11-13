import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class ImageScreen extends StatefulWidget {
  final List<Map> collections;
  final int index;
  ImageScreen(this.collections,this.index);

  @override
  _MyImageScreen createState() => _MyImageScreen(collections, index);
}

class _MyImageScreen extends State<ImageScreen> {
  final List<Map> collections;
  int index;
  _MyImageScreen(this.collections, this.index);
  @override
    Widget build(BuildContext context) {
    return new Scaffold(
    body:  new Swiper(
        itemBuilder: (BuildContext context, int index){
          if(this.index!=index&&this.index!=-3){
            index=this.index;
            this.index=-3;
          }
                return new Image.asset(collections[index]['image'],fit: BoxFit.fill);
        },
        
        itemCount: collections.length,
        pagination: new SwiperPagination(),
      ),
    );
  }
}
