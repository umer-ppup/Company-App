import 'dart:convert';

AttendanceModel attendanceModelFromJson(String str) =>
    AttendanceModel.fromJson(json.decode(str));

String attendanceModelToJson(AttendanceModel data) =>
    json.encode(data.toJson());

class AttendanceModel {
  AttendanceModel({
    this.empId,
    this.empName,
    this.attendanceHistory,
  });

  String empId;
  String empName;
  List<AttendanceHistory> attendanceHistory;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        empId: json["emp_id"],
        empName: json["emp_name"],
        attendanceHistory: List<AttendanceHistory>.from(
            json["attendanceHistory"]
                .map((x) => AttendanceHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "emp_name": empName,
        "attendanceHistory":
            List<dynamic>.from(attendanceHistory.map((x) => x.toJson())),
      };
}

class AttendanceHistory {
  AttendanceHistory({
    this.id,
    this.date,
    this.attendance,
  });

  String id;
  String date;
  String attendance;

  factory AttendanceHistory.fromJson(Map<String, dynamic> json) =>
      AttendanceHistory(
        id: json["id"],
        date: json["date"],
        attendance: json["attendance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "attendance": attendance,
      };
}
