import 'package:flutter/material.dart';

class ReceitaCoxinha extends StatelessWidget {
  int tempo = 45;

  List<String> ingredientes = [
    '1 fio de azeite',
    '1 cebola picada',
    '5 dentes de alho picados',
    '500g de peito de frango desfiado',
    'sal a gosto',
    'pimenta do reino a gosto',
    '150g de creme de ricota',
    '100g de queijo meia cura ralado',
    '1 xícara de farinha de linhaça'
  ];

  List<String> preparo = [
    'Em uma frigideira, aqueça 1 fio de óleo e refogue a cebola e o alho picado.',
    'Adicione o tomate e deixe refogar um pouco.',
    'Acrescente o frango desfiado, o sal, a pimenta-do-reino e o cheiro-verde.',
    'Transfira essa mistura para um processador e acrescente a couve-flor picada.'
        'Bata tudo muito bem até formar a massa da coxinha.',
    'Em outra tigela misture o creme de ricota com o queijo meia cura ralado.',
    'Pegue um pedaço da massa e abra na mão.',
    'Recheie com a mistura de creme de ricota com queijo e feche, formando uma coxinha.',
    'Passe as coxinhas na farinha de linhaça.',
    'Coloque as coxinhas em uma forma e leve ao forno preaquecido (180° C) por cerca de 35 minutos.'
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
                'Coxinha Low Carb',
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
                      image: AssetImage("assets/imgs/coxinha.jpg"),
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
