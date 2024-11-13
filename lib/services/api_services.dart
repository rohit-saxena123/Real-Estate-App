import 'dart:convert';
import 'package:http/http.dart'as http;

class joke_service{
  static const String BaseUrl='https://api.chucknorris.io/jokes/random';

  Future<String> jockobject() async{
    try{
      final response =await http.get(Uri.parse(BaseUrl));
      if(response.statusCode==200){
        final jsonData=jsonDecode(response.body);
        return jsonData['value'];
      }else{
        throw Exception('Failed to load joke');
      }
    }catch (e){
      throw Exception('Failed to fetch data ');
    }
  }

}




// class joke_api_services{
//   static const String BaseUrl='https://api.chucknorris.io/jokes/random';
//
//   Future<String> firstobject() async{
//     try{
//       final response =await http.get(Uri.parse(BaseUrl));
//       if(response.statusCode==200){
//         final jsonData = jsonDecode(response.body);
//         return jsonData['value'];
//       }else{
//         throw Exception('Failed to load jokes');
//       }
//
//     }catch(e){
//       throw Exception('Feiled to fetch joke $e');
//     }
//
//   }
// }


// class joke_api_service{
//   static const String BaseUrl='https://api.chucknorris.io/jokes/random';
//   Future<String> fetchsomejoke() async{
//     try{
//       final response = await http.get(Uri.parse(BaseUrl));
//       if(response.statusCode==200){
//         final jsonData= jsonDecode(response.body);
//         return jsonData['value'];
//       }
//       else{
//         throw Exception('Failed to load joke');
//       }
//
//     }catch(e){
//       throw Exception('Failed to fetch joke: $e');
//     }
//   }
//
// }