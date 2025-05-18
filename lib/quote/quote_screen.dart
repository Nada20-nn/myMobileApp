import 'package:flutter/material.dart';
import 'package:mobileproj/quote/quote.dart';
import 'package:mobileproj/quote/service.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late Future<List<Quote>> future; // 3mlt var mn no3 futureList nafs no3 2aly btrg3o service 3ndy

  @override
  void initState() {
    future = fetchQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/background_quote.jpeg"),
          ),
        ),
        child: FutureBuilder<List<Quote>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // btrg3 loading
              return Center(child: Center(child: SizedBox(
                height: 100,
                
                child: CircularProgressIndicator())));
            } else if (snapshot.hasError) {
              return Center(child: Icon(Icons.wifi_off_rounded,color: Colors.green.shade100,size: 200,)); // lw fe error
            } else if (snapshot.hasData) {

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final quote = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '"${quote.quote}"',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '- ${quote.author}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),

                         Text(
                          '- ${quote.category}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Divider(color: Colors.white54),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text('No data found'));
            }
          },
        ),
      ),
    );
  }
}
