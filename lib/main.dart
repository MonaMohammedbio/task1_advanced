import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isplaying=false;
  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  void initState(){
    assetsAudioPlayer.open(
        Playlist(
            audios: [
            Audio("assets/sample.mp3"),
              Audio("assets/sample2.mp3"),
            Audio("assets/sample3.mp3")
            ]
              )

    ,loopMode: LoopMode.playlist //loop the full playlist
  );

 assetsAudioPlayer.next();
   assetsAudioPlayer.previous();
   assetsAudioPlayer.playlistPlayAtIndex(1);


assetsAudioPlayer.playlistFinished.listen((event) {
  print("fffff");
  isplaying=false;});
super.initState();

  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(children: [
        Row(children: [
             Text("sample1"),

          IconButton(onPressed: (){
                if
                (assetsAudioPlayer.isPlaying.value){
                  assetsAudioPlayer.pause();
                }else{assetsAudioPlayer.play();}
 setState(() {
   isplaying=!isplaying;

 });
    },icon:isplaying ?Icon(Icons.pause):Icon(Icons.play_arrow) )




          ],
        ),
        Row(children: [
          Text("sample2"),

     IconButton(onPressed: (){
            if
            (assetsAudioPlayer.isPlaying.value){
              assetsAudioPlayer.pause();
            }else{assetsAudioPlayer.play();}
         setState(() {
            isplaying=!isplaying;

          });
          },icon:isplaying ?Icon(Icons.pause):Icon(Icons.play_arrow) )




        ],
        ),
        Row(children: [
          Text("sample3"),

         IconButton(onPressed: (){
            if
            (assetsAudioPlayer.isPlaying.value){
              assetsAudioPlayer.pause();
            }else{assetsAudioPlayer.play();}
        setState(() {
          isplaying=!isplaying;

         });
          },icon:isplaying ?Icon(Icons.pause):Icon(Icons.play_arrow) )




        ],
        ),
      ],)
    );
  }
}
