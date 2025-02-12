import 'package:flutter/material.dart'; 

void main(){
  runApp(MyApp()); 
} 


class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme:ThemeData(
        primarySwatch:Colors.teal,
      ),
      home:WhatsAppHome(),
    );
  }
} 

class WhatsAppHome extends StatefulWidget{
  @override 
  _WhatsupHomePageState createState() => _WhatsupHomePageState();
} 
class _WhatsupHomePageState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Chats"),
            Tab(text: "Status"),
            Tab(text: "Calls"),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.message),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

class ChatScreen extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:10, 
      itemBuilder: (context, index){
        return ListTile(leading: CircleAvatar(backgroundColor: Colors.teal, 
        child:Icon(Icons.person,color: Colors.white,),
        ), 
        title:Text("Contact ${index+1}"), 
        subtitle: Text("Last message here..."), 
        trailing:Text("12:00 PM"),
        );
      },
    );
  }
} 
class StatusScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Center(child:Text("Status Screen"));
  }
} 
class CallsScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Center(child:Text("Calls Screen"));
}
}