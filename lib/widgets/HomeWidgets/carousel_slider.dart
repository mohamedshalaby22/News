import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScrollableImage extends StatelessWidget {
  ScrollableImage({
    Key? key,
    required this.image,
    required this.avatar,
    required this.text,
    required this.publishAt,
  }) : super(key: key);
  String image, avatar, text, publishAt;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5, left: 5),
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image))),
            ),
            Positioned(
              bottom: -50,
              child: Container(
                  padding: const EdgeInsets.all(15),
                  width: 280,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.020),
                          offset: const Offset(0, 5),
                          blurRadius: 20,
                        )
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle),
                        child: ClipOval(
                          child: Image.network(avatar,
                              fit: BoxFit.cover, width: 50, height: 50),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Text(
                              ' By $text',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(publishAt,
                              style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
