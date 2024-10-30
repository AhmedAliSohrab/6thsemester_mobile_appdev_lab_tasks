import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://hips.hearstapps.com/hmg-prod/images/cute-cat-photos-1593441022.jpg?crop=0.670xw:1.00xh;0.167xw,0&resize=640:*',
    'https://i0.wp.com/www.communitycatspodcast.com/wp-content/uploads/2023/03/Cat6.jpg?fit=800%2C800&ssl=1',
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image App'),
        ),
        body: Center(
          child: PageView.builder(
            //used to create a swipeable carousal
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return InteractiveViewer(
                //provides gestures functionality
                panEnabled: true,
                minScale: 1.0,
                maxScale: 3.0,
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
