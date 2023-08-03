import 'package:flutter/material.dart';
import 'package:movie/model/comming.dart';
import 'package:movie/model/now_playing.dart';
import 'package:movie/model/popular.dart';
import 'package:movie/service/api_helper.dart';
import 'package:movie/view/detail.dart';


class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 45),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Now Playing',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ],
              ),
              FutureBuilder<NowPlaying>(
                  future: nowPlayData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.results!.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 8, top: 15),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Detail(snapshot.data!.results![index].id!.toInt())));
                                  print('koko');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].posterPath}'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ],
              ),
              FutureBuilder<Popular>(
                  future: popularData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.results.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 8, top: 15),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Detail(snapshot.data!.results[index].id)));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      'https://image.tmdb.org/t/p/original${snapshot.data!.results[index].posterPath}'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcomming',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ],
              ),
              FutureBuilder<CommingMovie>(
                  future: commingData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.results.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 8, top: 15),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Detail(
                                          snapshot.data!.results[index].id)));
                                  print('koko');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      'https://image.tmdb.org/t/p/original${snapshot.data!.results[index].posterPath}'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[850],
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 35,
                  color: index == 0 ? Colors.blue : Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: index == 1 ? Colors.blue : Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color: index == 2 ? Colors.blue : Colors.white,
                ),
                label: ''),
          ]),
    );
  }
}
