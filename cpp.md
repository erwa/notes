### Operator overloading for increment (pre-increment and post-increment)

```
struct X
{
    // pre-increment
    X& operator++()
    {
        // actual increment takes place here
        return *this;
    }

    // post-increment
    X operator++(int)
    {
        X tmp(*this); // copy
        operator++(); // pre-increment
        return tmp;   // return old value
    }
};
```

https://en.cppreference.com/w/cpp/language/operators#Increment_and_decrement


### Reference types

```
int a = 5;
int& r_a = a; // reference to int

extern int& r_b; // reference to int

// function that returns a reference to int
int& Foo();

// function that takes a parameter that is
// a reference to int
void Bar(int& r_p);
```

Differences from pointers:

* cannot directly refer to reference; usages of its name refer to referenced object
* references cannot be reassigned to refer to something else
* references cannot be null
* references cannot be uninitialized

https://en.wikipedia.org/wiki/Reference_(C%2B%2B)


### Destructor

```
class String
{
private:
    char *s;
    int size;
public:
    String(char *); // constructor
    ~String();      // destructor
};

String::String(char *c)
{
    size = strlen(c);
    s = new char[size+1];
    strcpy(s,c);
}

String::~String()
{
    delete []s;
}
```

https://www.geeksforgeeks.org/destructors-c/


### Make vs. CMake

Make a build system. CMake generates build files such as Makefiles from a CMakeLists.txt file.

https://stackoverflow.com/questions/25789644/difference-between-using-makefile-and-cmake-to-compile-the-code


### Capture list and parameter list

```
#include <iostream>
using namespace std;

int main() {

  const auto addSome = [](double some) {
    // [some] is a capture list
    // (double val) is a parameter list
    return [some](double val) { return some+val; } ;
  };

  const auto addFive = addSome(5);

  std::cout << addFive(2) << std::endl;
}
```

https://stackoverflow.com/questions/28669941/c-lambdas-capture-list-vs-parameter-list


### Variable initialization rules

https://stackoverflow.com/questions/2218254/variable-initialization-in-c


### Parameterized constructor

```
// CPP program to illustrate
// parameterized constructors
#include<iostream>
using namespace std;

class Point
{
    private:
        int x, y;
    public:
        // Parameterized Constructor
        Point(int x1, int y1)
        {
            x = x1;
            y = y1;
        }

        int getX()
        {
            return x;
        }
        int getY()
        {
            return y;
        }
    };

int main()
{
    // Constructor called
    Point p1(10, 15);

    // Access values assigned by constructor
    cout << "p1.x = " << p1.getX() << ", p1.y = " << p1.getY();

    return 0;
}
```

https://www.geeksforgeeks.org/constructors-c/


### Base class constructor

Called before subclass constructor is called. If the base class constructor has no arguments, it is called automatically. Otherwise, you must explicitly specify the constructor.

```
class SuperClass
{
    public:

        SuperClass(int foo)
        {
            // do something with foo
        }
};

class SubClass : public SuperClass
{
    public:

        SubClass(int foo, int bar)
        : SuperClass(foo)    // Call the superclass constructor in the subclass' initialization list.
        {
            // do something with bar
        }
};
```

https://stackoverflow.com/questions/120876/what-are-the-rules-for-calling-the-superclass-constructor


### Colon after constructor

Used for initialization. Can initialize member variables or call base class constructors.

```
class Demo
{
    // only time you can change a const member variable
    Demo(int& val) : m_val(val)
     {
     }
private:
    const int& m_val;
};
```

https://stackoverflow.com/questions/2785612/c-what-does-the-colon-after-a-constructor-mean


### `explicit` constructors

```
class A
{  public:
   explicit A();
   explicit A(int);
   explicit A(const char*, int = 0);
};
```

Adding `explicit` PREVENTS the following:

```
// Not allowed when `explicit` is used
A c = 1;
A d = "Venditti";
```

https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.3.0/com.ibm.zos.v2r3.cbclx01/explicit_keyword.htm


### `const` after a method

```
void attack() const
```

Means method does not modify the containing object.

https://www.prismnet.com/~mcmahon/Notes/const_part2.html

https://stackoverflow.com/questions/21187965/c-code-explanation-for-method-prototype-with-const-0/21187983


### `= 0`

```
class Weapon
{
  public:
    virtual void attack() const = 0;
};
```

`= 0` used with `virtual` to indicate function is `pure virtual`, meaning it must be overridden by subclass (no default implementation).

https://stackoverflow.com/questions/21187965/c-code-explanation-for-method-prototype-with-const-0/21187983


### How to read type definitions

```
int* - pointer to int
int const * - pointer to const int
int * const - const pointer to int
int const * const - const pointer to const int

// first const can be on either side of the type so
const int * == int const *
const int * const == int const * const
```



https://stackoverflow.com/questions/1143262/what-is-the-difference-between-const-int-const-int-const-and-int-const


### Nested classes

Have access to all names enclosing class has access to but is otherwise independent. No access to `this` pointer of enclosing class.

https://en.cppreference.com/w/cpp/language/nested_types


### Inheritance

```
class derived_class_name: public base_class_name
{ /*...*/ };
```

"public" is the accessibility set on members inherited from `base_class_name`.

http://www.cplusplus.com/doc/tutorial/inheritance/#inheritance


### Inserting into map

```
#include <map>

int main() {
  std::map<int, int> myMap;
  myMap[1] = 1;
}
```

http://stackoverflow.com/questions/4286670/preferred-idiomatic-way-to-insert-into-a-map


### Hello, world!

```
#include <iostream>

int main() {
  std::cout << "Hello, world!\n";
}
```

http://www2.latech.edu/~acm/helloworld/c++.html

Compile and run

```
g++ Main.cpp
a.out
```