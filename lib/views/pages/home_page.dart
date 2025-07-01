import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TransformationController myTransformationController =
      TransformationController();
  double isSlided = 1.0;
  void zoomUpdate(double scale) {
    setState(() {
      isSlided = scale;
      final currentMatrix = myTransformationController.value;
      final currentTranslation = currentMatrix.getTranslation();
      myTransformationController.value = Matrix4.identity()
        ..translate(currentTranslation.x, currentTranslation.y)
        ..scale(scale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            children: [
              //+Expanded
              Flexible(
                flex: 20,
                child: InteractiveViewer(
                  key: Key('home_page_imageflexiable'),
                  transformationController: myTransformationController,
                  panEnabled: true,
                  scaleEnabled: true,
                  child: SizedBox(
                    width: 1450,
                    child: Image.asset(
                      'asset/images/leaves.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Flexible(
                key: Key('home_page_sliderflexiable'),
                flex: 1,
                child: SizedBox(
                  child: Slider.adaptive(
                    min: 1.0,
                    max: 10.0,
                    value: isSlided,
                    onChanged: zoomUpdate,
                    //print(value);
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
