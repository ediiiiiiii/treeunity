import 'package:flutter/material.dart';

class PageSelector extends StatefulWidget {
  const PageSelector(
      {super.key,
      required this.tabController,
      this.width = 250,
      this.height = 40,
      this.yOffset = 100,
      required this.value});

  final TabController tabController;
  final double width;
  final double height;
  final double yOffset;
  final int value;

  @override
  State<PageSelector> createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  @override
  void initState() {
    super.initState();
    widget.tabController.animation?.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: widget.yOffset,
        child: Center(
          child: SizedBox(
            width: widget.width,
            child: Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      offset: Offset(3, 3),
                      color: Colors.black.withAlpha(50))
                ],
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Transform.translate(
                    offset: Offset(
                        widget.width /
                            2 *
                            (widget.tabController.animation?.value ?? 0.0),
                        0),
                    child: Container(
                      width: widget.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green[900],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            widget.tabController.animateTo(0);
                          },
                          child: const Text(
                            "Lernpfad",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: const Text(
                            "Aktuelles",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            widget.tabController.animateTo(1);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
