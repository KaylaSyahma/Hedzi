import 'package:e_commers/consts.dart';
import 'package:e_commers/ui/auth/login_screen.dart';
import 'package:e_commers/ui/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // ini buat nge active in warnanya
  int currentPage = 0; //dimulai dari index 0
  PageController _pageController = PageController();

// ini buat naro data product
  // List<String> product = List.generate(
  //   10, (index) => "Products ${index + 1}"
  // )

  // dasar pengambilan data dari API
  List<Map<String, String>> splashData = [
    {
      "text": "Hey there! Welcome to Hedzi \nTune in, zone out.",
      "image": "assets/images/splash_sound.png"
    },
    {
      "text": "Bringing you crisp vibes, anytime, anywhere.",
      "image": "assets/images/splash_sound.png"
    },
    {
      "text":
          "Feel the beat, live the sound. Hedzi – Your go-to audio game-changer",
      "image": "assets/images/splash_sound.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      // biar project ga ketutupan sm system hp
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
                width: double.infinity,
                child: PageView.builder(
                  // misalkan pengen ketika button nya dipencet pindah halaman, harus pake controller
                  controller: _pageController = PageController(),
                  // ini buat ketika page nya berubah dia ngapain
                  onPageChanged: (value) {
                    //initial state method for stateFulWidget behaviour. ini untuk ngatur state / perubahan yang akan terjadi
                    setState(() {
                      //ngambil data dari page pertama, index nya 0
                      currentPage = value;
                    });
                  },
                  //item count buat ngasih tau jumlah index yg ada, krn klo gapake ntar jadi unlimited
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                      text: splashData[index]["text"]!,
                      image: splashData[index]["image"]!),
                )),
          ),
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(splashData.length,
                      (index) => _dotsIndicator(index: index)))),
          Padding(
            // ini buat ngasih jarak luar button
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              // double infinity mainnya titik koordinat, akan membawa ke koordinat 0.0
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    if (currentPage == splashData.length - 1) {
                      // kode yang digunakan untuk berpindah antar halaman
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    } else {
                      _pageController.animateToPage(currentPage + 1,
                          duration: animationDuration, curve: Curves.ease);
                    }
                  },
                  child: Text(
                      currentPage == splashData.length - 1 ? "Start" : "Next",
                      style: const TextStyle(
                        color: Colors.white,
                      ))),
            ),
          )
        ],
      ),
    ));
  }

// EXTRACT METHOD
// klo mau bikin parameter req pake curlybraces
// kode untuk logika dots indicator
  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      height: 10,
      // ngaruh ke atas bawah kanan kiri
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: currentPage == index ? secondaryThemeColor : secondaryColor),
      // ini page if else ceritanya
      width: currentPage == index ? 20 : 10,
      duration: animationDuration,
    );
  }
}
