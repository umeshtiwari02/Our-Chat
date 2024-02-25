import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/models/chat_user.dart';
import 'package:chat_app/screens/view_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ProfileDialog extends StatelessWidget {
  const ProfileDialog({super.key, required this.user});

  final ChatUser user;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white.withOpacity(.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        width: mq.width * .6,
        height: mq.height * 0.35,
        child: Stack(children: [
          // user profile picture
          Positioned(
            top: mq.height * .055,
            left: mq.width * 0.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(mq.height * 0.2),
              child: CachedNetworkImage(
                width: mq.width * 0.58,
                fit: BoxFit.cover,
                imageUrl: user.image,
                errorWidget: (context, url, error) =>
                    const CircleAvatar(child: Icon(CupertinoIcons.person)),
              ),
            ),
          ),

          //user name
          Positioned(
            left: mq.width * .04,
            top: mq.height * .02,
            width: mq.width * .55,
            child: Text(
              user.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),

          // info button
          Positioned(
              right: 8,
              top: 6,
              child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ViewProfileScreen(user: user)));
                  },
                  minWidth: 0,
                  padding: const EdgeInsets.all(0),
                  child: const Icon(
                    Icons.info_outline,
                    color: Colors.blue,
                    size: 30,
                  )))
        ]),
      ),
    );
  }
}
