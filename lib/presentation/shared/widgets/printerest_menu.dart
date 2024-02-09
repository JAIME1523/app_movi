import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButtom {

  final VoidCallback onPressed;
  
  final IconData icon;

  CustomButtom({required this.onPressed, required this.icon});
}

class CustomMenu extends StatelessWidget {
  const CustomMenu({
    Key? key,
    this.mostar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  }) : super(key: key);
  final Color backgroundColor;
  final Color activeColor; 
  final Color inactiveColor; 
  final bool mostar;
  final List items;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (mostar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;

            return _CustomMenuBackground(
              child: _MenuItems(menuItems: items),
            );
          },
        ),
      ),
    );
  }
}

class _CustomMenuBackground extends StatelessWidget {
  const _CustomMenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      width: 360,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          // borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({Key? key, required this.menuItems}) : super(key: key);

  final List menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            menuItems.length,
            (index) => _CustomMenuButtom(
                  index: index,
                  item: menuItems[index],
                )));
  }
}

class _CustomMenuButtom extends StatelessWidget {
  const _CustomMenuButtom(
      {Key? key, required this.index, required this.item})
      : super(key: key);
  final int index;
  final CustomButtom item;
  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;

        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index)
              ? Provider.of<_MenuModel>(context).activeColor
              : Provider.of<_MenuModel>(context).inactiveColor),
    );
  }
}

class _MenuModel with ChangeNotifier {
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.white; 
  Color inactiveColor = Colors.blueGrey;
  int _itemSeleccionado = 1;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
