import 'package:flutter/material.dart';

import '../restapi/restapiclient.dart';
import '../style/style.dart';
import 'productgridviewscreen.dart';
class ProductUpdateScreen extends StatefulWidget {
  final Map Productitem;
   ProductUpdateScreen(this.Productitem);

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {

  bool loading =false;

  Map<String ,String> FormValue={};


  @override
  initState(){

    setState(() {
      FormValue.update('', (value) =>widget.Productitem['']);
      FormValue.update('', (value) => widget.Productitem['']);
      FormValue.update('', (value) => widget.Productitem['']);
      FormValue.update('', (value) => widget.Productitem['']);
      FormValue.update('', (value) => widget.Productitem['']);
      FormValue.update('', (value) => widget.Productitem['']);

    });


    super.initState();


  }

  InputOnchange(MapKey,TextValue){
    setState(() {
      FormValue.update(MapKey, (value) => TextValue);
    });
  }
  formOnSubmit() async {
    if(FormValue['Img']!.length==0){
      ErrorToast('Imag is Requied');

    }else if(FormValue['']!.length==0){
      ErrorToast('Imag is Requied');

    }else if(FormValue['']!.length==0){
      ErrorToast('Imag is Requied');

    }else if(FormValue['']!.length==0){
      ErrorToast('Imag is Requied');

    }else if(FormValue['']!.length==0){
      ErrorToast('Imag is Requied');

    }else{
      setState(() {
        loading=true;
      });
    // Update ....
      await productUpdateRequest(FormValue,widget.Productitem['_id']);

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context)=>ProductGrideVIewScreen()),
              (Route route) => false);


      setState(() {
        loading=false;
      });

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Create Screen '),

      ),
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            child: loading?(Center(child: CircularProgressIndicator(),)):SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: FormValue[''],
                    decoration: AppInputDecoration('Product Name'),

                    onChanged: (TextValue){
                      InputOnchange('product', TextValue);

                    },),
                  SizedBox(height: 20,),
                  TextFormField(
                    initialValue: FormValue[''],
                    decoration: AppInputDecoration('Product Code'),
                    onChanged: (TextValue){
                      InputOnchange('product', TextValue);
                    },),
                  SizedBox(height: 20,),
                  TextFormField(
                    initialValue: FormValue[''],
                    decoration: AppInputDecoration('Image'),
                    onChanged: (TextValue){
                      InputOnchange('product', TextValue);
                    },),
                  SizedBox(height: 20,),
                  TextFormField(
                    initialValue: FormValue[''],
                    decoration: AppInputDecoration('Unite Price'),
                    onChanged: (TextValue){
                      InputOnchange('product', TextValue);
                    },),
                  SizedBox(height: 20,),
                  TextFormField(
                    initialValue: FormValue[''],
                    decoration: AppInputDecoration('Total Prices'),
                    onChanged: (TextValue){
                      InputOnchange('product', TextValue);
                    },),
                  SizedBox(height: 20,),
                  DropDownButton(

                    DropdownButton(


                        items: [
                      DropdownMenuItem(child:Text("Select quty"),value: '1 Pcs',),
                      DropdownMenuItem(child:Text("Select quty"),value: '1 Pcs',),
                      DropdownMenuItem(child:Text("Select quty"),value: '1 Pcs',),
                      DropdownMenuItem(child:Text("Select quty"),value: '1 Pcs',),

                    ],
                        isExpanded: true,

                        onChanged: (TextValue){
                          InputOnchange('product', TextValue);
                        }),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    formOnSubmit();
                  }, style: appButtonstyle(),child: successButton('Submit')),




                ],
              ),
            ),),

        ],
      ),

    );
  }
}
