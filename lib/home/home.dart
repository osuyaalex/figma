import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
   const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final List<String> _images = [

    'img1.jpeg',
    'img2.jpeg',
    'img3.jpeg',
    'img4.jpeg',
    'img5.jpeg'
  ];
  int _selectSize = 1;
  bool isExpanded = false;
  bool expand = false;
  bool expanded = false;
  bool _isVisible = true;
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        // User is scrolling down
        if (_isVisible) {
          setState(() => _isVisible = false);

        }
      }
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        // User is scrolling up
        if (!_isVisible) {
          setState(() => _isVisible = true);

        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(

        preferredSize: Size.fromHeight(30),
        child: AppBar(
          backgroundColor:Theme.of(context).brightness == Brightness.light?
          Colors.white:
          Color(0xff1E1E1E),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
              child: Row(
                children: [
                   const Icon(Icons.close),

                  const SizedBox(
                    width: 13,
                  ),
                  Text('Product Name',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 22
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          SizedBox(
            height: 400,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,

               itemCount: _images.length,
                 itemBuilder: (context, index){
                 return  Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     height: 400,
                     width: MediaQuery.of(context).size.width*0.9,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                           image: AssetImage('asset/images/${_images[index]}',),
                               fit: BoxFit.fill
                       ),
                         boxShadow: [
                           BoxShadow(
                               color: Theme.of(context).brightness == Brightness.light?
                               Colors.grey.shade400:
                               Colors.black,
                               blurRadius: 2,
                               spreadRadius: 2,
                               offset: const Offset(
                                   1.0,
                                   2.0
                               )
                           )
                         ],
                         borderRadius: BorderRadius.circular(20),
                         color: Theme.of(context).brightness == Brightness.light?
                         Color(0xffe7edf9):
                         Color(0xff191C1E)
                     ),
                   ),
                 );
                 }
             ),
           ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0,),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AHA BHA PHA 30 DAYS\nMiracle Starter Kit',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Theme.of(context).brightness == Brightness.light
                          ?Color(0xff6C7C95):
                          Color(0xffA4C9FF)
                    ),
                  ),
                   SizedBox(
                    width: MediaQuery.of(context).size.width*0.13,
                  ),
                  Theme.of(context).brightness == Brightness.light?
                  Container(
                     height: 124,
                      width: 124,
                    decoration: BoxDecoration(
                      color: Color(0xffe7edf9),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2,
                            spreadRadius: 1.1,
                            offset: const Offset(
                                1.0,
                                1.0
                            )
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: SvgPicture.asset('asset/icons/Group 26086170.svg'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 17.0, left: 9),
                              child: SvgPicture.asset('asset/icons/sell.svg'),
                            ),
                          ],
                        ),
                      ],
                    )
                  ):Container(
                      height: 124,
                      width: 124,
                      decoration: BoxDecoration(
                        color: Color(0xff191C1E),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2,
                              spreadRadius: 1.1,
                              offset: Offset(
                                  1.0,
                                  1.0
                              )
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset('asset/icons/Group 26086170 (1).svg'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 17.0, left: 9),
                                child: SvgPicture.asset('asset/icons/sell (1).svg'),
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(12),
              child: Theme.of(context).brightness ==Brightness.light?Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('asset/icons/logo.svg'),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Brand Name',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey.shade500
                    ),
                  )
                ],
              ):Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset('asset/icons/Group 26086181.svg'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Theme.of(context).brightness == Brightness.light?Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('asset/icons/Group 26086185.svg'),
                  SvgPicture.asset('asset/icons/SKU.svg')
                ],
              ):Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('asset/icons/Group 26086185 (1).svg'),
                SvgPicture.asset('asset/icons/SKU2.svg')
              ],
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.0),
              child: Divider(
                height: 1,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Theme.of(context).brightness == Brightness.light?Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Colours:',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Color(0xff6C7C95),
                    ),
                  ),
                ],
              ):Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Colours:',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Color(0xffA4C9FF),
                    ),
                  ),
                ],
              )
            ),
            const SizedBox(
              height: 15,
            ),
            Theme.of(context).brightness == Brightness.light?
            SvgPicture.asset('asset/icons/ColoursCard.svg'):
                SvgPicture.asset('asset/icons/Group 26086172.svg'),
            const SizedBox(
              height: 40,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Theme.of(context).brightness == Brightness.light?Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Size:',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Color(0xff6C7C95),
                      ),
                    ),
                  ],
                ):Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Size:',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Color(0xffA4C9FF),
                      ),
                    ),
                  ],
                )
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSizeContainer('Small', 1),
                const SizedBox(
                  width: 18,
                ),
                _buildSizeContainer('Medium', 2),
                const SizedBox(
                  width: 18,
                ),
                _buildSizeContainer('Large', 3)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Divider(
                height: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Theme.of(context).brightness == Brightness.light?
                  SvgPicture.asset('asset/icons/bus.svg'):
                  SvgPicture.asset('asset/icons/bus1.svg'),
                ],
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Theme.of(context).brightness == Brightness.light?
                  SvgPicture.asset('asset/icons/cash.svg'):
                  SvgPicture.asset('asset/icons/cash1.svg'),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Theme.of(context).brightness == Brightness.light?Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping estimate',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff001c3a),
                    ),
                  ),
                  Text('Register/Login',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xffBA1A1A)
                    ),
                  )
                ],
              ),
            ):Padding(
              padding: const EdgeInsets.all(55.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping estimate',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xffD4E3FF),
                    ),
                  ),
                  Text('Register/Login',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xffBA1A1A)
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.0),
              child: Divider(
                height: 1,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            ExpansionTile(
              collapsedTextColor: Theme.of(context).brightness == Brightness.light?
              Colors.black:
              Colors.white,
              trailing:  Padding(
                padding: const EdgeInsets.only(right: 200.0),
                child: RotationTransition(
                  turns: isExpanded ? AlwaysStoppedAnimation(0.5) : AlwaysStoppedAnimation(0),
                  child: Icon(Icons.expand_more),
                ),
              ),
                title: Text('Description',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              onExpansionChanged: (bool value) {
                setState(() {
                  isExpanded = value;
                });
              },
              iconColor: Theme.of(context).brightness == Brightness.light?
              Colors.black:
              Colors.white,
              textColor: Theme.of(context).brightness == Brightness.light?
              Colors.black:
              Colors.white,
              shape: Border.all(color: Colors.transparent),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('If you have sensitive skin that causes you problems, even if you\'re a little tired,follow Miracle Kit\'s 4-STEP solution ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                  ),
                  ),
                ),
              ],

            ),
            const SizedBox(
              height: 30,
            ),
            ExpansionTile(
              collapsedTextColor: Theme.of(context).brightness == Brightness.light?
              Colors.black:
              Colors.white,
             trailing:  Padding(
               padding: const EdgeInsets.only(right: 200.0),
               child: RotationTransition(
                 turns: expand ? AlwaysStoppedAnimation(0.5) : AlwaysStoppedAnimation(0),
                 child: Icon(Icons.expand_more),
               ),
             ),

              title: Text('Ingredients',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              onExpansionChanged: (bool value) {
                setState(() {
                  expand = value;
                });
              },
              iconColor: Theme.of(context).brightness == Brightness.light?
              Colors.black:
              Colors.white,
              textColor: Theme.of(context).brightness == Brightness.light?
              Colors.black:
              Colors.white,
              shape: Border.all(color: Colors.transparent),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('If you have sensitive skin that causes you problems, even if you\'re a little tired,follow Miracle Kit\'s 4-STEP solution ',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    ),
                  ),
                ),
              ],

            ),
            const SizedBox(
              height: 30,
            ),
            ExpansionTile(
              collapsedTextColor: Theme.of(context).brightness == Brightness.light?
              Colors.black:
              Colors.white,
              trailing:  Padding(
                padding: const EdgeInsets.only(right: 200.0),
                child: RotationTransition(
                  turns: expanded ? AlwaysStoppedAnimation(0.5) : AlwaysStoppedAnimation(0),
                  child: Icon(Icons.expand_more),
                ),
              ),

              title: Text('Ingredients',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              onExpansionChanged: (bool value) {
                setState(() {
                  expanded = value;
                });
              },
              iconColor: Theme.of(context).brightness == Brightness.light?
              Colors.black:
              Colors.white,
              textColor: Theme.of(context).brightness == Brightness.light?
              Colors.black:
              Colors.white,
              shape: Border.all(color: Colors.transparent),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('If you have sensitive skin that causes you problems, even if you\'re a little tired,follow Miracle Kit\'s 4-STEP solution ',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    ),
                  ),
                ),
              ],

            ),
            const SizedBox(
              height: 64,
            ),
            Container(
              height: 129,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xffD9D9D9),
                image: DecorationImage(image: AssetImage('asset/images/img6.jpeg'),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              height: 312,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color(0xff29323B),
                  image: DecorationImage(image: AssetImage('asset/images/img7.jpeg'),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Container(
              height: 256,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color(0xff195FA7),
                  image: DecorationImage(image: AssetImage('asset/images/img9.jpeg'),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Container(
              height: 256,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color(0xff195FA7),
                  image: DecorationImage(image: AssetImage('asset/images/img8.jpeg'),
                      fit: BoxFit.cover
                  )
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            Theme.of(context).brightness == Brightness.light?
            Image.asset('asset/icons/Group 26086195.jpeg'):
            Image.asset('asset/icons/Group 26086195.jpeg'),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.0),
              child: Divider(
                height: 1,
              ),
            ),
            const SizedBox(
              height: 190,
            ),
            Theme.of(context).brightness ==Brightness.light?SvgPicture.asset('asset/icons/Bottom app bar - ProductPage.svg'):
            SvgPicture.asset('asset/icons/Bottom app bar.svg'),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: Theme.of(context).brightness == Brightness.light?Container(
          height: 56,
          width: 128,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffD4E3FF),
            boxShadow:  [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 3.5,
                  spreadRadius: 1,
                  offset: const Offset(
                      1.0,
                      1.0
                  )
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('asset/icons/shopping_cart_checkout.svg'),
              const SizedBox(
                width: 10,
              ),
              Text('Buy Now',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 16
                ),
              )
            ],
          ),
        ):Container(
          height: 56,
          width: 128,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xff004784),
            boxShadow:  const [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 3.5,
                  spreadRadius: 1,
                  offset: Offset(
                      1.0,
                      1.0
                  )
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('asset/icons/shopping_cart_checkout (1).svg'),
              const SizedBox(
                width: 10,
              ),
              Text('Buy Now',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                ),
              )
            ],
          ),
        )
      ),

    );
    //
  }

   Widget _buildSizeContainer(String label, int size) {
     return GestureDetector(
       onTap: () {
         setState(() {
           _selectSize = size;
         });
       },
       child: Theme.of(context).brightness == Brightness.light?Container(
         decoration: BoxDecoration(
           color: _selectSize == size ? Colors.blue : Colors.transparent,
           borderRadius: BorderRadius.circular(10),
           border: const Border(
             left: BorderSide(
               color: Colors.black
             ),
             right: BorderSide(
                 color: Colors.black
             ),
             top: BorderSide(
                 color: Colors.black
             ),
             bottom: BorderSide(
                 color: Colors.black
             ),
           )
         ),
         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
         child: _selectSize == size?Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             SvgPicture.asset('asset/icons/icon.svg'),

             Text(
               label,
               style: const TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ],
         ):Text(
           label,
           style: const TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.bold,
           ),
         ),
       ):Container(
         decoration: BoxDecoration(
             color: _selectSize == size ? Colors.blue : Colors.transparent,
             borderRadius: BorderRadius.circular(10),
             border: const Border(
               left: BorderSide(
                   color: Colors.white
               ),
               right: BorderSide(
                   color: Colors.white
               ),
               top: BorderSide(
                   color: Colors.white
               ),
               bottom: BorderSide(
                   color: Colors.white
               ),
             )
         ),
         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
         child: _selectSize == size?Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             SvgPicture.asset('asset/icons/icon (1).svg'),
             Text(
               label,
               style: const TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ],
         ):Text(
           label,
           style: const TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.bold,
           ),
         ),
       )
     );
   }
}
