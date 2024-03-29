import '../repositories/repository.dart';

class Task{
  String description;
  bool complete;
  final int id;

  Task({
    this.description = "",
    this.complete = false,
    required this.id,
  });
  Task.fromModel(Model model)
  :id = model.id,
  description = model.data['description'],
  complete = model.data['complete'];

  Model toModel() => Model(id : id, data: {
    'description':description,
    'complete':complete
  });
}