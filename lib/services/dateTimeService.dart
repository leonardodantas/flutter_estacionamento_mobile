class DateTimeService {
  
  int gerarDataComUmaHoraAdicional() {
    DateTime data = new DateTime(new DateTime.now().year, new DateTime.now().month, new DateTime.now().day, new DateTime.now().hour + 2, new DateTime.now().minute);
    return data.millisecondsSinceEpoch;
  }

  int gerarDataAtual() {
    DateTime data = new DateTime(new DateTime.now().year, new DateTime.now().month, new DateTime.now().day, new DateTime.now().hour , new DateTime.now().minute);
    return data.millisecondsSinceEpoch;
  }

  bool verificarValidadeCartao(int dataCartao) {
      int dataAtual = gerarDataAtual();
      int compareTo = dataCartao.compareTo(dataAtual); 

      if(compareTo > 0)
        return true;
      if(compareTo < 0)
        return false; 
      return false;
  }
}