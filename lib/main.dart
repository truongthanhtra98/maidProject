import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}




class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Work{
  int time;
  int roomAmount;
  int acreage;
  Work(this.time,this.roomAmount,this.acreage);





}

class _MyAppState extends State<MyApp> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();
  List<bool> isSelected;
  List<bool> isSwitch;
  bool val =false;

  var _work =["4 Phòng - 5 Giờ - 30m2","6 Phòng - 12 Giờ - 50m2"];
  var _workSelected ="4 Phòng - 5 Giờ - 30m2";




  String message ="Bạn đã chọn dịch vụ";
  @override
  void initState() {
    isSelected =[
      true,
      false,
      true
    ];
    super.initState();
  }

   onSwichvalueChanged(bool newVal){
    setState(() {
      val = newVal;
    });
   }

  @override

  Future<Null> selectDate(BuildContext context ) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(1975),
      lastDate: new  DateTime(2100),

    );
    if(picked != null && picked != _date){
      print("Date selected : ${_date.toString()}");

      setState(() {
        _date = picked;


      });
    }
  }
  Future<Null> selectTime(BuildContext context ) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,



    );
    if(picked != null && picked != _time){
      print("Time selected : ${_time.toString()}");

      setState(() {
        _time = picked;


      });
    }
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Container(margin: EdgeInsets.only(top:20),
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0)),),

        child:Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Padding(

                padding: const EdgeInsets.fromLTRB(50,0,50,20),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(labelText:"NƠI LÀM VIỆC" ,labelStyle: TextStyle(color: Colors.black,fontSize: 15)),
                    ),

                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: null,
                      disabledColor: Colors.blue,
                      iconSize: 40,
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(50,0,50,20),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(labelText: "SỐ NHÀ/CĂN HỘ",labelStyle: TextStyle(color: Colors.black,fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,40),

                child: Row(
                  children: <Widget>[


                    Column(
                      children: <Widget>[
                        Text("Chọn Ngày"),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,20,0,20),
                          child: RaisedButton(
                            child: new Text("${_date}"),

                            onPressed: (){
                              selectDate(context);
                            },
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Text("Chọn Giờ"),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,20,0,20),
                          child: RaisedButton(

                            child: new Text("${_time}"),

                            onPressed: (){
                              selectTime(context);

                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )


              ),
              Column(
                children: <Widget>[
                  Text("Làm Trong",style: TextStyle(color: Colors.black,fontSize: 15),),
                  Padding(

                    padding: const EdgeInsets.fromLTRB(40,0,40,20),


                    child: DropdownButton<String>(iconSize: 50,


                      items: _work.map((String dropDownStringItems){
                        return DropdownMenuItem<String>(
                          value: dropDownStringItems,
                          child: Text(dropDownStringItems),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected){
                        setState(() {
                          this._workSelected = newValueSelected;
                        });

                      },
                      value: _workSelected,

                    ),

                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[


                  Text("Thêm Dịch Vụ",style: TextStyle(color: Colors.black,fontSize: 15),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50,10,50,20),
                    child: Row(
                      children: <Widget>[
                        ToggleButtons(
                          children: <Widget>[
                            Icon(Icons.clear,size: 100,),
                            Icon(Icons.local_cafe,size: 100,),
                            Icon(Icons.local_shipping,size: 100,)
                          ],
                          isSelected: isSelected,
                          onPressed: (index){
                            setState(() {
                              isSelected[index]= !isSelected[index];
                            });

                          }


                          ,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
               children: <Widget>[

                 Padding(
                   padding: const EdgeInsets.fromLTRB(50,10,10,10),
                   child: Row(

                     children: <Widget>[
                       Text("Lặp Lại Hằng Tuần",style: TextStyle(color: Colors.black,fontSize: 15),),
                       Switch(
                         value: val,
                         onChanged:(newVal){
                           onSwichvalueChanged(newVal);
                         },
                         activeColor: Colors.green,


                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(50,10,10,10),
                   child: Row(

                     children: <Widget>[
                       Text("Lặp Lại Hằng Tuần",style: TextStyle(color: Colors.black,fontSize: 15),),
                       Switch(
                         value: val,
                         onChanged:(newVal){
                           onSwichvalueChanged(newVal);
                         },
                         activeColor: Colors.green,


                       ),
                     ],
                   ),
                 ),

               ],
              ),




                ],
              ),
        )

      ,
        ) ,

      ),
    );
  }
}
