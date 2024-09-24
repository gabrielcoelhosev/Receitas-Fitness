import 'package:flutter/material.dart';

class ReceitaLasanha extends StatelessWidget {
  int tempo = 15;

  List<String> ingredientes = [
    '2 berinjelas médias',
    '6 a 8 folhas de lasanha',
    '1 pote de queijo cottag',
    '250 g peito de peru light',
    '1 lata creme de leite light',
    '1/2 molho de tomate',
    '150g de creme ricota',
    '150 mussarela light picada'
  ];

  List<String> preparo = [
    'Misture o creme de leite com o molho de tomate e reserve.',
    'Coloque um pouco de molho no fundo e metade das folhas da massa da lasanha.',
    'Alterne com a berinjela, o cottage e o peito de peru.',
    'Coloque mais molho e faça outra camada de berinjela, o cottage e o peito de peru.'
        'Faça as camadas até terminar.',
    'Na última, antes de colocar o molho, coloque as outras folhas da massa da lasanha e o restante do molho por cima.',
    'Salpique a mussarela e leve ao forno para gratinar.',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text(
                'Lasanha Fit',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'PoppinsM',
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage("assets/imgs/lasanha.jpg"),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.timer),
                Text(
                  " $tempo minutos",
                  style: const TextStyle(
                      fontFamily: 'PoppinsM', fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ingredientes:",
                  style: TextStyle(fontSize: 18, fontFamily: 'Lobster'),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemCount: ingredientes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, 
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ingredientes[index],
                        style: const TextStyle(
                            fontSize: 13, fontFamily: 'PoppinsM'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
            const Text(
              'Modo de Preparo:',
              style: TextStyle(fontFamily: 'Lobster', fontSize: 20),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: preparo.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '${index + 1}. ${preparo[index]}',
                      style:
                          const TextStyle(fontSize: 16, fontFamily: 'PoppinsM'),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
