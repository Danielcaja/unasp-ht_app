enum CategoryEnum {
  None,
  College,
  HighSchool,
  Church,
  Internship,
  External,
  Admin
}

String stringValue(int index) {
  String r = '';

  switch (index) {
    case 0:
      r = '';
      break;
    case 1:
      r = 'Ensino Superior';
      break;
    case 2:
      r = 'Ensino Básico';
      break;
    case 3:
      r = 'Comunidade';
      break;
    case 4:
      r = 'Internato';
      break;
    case 5:
      r = 'Externato';
      break;
    case 6:
      r = 'Admin';
      break;
  }

  return r;
}
