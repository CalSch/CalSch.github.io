+++
#date='2025-05-25T21:41:33'
draft=false
title='Fan-C'
+++

Fan-C is a C header file that allows you to make more readable code.

Let's start with an example, here's a program that determines if you are eligible to run for US president (if you're 35 or older)
```c
#include <stdio.h>

int main() {
    int age;
    printf("Age: ");
    scanf("%d",&age);

    bool canBePresident = false;

    if (age >= 35) {
        canBePresident = true;
    } else {
        printf("You can't be the president :(\n");
        return 1;
    }

    printf("You can be the president!\n");

    return 0;
}
```

Is this readable? Not as much as it could be.
By using Fan-C, your code could look like this:
```c
#include <stdio.h>
#include "fanc.h"

integer main() {
    integer age;
    printf("Age: ");
    scanf("%d",&age);

    boolean canBePresident = false;

    perchance (age is_greater_than_or_equal_to 35) {
        canBePresident = true;
    } otherwise {
        printf("You can't be the president :(\n");
        bestow 1;
    }

    printf("You can be the president!\n");

    bestow 0;
}
```

Isn't it beautiful?

Also, the file is so short I can just put it here:
```cs
// Keywords

#define perchance if
#define otherwise else
#define whilst while
#define whereas for
#define advance continue
#define bestow return
#define halt break
#define perform do

// Types
// (these are mostly just the real words instead of synonyms)

#define automatic auto
#define integer int
#define decimal float
#define character char
#define boolean bool
#define invariable const
#define stagnant static
#define architecture struct
#define vacant void
#define categorized enum

// Operations

#define equals ==
#define unequal !=
#define is_greater_than >
#define is_less_than <
#define is_greater_than_or_equal_to >=
#define is_less_than_or_equal_to <=
#define added_to +
#define subtract_by -
#define multiplied_by *
#define divided_by /
#define modulus %
#define increment(i) i++
#define decrement(i) i--
#define bitwise_and &
#define bitwise_or |
#define bitwise_exclusive_or ^
```

(Side note: I had to set the highlighting language to C# instead of C because otherwise it all looks like comments. Maybe whoever made it thinks that hashtags are comments in C? Very strange)

---

GitHub: [CalSch/fan-c](https://github.com/CalSch/fan-c)