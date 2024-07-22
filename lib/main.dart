import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = '';
  var bgColor = Colors.yellow ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Bmi App"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                    fontWeight: FontWeight.w700,fontSize: 34
                ),),

                SizedBox( height: 22,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter Weight in kgs', style: TextStyle(fontWeight: FontWeight.w600)),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox( height: 12,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter Height in Feet', style: TextStyle(fontWeight: FontWeight.w600)),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox( height: 12,),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter Height in Inches', style: TextStyle(fontWeight: FontWeight.w600),),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox( height: 12,),

                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inc = inController.text.toString();

                  if(wt!='' && ft!='' && inc!=''){
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iInc = int.parse(inc);

                    var tInch = (ift*12) + iInc;
                    var tCm = tInch * 2.54;
                    var tM = tCm/100;

                    var bmi = iwt/(tM*tM);

                    var msg = '';

                    if(bmi>25){
                      msg = 'You are OverWeight!!';
                      bgColor = Colors.deepOrange;

                    } else if(bmi<18){
                      msg = 'You are UnderWeight!!';
                      bgColor = Colors.red;

                    } else{
                      msg = 'Congrats! You are Healthy :) ';

                    }

                    setState(() {
                      result ='$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}';
                    });



                  }else{
                    setState(() {
                      result = 'Please Fill Out all the Required Information !!!';
                    });
                  }


                }, child: Text('Calculate',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),),
                SizedBox(height: 12,),

                Text(result, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)

              ]

            ),
          ),
        ),
      )
    );
  }
}
