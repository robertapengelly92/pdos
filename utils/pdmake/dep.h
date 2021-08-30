/* Released to the public domain.
 *
 * Anyone and anything may copy, edit, publish,
 * use, compile, sell and distribute this work
 * and all its parts in any form for any purpose,
 * commercial and non-commercial, without any restrictions,
 * without complying with any conditions
 * and by any means.
 */

struct nameseq {
    struct nameseq *next;
    char *name;
};

struct dep {
    struct dep *next;
    char *name;
};
