import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:z_news_feed/Modules/news_list/news_feed.dart';

class MockDio extends Mock implements Dio {}

void main() {
  var mockdata = """
{
  "news": [
    {
      "id": 2394332,
      "title": "Ramdas Athawale seeks BJP-RPI alliance in UP to jointly fight Assembly polls  ",
      "timestamp": "2021-09-16 10:34:41",
      "section": "India",
      "slug": "india",
      "section_id": "120183",
      "thumbnail_url": "https://english.cdn.zeenews.com/sites/default/files/styles/zm_700x400/public/2021/09/16/971012-ramdasathawaleani.png",
      "section_url": "https://zeenews.india.com/mobileapi/sectionnews.php?sectionid=120183",
      "url": "https://zeenews.india.com/mobileapi/newsdetail.php?newsid=2394332",
      "tag": "Ramdas Athawale",
      "tag_id": "149732",
      "tag_url": "https://zeenews.india.com/mobileapi/sectionnews.php?sectionid=149732",
      "main_tag_url": "https://zeenews.india.com/tags/ramdas-athawale.html",
      "highlights": "<ul><li>Ramdas Athawale said that BJP should fight the next UP Assembly polls in alliance with RPI\r\nHe said that his party will start its poll campaign by taking out a \"Bahujan Kalyan Yatra\" from Saharanpur on Sept 26\r\nThe yatra will culminate at Lucknow's Rama Bai Ambedkar Park on December 18, he added </li></ul>",
      "summary": "<p>RPI chief Ramdas Athawale&nbsp;said that his party may field candidates on 10-12 seats dominated by Muslims, Scheduled Castes and backward classes in alliance with the BJP.</p>\r\n",
      "news_type": "news"
    }
  ],
  "threshold": 20,
  "totalpage": 10
}
""";

  testWidgets('NewsFeed widget', (WidgetTester tester) async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);

    dio.httpClientAdapter = dioAdapter;

    const path = 'https://jsonkeeper.com/b/0Y0J';

    dioAdapter.onGet(
      path,
      (request) => request.reply(200, {'data': mockdata}),
    );

    await tester.runAsync(() async {
      await tester.pumpWidget(const MaterialApp(
        home: NewsFeed(),
      ));
    });

    expect(find.text('News Feed'), findsOneWidget);
  });
}
