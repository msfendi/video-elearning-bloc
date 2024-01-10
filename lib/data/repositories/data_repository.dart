import 'package:http/http.dart' as http;

class DataService {
  //----------------- 1. Membuat Dataservice -----------------
  // Dataservice digunakan untuk membuat request ke API untuk mereturn response berupa data mentah
  // >>>>>>>>>>>>> lanjut ke api repository >>>>>>>>>>>>>
  Future<http.Response> getPosts() async {
    const _baseUrl = 'jsonplaceholder.typicode.com';
    try {
      final url = Uri.https(_baseUrl, '/posts');
      final response = await http.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}