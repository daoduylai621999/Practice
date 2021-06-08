import 'package:practice/Module/member.dart';

class Event {
  String dataSearch;
  Member member;
  Event({this.dataSearch, this.member});
}

class SearchGithubEvent extends Event {
  SearchGithubEvent(String dataSearch) : super(dataSearch: dataSearch);
}

class LoadMore extends Event {
  LoadMore(String dataSearch) : super(dataSearch: dataSearch);
}

class SetState extends Event {
  SetState({String dataSearch}) : super(dataSearch: dataSearch);
}

class Favorite extends Event {
  Favorite({Member member}) : super(member: member);

}