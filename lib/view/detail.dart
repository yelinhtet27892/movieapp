import 'package:flutter/material.dart';
import 'package:movie/model/comming.dart';
import 'package:movie/service/api_helper.dart';
import 'package:movie/view/youtube.dart';

class Detail extends StatefulWidget {
  int id;
  Detail(this.id);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: getDetailPage(widget.id),
            builder: (context, s) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        "https://image.tmdb.org/t/p/original${s.data!.posterPath}",
                        height: height * 0.4,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 40,
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            s.data!.title,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.download,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => YoutubePlayer()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        child: Text(
                          'Play',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Prolog',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      '${s.data!.title} is  provides linguis descriptions of movies and allows visually impaired people to follow a movie along with their peers. Such descriptionsare by design mainly visual and thus naturally form an interesting data source for computer vision and computationallinguistics.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Top Cast',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://image.tmdb.org/t/p/original${s.data!.posterPath}")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://image.tmdb.org/t/p/original${s.data!.posterPath}")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://image.tmdb.org/t/p/original${s.data!.posterPath}")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://image.tmdb.org/t/p/original${s.data!.posterPath}")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://image.tmdb.org/t/p/original${s.data!.posterPath}")),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
