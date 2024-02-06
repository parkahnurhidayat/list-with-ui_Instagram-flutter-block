import 'package:flutter/material.dart';
import 'package:flutter_block/data/entities/user_list_entity.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  final UserEntity item;
  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back),
          ),
          title: Center(
            child: Text(
              '${item.title}_${item.titleLast}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        double screenHeight =
                            MediaQuery.of(context).size.height;
                        double eightyPercentHeight = screenHeight * 0.6;
                        return SizedBox(
                          height: eightyPercentHeight,
                          child: ListView(children: const [
                            ListTile(
                              title: Text('Laporkan'),
                            ),
                            ListTile(
                              title: Text('Blokir'),
                            ),
                            ListTile(
                              title: Text('Tentang Akun Ini'),
                            ),
                            ListTile(
                              title: Text('Batasi'),
                            ),
                            ListTile(
                              title: Text('Sembunyikan Cerita Anda'),
                            ),
                            ListTile(
                              title: Text('Hapus Pengikut'),
                            ),
                            ListTile(
                              title: Text('Salin URL Profile'),
                            ),
                            ListTile(
                              title: Text('Tampilkan Code QR'),
                            ),
                            ListTile(
                              title: Text('Bagikan Profile Ini'),
                            ),
                          ]),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.more_horiz)),
            )
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 90,
                    width: 90,
                    child: CircleAvatar(
                      backgroundImage: Image.network(item.avatar).image,
                    ),
                  ),
                  const Column(
                    children: [
                      Text(
                        '18',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 22),
                      ),
                      Text(
                        'Post',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        '8,102',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 22),
                      ),
                      Text(
                        'Folowers',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        '20',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 22),
                      ),
                      Text(
                        'Folowing',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text(
                      'Frontend Developer',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: const Center(
                        child: Text(
                      'Follow',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 245, 241, 241)),
                    child: const Center(
                        child: Text(
                      'Message',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 245, 241, 241)),
                      child: const Icon(Icons.person_add_outlined))
                ],
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 70,
                      floating: true,
                      pinned: true,
                      leading: const Text(''),
                      bottom: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey[600],
                        indicatorColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: const [
                          Tab(
                            icon: Icon(Icons.grid_on_sharp),
                          ),
                          Tab(
                            icon: Icon(Icons.person_pin_rounded),
                          ),
                        ],
                      ),
                    ),
                    SliverFillRemaining(
                      child: TabBarView(
                        children: [
                          Center(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2,
                                    crossAxisCount: 3,
                                  ),
                                  itemCount:
                                      18, // Update this based on your actual data length
                                  itemBuilder: (context, index) {
                                    // Replace the following line with your actual data handling logic

                                    return Image.network(
                                      'https://picsum.photos/id/2$index/200/300',
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          const Center(child: Text('Content for Tab 2')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.subscriptions_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shop_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.account_circle_outlined),
                ),
              ],
            )),
      ),
    );
  }
}
