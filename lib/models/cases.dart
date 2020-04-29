class HfCase {
  String _caseTitle;
  String _nokTitle;
  String _nokType;

  HfCase(this._caseTitle, this._nokType, this._nokTitle);

  HfCase.map(dynamic obj) {
    this._caseTitle = obj['caseTitle'];
    this._nokType = obj['nokType'];
    this._nokTitle = obj['nokTitle'];
  }
//#region getters

  String get caseTitle => _caseTitle;
  String get nokTitle => _nokTitle;
  String get nokType => _nokType;

//#endregion getters
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['caseTitle'] = _caseTitle;
    map['nokType'] = _nokType;
    map['nokTitle'] = _nokTitle;
    return map;
  }

  HfCase.fromMap(Map<String, dynamic> map) {
    this._caseTitle = map['caseTitle'];
    this._nokType = map['nokType'];
    this._nokTitle = map['nokTitle'];
  }
}
