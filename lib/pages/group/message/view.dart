import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chat/widgets/message_list.dart';
import 'index.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff184E68),
              Color(0xff57CA85),
            ],
            transform: GradientRotation(45),
          ),
        ),
      ),
      title: const Center(
        child: Text("Chats"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const MessageList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed("/ContactPage"),
        backgroundColor: const Color(0xff57CA85),
        child: const Icon(Icons.chat),
      ),
    );
  }
}
