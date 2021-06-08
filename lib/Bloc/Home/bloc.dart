import 'dart:async';
import 'package:hive/hive.dart';
import 'package:practice/Bloc/Home/event.dart';
import 'package:practice/Bloc/Home/state.dart';
import 'package:practice/Module/member.dart';
import 'package:practice/Repo/repo.dart';

class SearchGithubBloc {
  // Nhan event tu UI
  final eventController = StreamController<Event>.broadcast();

  // Truyen state den UI
  final stateController = StreamController<SearchGithubState>.broadcast();

  SearchGithubBloc() {
    List<Member> members = [];
    int page = 1;
    stateController.add(SearchGithubState(members));
    eventController.stream.listen((Event event) async {
      if (event is SearchGithubEvent) {
        if(event.dataSearch.length == 0) {
          stateController.add(Error());
        } else {
          stateController.add(Loading());
          members = await NetWorkRepo().loadData(event.dataSearch, page);
          if(members.isEmpty) {
            stateController.add(Error());
          } else {
            stateController.add(SearchGithubState(members));
          }
        }
      } else if(event is LoadMore) {
        page += 1;
        List<Member> membersLoadMore = await NetWorkRepo().loadData(event.dataSearch, page);
        members.addAll(membersLoadMore);
        stateController.add(SearchGithubState(members));
      } else if(event is SetState) {
        stateController.add(SearchGithubState(members));
      }
    });
  }

  void dispose() {
    eventController.close();
    stateController.close();
  }
}
