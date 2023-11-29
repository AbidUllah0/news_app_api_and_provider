import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nows_app_udemy/screens/news_details_webview_screen/components/dialog_method.dart';
import 'package:nows_app_udemy/utils/app_bar_color_getter.dart';
import 'package:nows_app_udemy/widgets/vertical_spacing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/custom_text.dart';

class NewsDetailsWebView extends StatefulWidget {
  const NewsDetailsWebView({super.key});

  @override
  State<NewsDetailsWebView> createState() => _NewsDetailsWebViewState();
}

class _NewsDetailsWebViewState extends State<NewsDetailsWebView> {
  late WebViewController webViewController;
  double _progress = 0.0;
  final url =
      'https://techcrunch.com/2022/06/17/marc-lores-food-delivery-startup-wonder-raises-350m-3-5b-valuation/';

  @override
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return WillPopScope(
      onWillPop: () async {
        if (await webViewController.canGoBack()) {
          webViewController.goBack();

          /// stay inside
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: color),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(IconlyLight.arrowLeft2),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: CustomText(
            text: 'URL',
            style: TextStyle(color: color),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _buildModelBottomSheet();
              },
              icon: Icon(Icons.more_horiz),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              LinearProgressIndicator(
                value: _progress,
                color: _progress == 1.0 ? Colors.transparent : Colors.blue,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              Expanded(
                child: WebView(
                  initialUrl: url,
                  zoomEnabled: true,
                  javascriptMode: JavascriptMode.unrestricted,

                  ///for loading
                  onProgress: (progress) {
                    setState(() {
                      _progress = progress / 100;
                    });
                  },
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _buildModelBottomSheet() async {
    await showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          // height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              VerticalSpacing(20),
              Container(
                height: 5,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              VerticalSpacing(20),
              CustomText(
                text: 'More options',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              VerticalSpacing(20),
              Divider(thickness: 2),
              VerticalSpacing(20),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: () async {
                  try {
                    await Share.share('url', subject: 'Look what i made');
                  } catch (e) {
                    errorDialog(errorMessage: e.toString(), context: context);

                    /// or
                    errorDialog(
                        errorMessage: 'an error acccured here',
                        context: context);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.open_in_browser),
                title: Text('Open in browser'),
                onTap: () async {
                  try {
                    if (!await launchUrl(
                      Uri.parse(url),
                    )) {
                      throw 'could launch url $url';
                    }
                  } catch (e) {
                    errorDialog(errorMessage: e.toString(), context: context);

                    /// or
                    errorDialog(
                        errorMessage: 'an error acccured here',
                        context: context);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.refresh),
                title: Text('Refresh'),
                onTap: () async {
                  /// to refresh the page
                  await webViewController.reload();

                  ///disappear model sheet
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
