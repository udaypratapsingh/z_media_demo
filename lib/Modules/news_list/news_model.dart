class NewsModel {
  List<News>? news;
  int? threshold;
  int? totalpage;

  NewsModel({this.news, this.threshold, this.totalpage});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
    threshold = json['threshold'];
    totalpage = json['totalpage'];
  }

}

class News {
  int? id;
  String? title;
  String? timestamp;
  String? section;
  String? slug;
  String? sectionId;
  String? thumbnailUrl;
  String? sectionUrl;
  String? url;
  String? tag;
  String? tagId;
  String? tagUrl;
  String? mainTagUrl;
  String? highlights;
  String? summary;
  String? newsType;

  News(
      {this.id,
      this.title,
      this.timestamp,
      this.section,
      this.slug,
      this.sectionId,
      this.thumbnailUrl,
      this.sectionUrl,
      this.url,
      this.tag,
      this.tagId,
      this.tagUrl,
      this.mainTagUrl,
      this.highlights,
      this.summary,
      this.newsType});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    timestamp = json['timestamp'];
    section = json['section'];
    slug = json['slug'];
    sectionId = json['section_id'];
    thumbnailUrl = json['thumbnail_url'];
    sectionUrl = json['section_url'];
    url = json['url'];
    tag = json['tag'];
    tagId = json['tag_id'];
    tagUrl = json['tag_url'];
    mainTagUrl = json['main_tag_url'];
    highlights = json['highlights'];
    summary = json['summary'];
    newsType = json['news_type'];
  }
}