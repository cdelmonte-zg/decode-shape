Compiled method (c1) 180  159 %     3       dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode @ 31 (131 bytes)
 total in heap  [0x0000714480615688,0x0000714480615d18] = 1680
 main code      [0x0000714480615780,0x0000714480615cc0] = 1344
 stub code      [0x0000714480615cc0,0x0000714480615d10] = 80
 oops           [0x0000714480615d10,0x0000714480615d18] = 8
 mutable data [0x000071441c05f2e0,0x000071441c05f388] = 168
 relocation     [0x000071441c05f2e0,0x000071441c05f380] = 160
 metadata       [0x000071441c05f380,0x000071441c05f388] = 8
 immutable data [0x000071441c05f7a0,0x000071441c05fc40] = 1184
 dependencies   [0x000071441c05f7a0,0x000071441c05f7a8] = 8
 nul chk table  [0x000071441c05f7a8,0x000071441c05f7f8] = 80
 scopes pcs     [0x000071441c05f7f8,0x000071441c05fb18] = 800
 scopes data    [0x000071441c05fb18,0x000071441c05fc40] = 296

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Instructions begin]
  0x0000714480615780:   nop		word ptr [rax + rax]
  0x0000714480615789:   nop		word ptr [rax + rax]
[Entry Point]
  # {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  0x0000714480615792:   mov		r10d, dword ptr [rsi + 8]
  0x0000714480615796:   cmp		r10d, dword ptr [rax + 8]
  0x000071448061579a:   jne		0x714487a655e0      ;   {runtime_call Shared Runtime ic_miss_blob}
[Verified Entry Point]
  0x00007144806157a0:   mov		dword ptr [rsp - 0x14000], eax
  0x00007144806157a7:   push		rbp
  0x00007144806157a8:   sub		rsp, 0x60
  0x00007144806157ac:   cmp		dword ptr [r15 + 0x20], 1
  0x00007144806157b4:   je		0x7144806157bb
  0x00007144806157b6:   call		0x714487a4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007144806157bb:   movabs		rdi, 0x714428404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007144806157c5:   mov		ebx, dword ptr [rdi + 0x90]
  0x00007144806157cb:   add		ebx, 2
  0x00007144806157ce:   mov		dword ptr [rdi + 0x90], ebx
  0x00007144806157d4:   and		ebx, 0x7fe
  0x00007144806157da:   test		ebx, ebx
  0x00007144806157dc:   je		0x714480615b56      ;*iload_3 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@0 (line 29)
  0x00007144806157e2:   movabs		rsi, 0x714428404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007144806157ec:   mov		edi, 0xe0
  0x00007144806157f1:   cmp		r8d, 8
  0x00007144806157f5:   mov		rbx, rdi
  0x00007144806157f8:   mov		edi, 0xf0
  0x00007144806157fd:   cmovne		rdi, rbx
  0x0000714480615801:   cmp		r8d, 0x10
  0x0000714480615805:   mov		rbx, rdi
  0x0000714480615808:   mov		edi, 0x100
  0x000071448061580d:   cmovne		rdi, rbx
  0x0000714480615811:   mov		rbx, qword ptr [rsi + rdi]
  0x0000714480615815:   mov		r10d, 1
  0x000071448061581b:   add		rbx, r10
  0x000071448061581e:   mov		qword ptr [rsi + rdi], rbx
  0x0000714480615822:   cmp		r8d, 8
  0x0000714480615826:   je		0x7144806158fc
  0x000071448061582c:   cmp		r8d, 0x10
  0x0000714480615830:   jne		0x7144806159da      ;*lookupswitch {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@1 (line 29)
  0x0000714480615836:   mov		esi, 0
  0x000071448061583b:   jmp		0x7144806158cd      ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@62 (line 36)
  0x0000714480615840:   mov		rdi, rsi
  0x0000714480615843:   shl		edi, 1
  0x0000714480615845:   cmp		edi, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x0000714480615b77
  0x0000714480615848:   jae		0x714480615b81
  0x000071448061584e:   movsxd		rbx, edi
  0x0000714480615851:   movsx		ebx, byte ptr [rdx + rbx + 0x10]
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
  0x0000714480615856:   and		ebx, 0xff
  0x000071448061585c:   inc		edi
  0x000071448061585e:   cmp		edi, dword ptr [rdx + 0xc]
  0x0000714480615861:   jae		0x714480615b8f
  0x0000714480615867:   movsxd		rdi, edi
  0x000071448061586a:   movsx		edi, byte ptr [rdx + rdi + 0x10]
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@87 (line 38)
  0x000071448061586f:   and		edi, 0xff
  0x0000714480615875:   shl		edi, 8
  0x0000714480615878:   or		rdi, rbx
  0x000071448061587b:   cmp		esi, dword ptr [r9 + 0xc]; implicit exception: dispatches to 0x0000714480615b9d
  0x000071448061587f:   jae		0x714480615ba7
  0x0000714480615885:   movsxd		rbx, esi
  0x0000714480615888:   mov		dword ptr [r9 + rbx*4 + 0x10], edi
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000071448061588d:   inc		esi
  0x000071448061588f:   movabs		rdi, 0x714428404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x0000714480615899:   mov		ebx, dword ptr [rdi + 0x94]
  0x000071448061589f:   add		ebx, 2
  0x00007144806158a2:   mov		dword ptr [rdi + 0x94], ebx
  0x00007144806158a8:   and		ebx, 0x3ffe
  0x00007144806158ae:   test		ebx, ebx
  0x00007144806158b0:   je		0x714480615bb5      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007144806158b6:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007144806158ba:   test		dword ptr [r10], eax;   {poll}
  0x00007144806158bd:   movabs		rdi, 0x714428404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007144806158c7:   inc		dword ptr [rdi + 0x188];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007144806158cd:   cmp		esi, ecx
  0x00007144806158cf:   movabs		rdi, 0x714428404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007144806158d9:   mov		ebx, 0x168
  0x00007144806158de:   jge		0x7144806158e5
  0x00007144806158e0:   mov		ebx, 0x178
  0x00007144806158e5:   mov		rax, qword ptr [rdi + rbx]
  0x00007144806158e9:   lea		rax, [rax + 1]
  0x00007144806158ed:   mov		qword ptr [rdi + rbx], rax
  0x00007144806158f1:   jge		0x7144806159ba
  0x00007144806158f7:   jmp		0x714480615840      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x00007144806158fc:   mov		esi, 0
  0x0000714480615901:   jmp		0x714480615970      ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@31 (line 31)
  0x0000714480615906:   nop		
  0x0000714480615908:   cmp		esi, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x0000714480615bd6
  0x000071448061590b:   jae		0x714480615be0
  0x0000714480615911:   movsxd		rdi, esi
  0x0000714480615914:   movsx		edi, byte ptr [rdx + rdi + 0x10]
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
  0x0000714480615919:   and		edi, 0xff
  0x000071448061591f:   cmp		esi, dword ptr [r9 + 0xc]; implicit exception: dispatches to 0x0000714480615bee
  0x0000714480615923:   jae		0x714480615bf8
  0x0000714480615929:   movsxd		rax, esi
  0x000071448061592c:   mov		dword ptr [r9 + rax*4 + 0x10], edi
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x0000714480615931:   inc		esi
  0x0000714480615933:   movabs		rdi, 0x714428404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000071448061593d:   mov		eax, dword ptr [rdi + 0x94]
  0x0000714480615943:   add		eax, 2
  0x0000714480615946:   mov		dword ptr [rdi + 0x94], eax
  0x000071448061594c:   and		eax, 0x3ffe
  0x0000714480615951:   test		eax, eax
  0x0000714480615953:   je		0x714480615c06      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x0000714480615959:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x000071448061595d:   test		dword ptr [r10], eax;   {poll}
  0x0000714480615960:   movabs		rdi, 0x714428404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000071448061596a:   inc		dword ptr [rdi + 0x138];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x0000714480615970:   cmp		esi, ecx
  0x0000714480615972:   movabs		rdi, 0x714428404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000071448061597c:   mov		eax, 0x128
  0x0000714480615981:   jl		0x714480615988
  0x0000714480615983:   mov		eax, 0x118
  0x0000714480615988:   mov		rbx, qword ptr [rdi + rax]
  0x000071448061598c:   lea		rbx, [rbx + 1]
  0x0000714480615990:   mov		qword ptr [rdi + rax], rbx
  0x0000714480615994:   jl		0x714480615908      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x000071448061599a:   movabs		rdx, 0x714428404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007144806159a4:   inc		dword ptr [rdx + 0x150];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@56 (line 34)
  0x00007144806159aa:   add		rsp, 0x60
  0x00007144806159ae:   pop		rbp
  0x00007144806159af:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007144806159b3:   ja		0x714480615c27
  0x00007144806159b9:   ret		
  0x00007144806159ba:   movabs		rdx, 0x714428404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007144806159c4:   inc		dword ptr [rdx + 0x1a0];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@113 (line 41)
  0x00007144806159ca:   add		rsp, 0x60
  0x00007144806159ce:   pop		rbp
  0x00007144806159cf:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007144806159d3:   ja		0x714480615c3d
  0x00007144806159d9:   ret		                    ;*return {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@130 (line 45)
  0x00007144806159da:   nop		word ptr [rax + rax]
  0x00007144806159e0:   jmp		0x714480615c62      ;   {other}
  0x00007144806159e5:   add		byte ptr [rax], al
  0x00007144806159e7:   add		byte ptr [rax], al
  0x00007144806159e9:   add		byte ptr [rax + 0x130ba], al
  0x00007144806159ef:   add		byte ptr [rdi + rcx], al
  0x00007144806159f2:   test		dword ptr [rdx + 2], edi
  0x00007144806159f5:   add		byte ptr [rax], al
  0x00007144806159f7:   mov		rax, qword ptr [r15 + 0x1c8]
  0x00007144806159fe:   lea		rdi, [rax + 0x28]
  0x0000714480615a02:   cmp		rdi, qword ptr [r15 + 0x1d8]
  0x0000714480615a09:   ja		0x714480615c71
  0x0000714480615a0f:   mov		qword ptr [r15 + 0x1c8], rdi
  0x0000714480615a16:   mov		qword ptr [rax], 1
  0x0000714480615a1d:   mov		rcx, rdx
  0x0000714480615a20:   mov		r10d, 0x1b000000
  0x0000714480615a26:   sub		rcx, r10
  0x0000714480615a29:   mov		dword ptr [rax + 8], ecx
  0x0000714480615a2c:   xor		rcx, rcx
  0x0000714480615a2f:   mov		dword ptr [rax + 0xc], ecx
  0x0000714480615a32:   xor		rcx, rcx
  0x0000714480615a35:   mov		qword ptr [rax + 0x10], rcx
  0x0000714480615a39:   mov		qword ptr [rax + 0x18], rcx
  0x0000714480615a3d:   mov		qword ptr [rax + 0x20], rcx
                                                            ;*new {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
  0x0000714480615a41:   nop		dword ptr [rax]
  0x0000714480615a48:   jmp		0x714480615c8d      ;   {other}
  0x0000714480615a4d:   nop		
  0x0000714480615a4e:   nop		
  0x0000714480615a4f:   nop		
  0x0000714480615a50:   nop		
  0x0000714480615a51:   nop		
  0x0000714480615a52:   mov		rsi, r8             ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
  0x0000714480615a55:   mov		qword ptr [rsp + 0x48], rax
  0x0000714480615a5a:   nop		dword ptr [rax + rax]
  0x0000714480615a5f:   call		0x714487a664e0      ; ImmutableOopMap {[72]=Oop }
                                                            ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
                                                            ;   {static_call}
  0x0000714480615a64:   nop		dword ptr [rax + rax + 0x20003dc]
                                                            ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
                                                            ;   {post_call_nop}
  0x0000714480615a6c:   movabs		rdx, 0x714428404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x0000714480615a76:   lea		rdx, [rdx + 0x1c8]
  0x0000714480615a7d:   test		rax, rax
  0x0000714480615a80:   jne		0x714480615a8c
  0x0000714480615a82:   test		byte ptr [rdx], 1
  0x0000714480615a85:   jne		0x714480615a8c
  0x0000714480615a87:   lock or		qword ptr [rdx], 1
  0x0000714480615a8c:   mov		rdx, qword ptr [rsp + 0x48]
  0x0000714480615a91:   movabs		rsi, 0x714428404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x0000714480615a9b:   add		qword ptr [rsi + 0x1d8], 1
  0x0000714480615aa3:   mov		rdx, rax
  0x0000714480615aa6:   mov		rsi, qword ptr [rsp + 0x48]
                                                            ;*invokespecial <init> {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@126 (line 42)
  0x0000714480615aab:   nop		dword ptr [rax]
  0x0000714480615aaf:   call		0x714487a65ae0      ; ImmutableOopMap {[72]=Oop }
                                                            ;*invokespecial <init> {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@126 (line 42)
                                                            ;   {optimized virtual_call}
  0x0000714480615ab4:   nop		dword ptr [rax + rax + 0x300042c]
                                                            ;*invokespecial <init> {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@126 (line 42)
                                                            ;   {post_call_nop}
  0x0000714480615abc:   mov		rax, qword ptr [rsp + 0x48]
  0x0000714480615ac1:   jmp		0x714480615cb4      ;*athrow {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@129 (line 42)
  0x0000714480615ac6:   mov		dword ptr [rsp - 0x14000], eax
  0x0000714480615acd:   push		rbp
  0x0000714480615ace:   sub		rsp, 0x60
  0x0000714480615ad2:   nop		
  0x0000714480615ad4:   cmp		dword ptr [r15 + 0x20], 0
  0x0000714480615adc:   je		0x714480615ae3
  0x0000714480615ade:   call		0x714487a4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x0000714480615ae3:   mov		edi, 0x30
  0x0000714480615ae8:   movsxd		rdi, edi
  0x0000714480615aeb:   mov		rbx, qword ptr [rsi + rdi]
  0x0000714480615aef:   mov		edi, 0x28
  0x0000714480615af4:   movsxd		rdi, edi
  0x0000714480615af7:   mov		eax, dword ptr [rsi + rdi]
  0x0000714480615afa:   mov		edi, 0x18
  0x0000714480615aff:   movsxd		rdi, edi
  0x0000714480615b02:   mov		rdx, qword ptr [rsi + rdi]
  0x0000714480615b06:   mov		edi, 0x10
  0x0000714480615b0b:   movsxd		rdi, edi
  0x0000714480615b0e:   mov		ecx, dword ptr [rsi + rdi]
  0x0000714480615b11:   mov		rdi, rsi
  0x0000714480615b14:   mov		qword ptr [rsp + 0x40], rbx
  0x0000714480615b19:   mov		dword ptr [rsp + 0x34], eax
  0x0000714480615b1d:   mov		qword ptr [rsp + 0x38], rdx
  0x0000714480615b22:   mov		dword ptr [rsp + 0x30], ecx
  0x0000714480615b26:   call		0x71449e2e7cd0      ;   {runtime_call SharedRuntime::OSR_migration_end(long*)}
  0x0000714480615b2b:   nop		dword ptr [rax + rax];   {post_call_nop}
  0x0000714480615b33:   mov		ecx, dword ptr [rsp + 0x30]
  0x0000714480615b37:   mov		rsi, rcx
  0x0000714480615b3a:   mov		rdx, qword ptr [rsp + 0x38]
  0x0000714480615b3f:   mov		r9, rdx
  0x0000714480615b42:   mov		eax, dword ptr [rsp + 0x34]
  0x0000714480615b46:   mov		rcx, rax
  0x0000714480615b49:   mov		rbx, qword ptr [rsp + 0x40]
  0x0000714480615b4e:   mov		rdx, rbx
  0x0000714480615b51:   jmp		0x714480615970
  0x0000714480615b56:   movabs		r10, 0x1c040f70     ;   {metadata({method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x0000714480615b60:   mov		qword ptr [rsp + 8], r10
  0x0000714480615b65:   mov		qword ptr [rsp], -1
  0x0000714480615b6d:   call		0x714487b47960      ; ImmutableOopMap {rsi=Oop rdx=Oop r9=Oop }
                                                            ;*synchronization entry
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@-1 (line 29)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x0000714480615b72:   jmp		0x7144806157e2
  0x0000714480615b77:   call		0x714487b3fd60      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x0000714480615b7c:   call		0x714487b3fd60      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x0000714480615b81:   mov		qword ptr [rsp], rdi
  0x0000714480615b85:   mov		qword ptr [rsp + 8], rdx
  0x0000714480615b8a:   call		0x714487b3f460      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x0000714480615b8f:   mov		qword ptr [rsp], rdi
  0x0000714480615b93:   mov		qword ptr [rsp + 8], rdx
  0x0000714480615b98:   call		0x714487b3f460      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@87 (line 38)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x0000714480615b9d:   call		0x714487b3fd60      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x0000714480615ba2:   call		0x714487b3fd60      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x0000714480615ba7:   mov		qword ptr [rsp], rsi
  0x0000714480615bab:   mov		qword ptr [rsp + 8], r9
  0x0000714480615bb0:   call		0x714487b3f460      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x0000714480615bb5:   movabs		r10, 0x1c040f70     ;   {metadata({method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x0000714480615bbf:   mov		qword ptr [rsp + 8], r10
  0x0000714480615bc4:   mov		qword ptr [rsp], 0x6e
  0x0000714480615bcc:   call		0x714487b47960      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x0000714480615bd1:   jmp		0x7144806158b6
  0x0000714480615bd6:   call		0x714487b3fd60      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x0000714480615bdb:   call		0x714487b3fd60      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x0000714480615be0:   mov		qword ptr [rsp], rsi
  0x0000714480615be4:   mov		qword ptr [rsp + 8], rdx
  0x0000714480615be9:   call		0x714487b3f460      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x0000714480615bee:   call		0x714487b3fd60      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x0000714480615bf3:   call		0x714487b3fd60      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x0000714480615bf8:   mov		qword ptr [rsp], rsi
  0x0000714480615bfc:   mov		qword ptr [rsp + 8], r9
  0x0000714480615c01:   call		0x714487b3f460      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x0000714480615c06:   movabs		r10, 0x1c040f70     ;   {metadata({method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x0000714480615c10:   mov		qword ptr [rsp + 8], r10
  0x0000714480615c15:   mov		qword ptr [rsp], 0x35
  0x0000714480615c1d:   call		0x714487b47960      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x0000714480615c22:   jmp		0x714480615959
  0x0000714480615c27:   movabs		r10, 0x7144806159af ;   {internal_word}
  0x0000714480615c31:   mov		qword ptr [r15 + 0x538], r10
  0x0000714480615c38:   jmp		0x714487a68b60      ;   {runtime_call SafepointBlob}
  0x0000714480615c3d:   movabs		r10, 0x7144806159cf ;   {internal_word}
  0x0000714480615c47:   mov		qword ptr [r15 + 0x538], r10
  0x0000714480615c4e:   jmp		0x714487a68b60      ;   {runtime_call SafepointBlob}
  0x0000714480615c53:   movabs		rdx, 0              ;   {metadata(nullptr)}
  0x0000714480615c5d:   mov		eax, 0xa050f00
  0x0000714480615c62:   call		0x714487b45960      ; ImmutableOopMap {}
                                                            ;*new {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
                                                            ;   {runtime_call C1 Runtime load_klass_patching_blob}
  0x0000714480615c67:   jmp		0x7144806159e0
  0x0000714480615c6c:   call		0x714487b3fd60      ; ImmutableOopMap {}
                                                            ;*new {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x0000714480615c71:   mov		rdx, rdx
  0x0000714480615c74:   call		0x714487b40ae0      ; ImmutableOopMap {}
                                                            ;*new {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
                                                            ;   {runtime_call C1 Runtime fast_new_instance_init_check_blob}
  0x0000714480615c79:   jmp		0x714480615a41
  0x0000714480615c7e:   movabs		rdx, 0
  0x0000714480615c88:   mov		eax, 0xa050f00
  0x0000714480615c8d:   call		0x714487b46ae0      ; ImmutableOopMap {rax=Oop }
                                                            ;*invokedynamic {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
                                                            ;   {runtime_call C1 Runtime load_appendix_patching_blob}
  0x0000714480615c92:   jmp		0x714480615a48
  0x0000714480615c97:   mov		rax, qword ptr [r15 + 0x5e0]
  0x0000714480615c9e:   mov		qword ptr [r15 + 0x5e0], 0
  0x0000714480615ca9:   mov		qword ptr [r15 + 0x5e8], 0
  0x0000714480615cb4:   add		rsp, 0x60
  0x0000714480615cb8:   pop		rbp
  0x0000714480615cb9:   jmp		0x714487b3ee60      ;   {runtime_call C1 Runtime unwind_exception_blob}
  0x0000714480615cbe:   hlt		
  0x0000714480615cbf:   hlt		
[Stub Code]
  0x0000714480615cc0:   nop		dword ptr [rax + rax];   {other}
  0x0000714480615cc5:   movabs		rbx, 0              ;   {static_stub}
  0x0000714480615ccf:   jmp		0x714480615ccf      ;   {runtime_call nmethod}
  0x0000714480615cd4:   nop		
  0x0000714480615cd5:   movabs		rbx, 0              ;   {static_stub}
  0x0000714480615cdf:   jmp		0x714480615cdf      ;   {runtime_call nmethod}
[Exception Handler]
  0x0000714480615ce4:   call		0x714487b424e0      ;   {runtime_call C1 Runtime handle_exception_from_callee_blob}
  0x0000714480615ce9:   movabs		rdi, 0x71449e6ec7cf ;   {external_word}
  0x0000714480615cf3:   and		rsp, 0xfffffffffffffff0
  0x0000714480615cf7:   call		0x71449e0f8140      ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x0000714480615cfc:   hlt		
[Deopt Handler Code]
  0x0000714480615cfd:   movabs		r10, 0x714480615cfd ;   {section_word}
  0x0000714480615d07:   push		r10
  0x0000714480615d09:   jmp		0x714487a672e0      ;   {runtime_call DeoptimizationBlob}
  0x0000714480615d0e:   hlt		
  0x0000714480615d0f:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

============================= C1-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2) 196  160 %     4       dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode @ 31 (131 bytes)
 total in heap  [0x00007144881f2a08,0x00007144881f2de8] = 992
 main code      [0x00007144881f2b00,0x00007144881f2dc8] = 712
 stub code      [0x00007144881f2dc8,0x00007144881f2de0] = 24
 oops           [0x00007144881f2de0,0x00007144881f2de8] = 8
 mutable data [0x00007144180a0de0,0x00007144180a0e30] = 80
 relocation     [0x00007144180a0de0,0x00007144180a0e18] = 56
 metadata       [0x00007144180a0e18,0x00007144180a0e30] = 24
 immutable data [0x00007144181032c0,0x0000714418103598] = 728
 dependencies   [0x00007144181032c0,0x00007144181032c8] = 8
 nul chk table  [0x00007144181032c8,0x00007144181032e0] = 24
 scopes pcs     [0x00007144181032e0,0x00007144181034f0] = 528
 scopes data    [0x00007144181034f0,0x0000714418103598] = 168

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  0x00007144881f2b00:   call		0x71449e21e490      ;   {runtime_call os::breakpoint()}
  0x00007144881f2b05:   nop		word ptr [rax + rax]
  0x00007144881f2b10:   mov		dword ptr [rsp - 0x14000], eax
  0x00007144881f2b17:   push		rbp
  0x00007144881f2b18:   sub		rsp, 0x40
  0x00007144881f2b1c:   cmp		dword ptr [r15 + 0x20], 1
  0x00007144881f2b24:   jne		0x7144881f2dba
  0x00007144881f2b2a:   mov		rbp, qword ptr [rsi + 0x30]
  0x00007144881f2b2e:   mov		r14, qword ptr [rsi + 0x18]
  0x00007144881f2b32:   mov		ebx, dword ptr [rsi + 0x10]
  0x00007144881f2b35:   mov		r13d, dword ptr [rsi + 0x28]
  0x00007144881f2b39:   mov		rdi, rsi
  0x00007144881f2b3c:   movabs		r10, 0x71449e2e7cd0 ;   {runtime_call SharedRuntime::OSR_migration_end(long*)}
  0x00007144881f2b46:   call		r10
  0x00007144881f2b49:   nop		dword ptr [rax + rax];   {post_call_nop}
  0x00007144881f2b51:   test		rbp, rbp
  0x00007144881f2b54:   je		0x7144881f2d03
  0x00007144881f2b5a:   mov		r11d, dword ptr [rbp + 8]
  0x00007144881f2b5e:   cmp		r11d, 0x173310      ;   {metadata({type array byte})}
  0x00007144881f2b65:   jne		0x7144881f2d60
  0x00007144881f2b6b:   mov		r11, rbp
  0x00007144881f2b6e:   test		r14, r14
  0x00007144881f2b71:   je		0x7144881f2d0b
  0x00007144881f2b77:   mov		r10d, dword ptr [r14 + 8]
  0x00007144881f2b7b:   cmp		r10d, 0x173710      ;   {metadata({type array int})}
  0x00007144881f2b82:   jne		0x7144881f2d60      ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@31 (line 31)
  0x00007144881f2b88:   mov		r8d, dword ptr [r11 + 0xc]
                                                            ; implicit exception: dispatches to 0x00007144881f2d80
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
  0x00007144881f2b8c:   mov		ecx, dword ptr [r14 + 0xc]
                                                            ; implicit exception: dispatches to 0x00007144881f2d80
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007144881f2b90:   cmp		ebx, r13d
  0x00007144881f2b93:   jge		0x7144881f2cf3      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x00007144881f2b99:   lea		r10d, [rbx + 1]
  0x00007144881f2b9d:   movsxd		r9, r10d
  0x00007144881f2ba0:   xor		edi, edi
  0x00007144881f2ba2:   test		r10d, r10d
  0x00007144881f2ba5:   cmovl		r9, rdi
  0x00007144881f2ba9:   mov		r9d, r9d
  0x00007144881f2bac:   cmp		r9d, r13d
  0x00007144881f2baf:   cmovg		r9d, r13d
  0x00007144881f2bb3:   cmp		ebx, r8d
  0x00007144881f2bb6:   jae		0x7144881f2d13
  0x00007144881f2bbc:   movzx		ebp, byte ptr [r11 + rbx + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007144881f2bc2:   cmp		ebx, ecx
  0x00007144881f2bc4:   jae		0x7144881f2d3c
  0x00007144881f2bca:   mov		dword ptr [r14 + rbx*4 + 0x10], ebp
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007144881f2bcf:   inc		ebx                 ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@50 (line 31)
  0x00007144881f2bd1:   cmp		ebx, r9d
  0x00007144881f2bd4:   jl		0x7144881f2bb3      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x00007144881f2bd6:   movsxd		r10, ecx
  0x00007144881f2bd9:   movsxd		r9, r13d
  0x00007144881f2bdc:   movsxd		rdi, r8d
  0x00007144881f2bdf:   cmp		r9, rdi
  0x00007144881f2be2:   cmovl		rdi, r9
  0x00007144881f2be6:   cmp		r10, rdi
  0x00007144881f2be9:   cmovl		rdi, r10
  0x00007144881f2bed:   add		rdi, -7
  0x00007144881f2bf1:   mov		r10, -0x80000000
  0x00007144881f2bf8:   cmp		rdi, -0x80000000
  0x00007144881f2bff:   cmovl		rdi, r10
  0x00007144881f2c03:   mov		edi, edi
  0x00007144881f2c05:   cmp		ebx, edi
  0x00007144881f2c07:   jge		0x7144881f2cd2      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007144881f2c0d:   jmp		0x7144881f2c1d
  0x00007144881f2c0f:   vmovd		r13d, xmm1
  0x00007144881f2c14:   vmovd		r8d, xmm0
  0x00007144881f2c19:   vmovd		ecx, xmm3
  0x00007144881f2c1d:   mov		esi, edi
  0x00007144881f2c1f:   sub		esi, ebx
  0x00007144881f2c21:   xor		r9d, r9d
  0x00007144881f2c24:   cmp		edi, ebx
  0x00007144881f2c26:   cmovl		esi, r9d
  0x00007144881f2c2a:   cmp		esi, 0x1f40
  0x00007144881f2c30:   mov		r9d, 0x1f40
  0x00007144881f2c36:   cmova		esi, r9d
  0x00007144881f2c3a:   add		esi, ebx
  0x00007144881f2c3c:   vmovd		xmm1, r13d
  0x00007144881f2c41:   vmovd		xmm0, r8d
  0x00007144881f2c46:   vmovd		xmm3, ecx
  0x00007144881f2c4a:   nop		word ptr [rax + rax];*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
  0x00007144881f2c50:   movsxd		rax, ebx
  0x00007144881f2c53:   movzx		r10d, byte ptr [r11 + rax + 0x11]
  0x00007144881f2c59:   movzx		r9d, byte ptr [r11 + rax + 0x17]
  0x00007144881f2c5f:   movzx		r8d, byte ptr [r11 + rax + 0x16]
  0x00007144881f2c65:   movzx		edx, byte ptr [r11 + rax + 0x15]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007144881f2c6b:   movsxd		r13, ebx            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
  0x00007144881f2c6e:   movzx		ecx, byte ptr [r11 + rax + 0x13]
  0x00007144881f2c74:   movzx		ebp, byte ptr [r11 + r13 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007144881f2c7a:   mov		dword ptr [r14 + r13*4 + 0x10], ebp
                                                            ;   {other}
  0x00007144881f2c7f:   mov		dword ptr [r14 + rax*4 + 0x14], r10d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007144881f2c84:   movzx		r10d, byte ptr [r11 + rax + 0x12]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007144881f2c8a:   mov		dword ptr [r14 + rax*4 + 0x18], r10d
  0x00007144881f2c8f:   mov		dword ptr [r14 + rax*4 + 0x1c], ecx
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007144881f2c94:   movzx		r10d, byte ptr [r11 + rax + 0x14]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007144881f2c9a:   mov		dword ptr [r14 + rax*4 + 0x20], r10d
  0x00007144881f2c9f:   mov		dword ptr [r14 + rax*4 + 0x24], edx
  0x00007144881f2ca4:   mov		dword ptr [r14 + rax*4 + 0x28], r8d
  0x00007144881f2ca9:   mov		dword ptr [r14 + rax*4 + 0x2c], r9d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007144881f2cae:   add		ebx, 8              ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@50 (line 31)
  0x00007144881f2cb1:   cmp		ebx, esi
  0x00007144881f2cb3:   jl		0x7144881f2c50      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007144881f2cb5:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r11=Oop r14=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007144881f2cb9:   test		dword ptr [r10], eax;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
                                                            ;   {poll}
  0x00007144881f2cbc:   cmp		ebx, edi
  0x00007144881f2cbe:   jl		0x7144881f2c0f
  0x00007144881f2cc4:   vmovd		r13d, xmm1
  0x00007144881f2cc9:   vmovd		r8d, xmm0
  0x00007144881f2cce:   vmovd		ecx, xmm3
  0x00007144881f2cd2:   cmp		ebx, r13d
  0x00007144881f2cd5:   jge		0x7144881f2cf3
  0x00007144881f2cd7:   nop		
  0x00007144881f2cd8:   cmp		ebx, r8d
  0x00007144881f2cdb:   jae		0x7144881f2d13
  0x00007144881f2cdd:   movzx		ebp, byte ptr [r11 + rbx + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007144881f2ce3:   cmp		ebx, ecx
  0x00007144881f2ce5:   jae		0x7144881f2d3c
  0x00007144881f2ce7:   mov		dword ptr [r14 + rbx*4 + 0x10], ebp
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007144881f2cec:   inc		ebx                 ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@50 (line 31)
  0x00007144881f2cee:   cmp		ebx, r13d
  0x00007144881f2cf1:   jl		0x7144881f2cd8      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x00007144881f2cf3:   add		rsp, 0x40
  0x00007144881f2cf7:   pop		rbp
  0x00007144881f2cf8:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007144881f2cfc:   ja		0x7144881f2da4
  0x00007144881f2d02:   ret		
  0x00007144881f2d03:   xor		r11d, r11d
  0x00007144881f2d06:   jmp		0x7144881f2b6e
  0x00007144881f2d0b:   xor		r14d, r14d
  0x00007144881f2d0e:   jmp		0x7144881f2b88
  0x00007144881f2d13:   mov		esi, 0xffffffe4
  0x00007144881f2d18:   mov		dword ptr [rsp], r13d
  0x00007144881f2d1c:   mov		qword ptr [rsp + 0x10], r14
  0x00007144881f2d21:   mov		dword ptr [rsp + 0x18], ebx
  0x00007144881f2d25:   mov		qword ptr [rsp + 0x20], r11
  0x00007144881f2d2a:   mov		dword ptr [rsp + 0x1c], ebx
  0x00007144881f2d2e:   nop		
  0x00007144881f2d2f:   call		0x714487b4b6e0      ; ImmutableOopMap {[16]=Oop [32]=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007144881f2d34:   nop		dword ptr [rax + rax + 0x100032c]
                                                            ;   {post_call_nop}
  0x00007144881f2d3c:   mov		esi, 0xffffffe4
  0x00007144881f2d41:   mov		qword ptr [rsp], r11
  0x00007144881f2d45:   mov		dword ptr [rsp + 8], r13d
  0x00007144881f2d4a:   mov		qword ptr [rsp + 0x18], r14
  0x00007144881f2d4f:   mov		dword ptr [rsp + 0x20], ebx
  0x00007144881f2d53:   call		0x714487b4b6e0      ; ImmutableOopMap {[0]=Oop [24]=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007144881f2d58:   nop		dword ptr [rax + rax + 0x2000350]
                                                            ;   {post_call_nop}
  0x00007144881f2d60:   mov		esi, 0xffffff85
  0x00007144881f2d65:   mov		dword ptr [rsp], r13d
  0x00007144881f2d69:   mov		qword ptr [rsp + 8], r14
  0x00007144881f2d6e:   mov		dword ptr [rsp + 4], ebx
  0x00007144881f2d72:   nop		
  0x00007144881f2d73:   call		0x714487b4b6e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@31 (line 31)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007144881f2d78:   nop		dword ptr [rax + rax + 0x3000370]
                                                            ;   {post_call_nop}
  0x00007144881f2d80:   mov		esi, 0xffffffbe
  0x00007144881f2d85:   mov		rbp, r11
  0x00007144881f2d88:   mov		dword ptr [rsp], r13d
  0x00007144881f2d8c:   mov		qword ptr [rsp + 8], r14
  0x00007144881f2d91:   mov		dword ptr [rsp + 4], ebx
  0x00007144881f2d95:   nop		
  0x00007144881f2d97:   call		0x714487b4b6e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@31 (line 31)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007144881f2d9c:   nop		dword ptr [rax + rax + 0x4000394]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
                                                            ;   {post_call_nop}
  0x00007144881f2da4:   movabs		r10, 0x7144881f2cf8 ;   {internal_word}
  0x00007144881f2dae:   mov		qword ptr [r15 + 0x538], r10
  0x00007144881f2db5:   jmp		0x714487a68b60      ;   {runtime_call SafepointBlob}
  0x00007144881f2dba:   call		0x714487a4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007144881f2dbf:   jmp		0x7144881f2b2a
  0x00007144881f2dc4:   hlt		
  0x00007144881f2dc5:   hlt		
  0x00007144881f2dc6:   hlt		
  0x00007144881f2dc7:   hlt		
[Exception Handler]
  0x00007144881f2dc8:   jmp		0x714487b4b9e0      ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x00007144881f2dcd:   call		0x7144881f2dd2
  0x00007144881f2dd2:   sub		qword ptr [rsp], 5
  0x00007144881f2dd7:   jmp		0x714487a672e0      ;   {runtime_call DeoptimizationBlob}
  0x00007144881f2ddc:   hlt		
  0x00007144881f2ddd:   hlt		
  0x00007144881f2dde:   hlt		
  0x00007144881f2ddf:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

============================= C1-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2) 201  161       4       dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode (131 bytes)
 total in heap  [0x00007144881f3708,0x00007144881f39f8] = 752
 main code      [0x00007144881f3800,0x00007144881f39d8] = 472
 stub code      [0x00007144881f39d8,0x00007144881f39f0] = 24
 oops           [0x00007144881f39f0,0x00007144881f39f8] = 8
 mutable data [0x0000714400014d70,0x0000714400014d98] = 40
 relocation     [0x0000714400014d70,0x0000714400014d90] = 32
 metadata       [0x0000714400014d90,0x0000714400014d98] = 8
 immutable data [0x0000714400014af0,0x0000714400014d60] = 624
 dependencies   [0x0000714400014af0,0x0000714400014af8] = 8
 nul chk table  [0x0000714400014af8,0x0000714400014b10] = 24
 scopes pcs     [0x0000714400014b10,0x0000714400014cd0] = 448
 scopes data    [0x0000714400014cd0,0x0000714400014d60] = 144

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Instructions begin]
  0x00007144881f3800:   nop		
[Entry Point]
  # {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  # this:     rsi:rsi   = 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  # parm0:    rdx:rdx   = '[B'
  # parm1:    rcx       = int
  # parm2:    r8        = int
  # parm3:    r9:r9     = '[I'
  #           [sp+0x40]  (sp of caller)
  0x00007144881f3802:   mov		r10d, dword ptr [rsi + 8]
  0x00007144881f3806:   cmp		r10d, dword ptr [rax + 8]
  0x00007144881f380a:   jne		0x714487a655e0      ;   {runtime_call Shared Runtime ic_miss_blob}
[Verified Entry Point]
  0x00007144881f3810:   mov		dword ptr [rsp - 0x14000], eax
  0x00007144881f3817:   push		rbp
  0x00007144881f3818:   sub		rsp, 0x30
  0x00007144881f381c:   cmp		dword ptr [r15 + 0x20], 1
  0x00007144881f3824:   jne		0x7144881f39ca      ;*synchronization entry
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@-1 (line 29)
  0x00007144881f382a:   cmp		r8d, 8
  0x00007144881f382e:   jne		0x7144881f3990      ;*lookupswitch {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@1 (line 29)
  0x00007144881f3834:   test		ecx, ecx
  0x00007144881f3836:   jle		0x7144881f3960      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x00007144881f383c:   mov		r11d, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x00007144881f3970
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
  0x00007144881f3840:   test		r11d, r11d
  0x00007144881f3843:   jbe		0x7144881f3970
  0x00007144881f3849:   movsxd		r10, ecx
  0x00007144881f384c:   movsxd		r11, r11d
  0x00007144881f384f:   lea		r8, [r10 - 1]
  0x00007144881f3853:   cmp		r8, r11
  0x00007144881f3856:   jae		0x7144881f3970
  0x00007144881f385c:   mov		ebx, dword ptr [r9 + 0xc]; implicit exception: dispatches to 0x00007144881f3970
  0x00007144881f3860:   test		ebx, ebx
  0x00007144881f3862:   jbe		0x7144881f3970
  0x00007144881f3868:   movsxd		r11, ebx
  0x00007144881f386b:   cmp		r8, r11
  0x00007144881f386e:   jae		0x7144881f3970
  0x00007144881f3874:   movzx		r11d, byte ptr [rdx + 0x10]
  0x00007144881f3879:   mov		dword ptr [r9 + 0x10], r11d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007144881f387d:   add		r10, -7
  0x00007144881f3881:   mov		r11, -0x80000000
  0x00007144881f3888:   cmp		r10, -0x80000000
  0x00007144881f388f:   cmovl		r10, r11
  0x00007144881f3893:   mov		ebp, r10d
  0x00007144881f3896:   mov		edi, 1
  0x00007144881f389b:   cmp		ebp, 1
  0x00007144881f389e:   jle		0x7144881f3945      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007144881f38a4:   jmp		0x7144881f38aa
  0x00007144881f38a6:   vmovd		ecx, xmm0
  0x00007144881f38aa:   mov		eax, ebp
  0x00007144881f38ac:   sub		eax, edi
  0x00007144881f38ae:   xor		r11d, r11d
  0x00007144881f38b1:   cmp		ebp, edi
  0x00007144881f38b3:   cmovl		eax, r11d
  0x00007144881f38b7:   cmp		eax, 0x1f40
  0x00007144881f38bc:   mov		r11d, 0x1f40
  0x00007144881f38c2:   cmova		eax, r11d
  0x00007144881f38c6:   add		eax, edi
  0x00007144881f38c8:   vmovd		xmm0, ecx
  0x00007144881f38cc:   nop		dword ptr [rax]     ;*aload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@37 (line 32)
  0x00007144881f38d0:   movsxd		r14, edi            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007144881f38d3:   movzx		r11d, byte ptr [rdx + r14 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007144881f38d9:   mov		dword ptr [r9 + r14*4 + 0x10], r11d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007144881f38de:   movzx		r10d, byte ptr [rdx + r14 + 0x17]
  0x00007144881f38e4:   movzx		r8d, byte ptr [rdx + r14 + 0x16]
  0x00007144881f38ea:   movzx		r11d, byte ptr [rdx + r14 + 0x15]
  0x00007144881f38f0:   movzx		ebx, byte ptr [rdx + r14 + 0x14]
  0x00007144881f38f6:   movzx		ecx, byte ptr [rdx + r14 + 0x13]
  0x00007144881f38fc:   movzx		esi, byte ptr [rdx + r14 + 0x12]
  0x00007144881f3902:   movzx		r13d, byte ptr [rdx + r14 + 0x11]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007144881f3908:   mov		dword ptr [r9 + r14*4 + 0x14], r13d
                                                            ;   {other}
  0x00007144881f390d:   mov		dword ptr [r9 + r14*4 + 0x18], esi
  0x00007144881f3912:   mov		dword ptr [r9 + r14*4 + 0x1c], ecx
  0x00007144881f3917:   mov		dword ptr [r9 + r14*4 + 0x20], ebx
  0x00007144881f391c:   mov		dword ptr [r9 + r14*4 + 0x24], r11d
  0x00007144881f3921:   mov		dword ptr [r9 + r14*4 + 0x28], r8d
  0x00007144881f3926:   mov		dword ptr [r9 + r14*4 + 0x2c], r10d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007144881f392b:   add		edi, 8              ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@50 (line 31)
  0x00007144881f392e:   cmp		edi, eax
  0x00007144881f3930:   jl		0x7144881f38d0      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007144881f3932:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007144881f3936:   test		dword ptr [r10], eax;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
                                                            ;   {poll}
  0x00007144881f3939:   cmp		edi, ebp
  0x00007144881f393b:   jl		0x7144881f38a6
  0x00007144881f3941:   vmovd		ecx, xmm0
  0x00007144881f3945:   cmp		edi, ecx
  0x00007144881f3947:   jge		0x7144881f3960
  0x00007144881f3949:   nop		                    ;*aload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@37 (line 32)
  0x00007144881f394c:   movsxd		r10, edi            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007144881f394f:   movzx		r8d, byte ptr [rdx + r10 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007144881f3955:   mov		dword ptr [r9 + r10*4 + 0x10], r8d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007144881f395a:   inc		edi                 ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@50 (line 31)
  0x00007144881f395c:   cmp		edi, ecx
  0x00007144881f395e:   jl		0x7144881f394c
  0x00007144881f3960:   add		rsp, 0x30
  0x00007144881f3964:   pop		rbp
  0x00007144881f3965:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007144881f3969:   ja		0x7144881f39b4
  0x00007144881f396f:   ret		                    ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x00007144881f3970:   mov		esi, 0xffffff6e
  0x00007144881f3975:   mov		rbp, rdx
  0x00007144881f3978:   mov		qword ptr [rsp + 8], r9
  0x00007144881f397d:   mov		dword ptr [rsp + 4], ecx
  0x00007144881f3981:   nop		
  0x00007144881f3983:   call		0x714487b4b6e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007144881f3988:   nop		dword ptr [rax + rax + 0x1000280]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
                                                            ;   {post_call_nop}
  0x00007144881f3990:   mov		esi, 0xffffff45
  0x00007144881f3995:   mov		rbp, rdx
  0x00007144881f3998:   mov		dword ptr [rsp], ecx
  0x00007144881f399b:   mov		qword ptr [rsp + 8], r9
  0x00007144881f39a0:   mov		dword ptr [rsp + 0x10], r8d
  0x00007144881f39a5:   nop		
  0x00007144881f39a7:   call		0x714487b4b6e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*lookupswitch {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@1 (line 29)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007144881f39ac:   nop		dword ptr [rax + rax + 0x20002a4]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
                                                            ;   {post_call_nop}
  0x00007144881f39b4:   movabs		r10, 0x7144881f3965 ;   {internal_word}
  0x00007144881f39be:   mov		qword ptr [r15 + 0x538], r10
  0x00007144881f39c5:   jmp		0x714487a68b60      ;   {runtime_call SafepointBlob}
  0x00007144881f39ca:   call		0x714487a4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007144881f39cf:   jmp		0x7144881f382a
  0x00007144881f39d4:   hlt		
  0x00007144881f39d5:   hlt		
  0x00007144881f39d6:   hlt		
  0x00007144881f39d7:   hlt		
[Exception Handler]
  0x00007144881f39d8:   jmp		0x714487b4b9e0      ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x00007144881f39dd:   call		0x7144881f39e2
  0x00007144881f39e2:   sub		qword ptr [rsp], 5
  0x00007144881f39e7:   jmp		0x714487a672e0      ;   {runtime_call DeoptimizationBlob}
  0x00007144881f39ec:   hlt		
  0x00007144881f39ed:   hlt		
  0x00007144881f39ee:   hlt		
  0x00007144881f39ef:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

