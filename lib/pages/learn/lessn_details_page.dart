import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../components/z_image_display.dart';
import '../../models/lessn_aggr.dart';

class LessnDetailsPage extends StatefulWidget {
  LessnDetailsPage({Key? key, required this.lessn}) : super(key: key);
  final Lessn lessn;

  @override
  State<LessnDetailsPage> createState() => _LessnDetailsPageState();
}

class _LessnDetailsPageState extends State<LessnDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: widget.lessn.id,
                    child: ZImageDisplay(
                        image: widget.lessn.image,
                        height: MediaQuery.of(context).size.height * .2,
                        width: MediaQuery.of(context).size.width,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.lessn.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  SizedBox(height: 16),
                  HtmlWidget(
                    widget.lessn.body,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
