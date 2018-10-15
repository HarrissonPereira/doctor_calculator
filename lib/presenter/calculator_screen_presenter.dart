
class CalculatorScreenPresenter
{

  adicionar(int num1, int num2)
  {
    return num1 + num2;
  }

  subtrair(num1, num2)
  {
    return num1 - num2;
  }

  multiplicar(num1, num2)
  {
    return num1 * num2;
  }

  dividir(num1, num2)
  {
    return num2 != 0 ? num1/num2 : "Não é possível dividir por zero!";
  }

}