import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../components/z_image_display.dart';
import '../../models/srat_aggr.dart';

class SratDetailsPage extends StatefulWidget {
  SratDetailsPage({Key? key, required this.srat}) : super(key: key);
  final Srat srat;

  @override
  State<SratDetailsPage> createState() => _SratDetailsPageState();
}

class _SratDetailsPageState extends State<SratDetailsPage> {
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
                    tag: widget.srat.id,
                    child: ZImageDisplay(
                        image: widget.srat.image,
                        height: MediaQuery.of(context).size.height * .2,
                        width: MediaQuery.of(context).size.width,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.srat.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  SizedBox(height: 16),
                  HtmlWidget(
                    widget.srat.body,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
