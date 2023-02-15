import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xff090E21),
        ),
        body: const BMIApp(),
        backgroundColor: const Color(0xff090E21),
      ),
    ),
  );
}

class BMIApp extends StatefulWidget {
  const BMIApp({Key? key}) : super(key: key);

  @override
  State<BMIApp> createState() => _BMIAppState();
}

class _BMIAppState extends State<BMIApp> {
  // String male = '';
  //String female = '';
  double ans1 = 0;
  double ans2 = 0;
  //int m = 0;
  String  ans3 = 'BMI Categories';
  double meter = 0;
  int weight = 0;
  int  age = 2;
  String xender = '';
  double ans  = 0;
  // Color ans = Color(0xff090E21);

  final Duration time = Duration(seconds: 1);


  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: DelayedDisplay(
                    delay : Duration(seconds: time.inSeconds + 1),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: InkWell(
                        onTap: (){
                          setState((){
                            xender =  'female';
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: h,
                          width: w,
                          decoration: BoxDecoration(
                            color: const Color(0xff1D1E33),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: (xender == 'female') ? Colors.white : const Color(0xff1d1e33),
                              width: 2,
                            ),
                          ),
                          child: const Image(
                            image: AssetImage("images/female.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: DelayedDisplay(
                    delay : Duration(seconds: time.inSeconds + 2),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            xender = 'male';
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: h,
                          width: w,
                          decoration: BoxDecoration(
                            color: const Color(0xff1D1E33),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: (xender == 'male') ? Colors.white : const Color(0xff1d1e33),
                              width: 2,
                            ),
                          ),

                          child: const Image(
                            image: AssetImage("images/male.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: DelayedDisplay(
              delay : Duration(seconds: time.inSeconds + 3),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    color: const Color(0xff1D1E33),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("HEIGHT",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment : CrossAxisAlignment.end,
                        children: [
                          Text("${ans.toInt()}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 50,
                            ),
                          ),
                          Text("cm",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: const SliderThemeData(
                            trackHeight: 1,
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Slider(
                            min: 0,
                            max: 200,
                            onChanged: (double e){
                              setState(() {
                                ans  = e;
                              });
                            },
                            activeColor: const Color(0xff685C67),
                            inactiveColor: const Color(0xff43434A),
                            value: ans,
                            thumbColor: const Color(0xffEB1555),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: DelayedDisplay(
                      delay : Duration(seconds: time.inSeconds + 4),
                      child: Container(
                        height: h,
                        width: w,
                        decoration: BoxDecoration(
                          color: const Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //SizedBox(height: 20,),
                            const Text("Weight",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                )
                            ),
                            //SizedBox(height: 10,),
                            Text("$weight",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                            // SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      if(weight>0) {
                                        weight--;
                                      }
                                      else
                                      {
                                        weight= 0;
                                      }
                                    });
                                  },
                                  child: Container(
                                    //margin: EdgeInsets.only(bottom: 20),
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4C4F5E),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.remove,
                                      size: 30,
                                      color: Color(0xff878993),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4C4F5E),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.add,
                                      size: 30,
                                      color: Color(0xffEB1555),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: DelayedDisplay(
                      delay : Duration(seconds: time.inSeconds + 5),
                      child: Container(
                        height: h,
                        width: w,
                        decoration: BoxDecoration(
                          color: const Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //SizedBox(height: 20,),
                            const Text("Age",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                )
                            ),
                            //SizedBox(height: 10,),
                            Text("$age",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                            // SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap : (){
                                    setState(() {
                                      if(age>2) {
                                        age--;
                                      }
                                      else
                                      {
                                        age = 2;
                                      }
                                    });
                                  },
                                  child: Container(
                                    //margin: EdgeInsets.only(bottom: 20),
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4C4F5E),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.remove,
                                      size: 30,
                                      color: Color(0xff878993),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4C4F5E),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.add,
                                      size: 30,
                                      color: Color(0xffEB1555),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: [
                  DelayedDisplay(
                    delay : Duration(seconds: time.inSeconds + 6),
                    child: Padding(
                      padding: const EdgeInsets.only(top:5,bottom: 5),
                      child: Container(
                        height: h/11,
                        width: w,
                        decoration: BoxDecoration(
                          color: const Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${ans2.toStringAsFixed(2)}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 40,
                              ),
                            ),
                            Text("$ans3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  DelayedDisplay(
                    delay : Duration(seconds: time.inSeconds + 7),
                    child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: InkWell(
                        onTap: (){
                          setState((){
                            //m = ans.toInt();
                            if(xender == 'male' || xender == 'female') {
                              if(age>=2)
                              {
                                meter = ans / 100;
                                ans1 = meter * meter;
                                ans2 = weight / ans1;
                                if(ans2<=18)
                                {
                                  ans3 = 'Underweight';
                                }
                                else if(ans2>=18 && ans2<=25)
                                {
                                  ans3 = 'Normal weight';
                                }
                                else if(ans2>=25 && ans2<=29)
                                {
                                  ans3 = 'Overweight';
                                }
                                else
                                {
                                  ans3 = 'Obesity';
                                }
                              }
                            }
                          });
                        },
                        child: Container(
                          height: h/11,
                          width: w,
                          decoration: BoxDecoration(
                            color: Color(0xffEB1555),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text("Calculate",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
}
