class SpecialLab
{
  String? _labid;
  String? _labname;
  String? _labheadid;
  String? _studentsCount;

  String? get labid => _labid;

  set labid(String? value) {
    _labid = value;
  }

  String? get labname => _labname;

  String? get labheadid => _labheadid;

  set labheadid(String? value) {
    _labheadid = value;
  }

  set labname(String? value) {
    _labname = value;
  }


  String? get studentsCount => _studentsCount;

  set studentsCount(String? value) {
    _studentsCount = value;
  }

  SpecialLab(this._labid, this._labname, this._labheadid);
  SpecialLab.forAdminPage(this._labid,this._labname,this._studentsCount);
}