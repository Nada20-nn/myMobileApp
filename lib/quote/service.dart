import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:mobileproj/quote/quote.dart';

Future <List <Quote>> fetchQuote() async{
   final response= await http.get(Uri.parse('https://api.api-ninjas.com/v1/quotes'),
   headers:{'X-Api-Key': '2X+miIxU8KUYePDDS7bedw==xBTQkoWsDOEXIfkN'});


   if(response.statusCode==200){


      List<dynamic> data= jsonDecode(response.body);
      return data.map((json)=>Quote.fromJson(json)).toList();


   }

   throw Exception("failed to load data");
  //  JsonCodec.withReviver(reviver)
  

}