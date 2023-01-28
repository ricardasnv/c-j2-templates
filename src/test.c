#include <stdio.h>

typedef struct {
    int score;
} fruit_t;

#include "fruit_object_declarations.c"

int main() {
    #include "fruit_score_assignments.c"

    printf("Fruits:\n");

    #include "fruit_score_printfs.c"

    return 0;
}

