### Print type of variable

```
cout << typeid(x).name() << endl;
```

https://stackoverflow.com/questions/81870/is-it-possible-to-print-a-variables-type-in-standard-c


### Sort vector

```
#include <algorithm>
#include <iostream>
#include <vector>

vector<int> v = { 10, 9, 8, 6, 7, 2, 5, 1 };
sort(v.begin(), v.end());
```

There's also `std::stable_sort` for stable sorting (equal elements maintain relative order).

https://www.tutorialspoint.com/sorting-a-vector-in-cplusplus


### bits/stdc++.h

A header file that basically includes all standard C++ libraries. Useful to save time spent importing libraries one-by-one.

https://www.geeksforgeeks.org/bitsstdc-h-c/


### Matrices / matrixes / 2D arrays

Use vector of vector: `vector<vector<...>>`.

```
int foo(vector<vector<int>> &matrix) {
  ...
}

vector<vector<int>> mat = {
  {0,1,0},
  {0,1,0},
  {0,1,1},
  {0,0,1},
  {0,0,1},
  {0,0,0}
};

foo(mat);
```

https://stackoverflow.com/questions/10164263/how-to-pass-two-dimensional-array-of-an-unknown-size-to-a-function
https://stackoverflow.com/questions/758118/c-vector-literals-or-something-like-them


### Operator precedence

Highest to lowest

1) :: (scope resolution)
2) `x[]` (subscripting) (R-to-L)
3) `*x` (pointer dereferencing) (L-to-R)

https://en.cppreference.com/w/cpp/language/operator_precedence


### Strings / string manipulation

```
string s = "strongbad";
// substring starting at index 3, length 4.
cout << s.substr(3,4) << endl;

// uppercase string
for (auto &c : s) {
  cout << toupper(c);
}

// using Boost
#include <boost/algorithm/string.hpp>
#include <string>

std::string str = "Hello World";

// these return void
boost::to_upper(str);
boost::to_lower(str);
```


### Exponentiation

```
#include <cmath>

pow(2,3);
```


### Queues / heaps

```
#include <queue>

// priority queue (uses top())
priority_queue<int> q;
q.push(1);
q.push(2);
cout << "size: " << q.size() << endl;
cout << "top: " << q.top() << endl;
cout << "size: " << q.size() << endl;
q.pop(); // void
cout << "size: " << q.size() << endl;
cout << "top: " << q.top() << endl;

// regular queue (uses front())
queue<int> q;
q.push(1);
q.push(2);
cout << "size: " << q.size() << endl;
cout << "front: " << q.front() << endl;
cout << "size: " << q.size() << endl;
q.pop(); // void
cout << "size: " << q.size() << endl;
cout << "front: " << q.front() << endl;
```

Cannot iterate over a queue by default.

https://stackoverflow.com/questions/1259099/stdqueue-iteration

Min heap:

```
#include <queue>
priority_queue<int,vector<int>,greater<int> > q;
```

https://stackoverflow.com/questions/2786398/is-there-an-easy-way-to-make-a-min-heap-in-c


### Sets

```
#include <set>

set<int> s;
s.insert(1);
s.insert(2);
if (s.find(1) != s.end()) {
  cout << "found 1 in set" << endl;
}
s.erase(1);
if (s.find(1) == s.end()) {
  cout << "1 removed from set" << endl;
}
cout << s.size() << " elements in set" << endl;
s.insert(3);
s.insert(1);
for (auto i : s) {
  cout << i << " ";
}
cout << endl;
```

http://www.cplusplus.com/reference/set/set/


### Aggregate classes

No user-declared constructors, no private or protected non-static data members, no base classes, no virtual functions. Can be brace-initialized with comma-separated values.

```
// code works for C and C++
struct C {
  int a;
  double b;
};

struct D {
  int a;
  double b;
  C c;
};

// initialize an object of type C with an initializer-list
C c = {1, 2.0};

// D has a sub-aggregate of type C. In such cases initializer-clauses can be nested
D d = {10, 20.0, {1, 2.0}};
```


### Classes

```
class C {
public:
  int x;
};

C c; // Compiler-provided default constructor is used
// Here `c.x` contains garbage

C c = C(); // does zero-initialization

C c = C(); // Does not use default constructor for `C()` part
           // Uses value-initialization feature instead
assert(c.x == 0);

C *pc = new C(); // Does not use default constructor for `C()` part
                 // Uses value-initialization feature instead
assert(pc->x == 0);

C d{}; // C++11 style aggregate initialization.
assert(d.x == 0);
```

https://stackoverflow.com/questions/2417065/does-the-default-constructor-initialize-built-in-types


### Structs

Members are public by default (whereas members are private by default in classes).

```
struct C
{
    int x;
    int y;
};

C  c = {0}; // Zero initialize POD (plain old data)

C  c = C();      // Zero initialize using default constructor
C  c{};          // Latest versions accept this syntax.
C* c = new C();  // Zero initialize a dynamically allocated object.

// Note the difference between the above and the initialize version of the constructor.
// Note: All above comments apply to POD structures.
C  c;            // members are random (same is true for class)
C* c = new C;    // members are random (more officially undefined).

C c(); // Unfortunately this is not a variable declaration.
C c{}; // This syntax was added to overcome this confusion.

// The correct way to do this is:
C c = C();
```

https://stackoverflow.com/questions/5914422/proper-way-to-initialize-c-structs


### `this` keyword

For class of type X, `this` pointer has type `X*`.

```
void MyColor::Set(uint8_t r, uint8_t g, uint8_t b) {
    this->r = r;
    this->g = g;
    this->b = b;
}
```

https://www.geeksforgeeks.org/this-pointer-in-c/
https://www.cplusplus.com/forum/general/13043/


### Pairs

```
pair<int,int> p(1,2);
cout << p.first << " " << p.second << endl;
p.first = 3;
cout << p.first << endl;
```


### Iterators

Must support at least `++` (increment) and `*` (dereference) operators.

http://www.cplusplus.com/reference/iterator/


### Lists

Like vectors except you can't access specific indices directly (need to use iterator from known position like beginning or end). Cannot use [] indexing. Can push_front() though, unlike a vector.

To modify while iterating:

```
std::list<item*>::iterator i = items.begin();
while (i != items.end())
{
    bool isActive = (*i)->update();
    if (!isActive)
    {
        items.erase(i++);  // alternatively, i = items.erase(i);
    }
    else
    {
        other_code_involving(*i);
        ++i;
    }
}
```

Initializer list:

```
// std::initializer_list
auto auto_words = { "foo", "bar", "cat" };
```

https://stackoverflow.com/questions/20368195/stdinitializer-list-that-can-be-sorted

Array of constants. Cannot be std:sort'd.


### Vectors

```
// C++ program to illustrate the
// iterators in vector
#include <iostream>
#include <vector>

using namespace std;

int main()
{
    vector<int> g1;

    for (int i = 1; i <= 5; i++)
        g1.push_back(i);

    cout << "Output of begin and end: ";
    for (auto i = g1.begin(); i != g1.end(); ++i) {
        cout << *i << " " << (i - g1.begin());  // last bit gives index
    }

    std::vector<int> v;
    for (auto i :  v ) {
        ...
    }

    for (decltype(v.size()) i = 0; i < v.size(); ++i) {
        // ...
    }

    for (vector<int>::size_type i = 0; i < v.size(); ++i) {
        // ...
    }

    for (size_t i = 0; i < v.size(); i++) ...
}
```

https://www.geeksforgeeks.org/vector-in-cpp-stl/

Lookup (v[i] or v.at(i)) is constant-time.

https://stackoverflow.com/questions/181693/what-are-the-complexity-guarantees-of-the-standard-containers
http://www.cplusplus.com/reference/vector/vector/operator[]/


### Temporary objects

Created when prvalue is converted to glvalue.

https://en.cppreference.com/w/cpp/language/lifetime#Temporary_object_lifetime


### Using namespaces

```
using namespace std;

// allows us to use
cout << "hi";

// instead of
std::cout << "hi";
```

https://medium.com/breaktheloop/why-using-namespace-std-is-used-after-including-iostream-dc5ae45db652


### Include without .h

Include files can have any extension in both C and C++. C++ standard library headers have no extension. C standard library headers have a .h extension.

https://stackoverflow.com/questions/2799682/c-includes-with-and-without-h


### Output (<<)

```
cout <<  "x = ";

// same as

put(cout, "x = ");

// printing a fixed number of decimal places
#include <iomanip>  // manip for manipulation

// print 1 decimal place
cout << fixed << setprecision(1) << 1.0;

// save and restore formatting
ios state(nullptr);
state.copyfmt(cout); // save current formatting
cout << fixed << ... // other formatting options
cout.copyfmt(state); // restore old formatting

```

Once format state is passed to cout, it stays that way until changed.

https://stackoverflow.com/questions/5907031/printing-the-correct-number-of-decimal-points-with-cout
https://docs.microsoft.com/en-us/cpp/text/string-and-i-o-formatting-modern-cpp


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

Must be initialized where they are created. Uses of reference refer to actual object (there is an implicit dereference of a pointer), not the address.

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

Can use function that returns reference type on left-hand side of assignment:

```
double vals[] = {10.1, 12.6, 33.1, 24.1, 50.0};

double& setValues( int i ) {
   return vals[i];   // return a reference to the ith element
}

setValues(1) = 20.23; // change 2nd element
setValues(3) = 70.8;  // change 4th element
```


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
    delete[] s; // invokes destructor for each element of array
}
```

Destructor called automatically when object goes out-of-scope or explicitly destroyed via call to `delete`.

http://www.cplusplus.com/reference/new/operator%20delete[]/
https://stackoverflow.com/questions/18046571/c-delete-array-memory-without-brackets-still-works
https://docs.microsoft.com/en-us/cpp/cpp/destructors-cpp
https://www.geeksforgeeks.org/destructors-c/


### Make vs. CMake

Make a build system. CMake generates build files such as Makefiles from a CMakeLists.txt file.

https://stackoverflow.com/questions/25789644/difference-between-using-makefile-and-cmake-to-compile-the-code


### Function templates

```
template <typename T> // could also use template <class T>
void print(T thing) {
  cout << thing << endl;
}

print("hi"); // or print<string>("hi")
print(123);  // or print<int>(123)
```

http://www.cplusplus.com/doc/oldtutorial/templates/
https://stackoverflow.com/questions/2023977/difference-of-keywords-typename-and-class-in-templates

Omitting template parameters: can only do so at end, not beginning or middle. Can omit them when compiler can infer type.

```
template<typename T, typename U> void f(T t) {}
template<typename T, typename U> void g(U u) {}

int main() {
    f<int>(5);      // NOT LEGAL
    f<int, int>(5); // LEGAL

    g<int>(5);      // LEGAL
    g<int, int>(5); // LEGAL

    return 0;
}
```

https://stackoverflow.com/questions/1146048/omitting-arguments-in-c-templates


### auto type / auto keyword

`auto` is a placeholder for a type. Means type will be inferred from the initialization expression. Can modify with pointer (`*`), reference (`&`), `const`, `volatile`.

https://docs.microsoft.com/en-us/cpp/cpp/auto-cpp

```
for (auto x : vec) ...        // when you want to work with a copy
for (auto &x : vec) ...       // when you want to modify
for (auto const &x : vec) ... // when you don't want to copy or modify
```

https://stackoverflow.com/questions/15176104/c11-range-based-loop-get-item-by-value-or-reference-to-const

To use auto to infer array type

```
template<typename T, int N> using raw_array = T[N];

auto &&z = raw_array<int,5>{};
```

https://stackoverflow.com/questions/16949016/how-to-declare-array-with-auto


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

```
// all legal
int i(3);
int i{3};
int i = 3;

// https://en.cppreference.com/w/cpp/language/zero_initialization
int i{}; // zero initialization

int a[10] = {} // all zeroed
int a[10] = {1,2} // all zeroed except first two elements
```

https://stackoverflow.com/questions/2218254/variable-initialization-in-c


### new operator / new keyword

Requests memory on heap, object is created there, and address (pointer) of object is returned.

```
class car
{
    string name;
    int num;

    public:
        car(string a, int n)
        {
            cout << "Constructor called" << endl;
            this ->name = a;
            this ->num = n;
        }
}

int main()
{
    // Using new keyword
    car *p = new car("Honda", 2017);
    p->display();
}
```

https://www.geeksforgeeks.org/new-vs-operator-new-in-cpp/


### Default constructor

```
Rectangle::Rectangle () {
  width = 5;
  height = 5;
}

Rectangle rect;     // default constructor called
Rectangle rect2();  // error
```

http://www.cplusplus.com/doc/tutorial/classes/#overloading_constructors


### Copy constructor / move constructor

```
// copy constructor takes T& (reference type)
foo(foo const& other)
{
    this->length = other.length;
    this->ptr = new int[other.length];
    copy(other.ptr, other.ptr + other.length, this->ptr);
}

// move constructor takes T&& (rvalue reference)
foo(foo&& other)
{
   this->length = other.length;
   this->ptr = other.ptr;
   other.length = 0;
   other.ptr = nullptr;
}
```

https://stackoverflow.com/questions/5481539/what-does-t-double-ampersand-mean-in-c11


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


### HashMap / unordered map

```
#include <unordered_map>

unordered_map<int, int> m;
m[0] = 1;
m[1] = 2;
cout << m.size();
if (m.find(i) != m.end()) {
  cout << "found " << i << " in m";
}
m.erase(0);
```

Using pair as key:

```
unordered_map<pair<int,int>,bool,boost::hash<pair<int,int>>> m;
m.insert({pair<int,int>(1,2), true});
m[pair<int,int>(3,4)] = false;

for (auto &e : m) {
  cout << "(" << e.first.first << "," << e.first.second << ") -> " << e.second << endl;
}
```

https://www.techiedelight.com/use-std-pair-key-std-unordered_map-cpp/


### Map / ordered map

```
#include <map>

int main() {
  std::map<int, int> myMap;
  myMap[1] = 1;

  for (auto e = m.rbegin(); e != m.rend(); e++) {
    cout << e->first; // key
    cout << e->second; // value
  }
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