// "id":1,
// "content":"",
// "coverImageUrl":"",
// "description":"2781 points by lando2319 3 days ago  | 1259 comments",
// "subtitle":"twitter.com/mwseibel",
// "title":"Google no longer producing high quality search results in significant categories",
// "url":"https://twitter.com/mwseibel/status/1477701120319361026",
// "created_at":"2022-01-10T08:35:24.685Z",
// "updated_at":"2022-01-10T08:35:24.685Z"

class Article {
  int? id;
  String? content;
  String? coverImageUrl;
  String? description;
  String? subtitle;
  String? title;
  String? url;

  Article();

  factory Article.fromDocument(dynamic responseJson) {
    final user = Article();
    user.id = responseJson['id'] as int?;
    user.content = responseJson['content'] as String?;
    user.coverImageUrl = responseJson['coverImageUrl'] as String?;
    user.description = responseJson['description'] as String?;
    user.subtitle = responseJson['subtitle'] as String?;
    user.title = responseJson['title'] as String?;
    user.url = responseJson['url'] as String?;

    return user;
  }
}


