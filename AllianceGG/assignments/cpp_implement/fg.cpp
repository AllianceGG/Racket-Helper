#include <iostream>
using namespace std;

template<typename T1, typename T2>
class g
{
public:
    g(T1 a_): a(a_) { }
    T2 operator() (const T2& b)
    {
        return b + a;
    }
private:
    T1 a;
};

template <typename T1, typename T2>
class f
{
public:
    T2 operator() (const T2& y)
    {
        return g<T1, T2>(x)(y);
    }
    f(T1 x_): x(x_) { }
private:
    T1 x;
};

int main()
{
   cout << f<int,int>(7)(9) << endl;   //16
   cout << f<string,string> (" hello!")("world")  <<endl; // world hello!
   cout << f<char,string> ('!')("world") << endl;


   return 0;    //world!
}
