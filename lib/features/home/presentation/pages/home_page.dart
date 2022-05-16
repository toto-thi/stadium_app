import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stadium_app/features/firebase_auth/data/models/user_model.dart';
import 'package:stadium_app/features/firebase_auth/domain/entities/user_entity.dart';
import 'package:stadium_app/widget/base_widget/loadingScreen.dart';

class HomePage extends StatefulWidget {
  final String uid;
  const HomePage({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  final urlImages = [
    'https://images.unsplash.com/photo-1508098682722-e99c43a406b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1553778263-73a83bab9b0c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
    'https://images.unsplash.com/photo-1624880357913-a8539238245b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1624072213576-766398edb398?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1522778119026-d647f0596c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1489944440615-453fc2b6a9a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1023&q=80',
    'https://images.unsplash.com/photo-1489944440615-453fc2b6a9a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1623&q=80',
  ];

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyHome(),
    );
  }

  _bodyHome() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: urlImages.length,
              options: CarouselOptions(
                  height: 200.0,
                  initialPage: 0,
                  autoPlay: true,
                  //reverse: true,
                  //pageSnapping: false,
                  autoPlayInterval: const Duration(seconds: 10),
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  }),
              itemBuilder: (context, index, realIndex) {
                final urlImage = urlImages[index];

                return buildImage(urlImage, index);
              },
            ),
            const SizedBox(height: 25.0),
            Center(child: buildIndicator()),

            //hello, welcome to ...
            const SizedBox(height: 25.0),

            FutureBuilder<UserEntity?>(
                future: getUserById(widget.uid),
                builder: (context, snapShot) {
                  if (snapShot.hasError) {
                    return Center(
                      child: Text("Something went wrong ${snapShot.error}"),
                    );
                  } else if (snapShot.hasData) {
                    final user = snapShot.data;

                    return user == null
                        ? const Center(
                            child: Text("No User"),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: displayUser(user),
                          );
                  } else {
                    buildLoadingScreen();
                  }
                  return buildLoadingScreen();
                }),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10.0),
        color: Colors.grey.shade200,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: const ExpandingDotsEffect(
          dotWidth: 10.0,
          dotHeight: 10.0,
          dotColor: Colors.grey,
          activeDotColor: Colors.green,
        ),
      );

  Future<UserEntity?> getUserById(String uid) async {
    final userCollection =
        FirebaseFirestore.instance.collection("users").doc(uid);
    final snapShot = await userCollection.get();

    if (snapShot.exists) {
      return UserModel.fromSnapshot(snapShot);
    }
  }

  displayUser(UserEntity user) {
    return Text(
      'ສະບາຍດີ, ຍິນດີຕອ້ນຮັບທ່ານ ${user.firstName}',
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
    );
  }
}
