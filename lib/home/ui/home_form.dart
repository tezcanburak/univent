import 'package:flutter/material.dart';

class HomeForm extends StatelessWidget {
  const HomeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: 12,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(image: NetworkImage('https://picsum.photos/120')),
                  Text('BilmemNe Topluluğu'),
                  Text('26.01.1998'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
