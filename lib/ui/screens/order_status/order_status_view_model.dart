import 'package:flutter/material.dart';
import 'package:pickmed/core/others/base_view_model.dart';

class OrderStatusViewModel extends BaseViewModel {
  int currentStep = 0;
  int dotCount = 3;

  List<Step> getSteps() {
    return [
      Step(
        title: const Text('Confirmed'),
        subtitle: Container(),
        isActive: currentStep == 0,
        state: currentStep == 0 ? StepState.editing : StepState.complete,
        content: const SizedBox.shrink(),
      ),
      Step(
        title: const Text('In Progress'),
        isActive: currentStep == 1,
        state: currentStep == 1 ? StepState.editing : StepState.complete,
        content: const SizedBox.shrink(),
      ),
      Step(
        title: const Text('Completed'),
        isActive: currentStep == 2,
        state: currentStep == 2 ? StepState.editing : StepState.complete,
        content: const SizedBox.shrink(),
      ),
    ];
  }
}
