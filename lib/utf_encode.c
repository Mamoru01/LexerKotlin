#include "utf_encode.h"

typedef struct {
    char mask;    /* char data will be bitwise AND with this */
    char lead;    /* start bytes of current char in utf-8 encoded character */
    uint32_t beg; /* beginning of codepoint range */
    uint32_t end; /* end of codepoint range */
    int bits_stored; /* the number of bits from the codepoint that fits in char */
}utf_t;

utf_t * utf[] = {
        /*             mask        lead        beg      end       bits */
        [0] = &(utf_t){0b00111111, 0b10000000, 0,       0,        6    },
        [1] = &(utf_t){0b01111111, 0b00000000, 0000,    0177,     7    },
        [2] = &(utf_t){0b00011111, 0b11000000, 0200,    03777,    5    },
        [3] = &(utf_t){0b00001111, 0b11100000, 04000,   0177777,  4    },
        [4] = &(utf_t){0b00000111, 0b11110000, 0200000, 04177777, 3    },
        &(utf_t){0},
};

/* All lengths are in bytes */
int codepoint_len(const uint32_t cp); /* len of associated utf-8 char */

char *to_utf8(char str[]);

int codepoint_len(const uint32_t cp)
{
    int len = 0;
    for(utf_t **u = utf; *u; ++u) {
        if((cp >= (*u)->beg) && (cp <= (*u)->end)) {
            break;
        }
        ++len;
    }
    if(len > 4) /* Out of bounds */
        exit(1);

    return len;
}

uint32_t newUint(char str[]) {
    char buf[] = {"0x"};
    strcat(buf, str+2);
    return strtol(buf, NULL, 0);
}

char *to_utf8(char str[])
{
    const uint32_t cp = newUint(str);
    static char ret[5];
    const int bytes = codepoint_len(cp);

    int shift = utf[0]->bits_stored * (bytes - 1);
    ret[0] = (cp >> shift & utf[bytes]->mask) | utf[bytes]->lead;
    shift -= utf[0]->bits_stored;
    for(int i = 1; i < bytes; ++i) {
        ret[i] = (cp >> shift & utf[0]->mask) | utf[0]->lead;
        shift -= utf[0]->bits_stored;
    }
    ret[bytes] = '\0';
    return ret;


}