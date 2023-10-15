import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/task_model.dart';

class FirebaseFunction {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static Future<void> addTaskToFirebase(TaskModel taskModel) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    return docRef.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasksFromFirestore(DateTime date) {
    var collection = getTasksCollection();
    return collection
        .where(TaskModelKeys.dateKey,
            isEqualTo: DateUtils.dateOnly(date).microsecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getTasksCollection().doc(id).delete();
  }

  static Future<void> updateTask(String id, TaskModel taskModel) {
    return getTasksCollection().doc(id).update(taskModel.toJson());
  }
}
// 16972308000000 00
