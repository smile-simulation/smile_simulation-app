import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/search_patients_model/search_patients_model.dart';

abstract class PatientState {}

class PatientInitial extends PatientState {}

class PatientLoading extends PatientState {}

class PatientSuccess extends PatientState {
  final Patient patient;
  PatientSuccess(this.patient);
}

class PatientFailure extends PatientState {
  final String message;
  PatientFailure(this.message);
}