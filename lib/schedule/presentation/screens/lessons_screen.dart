import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:schedule/schedule/models/lesson_list.dart';
import 'package:schedule/schedule/presentation/screens/lesson_add_screen.dart';
import 'package:schedule/schedule/presentation/screens/lesson_edit_screen.dart';
import 'package:schedule/schedule/presentation/widgets/lesson_detail.dart';
import 'package:schedule/schedule/presentation/widgets/slidable_lesson.dart';
import 'package:schedule/schedule/store/actions/lesson_actions.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_state.dart';
import 'package:schedule/shared/utils/create_box_shadow.dart';
import 'package:schedule/shared/widgets/custom_appbar.dart';
import 'package:schedule/shared/widgets/dialog/fullscreen_dialog.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({
    super.key,
  });

  void onItemTapped(BuildContext context, int id) {
    final store = StoreProvider.of<AppState>(context);
    final lesson = store.state.lessons.getItem(id)!;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (context) => LessonDetail(
        id: id, 
        lesson: lesson, 
        onEdit: onItemEdit, 
        onDelete: onItemDelete,
      ),
    );
  }

  void onItemCreate(BuildContext context) {
    // Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LessonCreateScreen(), 
    ));
  }

  void onItemEdit(BuildContext context, int id) {
    // Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LessonEditScreen(id: id), 
    ));
  }

  void onItemDelete(BuildContext context, int lessonId) {
    showDialog(
      context: context, 
      builder: (context) {
        return StoreConnector<AppState, VoidCallback>(
          converter: (store) {
            return () => store.dispatch(RemoveLessonAction(lessonId));
          },
          builder: (context, callback) => FullscreenDialog(
            title: "Are you sure?", 
            actionName: "Delete", 
            description: "It will be impossible to restore deleted data",
            color: AppColors.roseRed, 
            onAction: callback,
          ),
        );
      } 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark.primary,
      appBar: const CustomAppBar(
        height: AppConfig.appBarHeight,
        title: "Classes",
      ),
      body: StoreConnector<AppState, LessonList>(
        converter: (store) => store.state.lessons,
        builder: (context, state) {
          if (state.items.isNotEmpty) {
            return SlidableAutoCloseBehavior(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: AppConfig.s12, vertical: AppConfig.s12),
                itemBuilder: (context, index) => SlidableLesson(
                  index: index,
                  data: state.items[index], 
                  onTap: onItemTapped,
                  onEdit: onItemEdit,
                  onDelete: onItemDelete,
                ), 
                itemCount: state.items.length,
              ),
            ); 
          }
          return Center(
            child: Text("No added lessons yet", style: Theme.of(context).textTheme.bodySmall),
          );
        }, 
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 10,
            right: 10,
            child: GestureDetector(
              onTap: () => onItemCreate(context),
              child: Container(
                padding: const EdgeInsets.all(AppConfig.s12),
                decoration: BoxDecoration(
                  color: AppColors.merigold.primary,
                  borderRadius: AppConfig.borderRadius50,
                  boxShadow: createBoxShadow(AppColors.merigold),
                ),
                child: Icon(
                  Icons.add, 
                  size: 36, 
                  color: AppColors.fgLight.primary
                ),
              ),
            ),
          ),
        ], 
      ),
    );
  }
}