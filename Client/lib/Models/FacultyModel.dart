class FacultyOfLab
{
  String? _fac_id;
  String? _fac_name;
  String? _fac_email;
  String? _fac_phNo;
  String? _lab_id;

  String? get labid => _lab_id;

  set labid(String? value) {
    _lab_id = value;
  }


  String? get fac_id => _fac_id;

  set fac_id(String? value) {
    _fac_id = value;
  }

  String? get fac_name => _fac_name;

  set fac_name(String? value) {
    _fac_name = value;
  }

  String? get fac_email => _fac_email;

  set fac_email(String? value) {
    _fac_email = value;
  }

  String? get fac_phNo => _fac_phNo;

  set fac_phNo(String? value) {
    _fac_phNo = value;
  }

  String? get lab_id => _lab_id;

  set lab_id(String? value) {
    _lab_id = value;
  }

  FacultyOfLab(this._fac_id, this._fac_name, this._fac_email,
      this._fac_phNo, this._lab_id);

  FacultyOfLab.empty();
}
