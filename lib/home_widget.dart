import 'package:flutter/material.dart';
import 'package:receitas_fitness/data_class.dart';
import 'package:receitas_fitness/receitas/receita_bolo.dart';
import 'package:receitas_fitness/receitas/receita_churros.dart';
import 'package:receitas_fitness/receitas/receita_coxinha.dart';
import 'package:receitas_fitness/receitas/receita_crepioca.dart';
import 'package:receitas_fitness/receitas/receita_lasanha.dart';
import 'package:receitas_fitness/receitas/receuta_brigadeiro.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final List<Data> _originalPhotos = [
    Data(
        image: "assets/imgs/coxinha.jpg",
        text: "Coxinha Low Carb",
        tempo: 45,
        tipo: "salgado"),
    Data(
        image: "assets/imgs/lasanha.jpg",
        text: "Lasanha Fit",
        tempo: 15,
        tipo: "salgado"),
    Data(
        image: "assets/imgs/brigadeiro.jpg",
        text: "Brigadeiro Fit",
        tempo: 60,
        tipo: "doce"),
    Data(
        image: "assets/imgs/churros.jpg",
        text: "Churros Fit",
        tempo: 45,
        tipo: "doce"),
    Data(
        image: "assets/imgs/crepioca.jpg",
        text: "Crepioca Fit",
        tempo: 5,
        tipo: "salgado"),
    Data(
        image: "assets/imgs/bolo.jpg",
        text: "Bolo de Chocolate Fit",
        tempo: 50,
        tipo: "doce"),
  ];

  List<Data> _photos = [];
  String _filtroAtual = 'Todas as Receitas';

  @override
  void initState() {
    super.initState();
    _photos = List.from(_originalPhotos);
  }

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
              fontFamily: 'Lobster', color: Colors.green, fontSize: 30),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list, color: Colors.green),
            onSelected: (String value) {
              _filtrarReceitas(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'menos_de_10_minutos',
                  child: Text(
                    'Menos de 10 minutos',
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'salgado',
                  child: Text(
                    'Salgado',
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'doce',
                  child: Text(
                    'Doce',
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'reset',
                  child: Text(
                    'Resetar Filtros',
                    style: TextStyle(
                        fontFamily: 'Lobster', color: Colors.red, fontSize: 20),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(
                  _filtroAtual,
                  style: const TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _telasReceitas(index);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 160,
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: AssetImage(_photos[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _photos[index].text,
                          style: const TextStyle(
                              fontFamily: 'PoppinsM',
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _filtrarReceitas(String filtro) {
    if (filtro == 'menos_de_10_minutos') {
      setState(() {
        _photos = _originalPhotos.where((data) => data.tempo <= 10).toList();
        _filtroAtual = 'Menos de 10 minutos:'; // Atualiza o filtro atual
      });
    } else if (filtro == 'salgado') {
      setState(() {
        _photos =
            _originalPhotos.where((data) => data.tipo == 'salgado').toList();
        _filtroAtual = 'Salgado:'; // Atualiza o filtro atual
      });
    } else if (filtro == 'doce') {
      setState(() {
        _photos = _originalPhotos.where((data) => data.tipo == 'doce').toList();
        _filtroAtual = 'Doce:'; // Atualiza o filtro atual
      });
    } else if (filtro == 'reset') {
      setState(() {
        _photos = List.from(_originalPhotos);
        _filtroAtual = 'Todas as Receitas:'; // Reseta o filtro atual
      });
    }
  }

  void _telasReceitas(int index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ReceitaCoxinha()));
    }
    if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ReceitaLasanha()));
    }
    if (index == 2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ReceitaBrigadeiro()));
    }
    if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ReceitaChurros()));
    }
    if (index == 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ReceitaCrepioca()));
    }
    if (index == 5) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ReceitaBolo()));
    }
  }
}
