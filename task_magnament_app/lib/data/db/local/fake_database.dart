import '../../enums/priority.dart';
import '../../enums/status.dart';
import '../../models/TaskModel.dart';

/// A singleton class that represents a fake database for task management.
///
/// This class is designed to simulate a database for managing tasks. It contains a static
/// list of `TaskModel` instances, representing a collection of tasks with different attributes.
/// The class uses a Singleton pattern to ensure that only one instance exists throughout
/// the application, providing a consistent data source.
class FakeDatabase {
  // Store the single instance of the class.
  static final FakeDatabase _instance = FakeDatabase._internal(); // Singleton instance.

  // Private constructor to prevent external instantiation.
  FakeDatabase._internal();

  // Method to get the single instance of the Singleton.
  factory FakeDatabase() {
    return _instance; // Return the single instance of the class.
  }

  // A list of `TaskModel` instances representing tasks in the fake database.
  final List<TaskModel> taskList = [
    TaskModel(
      uid: 8766592643,
      title: 'Buy groceries',
      content: 'Get milk, bread, and eggs.',
      person: 'John Doe',
      files: ['groceries_list.pdf'],
      priority: Priority.Medium,
      date: DateTime.now(),
      status: Status.ToDo,
    ),
    TaskModel(
      uid: 9536689298,
      title: 'Complete Flutter Project',
      content: 'Finish the UI and integrate with the backend.',
      person: 'Jane Smith',
      files: ['project_plan.docx', 'ui_design.sketch'],
      priority: Priority.High,
      date: DateTime.now().add(const Duration(days: 1)),
      status: Status.InProgress,
    ),
    TaskModel(
      uid: 1392924314,
      title: 'Schedule Meeting',
      content: 'Arrange a meeting with the marketing team.',
      person: 'Alice Johnson',
      files: [],
      priority: Priority.Low,
      date: DateTime.now().add(const Duration(days: 2)),
      status: Status.InReview,
    ),
    TaskModel(
      uid: 7918346395,
      title: 'Submit Expense Report',
      content: 'Submit the report for the recent business trip.',
      person: 'Robert Brown',
      files: ['expense_report.xlsx'],
      priority: Priority.Medium,
      date: DateTime.now().add(const Duration(days: 3)),
      status: Status.Done,
    ),
    TaskModel(
      uid: 9751148976,
      title: 'Plan Team Building Event',
      content: 'Organize a team building activity.',
      person: 'Susan White',
      files: ['team_building_ideas.pdf'],
      priority: Priority.Medium,
      date: DateTime.now().add(const Duration(days: 4)),
      status: Status.ToDo,
    ),
    TaskModel(
      uid: 7728983739,
      title: 'Backup Data',
      content: 'Back up important files to cloud storage.',
      person: 'Emily Clark',
      files: ['backup_instructions.txt'],
      priority: Priority.High,
      date: DateTime.now().add(Duration(days: 5)),
      status: Status.ToDo,
    ),
    TaskModel(
      uid: 8916913470,
      title: 'Prepare Presentation',
      content: 'Prepare slides for the client presentation.',
      person: 'Michael Green',
      files: ['presentation.pptx'],
      priority: Priority.Medium,
      date: DateTime.now().add(Duration(days: 6)),
      status: Status.InProgress,
    ),
    TaskModel(
      uid: 7046289216,
      title: 'Review Budget',
      content: 'Review the quarterly budget for the project.',
      person: 'Linda Lee',
      files: ['budget_2024.xlsx'],
      priority: Priority.Low,
      date: DateTime.now().add(Duration(days: 7)),
      status: Status.InReview,
    ),
    TaskModel(
      uid: 5863336385,
      title: 'Organize Workshop',
      content: 'Organize a workshop for the new employees.',
      person: 'Daniel Walker',
      files: ['workshop_plan.docx'],
      priority: Priority.Medium,
      date: DateTime.now().add(Duration(days: 8)),
      status: Status.Done,
    ),
    TaskModel(
      uid: 9207108552,
      title: 'Update Software',
      content: 'Update the project management software.',
      person: 'Karen Harris',
      files: ['update_instructions.pdf'],
      priority: Priority.High,
      date: DateTime.now().add(Duration(days: 9)),
      status: Status.ToDo,
    ),
    TaskModel(
      uid: 5597583560,
      title: 'Design New Logo',
      content: 'Create a new logo for the rebranding project.',
      person: 'Chris Johnson',
      files: ['logo_sketch.png'],
      priority: Priority.High,
      date: DateTime.now().add(Duration(days: 10)),
      status: Status.ToDo,
    ),
    TaskModel(
      uid: 7671285708,
      title: 'Analyze Sales Data',
      content: 'Analyze the sales data for the last quarter.',
      person: 'Samantha Brown',
      files: ['sales_data.xlsx'],
      priority: Priority.Medium,
      date: DateTime.now().add(Duration(days: 11)),
      status: Status.InProgress,
    ),
    TaskModel(
      uid: 3935655886,
      title: 'Update Company Website',
      content: 'Update the content and layout of the website.',
      person: 'David Martinez',
      files: ['website_content.html'],
      priority: Priority.Low,
      date: DateTime.now().add(Duration(days: 12)),
      status: Status.InReview,
    ),
    TaskModel(
      uid: 9469126487,
      title: 'Plan Company Outing',
      content: 'Organize an outing for the team.',
      person: 'Rachel Williams',
      files: ['outing_ideas.pdf'],
      priority: Priority.Medium,
      date: DateTime.now().add(Duration(days: 13)),
      status: Status.Done,
    ),
    TaskModel(
      uid: 2100573798,
      title: 'Research New Technologies',
      content: 'Investigate new technologies for the next project.',
      person: 'Brian Davis',
      files: ['tech_research.docx'],
      priority: Priority.High,
      date: DateTime.now().add(Duration(days: 14)),
      status: Status.ToDo,
    ),
    TaskModel(
      uid: 5515464551,
      title: 'Train New Employees',
      content: 'Conduct training sessions for new hires.',
      person: 'Karen White',
      files: ['training_schedule.docx'],
      priority: Priority.Medium,
      date: DateTime.now().add(Duration(days: 15)),
      status: Status.InProgress,
    ),
    TaskModel(
      uid: 2398520171,
      title: 'Prepare Budget Report',
      content: 'Create the annual budget report.',
      person: 'Nancy Wilson',
      files: ['annual_budget.pdf'],
      priority: Priority.Low,
      date: DateTime.now().add(Duration(days: 16)),
      status: Status.InReview,
    ),
    TaskModel(
      uid: 4873074160,
      title: 'Launch Marketing Campaign',
      content: 'Launch a new marketing campaign for the product.',
      person: 'Mark Taylor',
      files: ['campaign_plan.pdf'],
      priority: Priority.Medium,
      date: DateTime.now().add(Duration(days: 17)),
      status: Status.Done,
    ),
    TaskModel(
      uid: 9918806257,
      title: 'Conduct Customer Surveys',
      content: 'Gather feedback from customers.',
      person: 'Laura Brown',
      files: ['customer_survey.pdf'],
      priority: Priority.High,
      date: DateTime.now().add(Duration(days: 18)),
      status: Status.ToDo,
    ),
    TaskModel(
      uid: 2708960507,
      title: 'Write Project Report',
      content: 'Complete the final report for the project.',
      person: 'Michael Green',
      files: ['project_report.docx'],
      priority: Priority.Medium,
      date: DateTime.now().add(Duration(days: 19)),
      status: Status.InProgress,
    )
  ];
}
