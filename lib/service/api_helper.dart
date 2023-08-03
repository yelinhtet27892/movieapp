import 'package:dio/dio.dart';
import 'package:movie/model/comming.dart';
import 'package:movie/model/detail_model.dart';
import 'package:movie/model/now_playing.dart';
import 'package:movie/model/popular.dart';

final dio = Dio();

final token =
    "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwN2Q1NzU1NWQyOWNlMjg3Zjc0NjY5YjM0NzkyYmRmMiIsInN1YiI6IjY0YmNmYTIxZWI3OWMyMDExYzI1NzJhOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fuELXk5PS_M7BouHfFftoyFutEfxtizoNEBPeR5d9yU";
Future<NowPlaying> nowPlayData() async {
  Response response = await dio.get(
      'https://api.themoviedb.org/3/movie/now_playing?api key=07d57555d29ce287f74669b34792bdf2',
      options: Options(
        headers: {"Authorization": token},
      ));
  print("Response >>>>>>>>>>>>>>>>" + response.toString());
  return NowPlaying.fromJson(response.data);
}

Future<Popular> popularData() async {
  Response response = await dio.get(
      'https://api.themoviedb.org/3/movie/popular?api key=07d57555d29ce287f74669b34792bdf2',
      options: Options(
        headers: {"Authorization": token},
      ));
  print("Response >>>>>>>>>>>>>>>>" + response.toString());
  return Popular.fromJson(response.data);
}

Future<CommingMovie> commingData() async {
  Response response = await dio.get(
      'https://api.themoviedb.org/3/movie/upcoming?api key=07d57555d29ce287f74669b34792bdf2',
      options: Options(
        headers: {"Authorization": token},
      ));
  print("Response >>>>>>>>>>>>>>>>" + response.toString());
  return CommingMovie.fromJson(response.data);
}

Future<DetailModel> getDetailPage(int movieId) async {
  final Dio dio = Dio();

  var response = await dio.get(
      "https://api.themoviedb.org/3/movie/${movieId}?api_key=be536ef1d0b08bef115dab735402ebf0",
      queryParameters: {
        "Authorization":
            " Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZTUzNmVmMWQwYjA4YmVmMTE1ZGFiNzM1NDAyZWJmMCIsInN1YiI6IjY0YmEyN2JjMzAwOWFhMDBhZDYyODU1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4Krbc3KbDT-jeBIUnGDo8JfVod3IMLjw5WDigbxtf_g"
      });
  return DetailModel.fromJson(response.data);
}
