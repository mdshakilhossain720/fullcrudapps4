import 'package:allcrudproject4/style/style.dart';
import 'package:flutter/material.dart';

import '../restapi/restapiclient.dart';
import 'productupdatescreen.dart';
class ProductGrideVIewScreen extends StatefulWidget {
  const ProductGrideVIewScreen({super.key});

  @override
  State<ProductGrideVIewScreen> createState() => _ProductGrideVIewScreenState();
}

class _ProductGrideVIewScreenState extends State<ProductGrideVIewScreen> {

  List Productlist=[];
  bool isloading=true;

  @override
  void initState(){
    callData();
    super.initState();


  }


  callData() async {
    isloading=true;
  var data=await productGridView();
  setState(() {
    Productlist=data;
    isloading=false;

  });

  }
  DeletedItem(id){

    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title:  Text("Are you deletd"),
        content: Text("Are you sure data deleted"),


        actions: [
          OutlinedButton(onPressed: () async {
            Navigator.pop(context);
            setState(() {
              isloading=true;
            });
           await deleteRequest(id);
           await callData();

          }, child: Text("Yes")),
          OutlinedButton(onPressed: (){
            Navigator.pop(context);

          }, child: Text("No")),

        ],

      );
    });
  }

  GoToUpdate(context,Productitem){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductUpdateScreen(
        Productitem

    )));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        //Navigator.push(context, MaterialPageRoute(builder: (builder)=>ProductUpdateScreen(),),);
      },child: Icon(Icons.add),),
      appBar: AppBar(title: Text('Product List'),),
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            child: isloading?(Center(child: CircularProgressIndicator(),)):RefreshIndicator(
                onRefresh: () async {
                  await callData();
                },
                child: (
                    GridView.builder(

                        itemCount:Productlist.length ,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:2,
                            mainAxisExtent: 250,

                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemBuilder: (context ,index){

                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(child: Image.network(Productlist[index]['Img'],fit: BoxFit.cover,)),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(Productlist[index]['ProductName']),
                                      SizedBox(height: 5,),
                                      Text('Price :'+Productlist[index]['Uniteprices']+'BD'),

                                      Row(
                                        children: [
                                          OutlinedButton(onPressed: (){
                                            GoToUpdate(context,Productlist[index]);

                                          }, child: Icon(Icons.more)),
                                          SizedBox(width: 5,),
                                          OutlinedButton(onPressed: (){
                                            DeletedItem(Productlist[index]['id']);

                                          }, child: Icon(Icons.delete)),
                                        ],
                                      )

                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        })),


          ),
          ),
        ],
      ),

    );
  }
}
