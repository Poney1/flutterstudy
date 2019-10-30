import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'RandomWords.dart';

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Startup"),
        ),
        body: _buildSuggestions());
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(pair.asPascalCase, style: _biggerFont),
      trailing: new Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          loadData();
          if (alreadySaved) {
            _saved.remove(pair);
//            navigatorA(_context);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void navigatorA(BuildContext context) {
    Navigator.of(context).pushNamed('/a');
  }

  loadData() async {
    String dataUrl = 'http://httpbin.org/ip';
    try {
      var http = HttpClient();
      var request = await http.getUrl(Uri.parse(dataUrl));
//     request.headers.add("user-agent", "test");
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        String responseString = await response.transform(utf8.decoder).join();
        print("TAG : " + responseString);
        Fluttertoast.showToast(
            msg: responseString + " -- ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            textColor: Colors.white);
      } else {}
      http.close();
    } catch (exception) {
      print("TAG "+exception);
    }
    setState(() {});
  }
}
