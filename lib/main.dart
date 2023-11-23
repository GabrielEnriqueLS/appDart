import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NomesScreen(),
    );
  }
}

class NomesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nomes'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // Navegar para a tela de créditos
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreditosScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.indigo],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NomeCard(
                nome: 'Gabriel',
                idade: 19,
                cidade: 'Itabaiana',
                fato: 'Gosta de jogo de luta',
                cor: Colors.purple,
                imagem: 'assets/gabriel.jpg',
              ),
              NomeCard(
                nome: 'Augusto',
                idade: 40,
                cidade: 'Itabaiana',
                fato: 'Ama tomar cachaça',
                cor: Colors.green,
                imagem: 'assets/augusto.png',
              ),
              NomeCard(
                nome: 'Luan',
                idade: 19,
                cidade: 'Itabaiana',
                fato: 'gosta de andar de moto',
                cor: Colors.pink,
                imagem: 'assets/luan.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NomeCard extends StatelessWidget {
  final String nome;
  final int? idade;
  final String? cidade;
  final String? fato;
  final Color cor;
  final String? imagem;

  NomeCard(
      {required this.nome,
      this.idade,
      this.cidade,
      this.fato,
      required this.cor,
      this.imagem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesScreen(
              idade: idade,
              cidade: cidade,
              fato: fato,
              cor: cor,
              imagem: imagem,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        color: cor.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            nome,
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class DetalhesScreen extends StatelessWidget {
  final int? idade;
  final String? cidade;
  final String? fato;
  final Color cor;
  final String? imagem;

  DetalhesScreen(
      {this.idade, this.cidade, this.fato, required this.cor, this.imagem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
        backgroundColor: cor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [cor, cor.withOpacity(0.8)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imagem!),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Idade: ${idade ?? ""}',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              SizedBox(height: 8.0),
              Text(
                'Cidade: ${cidade ?? ""}',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              SizedBox(height: 8.0),
              Text(
                'Fato Aleatório: ${fato ?? ""}',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreditosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créditos'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.indigo],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/credito.jpg'),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Desenvolvido por:',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Text(
                'Gabriel, Augusto e Luan',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              SizedBox(height: 18.0),
              Text(
                'Versão: 1.3',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
