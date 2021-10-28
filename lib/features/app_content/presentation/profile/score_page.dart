import 'package:e_learn/features/app_content/presentation/widgets/assesment_summary.dart';
import 'package:e_learn/features/app_content/presentation/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';

class ScoresSubPage extends StatelessWidget {
  const ScoresSubPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return index == 1
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: LineChartSample1(),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 20, right: 20),
                      child: AssesmentSummary(),
                    );
            },
            childCount: 2,
          ),
        );
  }
}