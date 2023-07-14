part of 'widgets.dart';

class ScaffoldDefault extends StatelessWidget {
  final Brightness brightness;
  final Widget child;
  final bool isListView;
  final bool isPadding;

  const ScaffoldDefault({
    Key? key,
    this.brightness = Brightness.light,
    this.isListView = true,
    this.isPadding = true,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: brightness,
      child: Scaffold(
        backgroundColor: blackColor,
        body: (isListView)
            ? ListView(
                children: [
                  (isPadding)
                      ? Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: child,
                        )
                      : child,
                ],
              )
            : child,
      ),
    );
  }
}
