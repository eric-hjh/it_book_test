class BoardModel {
  int? id;
  int? sellPrice;
  int? hits;
  String? title;
  String? writer;
  String? publisher;
  String? state;
  String? content;
  String? stateImage;
  String? pubDate;
  String? summary;

  List<dynamic>? tags;

  BoardModel({
    this.id,
    this.sellPrice,
    this.hits,
    this.title,
    this.writer,
    this.publisher,
    this.state,
    this.content,
    this.stateImage,
    this.pubDate,
    this.summary,
    this.tags,
  });

  factory BoardModel.fromJson(Map<String, dynamic> json) {
    return BoardModel(
      id: json['pk'],
      sellPrice: json['sell_price'],
      hits: json['hits'],
      title: json['title'],
      writer: json['writer'],
      publisher: json['publisher'],
      state: json['state'],
      content: json['content'],
      stateImage: json['state_image'],
      pubDate: json['pub_date'],
      summary: json['summary'],
      tags: json['tags'],
    );
  }
}
