
import 'package:flutter/material.dart';

void main() {
  runApp(const ExploreMundoApp());
}

class ExploreMundoApp extends StatelessWidget {
  const ExploreMundoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explore Mundo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087E8B),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String pesquisa = '';

  void abrirTela(Widget tela) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => tela),
    );
  }

  void mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool encontrouDestino =
        'oeschinen lake suíça europa'.contains(pesquisa.toLowerCase().trim()) ||
        pesquisa.trim().isEmpty;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FA),
      body: ListView(
        children: [
          Container(
            color: const Color(0xFF087E8B),
            padding: const EdgeInsets.all(22),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EXPLORE MUNDO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Descubra lugares incríveis.',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  navButton('Destinos', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }),
                  navButton('Pacotes', () {
                    abrirTela(const PackagesPage());
                  }),
                  navButton('Contato', () {
                    abrirTela(const ContactPage());
                  }),
                  navButton('Sobre nós', () {
                    abrirTela(const AboutPage());
                  }),
                ],
              ),
            ),
          ),
Container(
  height: 230,
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.blueGrey.shade200,
    borderRadius: BorderRadius.circular(16),
  ),
  child: const Icon(
    Icons.landscape,
    size: 80,
    color: Colors.white,
  ),
),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Encontre sua próxima viagem',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                TextField(
                  onChanged: (valor) {
                    setState(() {
                      pesquisa = valor;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Pesquisar destinos...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Destinos em destaque',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                if (encontrouDestino) ...[
                  GestureDetector(
                    onTap: () {
                      abrirTela(const DestinationPage());
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'images/oeschinen_lake.jpg',
                        height: 230,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Oeschinen Lake',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(Icons.star, color: Colors.amber),
                      Text('4.9 (41)'),
                    ],
                  ),

                  const Text(
                    'Suíça · Europa',
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      actionButton(Icons.call, 'LIGAR', () {
                        mostrarMensagem('Entre em contato com nossa equipe.');
                      }),
                      actionButton(Icons.map, 'ROTA', () {
                        mostrarMensagem('Destino: Oeschinen Lake, Suíça.');
                      }),
                      actionButton(Icons.share, 'COMPARTILHAR', () {
                        mostrarMensagem('Compartilhe este destino com seus amigos!');
                      }),
                    ],
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Sobre o destino',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'O Oeschinen Lake é um dos destinos mais bonitos da Suíça. '
                    'Cercado por montanhas e paisagens naturais impressionantes, '
                    'é o lugar ideal para quem procura tranquilidade, aventura '
                    'e contato com a natureza.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ] else
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'Nenhum destino encontrado. Tente pesquisar por Suíça ou Oeschinen Lake.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                const SizedBox(height: 25),

                const Text(
                  'Nossos serviços',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                serviceCard(
                  Icons.flight,
                  'Pacotes de viagem',
                  'Encontre opções para sua próxima aventura.',
                  () => abrirTela(const PackagesPage()),
                ),
                serviceCard(
                  Icons.support_agent,
                  'Atendimento',
                  'Entre em contato com nossa equipe.',
                  () => abrirTela(const ContactPage()),
                ),
                serviceCard(
                  Icons.info_outline,
                  'Sobre nós',
                  'Conheça a agência Explore Mundo.',
                  () => abrirTela(const AboutPage()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget navButton(String label, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      label,
      style: const TextStyle(
        color: Color(0xFF087E8B),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget actionButton(IconData icon, String label, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Column(
      children: [
        Icon(icon, color: const Color(0xFF087E8B), size: 27),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget serviceCard(
  IconData icon,
  String title,
  String description,
  VoidCallback onTap,
) {
  return Card(
    color: Colors.white,
    margin: const EdgeInsets.only(bottom: 10),
    child: ListTile(
      onTap: onTap,
      leading: Icon(icon, color: const Color(0xFF087E8B)),
      title: Text(title),
      subtitle: Text(description),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    ),
  );
}

class DestinationPage extends StatelessWidget {
  const DestinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do destino'),
        backgroundColor: const Color(0xFF087E8B),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'images/oeschinen_lake.jpg',
              height: 240,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Oeschinen Lake',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.location_on, color: Color(0xFF087E8B)),
              Text('Suíça · Europa'),
              SizedBox(width: 15),
              Icon(Icons.star, color: Colors.amber),
              Text('4.9 (41 avaliações)'),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Sobre o destino',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'O Oeschinen Lake é um lago cercado pelos Alpes Suíços. '
            'O local oferece belas paisagens, trilhas e contato com a natureza. '
            'É uma ótima opção para quem deseja conhecer um destino especial na Europa.',
            style: TextStyle(fontSize: 16, height: 1.6),
          ),
        ],
      ),
    );
  }
}

class PackagesPage extends StatelessWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'Pacotes de viagem',
      icon: Icons.flight,
      message: 'Planeje sua próxima aventura!',
      description:
          'A Explore Mundo oferece opções de viagens para diferentes destinos. '
          'Consulte nossa equipe para conhecer os pacotes disponíveis.',
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'Contato',
      icon: Icons.support_agent,
      message: 'Fale com nossa equipe',
      description:
          'Estamos disponíveis para ajudar você a planejar sua viagem. '
          'Entre em contato pelo nosso atendimento para tirar dúvidas e solicitar informações.',
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'Sobre nós',
      icon: Icons.info_outline,
      message: 'Conheça a Explore Mundo',
      description:
          'Somos uma agência de viagens fictícia criada para ajudar pessoas '
          'a descobrir destinos incríveis, conhecer novas culturas e planejar experiências.',
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String message;
  final String description;

  const SimplePage({
    super.key,
    required this.title,
    required this.icon,
    required this.message,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF087E8B),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 65, color: const Color(0xFF087E8B)),
              const SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
