import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ResourceVideo extends StatefulWidget {
  const ResourceVideo({super.key});

  @override
  State<ResourceVideo> createState() => _ResourceVideoState();
}

class Course {
  final String name;
  final String id;

  Course({
    required this.id,
    required this.name,
  });

  Course copyWith({String? name, bool? isFavorite}) =>
      Course(name: name ?? this.name, id: '');
}

final List<Course> CourseData = [
  Course(id: '1', name: 'Natural Numbers'),
  Course(id: '2', name: '	LCM and HCF'),
  Course(id: '3', name: 'Unitary Method'),
  Course(id: '4', name: 'Fractions'),
  Course(id: '5', name: 'Ratio and Proportion'),
  // Course(id: '6', name: 'Profit and Loss'),
  // Course(id: '7', name: 'Simplification'),
  // Course(id: '8', name: 'Average'),
  // Course(id: '9', name: 'Percentage'),
  // Course(id: '10', name: 'Area and Perimeter'),
  // Course(id: '11', name: 'Simple Interest'),
  // Course(id: '12', name: 'Lines and Angles'),
  // Course(id: '13', name: 'Complementary and Supplementary Angles'),
  // Course(id: '14', name: 'Conversion of Units'),
  // Course(id: '15', name: 'Roman Numerals'),
];

class _ResourceVideoState extends State<ResourceVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Blue,
        automaticallyImplyLeading: false,
        shadowColor: black,
        title: text20('Video Resouces', white),
        elevation: 3,
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left_outlined,
            size: 30,
            color: white,
          ),
          onTap: () {
            Navigator.pop(context);
            // Navigator.of(context, rootNavigator: true).push(
            //   MaterialPageRoute(builder: (context) => Navigation()),
            // );
            // Navigator.pop(context);
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (BuildContext context) => CourseScreen()));
          },
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        // physics: ScrollPhysics(),
        child: SizedBox(
          //  height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: CourseData.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => VideoApp()));
                        },
                        child: ListTile(
                          leading: text16(CourseData[index].id, black),
                          title: text16(CourseData[index].name, black),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chevron_right),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/video/nature.mp4')
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController.play();
          });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Blue,
        automaticallyImplyLeading: false,
        shadowColor: black,
        title: text20('Natural Number', white),
        elevation: 3,
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left_outlined,
            size: 30,
            color: white,
          ),
          onTap: () {
            Navigator.pop(context);
            // Navigator.of(context, rootNavigator: true).push(
            //   MaterialPageRoute(builder: (context) => Navigation()),
            // );
            // Navigator.pop(context);
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (BuildContext context) => CourseScreen()));
          },
        ),
        titleSpacing: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _videoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController))
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      // backgroundColor:
                      //     MaterialStateProperty.all<Color>(Colors.blue),
                      fixedSize: MaterialStateProperty.all(Size(40, 40)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {
                    _videoPlayerController.seekTo(Duration(
                        seconds:
                            _videoPlayerController.value.position.inSeconds -
                                10));
                  },
                  child: Icon(Icons.skip_previous)),
              ElevatedButton(
                  onPressed: () {
                    _videoPlayerController.pause();
                  },
                  child: Icon(Icons.pause)),
              Padding(padding: EdgeInsets.all(2)),
              ElevatedButton(
                  onPressed: () {
                    _videoPlayerController.play();
                  },
                  child: Icon(Icons.play_arrow)),
              ElevatedButton(
                  style: ButtonStyle(
                      // backgroundColor:
                      //     MaterialStateProperty.all<Color>(Colors.blue),
                      fixedSize: MaterialStateProperty.all(Size(40, 40)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {
                    _videoPlayerController.seekTo(Duration(
                        seconds:
                            _videoPlayerController.value.position.inSeconds +
                                10));
                  },
                  child: Icon(Icons.fast_forward))
            ],
          )
        ],
      ),
    );
  }
}

class Vplay extends StatefulWidget {
  const Vplay({
    Key? key,
    required this.videoPlayerController,
  }) : super(key: key);
  final VideoPlayerController videoPlayerController;
  @override
  State<Vplay> createState() => _VplayState();
}

class _VplayState extends State<Vplay> {
  late VideoPlayerController _videoPlayerController;
  String? selectedCaption = "";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(children: [
        _videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController))
            : Container(),
        Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: VideoProgressIndicator(
              _videoPlayerController,
              allowScrubbing: false,
              colors: VideoProgressColors(
                  backgroundColor: Colors.blueGrey,
                  bufferedColor: Colors.blueGrey,
                  playedColor: Colors.blueAccent),
            ))
      ])
    ]);
  }
}
