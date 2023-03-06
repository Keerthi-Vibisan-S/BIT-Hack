class RequestModel{
  String? _r_id;
  String? _stu_id;
  String? _from_lab_fac_id;
  String? _to_lab_fac_id;
  String? _from_approval;
  String? _to_approval;
  String? _head_id;
  String? _head_approval;
  String? _reason;

  get r_id => _r_id;

  set r_id(value) {
    _r_id = value;
  }

  get stu_id => _stu_id;

  get reason => _reason;

  set reason(value) {
    _reason = value;
  }

  get head_approval => _head_approval;

  set head_approval(value) {
    _head_approval = value;
  }

  get head_id => _head_id;

  set head_id(value) {
    _head_id = value;
  }

  get to_approval => _to_approval;

  set to_approval(value) {
    _to_approval = value;
  }

  get from_approval => _from_approval;

  set from_approval(value) {
    _from_approval = value;
  }

  get to_lab_fac_id => _to_lab_fac_id;

  set to_lab_fac_id(value) {
    _to_lab_fac_id = value;
  }

  get from_lab_fac_id => _from_lab_fac_id;

  set from_lab_fac_id(value) {
    _from_lab_fac_id = value;
  }

  set stu_id(value) {
    _stu_id = value;
  }

  RequestModel(
      this._r_id,
      this._stu_id,
      this._from_lab_fac_id,
      this._to_lab_fac_id,
      this._from_approval,
      this._to_approval,
      this._head_id,
      this._head_approval,
      this._reason);
}