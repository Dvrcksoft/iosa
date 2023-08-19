import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:signalbyt/components/z_card.dart';
import 'package:signalbyt/models/post_aggr.dart';
import 'package:signalbyt/models/anal_aggr.dart';
import 'package:signalbyt/models/srat_aggr.dart';
import 'package:signalbyt/models/lessn_aggr.dart';
import 'package:signalbyt/models/video_lesson_aggr.dart';
import 'package:signalbyt/models_providers/app_provider.dart';
import 'package:signalbyt/pages/learn/post_details_page.dart';
import 'package:signalbyt/pages/learn/anal_details_page.dart';
import 'package:signalbyt/pages/learn/srat_details_page.dart';
import 'package:signalbyt/pages/learn/lessn_details_page.dart';
import 'package:signalbyt/utils/z_format.dart';

import '../../components/z_image_display.dart';
import '../../constants/app_colors.dart';
import '../../utils/z_launch_url.dart';

class LearnPage extends StatefulWidget {
  LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    final posts = appProvider.posts;
    final anals = appProvider.anals;
    final srats = appProvider.srats;
    final lessns = appProvider.lessns;
    final videoLessons = appProvider.videoLessons;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        bottom: TabBar(
          controller: _controller,
          indicatorColor: appColorYellow,
          labelColor: appColorYellow,
          tabs: [
            Tab(text: 'Blogs'),
            Tab(text: 'Analytics'),
            Tab(text: 'Strategy'),
            Tab(text: 'Lessons'),
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: [
        ListView.builder(
          itemCount: posts.length,
          itemBuilder: ((context, index) => Column(
                children: [
                  if (index == 0) SizedBox(height: 8),
                  PostCard(post: posts[index]),
                  if (index == videoLessons.length - 1) SizedBox(height: 16),
                ],
              )),
        ),
        ListView.builder(
          itemCount: anals.length,
          itemBuilder: ((context, index) => Column(
                children: [
                  if (index == 0) SizedBox(height: 8),
                  AnalCard(anal: anals[index]),
                  if (index == videoLessons.length - 1) SizedBox(height: 16),
                ],
              )),
        ),
        ListView.builder(
          itemCount: srats.length,
          itemBuilder: ((context, index) => Column(
                children: [
                  if (index == 0) SizedBox(height: 8),
                  SratCard(srat: srats[index]),
                  if (index == videoLessons.length - 1) SizedBox(height: 16),
                ],
              )),
        ),
         ListView.builder(
          itemCount: lessns.length,
          itemBuilder: ((context, index) => Column(
                children: [
                  if (index == 0) SizedBox(height: 8),
                  LessnCard(lessn: lessns[index]),
                  if (index == videoLessons.length - 1) SizedBox(height: 16),
                ],
              )),
        ),
        ListView.builder(
          itemCount: videoLessons.length,
          itemBuilder: ((context, index) => Column(
                children: [
                  if (index == 0) SizedBox(height: 8),
                  VideoCard(videoLesson: videoLessons[index]),
                  if (index == videoLessons.length - 1) SizedBox(height: 16)
                ],
              )),
        )
      ]),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return ZCard(
      borderRadiusColor: isLightTheme ? appColorCardBorderLight : appColorCardBorderDark,
      onTap: () => Get.to(() => PostDetailsPage(post: post), transition: Transition.cupertino, fullscreenDialog: true),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(),
          Hero(
            tag: post.id,
            child: ZImageDisplay(
              image: post.image,
              height: MediaQuery.of(context).size.width * .4,
              width: MediaQuery.of(context).size.width,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(post.title),
          ),
          SizedBox(height: 4),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(ZFormat.dateFormatSignal(post.postDate)),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class AnalCard extends StatelessWidget {
  const AnalCard({Key? key, required this.anal}) : super(key: key);
  final Anal anal;

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return ZCard(
      borderRadiusColor: isLightTheme ? appColorCardBorderLight : appColorCardBorderDark,
      onTap: () => Get.to(() => AnalDetailsPage(anal: anal), transition: Transition.cupertino, fullscreenDialog: true),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(),
          Hero(
            tag: anal.id,
            child: ZImageDisplay(
              image: anal.image,
              height: MediaQuery.of(context).size.width * .4,
              width: MediaQuery.of(context).size.width,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(anal.title),
          ),
          SizedBox(height: 4),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(ZFormat.dateFormatSignal(anal.analDate)),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class SratCard extends StatelessWidget {
  const SratCard({Key? key, required this.srat}) : super(key: key);
  final Srat srat;

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return ZCard(
      borderRadiusColor: isLightTheme ? appColorCardBorderLight : appColorCardBorderDark,
      onTap: () => Get.to(() => SratDetailsPage(srat: srat), transition: Transition.cupertino, fullscreenDialog: true),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(),
          Hero(
            tag: srat.id,
            child: ZImageDisplay(
              image: srat.image,
              height: MediaQuery.of(context).size.width * .4,
              width: MediaQuery.of(context).size.width,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(srat.title),
          ),
          SizedBox(height: 4),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(ZFormat.dateFormatSignal(srat.sratDate)),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class LessnCard extends StatelessWidget {
  const LessnCard({Key? key, required this.lessn}) : super(key: key);
  final Lessn lessn;

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return ZCard(
      borderRadiusColor: isLightTheme ? appColorCardBorderLight : appColorCardBorderDark,
      onTap: () => Get.to(() => LessnDetailsPage(lessn: lessn), transition: Transition.cupertino, fullscreenDialog: true),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(),
          Hero(
            tag: lessn.id,
            child: ZImageDisplay(
              image: lessn.image,
              height: MediaQuery.of(context).size.width * .4,
              width: MediaQuery.of(context).size.width,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(lessn.title),
          ),
          SizedBox(height: 4),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(ZFormat.dateFormatSignal(lessn.lessnDate)),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}


class VideoCard extends StatelessWidget {
  const VideoCard({Key? key, required this.videoLesson}) : super(key: key);
  final VideoLesson videoLesson;

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return ZCard(
      onTap: () => ZLaunchUrl.launchUrl(videoLesson.link),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.symmetric(),
      borderRadiusColor: isLightTheme ? appColorCardBorderLight : appColorCardBorderDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(),
          ZImageDisplay(
            image: videoLesson.image,
            height: MediaQuery.of(context).size.width * .4,
            width: MediaQuery.of(context).size.width,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(videoLesson.title),
          ),
          SizedBox(height: 4),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(ZFormat.dateFormatSignal(videoLesson.timestampCreated)),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
