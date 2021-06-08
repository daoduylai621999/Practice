import 'package:practice/Module/member.dart';

class SearchGithubState {
  var listUser = <Member>[];

  SearchGithubState(this.listUser);
}

class Loading extends SearchGithubState {
  Loading({List<Member> listUser}) : super(listUser);
}

class Error extends SearchGithubState {
  Error({List<Member> listUser}) : super(listUser);

}



