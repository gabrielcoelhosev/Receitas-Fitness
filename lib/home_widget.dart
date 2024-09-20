import 'package:flutter/material.dart';
import 'package:receitas_fitness/data_class.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List _photos = [
    Data(image: "assets/imgs/coxinha.jpg", text: "Coxinha Low Carb"),
    Data(image: "assets/imgs/lasanha.jpg", text: "Lasanha Fit"),
    Data(
        image: "assets/imgs/brigadeiro.jpg", text: "Brigadeiro de Batata Doce"),
    Data(image: "assets/imgs/churros.jpg", text: "Churros Fit"),
    Data(image: "assets/imgs/crepioca.jpg", text: "Crepioca Fit"),
    Data(image: "assets/imgs/bolo.jpg", text: "Bolo de Chocolate Fit"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Receitas Fitness',
          style: TextStyle(
              fontFamily: 'Lobster', color: Colors.lightGreen, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 40,
              child: GridView.builder(
                  itemCount: _photos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 170,
                            decoration: BoxDecoration(
                              border: Border.all(width: 3, color: Colors.white),
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: AssetImage(_photos[index].image),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            _photos[index].text,
                            style: TextStyle(fontFamily: 'PoppinsM'),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
