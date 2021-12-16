
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
 
import 'contact_details_view.dart';
import 'contact_model.dart';
 
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
 
  final ScrollController _scrollController = ScrollController();
 
  final List<Map<String, String>> data = [
    {
      "name": "Nicki Minaj",
      "phone": "+233 244 44 8888",
      "email": "Litricia@gmail.com",
      "country": "Ghana",
      "region": "Upper East"
    },
    {
      "name": "Mary Hamid",
      "phone": "+233 244 77 0000",
      "email": "Dianly@gmail.com",
      "country": "Ghana",
      "region": "Western Region"
    },
    {
      "name": "Adnan Baba",
      "phone": "+233 244 55 8888",
      "email": "Shatta@gmail.com",
      "country": "Ghana",
      "region": "Eastern Region"
    },
    {
      "name": "Jamal Issah",
      "phone": "+233 277 88 9999",
      "email": "Ibrahim3@gmail.com",
      "country": "Ghana",
      "region": "Upper East"
    },
    {
      "name": "Nida Rahim",
      "phone": "+233 266 77 7777",
      "email": "Tinash@gmail.com",
      "country": "Ghana",
      "region": "Brong Ahafo"
    },
    {
      "name": "Clemento Happy",
      "phone": "+233 266 13 6033",
      "email": "patrick4@gmail.com",
      "country": "Ghana",
      "region": "Cental Region"
    },
    {
      "name": "Bright Dan",
      "phone": "+233 233 87 3241",
      "email": "cardi7.gmail.com",
      "country": "Ghana",
      "region": "Western Regioin"
    },
    {
      "name": "William Ortiz",
      "phone": "1-412-819-7163",
      "email": "molestie.in@yahoo.ca",
      "country": "Vietnam",
      "region": "North Island"
    },
    {
      "name": "Halima Ibrahim",
      "phone": "+233 244 00 0000",
      "email": "freddies@gmail.com",
      "country": "Ghana",
      "region": "Accra"
    },
    {
      "name": "Mina Abdallah",
      "phone": "+233 66 77 888",
      "email": "patrick.lina@gmail.com",
      "country": "Ghana",
      "region": "Volta Region"
    }
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/person 1.png'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                country: 'Ghana',
                                email: 'kalima@gmail.com',
                                name: 'Kalima Yakubu',
                                phone: '+233 26 54 354 888',
                                region: 'Northern Region'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('images/person 2.jpg'),
                    ),
                    title: const Text(
                      'Dan Fred',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233 67 88 777'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('images/person 3.jpg'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}