#include <stdio.h>

void test_function(float);

int main()
{
    int figure = 42;
    float decimal = 3.14;
    test_function(decimal);
    return 0;
}

void test_function(float x)
{
    x = x + 10;
    return 0;
}
