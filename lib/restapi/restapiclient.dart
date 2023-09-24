
  import 'dart:convert';
import 'package:allcrudproject4/style/style.dart';
import 'package:http/http.dart'as http;

  Future<bool> productCreateRequest(FormValue) async {
   var URL=Uri.parse("");
   var PostBody=json.encode(FormValue);
   var PostHeader={"":""};

 var response=await http.post(URL,headers: PostHeader,body: PostBody);
 var resultCode=response.statusCode;
 var resultBody=jsonDecode(response.body);
 if(resultCode==200 && resultBody['']==''){
  SuccessToast('Request Success');
  return true;
 }else{
   ErrorToast('Request fails');
   return false;

 }


}

 Future<List>  productGridView() async {
    var URL=Uri.parse("");
    var postHeader={"":""};
    var response=await  http.get(URL,headers: postHeader);
    var resultcode=response.statusCode;
    var resultBody=json.decode(response.body);

    if(resultcode==200 && resultBody['']==''){
      SuccessToast('Msg Sending');
      return resultBody[''];
    }else{
      ErrorToast('Msg Not Sending');
      return [];
    }

}

Future<bool> deleteRequest(id) async {
    var URL=Uri.parse(""+id);
   var PostHeader={"":""};
   var response=await http.get(URL,headers: PostHeader);

   var resultcode=response.statusCode;
   var resultBody=json.decode(response.body);
   if(resultcode==200 && resultBody['']==''){
     SuccessToast("deleted data");
     return true;
   }else{
     ErrorToast("not delet");
     return false;
   }
}

  Future<bool> productUpdateRequest(FormValue,id) async {
    var URL=Uri.parse("");
    var PostBody=json.encode(FormValue);
    var PostHeader={"":""};

    var response=await http.post(URL,headers: PostHeader,body: PostBody);
    var resultCode=response.statusCode;
    var resultBody=jsonDecode(response.body);
    if(resultCode==200 && resultBody['']==''){
      SuccessToast('Request Success');
      return true;
    }else{
      ErrorToast('Request fails');
      return false;

    }


  }

