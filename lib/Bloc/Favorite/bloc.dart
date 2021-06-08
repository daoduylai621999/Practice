import 'dart:async';
import 'package:practice/Bloc/Favorite/event.dart';
import 'package:practice/Bloc/Favorite/state.dart';
import 'package:practice/Repo/db.dart';

class FavoriteBloc {
  // Nhan event tu UI
  final stateControllerFavorite = StreamController<FavoriteState>.broadcast();

  // Truyen State den UI
  final eventControllerFavorite = StreamController<FavoriteEvent>.broadcast();

  FavoriteBloc() {
    eventControllerFavorite.stream.listen((FavoriteEvent event) async {
      bool isFavorite = false;
      final db = SQLiteDbProvider.db;
      if(event is CheckFavoriteEvent) {
        if(await db.getMemberById(event.member.id) == null) {
          await db.insertMember(event.member);
          isFavorite = true;
        }
        else {
          await db.deleteMember(event.member.id);
        }
      }
      else if( event is LoadFavoriteEvent){
        if(await db.getMemberById(event.member.id) != null) isFavorite = true;
      }
      stateControllerFavorite.add(FavoriteState(isFavorite));
    });
  }

  void dispose() {
    eventControllerFavorite.close();
    stateControllerFavorite.close();
  }
}