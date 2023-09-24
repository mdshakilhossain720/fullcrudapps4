
import 'package:flutter/material.dart';

import '../restapi/restapiclient.dart';
import '../style/style.dart';
class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}


class _ProductCreateScreenState extends State<ProductCreateScreen> {

  bool loading =false;

  Map<String ,String> FormValue={};

  InputOnchange(MapKey,TextValue){
    setState(() {
      FormValue.update(MapKey, (value) => TextValue);
    });
  }
  formOnSubmit(){
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
      productCreateRequest(FormValue);
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
                    decoration: AppInputDecoration('Product Name'),

                    onChanged: (TextValue){
                      InputOnchange('product', TextValue);

                    },),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: AppInputDecoration('Product Code'),
                    onChanged: (TextValue){
                      InputOnchange('product', TextValue);
                    },),
                  SizedBox(height: 20,),
                  TextFormField(

                    decoration: AppInputDecoration('Image'),
                    onChanged: (TextValue){
                      InputOnchange('product', TextValue);
                    },),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: AppInputDecoration('Unite Price'),
                    onChanged: (TextValue){
                      InputOnchange('product', TextValue);
                    },),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: AppInputDecoration('Total Prices'),
                    onChanged: (TextValue){
                      InputOnchange('product', TextValue);
                    },),
                  SizedBox(height: 20,),
                  DropDownButton(
                    DropdownButton(items: [
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

