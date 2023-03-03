import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List<String> months=['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'];
List<String> days=['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
List<String> tempArray=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget> [
           Expanded(child: ListView.builder(
             itemCount: months.length,
               itemBuilder: (context, index){
             return Card(
               child: ExpansionTile(
                 title: Text(months[index].toString()),
               children: [
                 Container(
                   height: 150,
                   child: ListView.builder(
                     itemCount: days.length,
                       itemBuilder: (context, index){
                     return InkWell(
                       onTap:(){
                         setState(() {
                           if(tempArray.contains(days[index].toString())){
                             tempArray.remove(days[index].toString());
                           }else{
                             tempArray.add(days[index].toString());
                           }
                         });
                       print('myvalue');
                       print(tempArray.toString());
                         },
                       child: ListTile(
                         title: Text(days[index].toString()),
                       trailing: Container(
                         height: 40,
                         width: 90,
                         margin: EdgeInsets.all(10),
                         decoration: BoxDecoration(
                           color: tempArray.contains(days[index].toString())? Colors.red: Colors.green, 
                           borderRadius: BorderRadius.circular(10)
                         ),
                         child: Center(
                           child: Text(tempArray.contains(days[index].toString())? 'Remove': 'Add'),
                         ),
                       ),
                       ),
                     );
                   }),
                 )
               ],
               ),
             );
           })
           )
         ],
       ),
     ),
    );
  }
}
