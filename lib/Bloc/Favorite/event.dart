import 'package:practice/Module/member.dart';

class FavoriteEvent {

}

class CheckFavoriteEvent  extends FavoriteEvent {
  Member member;

  CheckFavoriteEvent([this.member]);
}

class LoadFavoriteEvent extends FavoriteEvent {
  Member member;

  LoadFavoriteEvent(this.member);
}