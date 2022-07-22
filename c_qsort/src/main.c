#include <stdio.h>

#define NUMS_SIZE 10

void print_arr(const int *arr, size_t size);

void qsort(int *arr, int p, int r);
int _part(int *arr, int p, int r);
void swap(int *a, int *b);

int main(void)
{   
    int numbers[NUMS_SIZE] = {
        1, 34, 56, 24, 89,
        13, 37, 32, 67, 56
    };

    puts("numbers:");
    print_arr(numbers, NUMS_SIZE);

    qsort(numbers, 0, NUMS_SIZE - 1);

    puts("sorted numbers:");
    print_arr(numbers, NUMS_SIZE);

    return 0;
}

void print_arr(const int *arr, size_t size)
{
    for (int i = 0; i < size; i++)
        printf("%d ", arr[i]);

    putc('\n', stdout);
}

void qsort(int *arr, int p, int r)
{
    if (p < r)
    {
        int q = _part(arr, p, r);
        qsort(arr, p, q - 1);
        qsort(arr, q + 1, r);
    }
}

int _part(int *arr, int p, int r)
{
    int i = p - 1;

    for (int j = p; j < r; j++)
    {
        if (arr[j] <= arr[r])
            swap(arr + (++i), arr + j);
    }

    swap(arr + i + 1, arr + r);
    return i + 1;
}

void swap(int *a, int *b)
{
    int tmp = *a;
    
    *a = *b;
    *b = tmp;
}