String removeCEPSymbols(String? cep) {
  return cep!.replaceAll("-", "");
}
