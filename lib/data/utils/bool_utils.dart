String convertFromBoolean(int has) {
  String result;

  if (has == 0) {
    result = "Não";
  } else {
    result = "Sim";
  }

  return result;
}
