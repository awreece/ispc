static float float4(uniform float a, uniform float b, uniform float c, 
                    uniform float d) {
    float ret = 0;
    cfor (uniform int i = 0; i < programCount; i += 4) {
        ret = insert(ret, i + 0, a);
        ret = insert(ret, i + 1, b);
        ret = insert(ret, i + 2, c);
        ret = insert(ret, i + 3, d);
    }
    return ret;
}

export uniform int width() { return programCount; }



export void f_f(uniform float RET[], uniform float aFOO[]) {
    float a = aFOO[programIndex&0x3];
    int i, j;
    float r = 0;
    cfor (i = 0; i < a+1; ++i) {
        if (i == 1)
            ccontinue;
        cfor (j = 0; j < a; ++j) {
            if (a == 2)
                ccontinue;
        }
        ++r;
    }
    RET[programIndex] = r;
}

export void result(uniform float RET[]) { 
    uniform float ret[4] = { 1,2,3,4 };
    RET[programIndex] = ret[programIndex & 0x3];
}
