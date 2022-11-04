import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:schedule/schedule/presentation/widgets/edit_content_button/edit_color_content_color.dart';
import 'package:schedule/schedule/presentation/widgets/edit_content_button/edit_content_button.dart';
import 'package:schedule/schedule/presentation/widgets/edit_content_button/edit_icon_content_button.dart';
import 'package:schedule/schedule/store/actions/current_lesson_actions.dart';
import 'package:schedule/shared/models/app_state.dart';
import 'package:schedule/schedule/models/lesson.dart';
import 'package:schedule/schedule/presentation/screens/templates/pushed_screen_template.dart';
import 'package:schedule/schedule/store/actions/lesson_actions.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/utils/open_dialog.dart';
import 'package:schedule/shared/utils/show_dialog.dart';
import 'package:schedule/shared/utils/show_snackbar.dart';

class LessonCreateScreen extends StatefulWidget {
  const LessonCreateScreen({
    super.key,
  });

  @override
  State<LessonCreateScreen> createState() => _LessonCreateScreenState();
}

class _LessonCreateScreenState extends State<LessonCreateScreen> {

  void dispatchUpdateLesson(Store<AppState> store, Lesson updated) {
    store.dispatch(UpdateLessonAction(updated));
    store.dispatch(UpdateCurrentLessonAction(updated));
  }

  void openTitleEditDialog(BuildContext context, Lesson currentLesson) {
    showEditTextDialog(
      context, 
      label: "Edit title", 
      description: "Some description of the dialog",
      initialValue: currentLesson.title, 
      onAction: (value) {
        final store = StoreProvider.of<AppState>(context);
        final updatedLesson = store.state.currentLesson!.update(title: value);
        dispatchUpdateLesson(store, updatedLesson);
      }
    );
  }

  void openProfessorEditDialog(BuildContext context, Lesson currentLesson) {
    showEditTextDialog(
      context, 
      label: "Edit professor's name", 
      description: "Some description of the dialog",
      initialValue: currentLesson.professor ?? "", 
      nullable: true,
      onAction: (value) {
        final store = StoreProvider.of<AppState>(context);
        final updatedLesson = store.state.currentLesson!.update(professor: value);
        dispatchUpdateLesson(store, updatedLesson);
      }
    );
  }

  void openAuditoryEditDialog(BuildContext context, Lesson currentLesson) {
    showEditTextDialog(
      context, 
      label: "Edit auditory", 
      description: "Some description of the dialog",
      initialValue: currentLesson.auditory ?? "", 
      nullable: true,
      onAction: (value) {
        final store = StoreProvider.of<AppState>(context);
        final updatedLesson = store.state.currentLesson!.update(auditory: value);
        dispatchUpdateLesson(store, updatedLesson);
      }
    );
  }

  void openDescriptionEditDialog(BuildContext context, Lesson currentLesson) {
    showEditTextDialog(
      context, 
      label: "Edit description", 
      description: "Some description of the dialog",
      initialValue: currentLesson.description ?? "",
      nullable: true,
      onAction: (value) {
        final store = StoreProvider.of<AppState>(context);
        final updatedLesson = store.state.currentLesson!.update(description: value);
        dispatchUpdateLesson(store, updatedLesson);
      }
    );
  }

  void openTypeEditDialog(BuildContext context, Lesson currentLesson) {
    showEditTypeDialog(
      context, 
      initialValue: currentLesson.type,
      onAction: (type) {
        final store = StoreProvider.of<AppState>(context);
        final updatedLesson = store.state.currentLesson!.update(type: type);
        dispatchUpdateLesson(store, updatedLesson);
      }
    );
  }
  
  void openIconEditDialog(BuildContext context, Lesson currentLesson) {
    showEditIconDialog(
      context, 
      initialValue: currentLesson.icon,
      onAction: (icon) {
        final store = StoreProvider.of<AppState>(context);
        final updatedLesson = store.state.currentLesson!.update(icon: icon);
        dispatchUpdateLesson(store, updatedLesson);
      }
    );
  }

  void openColorEditDialog(BuildContext context, Lesson currentLesson) {
    showEditColorDialog(
      context, 
      initialValue: currentLesson.color,
      onAction: (color) {
        final store = StoreProvider.of<AppState>(context);
        final updatedLesson = store.state.currentLesson!.update(color: color);
        dispatchUpdateLesson(store, updatedLesson);
      }
    );
  }

  void onCreate() {
    print("create");
    final store = StoreProvider.of<AppState>(context);
    final newLesson = store.state.currentLesson!;
    if (newLesson.title.isNotEmpty) {
      store.dispatch(CreateLessonAction(newLesson));
      Navigator.of(context).pop();
    } else {
      showCustomSnackBar(context, "Title is required");
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Lesson?>(
      onInit: (store) {
        final lastId = store.state.lessons.items.isNotEmpty 
          ? store.state.lessons.items.last.id : -1;
        final emptyLesson = Lesson(
          id: lastId + 1, 
          title: "", 
          color: AppColors.lapis, 
          icon: Icons.timer_outlined
        );
        store.dispatch(UpdateCurrentLessonAction(emptyLesson));
      },
      onDispose: (store) {
        store.dispatch(const UpdateCurrentLessonAction(null));
      },
      converter: (store) => store.state.currentLesson,
      builder: (context, currentLesson) {
        return PushedScreenTemplate(
          title: "Add new class",
          items: [
            EditContentButton(
              title: "Title", 
              nullable: false,
              content: currentLesson!.title, 
              onPressed: () => openDialog(context, currentLesson, openTitleEditDialog)
            ),
            EditContentButton(
              title: "Description", 
              content: currentLesson.description, 
              onPressed: () => openDialog(context, currentLesson, openDescriptionEditDialog)
            ),
            EditContentButton(
              title: "Auditory", 
              content: currentLesson.auditory, 
              onPressed: () => openDialog(context, currentLesson, openAuditoryEditDialog)
            ),
            EditContentButton(
              title: "Professor", 
              content: currentLesson.professor, 
              onPressed: () => openDialog(context, currentLesson, openProfessorEditDialog)
            ),
            EditContentButton(
              title: "Class type", 
              content: currentLesson.type.name, 
              nullable: false,
              onPressed: () => openDialog(context, currentLesson, openTypeEditDialog)
            ),
            EditIconContentButton(
              icon: currentLesson.icon, 
              onPressed: () => openDialog(context, currentLesson, openIconEditDialog)
            ),
            EditColorContentButton(
              color: currentLesson.color, 
              onPressed: () => openDialog(context, currentLesson, openColorEditDialog)
            ),
          ],
          action: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onCreate, 
              child: const Text("Create"),
            ),
          ),
        );
      }, 
    );
  }
}