import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/helper/my_date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/chat_user.dart';

class ViewProfileScreen extends StatefulWidget {
  final ChatUser user;
  const ViewProfileScreen({super.key, required this.user});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // for unfocusing keyboard
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(widget.user.name)),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Joined On: ',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            Text(
              MyDateUtil.getLastMessageTime(
                  context: context,
                  time: widget.user.lastActive,
                  showYear: true),
              style: const TextStyle(color: Colors.black54, fontSize: 15),
            ),
          ],
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mq.height * 0.015,
          ),
          child: Column(
            children: [
              // for adding some space
              SizedBox(
                width: mq.width,
                height: mq.height * 0.04,
              ),
              // user profile picture
              ClipRRect(
                // profile picture
                borderRadius: BorderRadius.circular(mq.height * 0.2),
                child: CachedNetworkImage(
                  height: mq.height * 0.2,
                  width: mq.height * 0.2,
                  fit: BoxFit.cover,
                  imageUrl: widget.user.image,
                  errorWidget: (context, url, error) =>
                      const CircleAvatar(child: Icon(CupertinoIcons.person)),
                ),
              ),
              //for adding some space
              SizedBox(
                height: mq.height * 0.02,
              ),
              // user email label
              Text(
                widget.user.email,
                style: const TextStyle(color: Colors.black87, fontSize: 16),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),

              // user about
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'About: ',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Text(
                    widget.user.about,
                    style: const TextStyle(color: Colors.black54, fontSize: 16),
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
