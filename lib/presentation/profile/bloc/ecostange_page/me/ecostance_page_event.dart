import 'package:flutter/material.dart';

abstract class EcostancePageEvent {}

class InitialMyEcoStancePageApi extends EcostancePageEvent {}

class MeResponseApi extends EcostancePageEvent {}

class DefaultstMyEcoStancePageApi extends EcostancePageEvent {}

class PreviousVersionMyEcoStanceApi extends EcostancePageEvent {}

class PreviousApiResponseFetched extends EcostancePageEvent {}

class EditEvent extends EcostancePageEvent {}

class CancelEditEvent extends EcostancePageEvent {}

class SaveContentEvent extends EcostancePageEvent {
  final String aboutUs;

  SaveContentEvent({required this.aboutUs});

  List<Object?> get props => [aboutUs];
}

class SelectImageEvent extends EcostancePageEvent {
  final String imageUrl;

  SelectImageEvent({
    required this.imageUrl,
  });

  List<Object?> get props => [imageUrl];
}

class LoadPageEvent extends EcostancePageEvent {}

class PublishStatusChanged extends EcostancePageEvent {
  final bool isPublished;

  PublishStatusChanged(this.isPublished);

  List<Object?> get props => [isPublished];
}

class OptionSelected extends EcostancePageEvent {
  final String option;

  OptionSelected(this.option);

  List<Object?> get props => [option];
}

class ButtonClickEvent extends EcostancePageEvent {}

class DefaultsButtonClicked extends EcostancePageEvent {
  DefaultsButtonClicked();
}

class SelectTemplateEvent extends EcostancePageEvent {
  final int index;

  SelectTemplateEvent(this.index);

  List<Object?> get props => [index];
}

class DeselectTemplateEvent extends EcostancePageEvent {
  final int index;

  DeselectTemplateEvent(this.index);

  List<Object?> get props => [index];
}

class OptionalNameEditEvent extends EcostancePageEvent {
  final TextEditingController name;
  OptionalNameEditEvent(this.name);

  List<Object?> get props => [name];
}

class OptionalEmailEditEvent extends EcostancePageEvent {
  final TextEditingController email;
  OptionalEmailEditEvent(this.email);

  List<Object?> get props => [email];
}

class OptionalPhoneEditEvent extends EcostancePageEvent {
  final TextEditingController phone;
  OptionalPhoneEditEvent(this.phone);

  List<Object?> get props => [phone];
}

class OptionalTwitterEditEvent extends EcostancePageEvent {
  final TextEditingController twitter;
  OptionalTwitterEditEvent(this.twitter);

  List<Object?> get props => [twitter];
}

class OptionalInstagramEditEvent extends EcostancePageEvent {
  final TextEditingController instagram;
  OptionalInstagramEditEvent(this.instagram);

  List<Object?> get props => [instagram];
}

class OptionalLinkdinEditEvent extends EcostancePageEvent {
  final TextEditingController linkdin;
  OptionalLinkdinEditEvent(this.linkdin);

  List<Object?> get props => [linkdin];
}

class OptionalFacebookEditEvent extends EcostancePageEvent {
  final TextEditingController facebook;
  OptionalFacebookEditEvent(this.facebook);

  List<Object?> get props => [facebook];
}

class OptionalNameEditSwitchChanged extends EcostancePageEvent {
  final bool isSwitchEnabled;
  OptionalNameEditSwitchChanged(this.isSwitchEnabled);

  List<Object?> get props => [isSwitchEnabled];
}

class OptionalPhoneEditSwitchChanged extends EcostancePageEvent {
  final bool isSwitchEnabled;
  OptionalPhoneEditSwitchChanged(this.isSwitchEnabled);

  List<Object?> get props => [isSwitchEnabled];
}

class OptionalEmailEditSwitchChanged extends EcostancePageEvent {
  final bool isSwitchEnabled;
  OptionalEmailEditSwitchChanged(this.isSwitchEnabled);

  List<Object?> get props => [isSwitchEnabled];
}

class OptionalTwitterEditSwitchChanged extends EcostancePageEvent {
  final bool isSwitchEnabled;
  OptionalTwitterEditSwitchChanged(this.isSwitchEnabled);

  List<Object?> get props => [isSwitchEnabled];
}

class OptionalLinkdinEditSwitchChanged extends EcostancePageEvent {
  final bool isSwitchEnabled;
  OptionalLinkdinEditSwitchChanged(this.isSwitchEnabled);

  List<Object?> get props => [isSwitchEnabled];
}

class OptionalInstagramEditSwitchChanged extends EcostancePageEvent {
  final bool isSwitchEnabled;
  OptionalInstagramEditSwitchChanged(this.isSwitchEnabled);

  List<Object?> get props => [isSwitchEnabled];
}

class OptionalFacebookEditSwitchChanged extends EcostancePageEvent {
  final bool isSwitchEnabled;
  OptionalFacebookEditSwitchChanged(this.isSwitchEnabled);

  List<Object?> get props => [isSwitchEnabled];
}

class TemplateSelectedEvent extends EcostancePageEvent {
  final int selectedIndex;

  TemplateSelectedEvent(this.selectedIndex);

  List<Object?> get props => [selectedIndex];
}
