
import 'package:ElMenus_ITI/views/signup.dart';
import 'package:flutter/material.dart';

 class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff000000),
          image: DecorationImage(image: AssetImage("assets/images/cover.jpg"),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text("Discover & Order the food you love.", style: TextStyle(color: Colors.white, fontSize: 34),),
                  ),                  
                ],
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40,),
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )]
                          ),
                          child: Column(
                            children: <Widget>[
                               Container(
                                padding: EdgeInsets.only(left:10,right: 10,bottom:10,top:30),
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.mail),
                                    hintText: " Enter Email",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                       borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0),
                                        ),
                                    ) //InputBorder.none
                                  ),
                      
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left:10,right: 10,top:0,bottom: 30),
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                       borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0),
                                        ),
                                    )
                                  ),
                                   autofocus: false,
                                   obscureText: true,
                                ),
                              ),
                        Container(
                          height: 45,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xffE5533A)
                          ),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                            ],
                          ),
                        ),
                       /* SizedBox(height: 40,),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xffE5533A)
                          ),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),*/
                      SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.only(left:43.0),
                         child: Row(
                           children: [
                             Text("Don't Have An Account ? ", style: TextStyle(color: Colors.grey),),
                             InkWell(
                               onTap: (){
                                 Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context)=>SignUp()),
                                  );
                               },
                               
                               child: Text(" Sign Up", style: TextStyle(color:Color(0xffE5533A)), )),
                         ],
                         ),
                       ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}