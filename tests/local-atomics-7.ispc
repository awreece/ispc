
export uniform int width() { return programCount; }

uniform int32 s = 0;

export void f_f(uniform float RET[], uniform float aFOO[]) {
    int32 a = aFOO[programIndex]; 
    float b = atomic_min_local(&s, a);
    RET[programIndex] = reduce_min(b);
}

export void result(uniform float RET[]) {
    RET[programIndex] = reduce_min(programIndex);
}
