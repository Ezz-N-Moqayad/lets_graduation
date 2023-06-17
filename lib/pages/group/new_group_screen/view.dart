import 'package:flutter/material.dart';

class NewGroupScreen extends StatelessWidget {
  const NewGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.topStart,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.centerEnd,
                colors: [
              Color(0xff184E68),
              Color(0xff57CA85),
            ])),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Back',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'New Group',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Create',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: 103,
                    height: 102,
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5FA),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: InkWell(
                      onTap: () {
                        print('gg');
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(0xffF5F5FA),
                        child: Image.asset(
                          'assets/images/personal_group.png',
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 75, start: 70),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5FA),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {
                          print('gg');
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xffF5F5FA),
                          child: Icon(
                            Icons.camera_alt,
                            color: Color(0xff57CA85),
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 16, start: 16),
                child: TextField(
                  keyboardType: TextInputType.name,
                  onTap: () {},
                  onChanged: (String value) {},
                  cursorColor: Colors.white,
                  cursorRadius: Radius.circular(10),
                  enabled: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Group name',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    helperMaxLines: 1,
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF5F5F5), width: 1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 69,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'PARTICIPANTS:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '20',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '0F',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '256',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 240),
                  child: ListView.separated(
                    padding: EdgeInsetsDirectional.only(start: 16, end: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 8);
                    },
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                            ),
                            child: InkWell(
                              onTap: () {
                                print('gg');
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(0xffF5F5FA),
                                child: Image.asset(
                                  'assets/images/personal_frindes.png',
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                bottom: 40, start: 48),
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color(0xffF5F5FA),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: InkWell(
                                onTap: () {
                                  print('gg');
                                },
                                child: CircleAvatar(
                                  backgroundColor: Color(0xffF5F5FA),
                                  child: Icon(
                                    Icons.dangerous_outlined,
                                    color: Color(0xff57CA85),
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 130),
                            child: Text(
                              'Aseel',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
