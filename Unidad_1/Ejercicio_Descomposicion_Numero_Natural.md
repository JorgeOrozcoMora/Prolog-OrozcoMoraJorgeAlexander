# Ejercicio Descomposiciones de un Numero Natural
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---
~~~
import java.util.Scanner;

public class EjercicioDescomposicion {

    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.print("Ingresa un número: ");
        int numero=sc.nextInt();
        sc.close();

        int[] resultado=new int[numero];
        descomponer(numero, numero, resultado, 0);
    }

    // Función para descomponer el número
    public static void descomponer(int n, int max, int[] resultado, int indice) {
        if (n==0) {
            imprimirResultado(resultado, indice);
            return;
        }

        for (int i=Math.min(n, max);i>=1;i--) {
            resultado[indice]=i; // agregamos el número en el índice actual
            descomponer(n-i, i, resultado, indice + 1);
        }
    }

    // Función para imprimir la descomposición
    public static void imprimirResultado(int[] resultado, int indice) {
        for (int i=0;i<indice;i++) {
            System.out.print(resultado[i]);
            if (i<indice-1) {
                System.out.print("+");
            }
        }
        System.out.println();
    }
}

~~~

**Explicacion del Codigo:** Lo primero que hace el programa es pedir al usuario que ingrese un número que quiera descomponer y lo guarda en la variable numero. Después se crea un arreglo donde se van a almacenar los números de cada descomposición. La función descomponer se encarga de encontrar todas las formas en que ese número puede escribirse como suma de otros números menores o iguales. Funciona probando diferentes números para ir construyendo cada combinación. Cuando lo que queda por descomponer llega a cero, significa que se ha completado una combinación válida, y entonces se imprime. Para elegir los números, la función empieza desde el mayor posible en ese momento y va descendiendo hasta 1, colocándolos en el arreglo que guarda la combinación actual. Luego se llama a sí misma para continuar armando la suma con el número restante, avanzando en el arreglo. De esta manera, explora todas las opciones posibles y muestra cada combinación completa antes de probar la siguiente, generando todas las descomposiciones sin repetir sumas equivalentes. Finalmente, se recorre el arreglo hasta el índice actual y se muestran todos los números separados por un signo de "+".