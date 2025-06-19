#pragma once 

#include<iostream>
#include <stdint.h>
#include <stddef.h>

struct HNode // instrusive list node
{
    HNode *next = NULL;
    uint64_t hcode =0 ; // hashes
};

//fixed size hash table
struct HTab{
    HNode **tab = NULL;
    size_t mask =0;
    size_t size=0;
};

struct HMap{
    HTab newer;
    HTab older;
    size_t migrate_pos=0;
};

HNode *hm_lookup(HMap *hmap, HNode *key, bool (*eq)(HNode *, HNode*));
void *hm_insert(HMap *hmap, HNode *node);
HNode *h_delete(HMap *hmap, HNode *key, bool(*eq) (HNode*, HNode*));