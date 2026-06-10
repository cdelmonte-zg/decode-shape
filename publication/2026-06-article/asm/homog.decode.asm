Compiled method (c1) 150  154 %     3       dev.cdelmonte.decodeshape.bench.Diag::homog @ 2 (25 bytes)
 total in heap  [0x00007c68e0615588,0x00007c68e0615910] = 904
 main code      [0x00007c68e0615680,0x00007c68e06158d8] = 600
 stub code      [0x00007c68e06158d8,0x00007c68e0615908] = 48
 oops           [0x00007c68e0615908,0x00007c68e0615910] = 8
 mutable data [0x00007c6870016750,0x00007c68700167a8] = 88
 relocation     [0x00007c6870016750,0x00007c68700167a0] = 80
 metadata       [0x00007c68700167a0,0x00007c68700167a8] = 8
 immutable data [0x00007c6870016820,0x00007c6870016a48] = 552
 dependencies   [0x00007c6870016820,0x00007c6870016828] = 8
 nul chk table  [0x00007c6870016828,0x00007c6870016858] = 48
 scopes pcs     [0x00007c6870016858,0x00007c68700169c8] = 368
 scopes data    [0x00007c68700169c8,0x00007c6870016a48] = 128

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007c6888401eb0} 'homog' '([I[I[I)V' in 'dev/cdelmonte/decodeshape/bench/Diag'
  0x00007c68e0615680:   mov		dword ptr [rsp - 0x14000], eax
  0x00007c68e0615687:   push		rbp
  0x00007c68e0615688:   sub		rsp, 0x60
  0x00007c68e061568c:   cmp		dword ptr [r15 + 0x20], 1
  0x00007c68e0615694:   je		0x7c68e061569b
  0x00007c68e0615696:   call		0x7c68e7a4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007c68e061569b:   movabs		rdi, 0x7c6888400a90 ;   {metadata(method data for {method} {0x00007c6888401eb0} 'homog' '([I[I[I)V' in 'dev/cdelmonte/decodeshape/bench/Diag')}
  0x00007c68e06156a5:   mov		ebx, dword ptr [rdi + 0x90]
  0x00007c68e06156ab:   add		ebx, 2
  0x00007c68e06156ae:   mov		dword ptr [rdi + 0x90], ebx
  0x00007c68e06156b4:   and		ebx, 0x7fe
  0x00007c68e06156ba:   test		ebx, ebx
  0x00007c68e06156bc:   je		0x7c68e0615811      ;*iconst_0 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@0 (line 89)
  0x00007c68e06156c2:   mov		edi, 0
  0x00007c68e06156c7:   jmp		0x7c68e0615741      ;*iload_3 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@2 (line 89)
  0x00007c68e06156cc:   nop		dword ptr [rax]
  0x00007c68e06156d0:   cmp		edi, dword ptr [rsi + 0xc]
                                                            ; implicit exception: dispatches to 0x00007c68e0615832
  0x00007c68e06156d3:   jae		0x7c68e061583c
  0x00007c68e06156d9:   movsxd		rbx, edi
  0x00007c68e06156dc:   mov		ebx, dword ptr [rsi + rbx*4 + 0x10]
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@12 (line 90)
  0x00007c68e06156e0:   cmp		edi, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x00007c68e061584a
  0x00007c68e06156e3:   jae		0x7c68e0615854
  0x00007c68e06156e9:   movsxd		rax, edi
  0x00007c68e06156ec:   mov		eax, dword ptr [rdx + rax*4 + 0x10]
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@15 (line 90)
  0x00007c68e06156f0:   add		ebx, eax
  0x00007c68e06156f2:   cmp		edi, dword ptr [rcx + 0xc]
  0x00007c68e06156f5:   jae		0x7c68e0615862
  0x00007c68e06156fb:   movsxd		rax, edi
  0x00007c68e06156fe:   mov		dword ptr [rcx + rax*4 + 0x10], ebx
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@17 (line 90)
  0x00007c68e0615702:   inc		edi
  0x00007c68e0615704:   movabs		rbx, 0x7c6888400a90 ;   {metadata(method data for {method} {0x00007c6888401eb0} 'homog' '([I[I[I)V' in 'dev/cdelmonte/decodeshape/bench/Diag')}
  0x00007c68e061570e:   mov		eax, dword ptr [rbx + 0x94]
  0x00007c68e0615714:   add		eax, 2
  0x00007c68e0615717:   mov		dword ptr [rbx + 0x94], eax
  0x00007c68e061571d:   and		eax, 0x3ffe
  0x00007c68e0615722:   test		eax, eax
  0x00007c68e0615724:   je		0x7c68e0615870      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@21 (line 89)
  0x00007c68e061572a:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {rcx=Oop rdx=Oop rsi=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.bench.Diag::homog@21 (line 89)
  0x00007c68e061572e:   test		dword ptr [r10], eax;   {poll}
  0x00007c68e0615731:   movabs		rbx, 0x7c6888400a90 ;   {metadata(method data for {method} {0x00007c6888401eb0} 'homog' '([I[I[I)V' in 'dev/cdelmonte/decodeshape/bench/Diag')}
  0x00007c68e061573b:   inc		dword ptr [rbx + 0xf8];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@21 (line 89)
  0x00007c68e0615741:   mov		ebx, dword ptr [rcx + 0xc]
                                                            ; implicit exception: dispatches to 0x00007c68e0615891
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@4 (line 89)
  0x00007c68e0615744:   cmp		edi, ebx
  0x00007c68e0615746:   movabs		rbx, 0x7c6888400a90 ;   {metadata(method data for {method} {0x00007c6888401eb0} 'homog' '([I[I[I)V' in 'dev/cdelmonte/decodeshape/bench/Diag')}
  0x00007c68e0615750:   mov		eax, 0xe8
  0x00007c68e0615755:   jl		0x7c68e061575c
  0x00007c68e0615757:   mov		eax, 0xd8
  0x00007c68e061575c:   mov		r8, qword ptr [rbx + rax]
  0x00007c68e0615760:   lea		r8, [r8 + 1]
  0x00007c68e0615764:   mov		qword ptr [rbx + rax], r8
  0x00007c68e0615768:   jl		0x7c68e06156d0      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
  0x00007c68e061576e:   add		rsp, 0x60
  0x00007c68e0615772:   pop		rbp
  0x00007c68e0615773:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007c68e0615777:   ja		0x7c68e0615896
  0x00007c68e061577d:   ret		                    ;*return {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@24 (line 92)
  0x00007c68e061577e:   mov		dword ptr [rsp - 0x14000], eax
  0x00007c68e0615785:   push		rbp
  0x00007c68e0615786:   sub		rsp, 0x60
  0x00007c68e061578a:   nop		
  0x00007c68e061578c:   cmp		dword ptr [r15 + 0x20], 0
  0x00007c68e0615794:   je		0x7c68e061579b
  0x00007c68e0615796:   call		0x7c68e7a4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007c68e061579b:   mov		edi, 0x18
  0x00007c68e06157a0:   movsxd		rdi, edi
  0x00007c68e06157a3:   mov		rbx, qword ptr [rsi + rdi]
  0x00007c68e06157a7:   mov		edi, 0x10
  0x00007c68e06157ac:   movsxd		rdi, edi
  0x00007c68e06157af:   mov		rax, qword ptr [rsi + rdi]
  0x00007c68e06157b3:   mov		edi, 8
  0x00007c68e06157b8:   movsxd		rdi, edi
  0x00007c68e06157bb:   mov		rdx, qword ptr [rsi + rdi]
  0x00007c68e06157bf:   mov		edi, 0
  0x00007c68e06157c4:   movsxd		rdi, edi
  0x00007c68e06157c7:   mov		ecx, dword ptr [rsi + rdi]
  0x00007c68e06157ca:   mov		rdi, rsi
  0x00007c68e06157cd:   mov		qword ptr [rsp + 0x48], rbx
  0x00007c68e06157d2:   mov		qword ptr [rsp + 0x40], rax
  0x00007c68e06157d7:   mov		qword ptr [rsp + 0x38], rdx
  0x00007c68e06157dc:   mov		dword ptr [rsp + 0x30], ecx
  0x00007c68e06157e0:   call		0x7c68fe4e7cd0      ;   {runtime_call SharedRuntime::OSR_migration_end(long*)}
  0x00007c68e06157e5:   nop		dword ptr [rax + rax];   {post_call_nop}
  0x00007c68e06157ed:   mov		ecx, dword ptr [rsp + 0x30]
  0x00007c68e06157f1:   mov		rdi, rcx
  0x00007c68e06157f4:   mov		rdx, qword ptr [rsp + 0x38]
  0x00007c68e06157f9:   mov		rcx, rdx
  0x00007c68e06157fc:   mov		rax, qword ptr [rsp + 0x40]
  0x00007c68e0615801:   mov		rdx, rax
  0x00007c68e0615804:   mov		rbx, qword ptr [rsp + 0x48]
  0x00007c68e0615809:   mov		rsi, rbx
  0x00007c68e061580c:   jmp		0x7c68e0615741
  0x00007c68e0615811:   movabs		r10, 0x7c6888401eb0 ;   {metadata({method} {0x00007c6888401eb0} 'homog' '([I[I[I)V' in 'dev/cdelmonte/decodeshape/bench/Diag')}
  0x00007c68e061581b:   mov		qword ptr [rsp + 8], r10
  0x00007c68e0615820:   mov		qword ptr [rsp], -1
  0x00007c68e0615828:   call		0x7c68e7b46e60      ; ImmutableOopMap {rsi=Oop rdx=Oop rcx=Oop }
                                                            ;*synchronization entry
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@-1 (line 89)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x00007c68e061582d:   jmp		0x7c68e06156c2
  0x00007c68e0615832:   call		0x7c68e7b3e760      ; ImmutableOopMap {rcx=Oop rdx=Oop rsi=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@12 (line 90)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007c68e0615837:   call		0x7c68e7b3e760      ; ImmutableOopMap {rcx=Oop rdx=Oop rsi=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@12 (line 90)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007c68e061583c:   mov		qword ptr [rsp], rdi
  0x00007c68e0615840:   mov		qword ptr [rsp + 8], rsi
  0x00007c68e0615845:   call		0x7c68e7b3d8e0      ; ImmutableOopMap {rcx=Oop rdx=Oop rsi=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@12 (line 90)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007c68e061584a:   call		0x7c68e7b3e760      ; ImmutableOopMap {rcx=Oop rdx=Oop rsi=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@15 (line 90)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007c68e061584f:   call		0x7c68e7b3e760      ; ImmutableOopMap {rcx=Oop rdx=Oop rsi=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@15 (line 90)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007c68e0615854:   mov		qword ptr [rsp], rdi
  0x00007c68e0615858:   mov		qword ptr [rsp + 8], rdx
  0x00007c68e061585d:   call		0x7c68e7b3d8e0      ; ImmutableOopMap {rcx=Oop rdx=Oop rsi=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@15 (line 90)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007c68e0615862:   mov		qword ptr [rsp], rdi
  0x00007c68e0615866:   mov		qword ptr [rsp + 8], rcx
  0x00007c68e061586b:   call		0x7c68e7b3d8e0      ; ImmutableOopMap {rcx=Oop rdx=Oop rsi=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@17 (line 90)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007c68e0615870:   movabs		r10, 0x7c6888401eb0 ;   {metadata({method} {0x00007c6888401eb0} 'homog' '([I[I[I)V' in 'dev/cdelmonte/decodeshape/bench/Diag')}
  0x00007c68e061587a:   mov		qword ptr [rsp + 8], r10
  0x00007c68e061587f:   mov		qword ptr [rsp], 0x15
  0x00007c68e0615887:   call		0x7c68e7b46e60      ; ImmutableOopMap {rcx=Oop rdx=Oop rsi=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.bench.Diag::homog@21 (line 89)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x00007c68e061588c:   jmp		0x7c68e061572a
  0x00007c68e0615891:   call		0x7c68e7b3e760      ; ImmutableOopMap {rcx=Oop rdx=Oop rsi=Oop }
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@4 (line 89)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007c68e0615896:   movabs		r10, 0x7c68e0615773 ;   {internal_word}
  0x00007c68e06158a0:   mov		qword ptr [r15 + 0x538], r10
  0x00007c68e06158a7:   jmp		0x7c68e7a68b60      ;   {runtime_call SafepointBlob}
  0x00007c68e06158ac:   mov		rax, qword ptr [r15 + 0x5e0]
  0x00007c68e06158b3:   mov		qword ptr [r15 + 0x5e0], 0
  0x00007c68e06158be:   mov		qword ptr [r15 + 0x5e8], 0
  0x00007c68e06158c9:   add		rsp, 0x60
  0x00007c68e06158cd:   pop		rbp
  0x00007c68e06158ce:   jmp		0x7c68e7b3d2e0      ;   {runtime_call C1 Runtime unwind_exception_blob}
  0x00007c68e06158d3:   hlt		
  0x00007c68e06158d4:   hlt		
  0x00007c68e06158d5:   hlt		
  0x00007c68e06158d6:   hlt		
  0x00007c68e06158d7:   hlt		
[Exception Handler]
  0x00007c68e06158d8:   call		0x7c68e7b419e0      ;   {runtime_call C1 Runtime handle_exception_from_callee_blob}
  0x00007c68e06158dd:   movabs		rdi, 0x7c68fe8ec7cf ;   {external_word}
  0x00007c68e06158e7:   and		rsp, 0xfffffffffffffff0
  0x00007c68e06158eb:   call		0x7c68fe2f8140      ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007c68e06158f0:   hlt		
[Deopt Handler Code]
  0x00007c68e06158f1:   movabs		r10, 0x7c68e06158f1 ;   {section_word}
  0x00007c68e06158fb:   push		r10
  0x00007c68e06158fd:   jmp		0x7c68e7a672e0      ;   {runtime_call DeoptimizationBlob}
  0x00007c68e0615902:   hlt		
  0x00007c68e0615903:   hlt		
  0x00007c68e0615904:   hlt		
  0x00007c68e0615905:   hlt		
  0x00007c68e0615906:   hlt		
  0x00007c68e0615907:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

============================= C1-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2) 158  155 %     4       dev.cdelmonte.decodeshape.bench.Diag::homog @ 2 (25 bytes)
 total in heap  [0x00007c68e81f2f08,0x00007c68e81f33d8] = 1232
 main code      [0x00007c68e81f3000,0x00007c68e81f33b8] = 952
 stub code      [0x00007c68e81f33b8,0x00007c68e81f33d0] = 24
 oops           [0x00007c68e81f33d0,0x00007c68e81f33d8] = 8
 mutable data [0x00007c68780a0de0,0x00007c68780a0e30] = 80
 relocation     [0x00007c68780a0de0,0x00007c68780a0e20] = 64
 metadata       [0x00007c68780a0e20,0x00007c68780a0e30] = 16
 immutable data [0x00007c6878102bd0,0x00007c6878102ef0] = 800
 dependencies   [0x00007c6878102bd0,0x00007c6878102bd8] = 8
 nul chk table  [0x00007c6878102bd8,0x00007c6878102bf8] = 32
 scopes pcs     [0x00007c6878102bf8,0x00007c6878102e18] = 544
 scopes data    [0x00007c6878102e18,0x00007c6878102ef0] = 216

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007c6888401eb0} 'homog' '([I[I[I)V' in 'dev/cdelmonte/decodeshape/bench/Diag'
  0x00007c68e81f3000:   call		0x7c68fe41e490      ;   {runtime_call os::breakpoint()}
  0x00007c68e81f3005:   nop		word ptr [rax + rax]
  0x00007c68e81f3010:   mov		dword ptr [rsp - 0x14000], eax
  0x00007c68e81f3017:   push		rbp
  0x00007c68e81f3018:   sub		rsp, 0x50
  0x00007c68e81f301c:   cmp		dword ptr [r15 + 0x20], 1
  0x00007c68e81f3024:   jne		0x7c68e81f33ae
  0x00007c68e81f302a:   mov		r14, qword ptr [rsi + 0x18]
  0x00007c68e81f302e:   mov		rbp, qword ptr [rsi + 0x10]
  0x00007c68e81f3032:   mov		r13d, dword ptr [rsi]
  0x00007c68e81f3035:   mov		rbx, qword ptr [rsi + 8]
  0x00007c68e81f3039:   mov		rdi, rsi
  0x00007c68e81f303c:   vzeroupper		
  0x00007c68e81f303f:   movabs		r10, 0x7c68fe4e7cd0 ;   {runtime_call SharedRuntime::OSR_migration_end(long*)}
  0x00007c68e81f3049:   call		r10
  0x00007c68e81f304c:   nop		dword ptr [rax + rax];   {post_call_nop}
  0x00007c68e81f3054:   xor		r11d, r11d
  0x00007c68e81f3057:   test		r14, r14
  0x00007c68e81f305a:   je		0x7c68e81f3299
  0x00007c68e81f3060:   mov		r10d, dword ptr [r14 + 8]
  0x00007c68e81f3064:   cmp		r10d, 0x173710      ;   {metadata({type array int})}
  0x00007c68e81f306b:   jne		0x7c68e81f3328
  0x00007c68e81f3071:   mov		r8, r14
  0x00007c68e81f3074:   test		rbp, rbp
  0x00007c68e81f3077:   je		0x7c68e81f308d
  0x00007c68e81f3079:   mov		r11d, dword ptr [rbp + 8]
  0x00007c68e81f307d:   cmp		r11d, 0x173710      ;   {metadata({type array int})}
  0x00007c68e81f3084:   jne		0x7c68e81f3328
  0x00007c68e81f308a:   mov		r11, rbp
  0x00007c68e81f308d:   mov		r9d, dword ptr [rbx + 8]; implicit exception: dispatches to 0x00007c68e81f3374
  0x00007c68e81f3091:   cmp		r9d, 0x173710       ;   {metadata({type array int})}
  0x00007c68e81f3098:   jne		0x7c68e81f3328      ;*iload_3 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@2 (line 89)
  0x00007c68e81f309e:   mov		r14d, dword ptr [r8 + 0xc]
                                                            ; implicit exception: dispatches to 0x00007c68e81f334c
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@12 (line 90)
  0x00007c68e81f30a2:   mov		esi, dword ptr [r11 + 0xc]
                                                            ; implicit exception: dispatches to 0x00007c68e81f334c
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@15 (line 90)
  0x00007c68e81f30a6:   mov		edi, dword ptr [rbx + 0xc]
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@4 (line 89)
  0x00007c68e81f30a9:   cmp		r13d, edi
  0x00007c68e81f30ac:   jge		0x7c68e81f3286      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
  0x00007c68e81f30b2:   mov		r10d, ebx
  0x00007c68e81f30b5:   lea		ecx, [r13 + 1]
  0x00007c68e81f30b9:   movsxd		rdx, edi
  0x00007c68e81f30bc:   movsxd		rax, ecx
  0x00007c68e81f30bf:   mov		r9d, 0xfffffff0
  0x00007c68e81f30c5:   sub		r9d, r10d
  0x00007c68e81f30c8:   shr		r9d, 2
  0x00007c68e81f30cc:   xor		r10d, r10d
  0x00007c68e81f30cf:   test		ecx, ecx
  0x00007c68e81f30d1:   cmovl		rax, r10
  0x00007c68e81f30d5:   mov		r10d, eax
  0x00007c68e81f30d8:   cmp		r10d, edi
  0x00007c68e81f30db:   cmovg		r10d, edi
  0x00007c68e81f30df:   sub		r9d, r10d
  0x00007c68e81f30e2:   movsxd		rcx, r10d
  0x00007c68e81f30e5:   mov		r10d, 4
  0x00007c68e81f30eb:   bzhi		r10, r9, r10
  0x00007c68e81f30f0:   add		rcx, r10
  0x00007c68e81f30f3:   cmp		rcx, rdx
  0x00007c68e81f30f6:   mov		r10, rdx
  0x00007c68e81f30f9:   cmovl		r10, rcx
  0x00007c68e81f30fd:   mov		r10d, r10d
  0x00007c68e81f3100:   cmp		r13d, r14d
  0x00007c68e81f3103:   jae		0x7c68e81f32a1
  0x00007c68e81f3109:   mov		ebp, dword ptr [r8 + r13*4 + 0x10]
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@12 (line 90)
  0x00007c68e81f310e:   cmp		r13d, esi
  0x00007c68e81f3111:   jae		0x7c68e81f32d0
  0x00007c68e81f3117:   add		ebp, dword ptr [r11 + r13*4 + 0x10]
                                                            ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@16 (line 90)
  0x00007c68e81f311c:   cmp		r13d, edi
  0x00007c68e81f311f:   jae		0x7c68e81f3300
  0x00007c68e81f3125:   mov		dword ptr [rbx + r13*4 + 0x10], ebp
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@17 (line 90)
  0x00007c68e81f312a:   inc		r13d                ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@18 (line 89)
  0x00007c68e81f312d:   cmp		r13d, r10d
  0x00007c68e81f3130:   jl		0x7c68e81f3100      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
  0x00007c68e81f3132:   movsxd		r10, esi
  0x00007c68e81f3135:   movsxd		r9, r14d
  0x00007c68e81f3138:   cmp		rdx, r9
  0x00007c68e81f313b:   cmovl		r9, rdx
  0x00007c68e81f313f:   cmp		r10, r9
  0x00007c68e81f3142:   cmovl		r9, r10
  0x00007c68e81f3146:   cmp		r9, rdx
  0x00007c68e81f3149:   cmovl		rdx, r9
  0x00007c68e81f314d:   mov		r10d, edx
  0x00007c68e81f3150:   lea		ecx, [r10 - 0x3f]
  0x00007c68e81f3154:   cmp		r13d, ecx
  0x00007c68e81f3157:   jge		0x7c68e81f3256      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@21 (line 89)
  0x00007c68e81f315d:   xor		r9d, r9d
  0x00007c68e81f3160:   mov		edx, 0xfa00
  0x00007c68e81f3165:   mov		eax, r10d
  0x00007c68e81f3168:   sub		eax, r13d
  0x00007c68e81f316b:   add		eax, -0x3f
  0x00007c68e81f316e:   cmp		ecx, r13d
  0x00007c68e81f3171:   cmovl		eax, r9d
  0x00007c68e81f3175:   cmp		eax, 0xfa00
  0x00007c68e81f317a:   cmova		eax, edx
  0x00007c68e81f317d:   add		eax, r13d
  0x00007c68e81f3180:   .byte		0x62
  0x00007c68e81f3181:   xchg		eax, ecx
  0x00007c68e81f3182:   jle		0x7c68e81f31cc
  0x00007c68e81f3184:   outsd		dx, dword ptr [rsi]
  0x00007c68e81f3185:   test		byte ptr [rax + 0x10], ch
  0x00007c68e81f318b:   .byte		0x62
  0x00007c68e81f318c:   xchg		eax, ecx
  0x00007c68e81f318d:   jge		0x7c68e81f31d7
  0x00007c68e81f318f:   inc		byte ptr [rbx + rbp*4 + 0x10]
                                                            ;   {other}
  0x00007c68e81f3196:   vmovdqu32		zmmword ptr [rbx + r13*4 + 0x10], zmm0
  0x00007c68e81f31a1:   movsxd		rbp, r13d
  0x00007c68e81f31a4:   vmovdqu32		zmm0, zmmword ptr [r8 + rbp*4 + 0x50]
  0x00007c68e81f31af:   vpaddd		zmm0 , zmm0, zmmword ptr [r11 + rbp*4 + 0x50]
  0x00007c68e81f31ba:   vmovdqu32		zmmword ptr [rbx + rbp*4 + 0x50], zmm0
  0x00007c68e81f31c5:   vmovdqu32		zmm0, zmmword ptr [r8 + rbp*4 + 0x90]
  0x00007c68e81f31d0:   vpaddd		zmm0 , zmm0, zmmword ptr [r11 + rbp*4 + 0x90]
  0x00007c68e81f31db:   vmovdqu32		zmmword ptr [rbx + rbp*4 + 0x90], zmm0
  0x00007c68e81f31e6:   vmovdqu32		zmm0, zmmword ptr [r8 + rbp*4 + 0xd0]
  0x00007c68e81f31f1:   vpaddd		zmm0 , zmm0, zmmword ptr [r11 + rbp*4 + 0xd0]
  0x00007c68e81f31fc:   vmovdqu32		zmmword ptr [rbx + rbp*4 + 0xd0], zmm0
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@17 (line 90)
  0x00007c68e81f3207:   add		r13d, 0x40          ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@18 (line 89)
  0x00007c68e81f320b:   cmp		r13d, eax
  0x00007c68e81f320e:   jl		0x7c68e81f3180      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@21 (line 89)
  0x00007c68e81f3214:   mov		rax, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r11=Oop r8=Oop rbx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.bench.Diag::homog@21 (line 89)
  0x00007c68e81f3218:   test		dword ptr [rax], eax;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@21 (line 89)
                                                            ;   {poll}
  0x00007c68e81f321a:   cmp		r13d, ecx
  0x00007c68e81f321d:   jl		0x7c68e81f3165
  0x00007c68e81f3223:   add		r10d, -0xf
  0x00007c68e81f3227:   cmp		r13d, r10d
  0x00007c68e81f322a:   jge		0x7c68e81f3256      ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@12 (line 90)
  0x00007c68e81f322c:   .byte		0x62
  0x00007c68e81f322d:   xchg		eax, ecx
  0x00007c68e81f322e:   jle		0x7c68e81f3278
  0x00007c68e81f3230:   outsd		dx, dword ptr [rsi]
  0x00007c68e81f3231:   test		byte ptr [rax + 0x10], ch
  0x00007c68e81f3237:   .byte		0x62
  0x00007c68e81f3238:   xchg		eax, ecx
  0x00007c68e81f3239:   jge		0x7c68e81f3283
  0x00007c68e81f323b:   inc		byte ptr [rbx + rbp*4 + 0x10]
  0x00007c68e81f3242:   vmovdqu32		zmmword ptr [rbx + r13*4 + 0x10], zmm0
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@17 (line 90)
  0x00007c68e81f324d:   add		r13d, 0x10          ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@18 (line 89)
  0x00007c68e81f3251:   cmp		r13d, r10d
  0x00007c68e81f3254:   jl		0x7c68e81f322c      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
  0x00007c68e81f3256:   cmp		r13d, edi
  0x00007c68e81f3259:   jge		0x7c68e81f3286
  0x00007c68e81f325b:   nop		
  0x00007c68e81f325c:   cmp		r13d, r14d
  0x00007c68e81f325f:   jae		0x7c68e81f32a1
  0x00007c68e81f3261:   mov		ebp, dword ptr [r8 + r13*4 + 0x10]
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@12 (line 90)
  0x00007c68e81f3266:   cmp		r13d, esi
  0x00007c68e81f3269:   jae		0x7c68e81f32d0
  0x00007c68e81f326b:   add		ebp, dword ptr [r11 + r13*4 + 0x10]
                                                            ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@16 (line 90)
  0x00007c68e81f3270:   cmp		r13d, edi
  0x00007c68e81f3273:   jae		0x7c68e81f3300
  0x00007c68e81f3279:   mov		dword ptr [rbx + r13*4 + 0x10], ebp
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@17 (line 90)
  0x00007c68e81f327e:   inc		r13d                ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@18 (line 89)
  0x00007c68e81f3281:   cmp		r13d, edi
  0x00007c68e81f3284:   jl		0x7c68e81f325c      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
  0x00007c68e81f3286:   vzeroupper		
  0x00007c68e81f3289:   add		rsp, 0x50
  0x00007c68e81f328d:   pop		rbp
  0x00007c68e81f328e:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007c68e81f3292:   ja		0x7c68e81f3398
  0x00007c68e81f3298:   ret		
  0x00007c68e81f3299:   xor		r8d, r8d
  0x00007c68e81f329c:   jmp		0x7c68e81f3074
  0x00007c68e81f32a1:   mov		esi, 0xffffffe4
  0x00007c68e81f32a6:   mov		qword ptr [rsp], r11
  0x00007c68e81f32aa:   mov		qword ptr [rsp + 0x18], rbx
  0x00007c68e81f32af:   mov		dword ptr [rsp + 0x14], r13d
  0x00007c68e81f32b4:   mov		qword ptr [rsp + 0x20], r8
  0x00007c68e81f32b9:   mov		dword ptr [rsp + 0x28], r13d
  0x00007c68e81f32be:   nop		
  0x00007c68e81f32c0:   vzeroupper		
  0x00007c68e81f32c3:   call		0x7c68e7b495e0      ; ImmutableOopMap {[0]=Oop [24]=Oop [32]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@12 (line 90)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007c68e81f32c8:   nop		dword ptr [rax + rax + 0x10003c0]
                                                            ;   {post_call_nop}
  0x00007c68e81f32d0:   mov		esi, 0xffffffe4
  0x00007c68e81f32d5:   mov		qword ptr [rsp], r8
  0x00007c68e81f32d9:   mov		qword ptr [rsp + 0x20], rbx
  0x00007c68e81f32de:   mov		dword ptr [rsp + 0x1c], r13d
  0x00007c68e81f32e3:   mov		qword ptr [rsp + 0x28], r11
  0x00007c68e81f32e8:   mov		dword ptr [rsp + 0x30], r13d
  0x00007c68e81f32ed:   nop		
  0x00007c68e81f32f0:   vzeroupper		
  0x00007c68e81f32f3:   call		0x7c68e7b495e0      ; ImmutableOopMap {[0]=Oop [32]=Oop [40]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@15 (line 90)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007c68e81f32f8:   nop		dword ptr [rax + rax + 0x20003f0]
                                                            ;   {post_call_nop}
  0x00007c68e81f3300:   mov		esi, 0xffffffe4
  0x00007c68e81f3305:   mov		qword ptr [rsp], r8
  0x00007c68e81f3309:   mov		qword ptr [rsp + 8], r11
  0x00007c68e81f330e:   mov		qword ptr [rsp + 0x20], rbx
  0x00007c68e81f3313:   mov		dword ptr [rsp + 0x1c], r13d
  0x00007c68e81f3318:   vzeroupper		
  0x00007c68e81f331b:   call		0x7c68e7b495e0      ; ImmutableOopMap {[0]=Oop [8]=Oop [32]=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@17 (line 90)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007c68e81f3320:   nop		dword ptr [rax + rax + 0x3000418]
                                                            ;   {post_call_nop}
  0x00007c68e81f3328:   mov		esi, 0xffffff85
  0x00007c68e81f332d:   mov		qword ptr [rsp], rbx
  0x00007c68e81f3331:   mov		dword ptr [rsp + 8], r13d
  0x00007c68e81f3336:   mov		qword ptr [rsp + 0x10], r14
  0x00007c68e81f333b:   nop		
  0x00007c68e81f333c:   vzeroupper		
  0x00007c68e81f333f:   call		0x7c68e7b495e0      ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop }
                                                            ;*iload_3 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@2 (line 89)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007c68e81f3344:   nop		dword ptr [rax + rax + 0x400043c]
                                                            ;   {post_call_nop}
  0x00007c68e81f334c:   mov		esi, 0xffffffbe
  0x00007c68e81f3351:   mov		rbp, r8
  0x00007c68e81f3354:   mov		qword ptr [rsp], r11
  0x00007c68e81f3358:   mov		qword ptr [rsp + 8], rbx
  0x00007c68e81f335d:   mov		dword ptr [rsp + 0x10], r13d
  0x00007c68e81f3362:   nop		
  0x00007c68e81f3364:   vzeroupper		
  0x00007c68e81f3367:   call		0x7c68e7b495e0      ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*iload_3 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@2 (line 89)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007c68e81f336c:   nop		dword ptr [rax + rax + 0x5000464]
                                                            ;   {post_call_nop}
  0x00007c68e81f3374:   mov		esi, 0xffffff6e
  0x00007c68e81f3379:   mov		rbp, r8
  0x00007c68e81f337c:   mov		qword ptr [rsp], r11
  0x00007c68e81f3380:   mov		dword ptr [rsp + 8], r13d
  0x00007c68e81f3385:   nop		
  0x00007c68e81f3388:   vzeroupper		
  0x00007c68e81f338b:   call		0x7c68e7b495e0      ; ImmutableOopMap {rbp=Oop [0]=Oop }
                                                            ;*iload_3 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@2 (line 89)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007c68e81f3390:   nop		dword ptr [rax + rax + 0x6000488]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
                                                            ;   {post_call_nop}
  0x00007c68e81f3398:   movabs		r10, 0x7c68e81f328e ;   {internal_word}
  0x00007c68e81f33a2:   mov		qword ptr [r15 + 0x538], r10
  0x00007c68e81f33a9:   jmp		0x7c68e7a68b60      ;   {runtime_call SafepointBlob}
  0x00007c68e81f33ae:   call		0x7c68e7a4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007c68e81f33b3:   jmp		0x7c68e81f302a
[Exception Handler]
  0x00007c68e81f33b8:   jmp		0x7c68e7b498e0      ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x00007c68e81f33bd:   call		0x7c68e81f33c2
  0x00007c68e81f33c2:   sub		qword ptr [rsp], 5
  0x00007c68e81f33c7:   jmp		0x7c68e7a672e0      ;   {runtime_call DeoptimizationBlob}
  0x00007c68e81f33cc:   hlt		
  0x00007c68e81f33cd:   hlt		
  0x00007c68e81f33ce:   hlt		
  0x00007c68e81f33cf:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2) 163  156       4       dev.cdelmonte.decodeshape.bench.Diag::homog (25 bytes)
 total in heap  [0x00007c68e81f3408,0x00007c68e81f3808] = 1024
 main code      [0x00007c68e81f3500,0x00007c68e81f37e8] = 744
 stub code      [0x00007c68e81f37e8,0x00007c68e81f3800] = 24
 oops           [0x00007c68e81f3800,0x00007c68e81f3808] = 8
 mutable data [0x00007c68600653e0,0x00007c6860065408] = 40
 relocation     [0x00007c68600653e0,0x00007c6860065400] = 32
 metadata       [0x00007c6860065400,0x00007c6860065408] = 8
 immutable data [0x00007c6860065170,0x00007c68600653d0] = 608
 dependencies   [0x00007c6860065170,0x00007c6860065178] = 8
 nul chk table  [0x00007c6860065178,0x00007c6860065198] = 32
 scopes pcs     [0x00007c6860065198,0x00007c6860065358] = 448
 scopes data    [0x00007c6860065358,0x00007c68600653d0] = 120

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007c6888401eb0} 'homog' '([I[I[I)V' in 'dev/cdelmonte/decodeshape/bench/Diag'
  # parm0:    rsi:rsi   = '[I'
  # parm1:    rdx:rdx   = '[I'
  # parm2:    rcx:rcx   = '[I'
  #           [sp+0x40]  (sp of caller)
  0x00007c68e81f3500:   mov		dword ptr [rsp - 0x14000], eax
  0x00007c68e81f3507:   push		rbp
  0x00007c68e81f3508:   sub		rsp, 0x30
  0x00007c68e81f350c:   cmp		dword ptr [r15 + 0x20], 1
  0x00007c68e81f3514:   jne		0x7c68e81f37de      ;*synchronization entry
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@-1 (line 89)
  0x00007c68e81f351a:   mov		r10d, dword ptr [rcx + 0xc]
                                                            ; implicit exception: dispatches to 0x00007c68e81f37b1
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@4 (line 89)
  0x00007c68e81f351e:   test		r10d, r10d
  0x00007c68e81f3521:   jbe		0x7c68e81f3772      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
  0x00007c68e81f3527:   mov		r11d, dword ptr [rsi + 0xc]
                                                            ; implicit exception: dispatches to 0x00007c68e81f3785
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@12 (line 90)
  0x00007c68e81f352b:   test		r11d, r11d
  0x00007c68e81f352e:   jbe		0x7c68e81f3785
  0x00007c68e81f3534:   lea		r8d, [r10 - 1]
  0x00007c68e81f3538:   cmp		r8d, r11d
  0x00007c68e81f353b:   jae		0x7c68e81f3785
  0x00007c68e81f3541:   mov		r9d, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x00007c68e81f3785
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@15 (line 90)
  0x00007c68e81f3545:   test		r9d, r9d
  0x00007c68e81f3548:   jbe		0x7c68e81f3785
  0x00007c68e81f354e:   cmp		r8d, r9d
  0x00007c68e81f3551:   jae		0x7c68e81f3785
  0x00007c68e81f3557:   cmp		r8d, r10d
  0x00007c68e81f355a:   jae		0x7c68e81f3785
  0x00007c68e81f3560:   movsxd		r11, r10d
  0x00007c68e81f3563:   mov		r9d, ecx
  0x00007c68e81f3566:   mov		ebx, 0xfffffff0
  0x00007c68e81f356b:   sub		ebx, r9d
  0x00007c68e81f356e:   shr		ebx, 2
  0x00007c68e81f3571:   dec		ebx
  0x00007c68e81f3573:   xor		r8d, r8d
  0x00007c68e81f3576:   mov		edi, 4
  0x00007c68e81f357b:   bzhi		r9, rbx, rdi
  0x00007c68e81f3580:   inc		r9
  0x00007c68e81f3583:   cmp		r9, r11
  0x00007c68e81f3586:   cmovl		r11, r9
  0x00007c68e81f358a:   mov		r9d, r11d
  0x00007c68e81f358d:   xor		ebx, ebx            ;*aload_2 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@8 (line 90)
  0x00007c68e81f358f:   mov		r11d, dword ptr [rdx + rbx*4 + 0x10]
  0x00007c68e81f3594:   add		r11d, dword ptr [rsi + rbx*4 + 0x10]
  0x00007c68e81f3599:   mov		dword ptr [rcx + rbx*4 + 0x10], r11d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@17 (line 90)
  0x00007c68e81f359e:   lea		r11d, [rbx + 1]
  0x00007c68e81f35a2:   cmp		r11d, r9d
  0x00007c68e81f35a5:   jge		0x7c68e81f35ac      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
  0x00007c68e81f35a7:   mov		ebx, r11d
  0x00007c68e81f35aa:   jmp		0x7c68e81f358f
  0x00007c68e81f35ac:   lea		r9d, [r10 - 0x7f]
  0x00007c68e81f35b0:   cmp		r11d, r9d
  0x00007c68e81f35b3:   jge		0x7c68e81f37ac
  0x00007c68e81f35b9:   inc		ebx                 ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@21 (line 89)
  0x00007c68e81f35bb:   mov		edi, 0x1f400
  0x00007c68e81f35c0:   jmp		0x7c68e81f36f7
  0x00007c68e81f35c5:   nop		word ptr [rax + rax]
  0x00007c68e81f35d0:   mov		ebx, ebp            ;*aload_2 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@8 (line 90)
  0x00007c68e81f35d2:   vmovdqu32		zmm0, zmmword ptr [rdx + rbx*4 + 0x10]
  0x00007c68e81f35dd:   vpaddd		zmm0 , zmm0, zmmword ptr [rsi + rbx*4 + 0x10]
  0x00007c68e81f35e8:   vmovdqu32		zmmword ptr [rcx + rbx*4 + 0x10], zmm0
  0x00007c68e81f35f3:   vmovdqu32		zmm0, zmmword ptr [rsi + rbx*4 + 0x50]
  0x00007c68e81f35fe:   vpaddd		zmm0 , zmm0, zmmword ptr [rdx + rbx*4 + 0x50]
                                                            ;   {other}
  0x00007c68e81f3609:   vmovdqu32		zmmword ptr [rcx + rbx*4 + 0x50], zmm0
  0x00007c68e81f3614:   vmovdqu32		zmm0, zmmword ptr [rsi + rbx*4 + 0x90]
  0x00007c68e81f361f:   vpaddd		zmm0 , zmm0, zmmword ptr [rdx + rbx*4 + 0x90]
  0x00007c68e81f362a:   vmovdqu32		zmmword ptr [rcx + rbx*4 + 0x90], zmm0
  0x00007c68e81f3635:   vmovdqu32		zmm0, zmmword ptr [rsi + rbx*4 + 0xd0]
  0x00007c68e81f3640:   vpaddd		zmm0 , zmm0, zmmword ptr [rdx + rbx*4 + 0xd0]
  0x00007c68e81f364b:   vmovdqu32		zmmword ptr [rcx + rbx*4 + 0xd0], zmm0
  0x00007c68e81f3656:   vmovdqu32		zmm0, zmmword ptr [rdx + rbx*4 + 0x110]
  0x00007c68e81f3661:   vpaddd		zmm0 , zmm0, zmmword ptr [rsi + rbx*4 + 0x110]
  0x00007c68e81f366c:   vmovdqu32		zmmword ptr [rcx + rbx*4 + 0x110], zmm0
  0x00007c68e81f3677:   vmovdqu32		zmm0, zmmword ptr [rsi + rbx*4 + 0x150]
  0x00007c68e81f3682:   vpaddd		zmm0 , zmm0, zmmword ptr [rdx + rbx*4 + 0x150]
  0x00007c68e81f368d:   vmovdqu32		zmmword ptr [rcx + rbx*4 + 0x150], zmm0
  0x00007c68e81f3698:   vmovdqu32		zmm0, zmmword ptr [rdx + rbx*4 + 0x190]
  0x00007c68e81f36a3:   vpaddd		zmm0 , zmm0, zmmword ptr [rsi + rbx*4 + 0x190]
  0x00007c68e81f36ae:   vmovdqu32		zmmword ptr [rcx + rbx*4 + 0x190], zmm0
  0x00007c68e81f36b9:   vmovdqu32		zmm0, zmmword ptr [rdx + rbx*4 + 0x1d0]
  0x00007c68e81f36c4:   vpaddd		zmm0 , zmm0, zmmword ptr [rsi + rbx*4 + 0x1d0]
  0x00007c68e81f36cf:   vmovdqu32		zmmword ptr [rcx + rbx*4 + 0x1d0], zmm0
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@17 (line 90)
  0x00007c68e81f36da:   lea		ebp, [rbx + 0x80]
  0x00007c68e81f36e0:   cmp		ebp, r11d
  0x00007c68e81f36e3:   jl		0x7c68e81f35d0      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@21 (line 89)
  0x00007c68e81f36e9:   mov		r11, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {rcx=Oop rdx=Oop rsi=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.bench.Diag::homog@21 (line 89)
  0x00007c68e81f36ed:   test		dword ptr [r11], eax;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@21 (line 89)
                                                            ;   {poll}
  0x00007c68e81f36f0:   cmp		ebp, r9d
  0x00007c68e81f36f3:   jge		0x7c68e81f374c
  0x00007c68e81f36f5:   mov		ebx, ebp
  0x00007c68e81f36f7:   mov		r11d, r10d
  0x00007c68e81f36fa:   sub		r11d, ebx
  0x00007c68e81f36fd:   add		r11d, -0x7f
  0x00007c68e81f3701:   cmp		r9d, ebx
  0x00007c68e81f3704:   cmovl		r11d, r8d
  0x00007c68e81f3708:   cmp		r11d, 0x1f400
  0x00007c68e81f370f:   cmova		r11d, edi
  0x00007c68e81f3713:   add		r11d, ebx
  0x00007c68e81f3716:   jmp		0x7c68e81f35d2
  0x00007c68e81f371b:   add		ebx, 0x80           ;*aload_2 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@8 (line 90)
  0x00007c68e81f3721:   vmovdqu32		zmm0, zmmword ptr [rdx + rbx*4 + 0x10]
  0x00007c68e81f372c:   vpaddd		zmm0 , zmm0, zmmword ptr [rsi + rbx*4 + 0x10]
  0x00007c68e81f3737:   vmovdqu32		zmmword ptr [rcx + rbx*4 + 0x10], zmm0
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@17 (line 90)
  0x00007c68e81f3742:   add		ebx, 0x10           ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@18 (line 89)
  0x00007c68e81f3745:   cmp		ebx, r11d
  0x00007c68e81f3748:   jl		0x7c68e81f3721      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
  0x00007c68e81f374a:   jmp		0x7c68e81f3757
  0x00007c68e81f374c:   lea		r11d, [r10 - 0xf]
  0x00007c68e81f3750:   cmp		ebp, r11d
  0x00007c68e81f3753:   jl		0x7c68e81f371b
  0x00007c68e81f3755:   mov		ebx, ebp
  0x00007c68e81f3757:   cmp		ebx, r10d
  0x00007c68e81f375a:   jge		0x7c68e81f3772      ;*aload_2 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@8 (line 90)
  0x00007c68e81f375c:   mov		r8d, dword ptr [rdx + rbx*4 + 0x10]
  0x00007c68e81f3761:   add		r8d, dword ptr [rsi + rbx*4 + 0x10]
  0x00007c68e81f3766:   mov		dword ptr [rcx + rbx*4 + 0x10], r8d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@17 (line 90)
  0x00007c68e81f376b:   inc		ebx                 ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@18 (line 89)
  0x00007c68e81f376d:   cmp		ebx, r10d
  0x00007c68e81f3770:   jl		0x7c68e81f375c
  0x00007c68e81f3772:   vzeroupper		
  0x00007c68e81f3775:   add		rsp, 0x30
  0x00007c68e81f3779:   pop		rbp
  0x00007c68e81f377a:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007c68e81f377e:   ja		0x7c68e81f37c8
  0x00007c68e81f3784:   ret		                    ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
  0x00007c68e81f3785:   mov		rbp, rsi
  0x00007c68e81f3788:   mov		qword ptr [rsp], rdx
  0x00007c68e81f378c:   mov		qword ptr [rsp + 8], rcx
  0x00007c68e81f3791:   mov		dword ptr [rsp + 0x10], r10d
  0x00007c68e81f3796:   mov		esi, 0xffffff6e
  0x00007c68e81f379b:   nop		
  0x00007c68e81f379c:   vzeroupper		
  0x00007c68e81f379f:   call		0x7c68e7b495e0      ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007c68e81f37a4:   nop		dword ptr [rax + rax + 0x100039c]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
                                                            ;   {post_call_nop}
  0x00007c68e81f37ac:   mov		ebx, r11d
  0x00007c68e81f37af:   jmp		0x7c68e81f3757
  0x00007c68e81f37b1:   mov		esi, 0xfffffff6
  0x00007c68e81f37b6:   nop		
  0x00007c68e81f37b8:   vzeroupper		
  0x00007c68e81f37bb:   call		0x7c68e7b495e0      ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@4 (line 89)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007c68e81f37c0:   nop		dword ptr [rax + rax + 0x20003b8]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.bench.Diag::homog@5 (line 89)
                                                            ;   {post_call_nop}
  0x00007c68e81f37c8:   movabs		r10, 0x7c68e81f377a ;   {internal_word}
  0x00007c68e81f37d2:   mov		qword ptr [r15 + 0x538], r10
  0x00007c68e81f37d9:   jmp		0x7c68e7a68b60      ;   {runtime_call SafepointBlob}
  0x00007c68e81f37de:   call		0x7c68e7a4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007c68e81f37e3:   jmp		0x7c68e81f351a
[Exception Handler]
  0x00007c68e81f37e8:   jmp		0x7c68e7b498e0      ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x00007c68e81f37ed:   call		0x7c68e81f37f2
  0x00007c68e81f37f2:   sub		qword ptr [rsp], 5
  0x00007c68e81f37f7:   jmp		0x7c68e7a672e0      ;   {runtime_call DeoptimizationBlob}
  0x00007c68e81f37fc:   hlt		
  0x00007c68e81f37fd:   hlt		
  0x00007c68e81f37fe:   hlt		
  0x00007c68e81f37ff:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

============================= C1-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

