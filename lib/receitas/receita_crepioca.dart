import 'package:flutter/material.dart';

class ReceitaCrepioca extends StatelessWidget {
  int tempo = 5;

  List<String> ingredientes = [
    '1 colher de tapioca',
    '1 ovo',
  ];

  List<String> preparo = [
    'Em um recipiente, bata bem o ovo.',
    'Adicione a goma de tapioca e bata novamente (pode bater com um garfo mesmo), até obter uma mistura homogênea.',
    'Coloque todo o conteúdo em uma frigideira antiaderente levemente quente e mantenha em fogo baixo.',
    'Deixe por alguns segundos e vire para dourar do outro lado.'
        'Não é necessário untar com óleo, azeite ou manteiga.',
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
                'Crepioca',
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
                      image: AssetImage("assets/imgs/crepioca.jpg"),
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
