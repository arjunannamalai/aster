import 'package:http/http.dart' as http;
import 'post.dart';

class Service {
  static Future<List<Post>?> getData() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
