// import 'package:flutter/material.dart';
// import 'package:practice/Bloc/Favorite/bloc.dart';
// import 'package:practice/Bloc/Favorite/event.dart';
// import 'package:practice/Bloc/Favorite/state.dart';
// import 'package:practice/Module/member.dart';
//
// class Detail extends StatefulWidget {
//   const Detail({Key key, this.member, this.index, this.blocF}) : super(key: key);
//   final Member member;
//   final int index;
//   final FavoriteBloc blocF;
//
//   @override
//   _DetailState createState() => _DetailState(member: member, index: index, blocF: blocF);
// }
//
// class _DetailState extends State<Detail> with TickerProviderStateMixin{
//   _DetailState({this.member, this.index, this.blocF});
//   final Member member;
//   final int index;
//   final FavoriteBloc blocF;
//
//   AnimationController animationController;
//   Animation<double> animation;
//
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(duration: Duration(seconds: 1, milliseconds: 200), vsync: this);
//     animation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);
//     animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     animationController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: new Text("Detail"),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(bottom: 10),
//               margin: EdgeInsets.only(bottom: 20),
//               decoration: BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     width: 2,
//                     color: Colors.black54,
//                   )
//                 )
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 60,
//                     width: 60,
//                     child: CircleAvatar(
//                       backgroundImage: new NetworkImage(member.avatarUrl),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Stack(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(left: 20, right: 20),
//                   child: Column(
//                     children: <Widget>[
//                       field("User Name" ,member.login),
//                       field("User Index", index.toString()),
//                       fieldState("Favorite State"),
//                       AnimatedImg(animation: animation, member: member),
//                       ],
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget field(String nameText, String string) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 18),
//       child: Row(
//         children: [
//           Stack(
//             alignment: Alignment.topLeft,
//             children: [
//               Text(
//                 "$nameText: ",
//                 style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 100),
//                 child: Text(
//                   "$string",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.blue
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget fieldState(String nameText) {
//     blocF.eventControllerFavorite.add(FavoriteEventFirst(member));
//     bool _isSaved = false;
//     return Container(
//       margin: EdgeInsets.only(bottom: 15),
//       child: Row(
//         children: [
//           Stack(
//             alignment: Alignment.topLeft,
//             children: [
//               Text(
//                 "$nameText: ",
//                 style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
//               ),
//               StreamBuilder<FavoriteState>(
//                 stream: blocF.stateControllerFavorite.stream,
//                 builder: (BuildContext context, AsyncSnapshot<FavoriteState> snapshot) {
//                   if(snapshot.data != null) {
//                     _isSaved = snapshot.data.isSaved;
//                   }
//                   return new Container(
//                     margin: EdgeInsets.only(left: 130),
//                     child: Icon(
//                       _isSaved? Icons.favorite : Icons.favorite_outline,
//                       color: _isSaved? Colors.redAccent.withOpacity(0.8) : Colors.black54.withOpacity(0.7),
//                     ),
//                   );
//                 }
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AnimatedImg extends AnimatedWidget {
//   AnimatedImg({Key key, this.animation, this.member}) : super(key: key, listenable: animation);
//
//   final Member member;
//   final Animation<double> animation;
//   final opacityTween = Tween(begin: 0.0, end: 1.0);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Opacity(
//         opacity: opacityTween.evaluate(animation),
//         child: Container(
//           child: Image.network(member.avatarUrl),
//         ),
//       )
//       ,
//     );
//   }
// }
