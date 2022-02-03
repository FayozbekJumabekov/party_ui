import 'package:flutter/material.dart';
import 'models/fade_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  bool buttonChange = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
          /// # Image
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/im_party.jpeg"))),
          child: FadeTransition(
            opacity: _animation,
            /// #Animation Gradient
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1,left: 30,right: 30),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.5),
                  ]
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// # Texts
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       FadeAnimation(
                         6,
                         Text(
                           "Find the best \nparties near you",
                           style: TextStyle(
                               color: Colors.amberAccent,
                               fontSize: 40,
                               fontWeight: FontWeight.bold),
                         ),
                       ),
                       SizedBox(
                         height: 20,
                       ),
                       FadeAnimation(
                         7,
                         Text(
                           "Let us find you party for your \ninterest",
                           style: TextStyle(
                             color: Colors.greenAccent.withOpacity(0.9),
                             fontSize: 22,
                           ),
                         ),
                       ),

                     ],
                   ),
                    /// # Button
                    FadeAnimation(
                      8,
                        (buttonChange)? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                buttonChange = !buttonChange;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(250,50),
                                primary: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Text("Start")),
                        ) : Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                    setState(() {
                                      buttonChange =  !buttonChange;
                                    });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(100,50),
                                        primary: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20))),
                                    child: Text("Google+")),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        buttonChange =  !buttonChange;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(100,50),
                                        primary: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20))),
                                    child: Text("FaceBook")),
                              ),
                            ],
                          ),
                        ),
                    ),

                  ],
                ),
              ),
            ),
          )),
    );
  }
}
