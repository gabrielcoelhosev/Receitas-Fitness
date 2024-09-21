import 'package:flutter/material.dart';

class ReceitaChurros extends StatelessWidget {
  int tempo = 45;

  List<String> ingredientes = [
    '1 xícara farinha arroz',
    '1 xícara de água',
    '1 colher óleo vegetal',
    '1 colher de sal',
    '1 xícara de leite em pó',
    '1 colher de cacau em pó',
  ];

  List<String> preparo = [
    'Pré-aqueça o forno em 180º C. Forre uma assadeira com papel manteiga. Reserve.',
    'Junte a água, o sal, o adoçante e o óleo em uma panela. Leve ao fogo.',
    'Quando ferver, desligue a panela, adicione a farinha de arroz integral e mexa bem, até a massa desgrudar do fundo da panela.',
    'Ponha a massa em uma bisnaga ou saco de confeitar. Dê o formato de churros depositando as porções de massa em uma assadeira forrada com papel manteiga.'
        'Leve ao forno para assar por 20 minutos.',
    'Depois de pronto, espere esfriar e sirva com os molhos.',
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
                'Churros Fit',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'PoppinsM',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("assets/imgs/churros.jpg"),
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
                  style: TextStyle(
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
                crossAxisCount:
                    3, // Número de itens por linha (2 ingredientes por linha)
                crossAxisSpacing: 5, // Espaçamento horizontal entre os itens
                mainAxisSpacing: 5, // Espaçamento vertical entre os itens
                childAspectRatio:
                    2, // Controla a proporção de largura/altura dos itens
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
