
// class _CaseTileState extends State<CaseTile> {
//   final DocumentSnapshot doc;
//   _CaseTileState({this.doc});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.pink.shade300,
//       height: 200,
//       width: 220,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Color(0xffeeeeee),
//             blurRadius: 3.0,
//           ),
//         ],
//       ),
//       child: Card(
//         elevation: 5,
//         child: Text(
//           widget.documentSnapshot['caseTitle'],
//           style: Theme.of(context)
//               .textTheme
//               .title
//               .copyWith(color: Theme.of(context).primaryColor),
//         ),
//       ),
//     );
//   }
// }
