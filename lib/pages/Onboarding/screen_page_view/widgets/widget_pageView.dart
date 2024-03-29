import 'package:flutter/material.dart';

class widget_pageView extends StatelessWidget {
  const widget_pageView({
    Key? key,
    required this.title,
    required this.Imagee,
  }) : super(key: key);

  final String title;
  final String Imagee;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Imagee),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 450),
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 'assets/images/page_view.png'
// 'Want a walking group? Walk friends! It is a  \n community of thousands of members that \n connects girls to create walking groups.'
