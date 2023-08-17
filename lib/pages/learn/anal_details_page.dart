import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../components/z_image_display.dart';
import '../../models/anal_aggr.dart';

class AnalDetailsPage extends StatefulWidget {
  AnalDetailsPage({Key? key, required this.anal}) : super(key: key);
  final Anal anal;

  @override
  State<AnalDetailsPage> createState() => _AnalDetailsPageState();
}

class _AnalDetailsPageState extends State<AnalDetailsPage> {
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
                    tag: widget.anal.id,
                    child: ZImageDisplay(
                        image: widget.anal.image,
                        height: MediaQuery.of(context).size.height * .2,
                        width: MediaQuery.of(context).size.width,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.anal.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  SizedBox(height: 16),
                  HtmlWidget(
                    widget.anal.body,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
