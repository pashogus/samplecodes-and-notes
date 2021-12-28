public class Test
{
public static void main(String [] args)
{
   // new Test().display(1,"hi");
    new Test().display1("hi","World",1);
}

public void display(int x,String ...s)
{
    System.out.println(s[s.length-x]+"");
}
public void display1(String ...s,int x)
{
    System.out.println(s[s.length-x]+"");
}
}

/Test.java:15: error: varargs parameter must be the last parameter
public void display1(String ...s,int x)
 
-----------------------------------------------^
1 error


byte 	0
short 	0
int 	0
long 	0L
float 	0.0f
double 	0.0d
char 	'\u0000'
String (or any object)   	null
boolean 	false

--------------------------

The protected access modifier is accessible within package and outside the package but through inheritance only. The protected access modifier can be applied on the data member, method and constructor. It can't be applied on the class. It provides more accessibility than the default modifer.

Default: The access level of a default modifier is only within the package. It cannot be accessed from outside the package. ... Public: The access level of a public modifier is everywhere. It can be accessed from within the class, outside the class, within the package and outside the package.

----------------------

Arrays.sort():
Arrays.sort() is a method residing in Arrays class. It is used to sort the Array passed to it. It can be integer array, float array, String array, Array of objects etc.
The time complexity for this method is O(nlogn) as it runs TimSort in background. TimSort algorithm makes use of the Insertion sort and the MergeSort algorithms.
sort() method is best optimized, so if you use this method instead of writing your own, you'll get best results.
import java.util.Arrays;
public class JavaTest{
	public static void main(String[] args){
		String[] names = {"apples", "zen", "delhi"};
		Arrays.sort(names);
		for(String name: names)
			System.out.print(name+" ");
	}
}

//Output: 
//apple delhi zen

Arrays.sort() uses Dual-Pivot Quicksort algorithm for primitive types (int, String, double, ...) and Mergesort for array of objects. 

Collections.sort():

Collections.sort() is used to sort an object which extends List interface. ArrayList and LinkedList extend List interface, so we can sort them using Collections.sort.

Collections.sort() has a time complexity of O(nlogn) as it run merge sort in background
import java.util.*;
public class JavaTest{
	public static void main(String[] args){
		ArrayList<Integer> l = new ArrayList<>();
		l.add(15);
		l.add(2);
		l.add(43);
		l.add(0);

//by defaul;t collections.sort will sort in ascending order
		Collections.sort(l);
		for(int i=0; i<l.size(); i++)
			System.out.print(l.get(i)+" ");
		
		// Collections.sort(al, Collections.reverseOrder());
	}
}
	
//Output
//0 2 15 43

import java.util.*;

public class MyClass {
    public static void main(String args[]) {
     ArrayList<String> list = new ArrayList<String>();
     list.add("aAa");
     list.add("AAa");
     list.add("AaAa");
       list.add("2");
	    list.add("2"); //duplicate is accestable in array lsit but not in set
     Collections.sort(list);

      System.out.println("Sum of x+y = " + list);
    }
}

Sum of x+y = [2,2 AAa, AaAa, aAa]

--------------------

     System.out.println(list.hashCode());
          System.out.println("Hello".hashCode());
		  
127550961
69609650
Sum of x+y = [2, AAa, AaAa, a

------------

 CompareTo - lexigographicaly - dictionary Order

"abc".CompareTo("Zdf"); 
abc is before zdf , 25 position so value is -25

"bbc".CompareTo("adf")
bbc is after adf , so it is 1 position after it, s value is 1

      String str1 = "geeksforgeeks";
        String str2 = new String("geeksforgeeks");
        String str3 = new String("astha");
              String str4 = new String("bser");
        
        /*The value 0 if the argument is a string lexicographically equal to this string;
a value less than 0 if the argument is a string lexicographically greater than this string;
and a value greater than 0 if the argument is a string lexicographically less than this string. */

          // Checking if geeksforgeeks string
        // equates to geeksforgeeks object
        System.out.print("Difference of geeksforgeeks(obj) and geeksforgeeks(str) : ");
        System.out.println(str1.compareTo(str2));
  
        // Checking if geeksforgeeks string
        // equates to astha object
        System.out.print("Difference of astha(obj) and geeksforgeeks(str) : ");
        System.out.println(str1.compareTo(str3));
        
        System.out.println(str3.compareTo(str4));
		
		Difference of geeksforgeeks(obj) and geeksforgeeks(str) : 0
Difference of astha(obj) and geeksforgeeks(str) : 6
-1

--------------------------------

int i=100;
        if((i++ > 102) && (++i <105))
        {
            System.out.println("if " + i++);
        }
        else
        {
            //though if condition is not satisfied, because of first condition, and for the second consition it already incremented 
            //value by 1 , so i will be 101 now.
             System.out.println("else " + i);
        }
    }
	
	------------------------
	
	method overloading with different parameter , but void doit() is same as String doit()
	
	1.overloading is done by etiher by number of Arguements
	2.overloading is done by changing  data type of Arguements
		2.overloading is not done by return type
	
	class Adder{  
static int add(int a,int b){return a+b;}  
static int add(int a,int b,int c){return a+b+c;}  
}

overloading is done by changing  data type of Arguements
class Adder{  
static int add(int a, int b){return a+b;}  
static double add(double a, double b){return a+b;}  
}  
	
	------------------------------
	
	  public void doit() //same number of arguments 
    {
        
    } 
    
    public String doit() // same number of arguemnts  , so at this point it will throw an error as method is already exists
    {
    return "hello";
    }
    
    public Double doit(int x) 
    {
       return 2.0;
    }
  
---------------------------------  
    public String doit1(int x) //not an overloading , both methods has one arguments.
    {
    return "hello";
    }
    
    public Double doit1(int x) // will get error at this point
    {
       return 2.0;
    }

----------------------------
Numbers are so important in Java that six of the eight primitive data types are numeric types. 
There are both integer and floating point primitive types. Integer types have no fractional part; floating point types have a fractional part. 
In the tables, E means "ten to the power of". So 3.5E38 means 3.5 x 10power38
 For example, all values represented using the short data type use 16 bits. The value zero (as a short) uses 16 bits and the value thirty thousand uses 16 bits.

All values represented using the long data type use 64 bits. The value zero (as a long) uses 64 bits, the value thirty thousand uses 64 bits, and the value eight trillion uses 64 bits.

Values that are large in magnitude (negative or positive) need more bits to be represented. This is similar to writing out numbers on paper: large numbers need more digits. If a value needs more bits than a particular data type uses, then it cannot be represented using that data type. 


Integer Primitive Data Types
Type	Size	Range
byte	8 bits	-128 to +127
short	16 bits	-32,768 to +32,767
int	32 bits	-2 billion to +2 billion (approximately)
long	64 bits	-9E18 to +9E18 (approximately)

Floating Point Primitive Data Types
Type	Size	Range
float	32 bits	-3.4E38 to +3.4E38
double	64 bits	-1.7E308 to 1.7E308

Primitive Type	Wrapper class
boolean	Boolean
char	Character
byte	Byte
short	Short
int	Integer
long	Long
float	Float
double	Double

----------------------

he java.lang.ClassCastException is one of the unchecked exception in Java. It can occur in our program when we tried to convert an object of one class type into an object of another class type.
When will be ClassCastException is thrown

    When we try to cast an object of Parent class to its Child class type, this exception will be thrown.
    When we try to cast an object of one class into another class type that has not extended the other class or they don't have any relationship between them.
	
	class ParentTest {
   String parentName;
   ParentTest(String n1){
      parentName = n1;
   }
   public void display() {
      System.out.println(parentName);
   }
}
class ChildTest extends ParentTest {
   String childName;
   ChildTest(String n2) {
      super(n2);
      childName = n2;
   }
   public void display() {
      System.out.println(childName);
   }
}
public class Test {
   public static void main(String args[]) {
      ChildTest ct1 = new ChildTest("Jai");
      ParentTest pt1 = new ParentTest("Adithya");
      pt1 = ct1;
      pt1.display();

      ParentTest pt2 = new ParentTest("Sai");
      ChildTest ct2 = (ChildTest)pt2;
   }
}

Jai
Exception in thread "main" java.lang.ClassCastException: ParentTest cannot be cast to ChildTest
        at Test.main(Test.java:30)
		
----------------------------------
		
import java.util.*;

public class MyClass {
    public static void main(String args[]) {
        
     HashMap<Integer,String> test = new HashMap<Integer,String>();
     test.put(2,"test2");
      test.put(1,"test1");
       test.put(3,"test2");
        test.put(null,"nullvalue"); //permits one null value
       
        LinkedHashMap<Integer,String> testing = new LinkedHashMap<Integer,String>();
     testing.put(2,"test2");
      testing.put(1,"test1");
       testing.put(3,"test2");
        testing.put(null,"nullvalue"); //permits one value
       
       HashSet<String> testset = new HashSet<String>();
     testset.add("test2");
      testset.add("test1");
       testset.add("test2");
       testset.add(null);
       
       LinkedHashSet<String> testsetlinked = new LinkedHashSet<String>();
     testsetlinked.add("test2");
      testsetlinked.add("test1");
       testsetlinked.add("test2"); //no duplicates as object is the key for internal Hash Map which Hashset Uses
       testsetlinked.add(null);   //permits one null value
        
       System.out.println("Hash Map"+test);
       System.out.println("Linked Hash Map"+testing);
        System.out.println("Hash Set"+testset);
        System.out.println("Linked Hash Set"+testsetlinked);
       
    }
}

Hash Map{null=nullvalue, 1=test1, 2=test2, 3=test2}
Linked Hash Map{2=test2, 1=test1, 3=test2, null=nullvalue}
Hash Set[null, test2, test1]
Linked Hash Set[test2, test1, null]


-------------------------------