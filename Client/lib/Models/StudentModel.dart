class StudentModel{
  String? _stu_id;
  String? _stu_name;
  String? _stu_email;
  String? _stu_contact;
  String? _lab_id;
  String? _faculty_id;
  String? _count;
  String? _last_updated_date;
  String? _dept;
  String? _year;

  get stu_id => _stu_id;

  set stu_id(value) {
    _stu_id = value;
  }

  get stu_name => _stu_name;

  set stu_name(value) {
    _stu_name = value;
  }

  get stu_email => _stu_email;

  set stu_email(value) {
    _stu_email = value;
  }

  get stu_contact => _stu_contact;

  set stu_contact(value) {
    _stu_contact = value;
  }

  get lab_id => _lab_id;

  set lab_id(value) {
    _lab_id = value;
  }

  StudentModel(
      this._stu_id,
      this._stu_name,
      this._stu_email,
      this._stu_contact,
      this._lab_id,
      this._faculty_id,
      this._count,
      this._last_updated_date,
      this._dept,
      this._year);

  get faculty_id => _faculty_id;

  set faculty_id(value) {
    _faculty_id = value;
  }

  get count => _count;

  set count(value) {
    _count = value;
  }

  get last_updated_date => _last_updated_date;

  set last_updated_date(value) {
    _last_updated_date = value;
  }

  get dept => _dept;

  set dept(value) {
    _dept = value;
  }

  get year => _year;

  set year(value) {
    _year = value;
  }
}