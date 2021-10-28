import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'percent_indicator.dart';

enum CustomStepState { complete, disabled, current }
const double _kStepSize = 10.0;
const double _kTriangleHeight = _kStepSize * 0.866025;

class CustomStep {
  const CustomStep({
    required this.title,
    this.subtitle,
    this.state = CustomStepState.disabled,
    this.isActive = false,
  });

  /// The title of the step that typically describes it.
  final Widget title;

  /// The subtitle of the step that appears below the title and has a smaller
  /// font size. It typically gives more details that complement the title.
  ///
  /// If null, the subtitle is not shown.
  final Widget? subtitle;

  final CustomStepState state;

  /// Whether or not the step is active. The flag only influences styling.
  final bool isActive;
}

class CustomStepper extends StatefulWidget {
  /// Creates a stepper from a list of steps.
  ///
  /// This widget is not meant to be rebuilt with a different list of steps
  /// unless a key is provided in order to distinguish the old stepper from the
  /// new one.
  ///
  /// The [steps], [type], and [currentStep] arguments must not be null.
  const CustomStepper({
    Key? key,
    required this.steps,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
    this.elevation,
  })  : assert(0 <= currentStep && currentStep < steps.length),
        super(key: key);

  final List<CustomStep> steps;


  /// The index into [steps] of the current step whose content is displayed.
  final int currentStep;

  /// The callback called when a step is tapped, with its index passed as
  /// an argument.
  final ValueChanged<int>? onStepTapped;

  /// The callback called when the 'continue' button is tapped.
  ///
  /// If null, the 'continue' button will be disabled.
  final VoidCallback? onStepContinue;

  /// The callback called when the 'cancel' button is tapped.
  ///
  /// If null, the 'cancel' button will be disabled.
  final VoidCallback? onStepCancel;

  final ControlsWidgetBuilder? controlsBuilder;

  /// The elevation of this stepper's [Material] when [type] is [StepperType.horizontal].
  final double? elevation;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper>
    with TickerProviderStateMixin {
  late List<GlobalKey> _keys;
  final Map<int, CustomStepState> _oldStates = <int, CustomStepState>{};

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (int i) => GlobalKey(),
    );

    for (int i = 0; i < widget.steps.length; i += 1)
      _oldStates[i] = widget.steps[i].state;
  }

  @override
  void didUpdateWidget(CustomStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (int i = 0; i < oldWidget.steps.length; i += 1)
      _oldStates[i] = oldWidget.steps[i].state;
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  bool _isDark() {
    return Theme.of(context).brightness == Brightness.dark;
  }

  Widget _buildLine(bool visible,int index) {
    return Container(
      width: visible ? 1.0 : 0.0,
      height: _isFirst(index)?15: 30.0,
      color: Colors.grey.shade400,
    );
  }

  Color _circleColor(int index) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    if (!_isDark()) {
      return widget.steps[index].isActive
          ? Color(0xFF00FFDD)
          : Colors.grey.withOpacity(0.2);
    } else {
      return widget.steps[index].isActive
          ? colorScheme.secondary
          : colorScheme.background;
    }
  }

  Widget _buildCircle(int index, bool oldState) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: _kStepSize,
      height: _kStepSize,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: _circleColor(index),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildCheck(bool oldState) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: _kStepSize,
      height: _kStepSize,
      child: Center(
        child: SizedBox(
          width: _kStepSize,
          height:
              _kTriangleHeight, // Height of 24dp-long-sided equilateral triangle.
          child: CustomPaint(
            painter: _BuildCheckPainter(
              color:  Color(0xFF00FFDD),
            ),
            child: Align(
              alignment: const Alignment(
                  0.0, 0.8), // 0.8 looks better than the geometrical 0.33.
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    if (widget.steps[index].state == CustomStepState.complete)
      return _buildCheck(false);
    else 
      return _buildCircle(index, false);
    
  }

  Widget _buildHeaderText(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
         AnimatedDefaultTextStyle(
            style: GoogleFonts.alegreya(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF)),
            duration: kThemeAnimationDuration,
            curve: Curves.fastOutSlowIn,
            child: widget.steps[index].title,
          ),
        
        if (widget.steps[index].subtitle != null)
          Container(
            margin: const EdgeInsets.only(top: 2.0),
            child: AnimatedDefaultTextStyle(
              style:
                  GoogleFonts.alegreya(fontSize: 16, color: Color(0xABFFFFFF)),
              duration: kThemeAnimationDuration,
              curve: Curves.fastOutSlowIn,
              child: widget.steps[index].subtitle!,
            ),
          ),
      ],
    );
  }

  Widget _buildVerticalHeader(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              // Line parts are always added in order for the ink splash to
              // flood the tips of the connector lines.
              (_isFirst(index))?
                   CircularPercentIndicator(
                        radius: 30.0,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        circularStrokeCap: CircularStrokeCap.round,
                        lineWidth: 4.0,
                        percent: 0.67,
                        progressColor: Color(0xFF00FFDD),
                      ): Padding(
                        padding: const EdgeInsets.only(left:10,right: 10),
                        child: _buildIcon(index),
                      ),
             Padding(
                padding:_isLast(index)?const EdgeInsets.only(left:10):const EdgeInsets.all(0),
                child: _buildLine(!_isLast(index),index),
              ),
             
              
              
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 12.0),
              child: _buildHeaderText(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVertical() {
    return ListView(
      shrinkWrap: true,
      
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        for (int i = 0; i < widget.steps.length; i += 1)
          _buildVerticalHeader(i),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildVertical();
  }
}

class _BuildCheckPainter extends CustomPainter {
  _BuildCheckPainter({
    required this.color,
  });

  final Color color;

  @override
  bool hitTest(Offset point) => true; // Hitting the rectangle is fine enough.

  @override
  bool shouldRepaint(_BuildCheckPainter oldPainter) {
    return oldPainter.color != color;
  }

  @override
  void paint(Canvas canvas, Size size) {


    final paint = Paint();
    paint.color = color;
    paint.strokeWidth = 3;
     paint.style = PaintingStyle.stroke;
      paint.strokeJoin = StrokeJoin.round;
    paint.strokeCap = StrokeCap.round;

    canvas.drawPath(
      Path()..moveTo(0, size.height / 1.5)
            ..lineTo(size.width / 2, size.height)
            ..lineTo(size.width , 0)
      , paint);
    }
}
