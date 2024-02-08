import 'package:fishnetlk/core/constants/app_colors.dart';
import 'package:fishnetlk/features/auth/providers/get_user_info_by_id_provider.dart';
import 'package:fishnetlk/features/chat/presentation/screens/chats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../controller/home_controller.dart';
import '../../../auth/providers/get_user_info_by_id_provider.dart';
import '../screens/chat_screen.dart';
import '/core/constants/extensions.dart';
// import '/features/chat/presentation/screens/chat_screen.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.userId,
    required this.lastMessage,
    required this.lastMessageTs,
    required this.chatroomId,
  }) : super(key: key);

  final String userId;
  final String lastMessage;
  final DateTime lastMessageTs;
  final String chatroomId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              ChatScreen.routeName,
              arguments: {
                'userId': userId,
              },
            );
          },
          child: Row(
            children: [
              // Profile Pic
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(ctrl.makePostUi[1].image as String),
              ),
              // const SizedBox(width: 10),
              // Column (Name + Last Message + Last Message Timetstamp)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      ctrl.makePostUi[1].fullName as String,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Last Message + Ts
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            lastMessage,
                            style: const TextStyle(
                              color: AppColors.darkGreyColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Text(' → '),
                        Text(
                          lastMessageTs.jm(),
                          style: const TextStyle(
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Message status
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.check_circle_outline,
                  color: AppColors.messengerDarkGrey,
                ),
              ),
            ],
          ),
        ),
      );
    });

  }
}
