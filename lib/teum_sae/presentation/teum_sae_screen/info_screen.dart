import 'package:flutter/material.dart';
import 'package:teum_sae/router/router.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: IconButton(
                  onPressed: () {
                    router.go('/selectMode');
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(24.0),
                      child: Image.asset('assets/png/youwl_logo.png')),
                  const Text(
                    '안녕하세요, youwl입니다.',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text(
                      '''저의 첫 번째 앱 '틈새' 입니다.\n\n스톱 워치와 현재 시간을 나타내는 기능이 있습니다. 꾸준히 업데이트 할 예정이니 원하는 기능이 있다면 마음껏 리뷰남겨주세요.\n\n함께 해주셔서 감사합니다. ''',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w300,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
