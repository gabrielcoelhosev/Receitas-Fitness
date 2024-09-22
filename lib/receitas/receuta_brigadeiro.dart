import 'package:flutter/material.dart';

class ReceitaBrigadeiro extends StatelessWidget {
  int tempo = 60;

  List<String> ingredientes = [
    '500 g de batata-doce',
    '2 colheres de óleo coco',
    '4 coleheres de caucau',
    '2 colheres aç mascavo',
    '50 ml leite desnatado',
    '1 colher café solúvel',
  ];

  List<String> preparo = [
    'Cozinhe as batatas na pressão por aproximadamente 20 minutos.',
    'Amasse-as bem.',
    'Coloque o purê em uma panela com o cacau, açúcar, café e óleo.',
    'Cozinhe e mexa a massa, enquanto acrescenta o leite até ficar homogêneo.'
        'Deixar esfriar.',
    'Enrolar e passe no chocolate meio amargo granulado.',
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
                'Brigadeiro de Batata Doce',
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
                      image: AssetImage("assets/imgs/brigadeiro.jpg"),
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
              padding: const EdgeInsets.all(5),
              itemCount: ingredientes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    3, 
                crossAxisSpacing: 5, 
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
