Compiled method (c1) 206  160 %     3       dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode @ 31 (131 bytes)
 total in heap  [0x00007f3708617b88,0x00007f3708618218] = 1680
 main code      [0x00007f3708617c80,0x00007f37086181c0] = 1344
 stub code      [0x00007f37086181c0,0x00007f3708618210] = 80
 oops           [0x00007f3708618210,0x00007f3708618218] = 8
 mutable data [0x00007f369001db00,0x00007f369001dba8] = 168
 relocation     [0x00007f369001db00,0x00007f369001dba0] = 160
 metadata       [0x00007f369001dba0,0x00007f369001dba8] = 8
 immutable data [0x00007f369001dc30,0x00007f369001e0d0] = 1184
 dependencies   [0x00007f369001dc30,0x00007f369001dc38] = 8
 nul chk table  [0x00007f369001dc38,0x00007f369001dc88] = 80
 scopes pcs     [0x00007f369001dc88,0x00007f369001dfa8] = 800
 scopes data    [0x00007f369001dfa8,0x00007f369001e0d0] = 296

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Instructions begin]
  0x00007f3708617c80:   nop		word ptr [rax + rax]
  0x00007f3708617c89:   nop		word ptr [rax + rax]
[Entry Point]
  # {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  0x00007f3708617c92:   mov		r10d, dword ptr [rsi + 8]
  0x00007f3708617c96:   cmp		r10d, dword ptr [rax + 8]
  0x00007f3708617c9a:   jne		0x7f370fa655e0      ;   {runtime_call Shared Runtime ic_miss_blob}
[Verified Entry Point]
  0x00007f3708617ca0:   mov		dword ptr [rsp - 0x14000], eax
  0x00007f3708617ca7:   push		rbp
  0x00007f3708617ca8:   sub		rsp, 0x60
  0x00007f3708617cac:   cmp		dword ptr [r15 + 0x20], 1
  0x00007f3708617cb4:   je		0x7f3708617cbb
  0x00007f3708617cb6:   call		0x7f370fa4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007f3708617cbb:   movabs		rdi, 0x7f36b0404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708617cc5:   mov		ebx, dword ptr [rdi + 0x90]
  0x00007f3708617ccb:   add		ebx, 2
  0x00007f3708617cce:   mov		dword ptr [rdi + 0x90], ebx
  0x00007f3708617cd4:   and		ebx, 0x7fe
  0x00007f3708617cda:   test		ebx, ebx
  0x00007f3708617cdc:   je		0x7f3708618056      ;*iload_3 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@0 (line 29)
  0x00007f3708617ce2:   movabs		rsi, 0x7f36b0404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708617cec:   mov		edi, 0xe0
  0x00007f3708617cf1:   cmp		r8d, 8
  0x00007f3708617cf5:   mov		rbx, rdi
  0x00007f3708617cf8:   mov		edi, 0xf0
  0x00007f3708617cfd:   cmovne		rdi, rbx
  0x00007f3708617d01:   cmp		r8d, 0x10
  0x00007f3708617d05:   mov		rbx, rdi
  0x00007f3708617d08:   mov		edi, 0x100
  0x00007f3708617d0d:   cmovne		rdi, rbx
  0x00007f3708617d11:   mov		rbx, qword ptr [rsi + rdi]
  0x00007f3708617d15:   mov		r10d, 1
  0x00007f3708617d1b:   add		rbx, r10
  0x00007f3708617d1e:   mov		qword ptr [rsi + rdi], rbx
  0x00007f3708617d22:   cmp		r8d, 8
  0x00007f3708617d26:   je		0x7f3708617dfc
  0x00007f3708617d2c:   cmp		r8d, 0x10
  0x00007f3708617d30:   jne		0x7f3708617eda      ;*lookupswitch {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@1 (line 29)
  0x00007f3708617d36:   mov		esi, 0
  0x00007f3708617d3b:   jmp		0x7f3708617dcd      ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@62 (line 36)
  0x00007f3708617d40:   mov		rdi, rsi
  0x00007f3708617d43:   shl		edi, 1
  0x00007f3708617d45:   cmp		edi, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x00007f3708618077
  0x00007f3708617d48:   jae		0x7f3708618081
  0x00007f3708617d4e:   movsxd		rbx, edi
  0x00007f3708617d51:   movsx		ebx, byte ptr [rdx + rbx + 0x10]
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
  0x00007f3708617d56:   and		ebx, 0xff
  0x00007f3708617d5c:   inc		edi
  0x00007f3708617d5e:   cmp		edi, dword ptr [rdx + 0xc]
  0x00007f3708617d61:   jae		0x7f370861808f
  0x00007f3708617d67:   movsxd		rdi, edi
  0x00007f3708617d6a:   movsx		edi, byte ptr [rdx + rdi + 0x10]
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@87 (line 38)
  0x00007f3708617d6f:   and		edi, 0xff
  0x00007f3708617d75:   shl		edi, 8
  0x00007f3708617d78:   or		rdi, rbx
  0x00007f3708617d7b:   cmp		esi, dword ptr [r9 + 0xc]; implicit exception: dispatches to 0x00007f370861809d
  0x00007f3708617d7f:   jae		0x7f37086180a7
  0x00007f3708617d85:   movsxd		rbx, esi
  0x00007f3708617d88:   mov		dword ptr [r9 + rbx*4 + 0x10], edi
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007f3708617d8d:   inc		esi
  0x00007f3708617d8f:   movabs		rdi, 0x7f36b0404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708617d99:   mov		ebx, dword ptr [rdi + 0x94]
  0x00007f3708617d9f:   add		ebx, 2
  0x00007f3708617da2:   mov		dword ptr [rdi + 0x94], ebx
  0x00007f3708617da8:   and		ebx, 0x3ffe
  0x00007f3708617dae:   test		ebx, ebx
  0x00007f3708617db0:   je		0x7f37086180b5      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007f3708617db6:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007f3708617dba:   test		dword ptr [r10], eax;   {poll}
  0x00007f3708617dbd:   movabs		rdi, 0x7f36b0404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708617dc7:   inc		dword ptr [rdi + 0x188];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007f3708617dcd:   cmp		esi, ecx
  0x00007f3708617dcf:   movabs		rdi, 0x7f36b0404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708617dd9:   mov		ebx, 0x168
  0x00007f3708617dde:   jge		0x7f3708617de5
  0x00007f3708617de0:   mov		ebx, 0x178
  0x00007f3708617de5:   mov		rax, qword ptr [rdi + rbx]
  0x00007f3708617de9:   lea		rax, [rax + 1]
  0x00007f3708617ded:   mov		qword ptr [rdi + rbx], rax
  0x00007f3708617df1:   jge		0x7f3708617eba
  0x00007f3708617df7:   jmp		0x7f3708617d40      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x00007f3708617dfc:   mov		esi, 0
  0x00007f3708617e01:   jmp		0x7f3708617e70      ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@31 (line 31)
  0x00007f3708617e06:   nop		
  0x00007f3708617e08:   cmp		esi, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x00007f37086180d6
  0x00007f3708617e0b:   jae		0x7f37086180e0
  0x00007f3708617e11:   movsxd		rdi, esi
  0x00007f3708617e14:   movsx		edi, byte ptr [rdx + rdi + 0x10]
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
  0x00007f3708617e19:   and		edi, 0xff
  0x00007f3708617e1f:   cmp		esi, dword ptr [r9 + 0xc]; implicit exception: dispatches to 0x00007f37086180ee
  0x00007f3708617e23:   jae		0x7f37086180f8
  0x00007f3708617e29:   movsxd		rax, esi
  0x00007f3708617e2c:   mov		dword ptr [r9 + rax*4 + 0x10], edi
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f3708617e31:   inc		esi
  0x00007f3708617e33:   movabs		rdi, 0x7f36b0404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708617e3d:   mov		eax, dword ptr [rdi + 0x94]
  0x00007f3708617e43:   add		eax, 2
  0x00007f3708617e46:   mov		dword ptr [rdi + 0x94], eax
  0x00007f3708617e4c:   and		eax, 0x3ffe
  0x00007f3708617e51:   test		eax, eax
  0x00007f3708617e53:   je		0x7f3708618106      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007f3708617e59:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007f3708617e5d:   test		dword ptr [r10], eax;   {poll}
  0x00007f3708617e60:   movabs		rdi, 0x7f36b0404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708617e6a:   inc		dword ptr [rdi + 0x138];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007f3708617e70:   cmp		esi, ecx
  0x00007f3708617e72:   movabs		rdi, 0x7f36b0404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708617e7c:   mov		eax, 0x128
  0x00007f3708617e81:   jl		0x7f3708617e88
  0x00007f3708617e83:   mov		eax, 0x118
  0x00007f3708617e88:   mov		rbx, qword ptr [rdi + rax]
  0x00007f3708617e8c:   lea		rbx, [rbx + 1]
  0x00007f3708617e90:   mov		qword ptr [rdi + rax], rbx
  0x00007f3708617e94:   jl		0x7f3708617e08      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x00007f3708617e9a:   movabs		rdx, 0x7f36b0404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708617ea4:   inc		dword ptr [rdx + 0x150];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@56 (line 34)
  0x00007f3708617eaa:   add		rsp, 0x60
  0x00007f3708617eae:   pop		rbp
  0x00007f3708617eaf:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007f3708617eb3:   ja		0x7f3708618127
  0x00007f3708617eb9:   ret		
  0x00007f3708617eba:   movabs		rdx, 0x7f36b0404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708617ec4:   inc		dword ptr [rdx + 0x1a0];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@113 (line 41)
  0x00007f3708617eca:   add		rsp, 0x60
  0x00007f3708617ece:   pop		rbp
  0x00007f3708617ecf:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007f3708617ed3:   ja		0x7f370861813d
  0x00007f3708617ed9:   ret		                    ;*return {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@130 (line 45)
  0x00007f3708617eda:   nop		word ptr [rax + rax]
  0x00007f3708617ee0:   jmp		0x7f3708618162      ;   {other}
  0x00007f3708617ee5:   add		byte ptr [rax], al
  0x00007f3708617ee7:   add		byte ptr [rax], al
  0x00007f3708617ee9:   add		byte ptr [rax + 0x130ba], al
  0x00007f3708617eef:   add		byte ptr [rdi + rcx], al
  0x00007f3708617ef2:   test		dword ptr [rdx + 2], edi
  0x00007f3708617ef5:   add		byte ptr [rax], al
  0x00007f3708617ef7:   mov		rax, qword ptr [r15 + 0x1c8]
  0x00007f3708617efe:   lea		rdi, [rax + 0x28]
  0x00007f3708617f02:   cmp		rdi, qword ptr [r15 + 0x1d8]
  0x00007f3708617f09:   ja		0x7f3708618171
  0x00007f3708617f0f:   mov		qword ptr [r15 + 0x1c8], rdi
  0x00007f3708617f16:   mov		qword ptr [rax], 1
  0x00007f3708617f1d:   mov		rcx, rdx
  0x00007f3708617f20:   mov		r10d, 0x1b000000
  0x00007f3708617f26:   sub		rcx, r10
  0x00007f3708617f29:   mov		dword ptr [rax + 8], ecx
  0x00007f3708617f2c:   xor		rcx, rcx
  0x00007f3708617f2f:   mov		dword ptr [rax + 0xc], ecx
  0x00007f3708617f32:   xor		rcx, rcx
  0x00007f3708617f35:   mov		qword ptr [rax + 0x10], rcx
  0x00007f3708617f39:   mov		qword ptr [rax + 0x18], rcx
  0x00007f3708617f3d:   mov		qword ptr [rax + 0x20], rcx
                                                            ;*new {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
  0x00007f3708617f41:   nop		dword ptr [rax]
  0x00007f3708617f48:   jmp		0x7f370861818d      ;   {other}
  0x00007f3708617f4d:   nop		
  0x00007f3708617f4e:   nop		
  0x00007f3708617f4f:   nop		
  0x00007f3708617f50:   nop		
  0x00007f3708617f51:   nop		
  0x00007f3708617f52:   mov		rsi, r8             ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
  0x00007f3708617f55:   mov		qword ptr [rsp + 0x48], rax
  0x00007f3708617f5a:   nop		dword ptr [rax + rax]
  0x00007f3708617f5f:   call		0x7f370fa664e0      ; ImmutableOopMap {[72]=Oop }
                                                            ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
                                                            ;   {static_call}
  0x00007f3708617f64:   nop		dword ptr [rax + rax + 0x20003dc]
                                                            ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
                                                            ;   {post_call_nop}
  0x00007f3708617f6c:   movabs		rdx, 0x7f36b0404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708617f76:   lea		rdx, [rdx + 0x1c8]
  0x00007f3708617f7d:   test		rax, rax
  0x00007f3708617f80:   jne		0x7f3708617f8c
  0x00007f3708617f82:   test		byte ptr [rdx], 1
  0x00007f3708617f85:   jne		0x7f3708617f8c
  0x00007f3708617f87:   lock or		qword ptr [rdx], 1
  0x00007f3708617f8c:   mov		rdx, qword ptr [rsp + 0x48]
  0x00007f3708617f91:   movabs		rsi, 0x7f36b0404080 ;   {metadata(method data for {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708617f9b:   add		qword ptr [rsi + 0x1d8], 1
  0x00007f3708617fa3:   mov		rdx, rax
  0x00007f3708617fa6:   mov		rsi, qword ptr [rsp + 0x48]
                                                            ;*invokespecial <init> {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@126 (line 42)
  0x00007f3708617fab:   nop		dword ptr [rax]
  0x00007f3708617faf:   call		0x7f370fa65ae0      ; ImmutableOopMap {[72]=Oop }
                                                            ;*invokespecial <init> {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@126 (line 42)
                                                            ;   {optimized virtual_call}
  0x00007f3708617fb4:   nop		dword ptr [rax + rax + 0x300042c]
                                                            ;*invokespecial <init> {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@126 (line 42)
                                                            ;   {post_call_nop}
  0x00007f3708617fbc:   mov		rax, qword ptr [rsp + 0x48]
  0x00007f3708617fc1:   jmp		0x7f37086181b4      ;*athrow {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@129 (line 42)
  0x00007f3708617fc6:   mov		dword ptr [rsp - 0x14000], eax
  0x00007f3708617fcd:   push		rbp
  0x00007f3708617fce:   sub		rsp, 0x60
  0x00007f3708617fd2:   nop		
  0x00007f3708617fd4:   cmp		dword ptr [r15 + 0x20], 0
  0x00007f3708617fdc:   je		0x7f3708617fe3
  0x00007f3708617fde:   call		0x7f370fa4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007f3708617fe3:   mov		edi, 0x30
  0x00007f3708617fe8:   movsxd		rdi, edi
  0x00007f3708617feb:   mov		rbx, qword ptr [rsi + rdi]
  0x00007f3708617fef:   mov		edi, 0x28
  0x00007f3708617ff4:   movsxd		rdi, edi
  0x00007f3708617ff7:   mov		eax, dword ptr [rsi + rdi]
  0x00007f3708617ffa:   mov		edi, 0x18
  0x00007f3708617fff:   movsxd		rdi, edi
  0x00007f3708618002:   mov		rdx, qword ptr [rsi + rdi]
  0x00007f3708618006:   mov		edi, 0x10
  0x00007f370861800b:   movsxd		rdi, edi
  0x00007f370861800e:   mov		ecx, dword ptr [rsi + rdi]
  0x00007f3708618011:   mov		rdi, rsi
  0x00007f3708618014:   mov		qword ptr [rsp + 0x40], rbx
  0x00007f3708618019:   mov		dword ptr [rsp + 0x34], eax
  0x00007f370861801d:   mov		qword ptr [rsp + 0x38], rdx
  0x00007f3708618022:   mov		dword ptr [rsp + 0x30], ecx
  0x00007f3708618026:   call		0x7f37272e7cd0      ;   {runtime_call SharedRuntime::OSR_migration_end(long*)}
  0x00007f370861802b:   nop		dword ptr [rax + rax];   {post_call_nop}
  0x00007f3708618033:   mov		ecx, dword ptr [rsp + 0x30]
  0x00007f3708618037:   mov		rsi, rcx
  0x00007f370861803a:   mov		rdx, qword ptr [rsp + 0x38]
  0x00007f370861803f:   mov		r9, rdx
  0x00007f3708618042:   mov		eax, dword ptr [rsp + 0x34]
  0x00007f3708618046:   mov		rcx, rax
  0x00007f3708618049:   mov		rbx, qword ptr [rsp + 0x40]
  0x00007f370861804e:   mov		rdx, rbx
  0x00007f3708618051:   jmp		0x7f3708617e70
  0x00007f3708618056:   movabs		r10, 0x1c040f70     ;   {metadata({method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708618060:   mov		qword ptr [rsp + 8], r10
  0x00007f3708618065:   mov		qword ptr [rsp], -1
  0x00007f370861806d:   call		0x7f370fb47960      ; ImmutableOopMap {rsi=Oop rdx=Oop r9=Oop }
                                                            ;*synchronization entry
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@-1 (line 29)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x00007f3708618072:   jmp		0x7f3708617ce2
  0x00007f3708618077:   call		0x7f370fb3f260      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007f370861807c:   call		0x7f370fb3f260      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007f3708618081:   mov		qword ptr [rsp], rdi
  0x00007f3708618085:   mov		qword ptr [rsp + 8], rdx
  0x00007f370861808a:   call		0x7f370fb3e960      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007f370861808f:   mov		qword ptr [rsp], rdi
  0x00007f3708618093:   mov		qword ptr [rsp + 8], rdx
  0x00007f3708618098:   call		0x7f370fb3e960      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@87 (line 38)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007f370861809d:   call		0x7f370fb3f260      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007f37086180a2:   call		0x7f370fb3f260      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007f37086180a7:   mov		qword ptr [rsp], rsi
  0x00007f37086180ab:   mov		qword ptr [rsp + 8], r9
  0x00007f37086180b0:   call		0x7f370fb3e960      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007f37086180b5:   movabs		r10, 0x1c040f70     ;   {metadata({method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f37086180bf:   mov		qword ptr [rsp + 8], r10
  0x00007f37086180c4:   mov		qword ptr [rsp], 0x6e
  0x00007f37086180cc:   call		0x7f370fb47960      ; ImmutableOopMap {rdx=Oop r9=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x00007f37086180d1:   jmp		0x7f3708617db6
  0x00007f37086180d6:   call		0x7f370fb3f260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007f37086180db:   call		0x7f370fb3f260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007f37086180e0:   mov		qword ptr [rsp], rsi
  0x00007f37086180e4:   mov		qword ptr [rsp + 8], rdx
  0x00007f37086180e9:   call		0x7f370fb3e960      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007f37086180ee:   call		0x7f370fb3f260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007f37086180f3:   call		0x7f370fb3f260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007f37086180f8:   mov		qword ptr [rsp], rsi
  0x00007f37086180fc:   mov		qword ptr [rsp + 8], r9
  0x00007f3708618101:   call		0x7f370fb3e960      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007f3708618106:   movabs		r10, 0x1c040f70     ;   {metadata({method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007f3708618110:   mov		qword ptr [rsp + 8], r10
  0x00007f3708618115:   mov		qword ptr [rsp], 0x35
  0x00007f370861811d:   call		0x7f370fb47960      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x00007f3708618122:   jmp		0x7f3708617e59
  0x00007f3708618127:   movabs		r10, 0x7f3708617eaf ;   {internal_word}
  0x00007f3708618131:   mov		qword ptr [r15 + 0x538], r10
  0x00007f3708618138:   jmp		0x7f370fa68b60      ;   {runtime_call SafepointBlob}
  0x00007f370861813d:   movabs		r10, 0x7f3708617ecf ;   {internal_word}
  0x00007f3708618147:   mov		qword ptr [r15 + 0x538], r10
  0x00007f370861814e:   jmp		0x7f370fa68b60      ;   {runtime_call SafepointBlob}
  0x00007f3708618153:   movabs		rdx, 0              ;   {metadata(nullptr)}
  0x00007f370861815d:   mov		eax, 0xa050f00
  0x00007f3708618162:   call		0x7f370fb45ee0      ; ImmutableOopMap {}
                                                            ;*new {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
                                                            ;   {runtime_call C1 Runtime load_klass_patching_blob}
  0x00007f3708618167:   jmp		0x7f3708617ee0
  0x00007f370861816c:   call		0x7f370fb3f260      ; ImmutableOopMap {}
                                                            ;*new {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007f3708618171:   mov		rdx, rdx
  0x00007f3708618174:   call		0x7f370fb40ae0      ; ImmutableOopMap {}
                                                            ;*new {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
                                                            ;   {runtime_call C1 Runtime fast_new_instance_init_check_blob}
  0x00007f3708618179:   jmp		0x7f3708617f41
  0x00007f370861817e:   movabs		rdx, 0
  0x00007f3708618188:   mov		eax, 0xa050f00
  0x00007f370861818d:   call		0x7f370fb47060      ; ImmutableOopMap {rax=Oop }
                                                            ;*invokedynamic {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
                                                            ;   {runtime_call C1 Runtime load_appendix_patching_blob}
  0x00007f3708618192:   jmp		0x7f3708617f48
  0x00007f3708618197:   mov		rax, qword ptr [r15 + 0x5e0]
  0x00007f370861819e:   mov		qword ptr [r15 + 0x5e0], 0
  0x00007f37086181a9:   mov		qword ptr [r15 + 0x5e8], 0
  0x00007f37086181b4:   add		rsp, 0x60
  0x00007f37086181b8:   pop		rbp
  0x00007f37086181b9:   jmp		0x7f370fb3dde0      ;   {runtime_call C1 Runtime unwind_exception_blob}
  0x00007f37086181be:   hlt		
  0x00007f37086181bf:   hlt		
[Stub Code]
  0x00007f37086181c0:   nop		dword ptr [rax + rax];   {other}
  0x00007f37086181c5:   movabs		rbx, 0              ;   {static_stub}
  0x00007f37086181cf:   jmp		0x7f37086181cf      ;   {runtime_call nmethod}
  0x00007f37086181d4:   nop		
  0x00007f37086181d5:   movabs		rbx, 0              ;   {static_stub}
  0x00007f37086181df:   jmp		0x7f37086181df      ;   {runtime_call nmethod}
[Exception Handler]
  0x00007f37086181e4:   call		0x7f370fb424e0      ;   {runtime_call C1 Runtime handle_exception_from_callee_blob}
  0x00007f37086181e9:   movabs		rdi, 0x7f37276ec7cf ;   {external_word}
  0x00007f37086181f3:   and		rsp, 0xfffffffffffffff0
  0x00007f37086181f7:   call		0x7f37270f8140      ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f37086181fc:   hlt		
[Deopt Handler Code]
  0x00007f37086181fd:   movabs		r10, 0x7f37086181fd ;   {section_word}
  0x00007f3708618207:   push		r10
  0x00007f3708618209:   jmp		0x7f370fa672e0      ;   {runtime_call DeoptimizationBlob}
  0x00007f370861820e:   hlt		
  0x00007f370861820f:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

============================= C1-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2) 220  161 %     4       dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode @ 31 (131 bytes)
 total in heap  [0x00007f37101f2d08,0x00007f37101f3180] = 1144
 main code      [0x00007f37101f2e00,0x00007f37101f3160] = 864
 stub code      [0x00007f37101f3160,0x00007f37101f3178] = 24
 oops           [0x00007f37101f3178,0x00007f37101f3180] = 8
 mutable data [0x00007f36a00a0de0,0x00007f36a00a0e30] = 80
 relocation     [0x00007f36a00a0de0,0x00007f36a00a0e18] = 56
 metadata       [0x00007f36a00a0e18,0x00007f36a00a0e30] = 24
 immutable data [0x00007f36a00ea980,0x00007f36a00eac58] = 728
 dependencies   [0x00007f36a00ea980,0x00007f36a00ea988] = 8
 nul chk table  [0x00007f36a00ea988,0x00007f36a00ea9a0] = 24
 scopes pcs     [0x00007f36a00ea9a0,0x00007f36a00eabb0] = 528
 scopes data    [0x00007f36a00eabb0,0x00007f36a00eac58] = 168

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  0x00007f37101f2e00:   call		0x7f372721e490      ;   {runtime_call os::breakpoint()}
  0x00007f37101f2e05:   nop		word ptr [rax + rax]
  0x00007f37101f2e10:   mov		dword ptr [rsp - 0x14000], eax
  0x00007f37101f2e17:   push		rbp
  0x00007f37101f2e18:   sub		rsp, 0x40
  0x00007f37101f2e1c:   cmp		dword ptr [r15 + 0x20], 1
  0x00007f37101f2e24:   jne		0x7f37101f3152
  0x00007f37101f2e2a:   mov		rbp, qword ptr [rsi + 0x30]
  0x00007f37101f2e2e:   mov		r13, qword ptr [rsi + 0x18]
  0x00007f37101f2e32:   mov		r14d, dword ptr [rsi + 0x10]
  0x00007f37101f2e36:   mov		ebx, dword ptr [rsi + 0x28]
  0x00007f37101f2e39:   mov		rdi, rsi
  0x00007f37101f2e3c:   movabs		r10, 0x7f37272e7cd0 ;   {runtime_call SharedRuntime::OSR_migration_end(long*)}
  0x00007f37101f2e46:   call		r10
  0x00007f37101f2e49:   nop		dword ptr [rax + rax];   {post_call_nop}
  0x00007f37101f2e51:   test		rbp, rbp
  0x00007f37101f2e54:   je		0x7f37101f3099
  0x00007f37101f2e5a:   mov		r11d, dword ptr [rbp + 8]
  0x00007f37101f2e5e:   cmp		r11d, 0x173310      ;   {metadata({type array byte})}
  0x00007f37101f2e65:   jne		0x7f37101f30f8
  0x00007f37101f2e6b:   mov		rcx, rbp
  0x00007f37101f2e6e:   test		r13, r13
  0x00007f37101f2e71:   je		0x7f37101f30a0
  0x00007f37101f2e77:   mov		r10d, dword ptr [r13 + 8]
  0x00007f37101f2e7b:   cmp		r10d, 0x173710      ;   {metadata({type array int})}
  0x00007f37101f2e82:   jne		0x7f37101f30f8      ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@31 (line 31)
  0x00007f37101f2e88:   mov		r8d, dword ptr [rcx + 0xc]
                                                            ; implicit exception: dispatches to 0x00007f37101f3118
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
  0x00007f37101f2e8c:   mov		r11d, dword ptr [r13 + 0xc]
                                                            ; implicit exception: dispatches to 0x00007f37101f3118
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f37101f2e90:   cmp		r14d, ebx
  0x00007f37101f2e93:   jge		0x7f37101f3089      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x00007f37101f2e99:   lea		r10d, [r14 + 1]
  0x00007f37101f2e9d:   movsxd		r9, r10d
  0x00007f37101f2ea0:   xor		edi, edi
  0x00007f37101f2ea2:   test		r10d, r10d
  0x00007f37101f2ea5:   cmovl		r9, rdi
  0x00007f37101f2ea9:   mov		r9d, r9d
  0x00007f37101f2eac:   cmp		r9d, ebx
  0x00007f37101f2eaf:   cmovg		r9d, ebx
  0x00007f37101f2eb3:   cmp		r14d, r8d
  0x00007f37101f2eb6:   jae		0x7f37101f30a8
  0x00007f37101f2ebc:   movzx		ebp, byte ptr [rcx + r14 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007f37101f2ec2:   cmp		r14d, r11d
  0x00007f37101f2ec5:   jae		0x7f37101f30d4
  0x00007f37101f2ecb:   mov		dword ptr [r13 + r14*4 + 0x10], ebp
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f37101f2ed0:   inc		r14d                ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@50 (line 31)
  0x00007f37101f2ed3:   cmp		r14d, r9d
  0x00007f37101f2ed6:   jl		0x7f37101f2eb3      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x00007f37101f2ed8:   movsxd		r10, r11d
  0x00007f37101f2edb:   movsxd		r9, ebx
  0x00007f37101f2ede:   movsxd		rdi, r8d
  0x00007f37101f2ee1:   cmp		r9, rdi
  0x00007f37101f2ee4:   cmovl		rdi, r9
  0x00007f37101f2ee8:   cmp		r10, rdi
  0x00007f37101f2eeb:   cmovl		rdi, r10
  0x00007f37101f2eef:   add		rdi, -0xf
  0x00007f37101f2ef3:   mov		r10, -0x80000000
  0x00007f37101f2efa:   cmp		rdi, -0x80000000
  0x00007f37101f2f01:   cmovl		rdi, r10
  0x00007f37101f2f05:   mov		edi, edi
  0x00007f37101f2f07:   cmp		r14d, edi
  0x00007f37101f2f0a:   jge		0x7f37101f3067      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007f37101f2f10:   jmp		0x7f37101f2f23
  0x00007f37101f2f12:   vmovd		ebx, xmm5
  0x00007f37101f2f16:   vmovd		r8d, xmm6
  0x00007f37101f2f1b:   vmovd		r11d, xmm7
  0x00007f37101f2f20:   mov		edi, dword ptr [rsp]
  0x00007f37101f2f23:   mov		r10d, edi
  0x00007f37101f2f26:   sub		r10d, r14d
  0x00007f37101f2f29:   xor		edx, edx
  0x00007f37101f2f2b:   cmp		edi, r14d
  0x00007f37101f2f2e:   cmovl		r10d, edx
  0x00007f37101f2f32:   cmp		r10d, 0x3e80
  0x00007f37101f2f39:   mov		edx, 0x3e80
  0x00007f37101f2f3e:   cmova		r10d, edx
  0x00007f37101f2f42:   add		r10d, r14d
  0x00007f37101f2f45:   vmovd		xmm5, ebx
  0x00007f37101f2f49:   vmovd		xmm6, r8d
  0x00007f37101f2f4e:   vmovd		xmm7, r11d
  0x00007f37101f2f53:   mov		dword ptr [rsp], edi
  0x00007f37101f2f56:   mov		dword ptr [rsp + 4], r10d
  0x00007f37101f2f5b:   nop		dword ptr [rax + rax];*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
  0x00007f37101f2f60:   movsxd		rbp, r14d
  0x00007f37101f2f63:   movzx		r11d, byte ptr [rcx + rbp + 0x11]
  0x00007f37101f2f69:   movzx		r10d, byte ptr [rcx + rbp + 0x1f]
  0x00007f37101f2f6f:   vmovd		xmm1, r10d
  0x00007f37101f2f74:   movzx		r8d, byte ptr [rcx + rbp + 0x1e]
  0x00007f37101f2f7a:   vmovd		xmm0, r8d           ;   {other}
  0x00007f37101f2f7f:   movzx		r10d, byte ptr [rcx + rbp + 0x1d]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007f37101f2f85:   vmovd		xmm3, r10d
  0x00007f37101f2f8a:   movsxd		r8, r14d            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
  0x00007f37101f2f8d:   movzx		r10d, byte ptr [rcx + rbp + 0x1b]
  0x00007f37101f2f93:   vmovd		xmm2, r10d
  0x00007f37101f2f98:   movzx		r10d, byte ptr [rcx + r8 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007f37101f2f9e:   mov		dword ptr [r13 + r8*4 + 0x10], r10d
  0x00007f37101f2fa3:   mov		dword ptr [r13 + rbp*4 + 0x14], r11d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f37101f2fa8:   movzx		esi, byte ptr [rcx + rbp + 0x1a]
  0x00007f37101f2fad:   movzx		r10d, byte ptr [rcx + rbp + 0x19]
  0x00007f37101f2fb3:   movzx		r11d, byte ptr [rcx + rbp + 0x18]
  0x00007f37101f2fb9:   movzx		r9d, byte ptr [rcx + rbp + 0x17]
  0x00007f37101f2fbf:   movzx		r8d, byte ptr [rcx + rbp + 0x16]
  0x00007f37101f2fc5:   movzx		ebx, byte ptr [rcx + rbp + 0x15]
  0x00007f37101f2fca:   movzx		edx, byte ptr [rcx + rbp + 0x14]
  0x00007f37101f2fcf:   movzx		edi, byte ptr [rcx + rbp + 0x13]
  0x00007f37101f2fd4:   movzx		eax, byte ptr [rcx + rbp + 0x12]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007f37101f2fd9:   mov		dword ptr [r13 + rbp*4 + 0x18], eax
  0x00007f37101f2fde:   mov		dword ptr [r13 + rbp*4 + 0x1c], edi
  0x00007f37101f2fe3:   mov		dword ptr [r13 + rbp*4 + 0x20], edx
  0x00007f37101f2fe8:   mov		dword ptr [r13 + rbp*4 + 0x24], ebx
  0x00007f37101f2fed:   mov		dword ptr [r13 + rbp*4 + 0x28], r8d
  0x00007f37101f2ff2:   mov		dword ptr [r13 + rbp*4 + 0x2c], r9d
  0x00007f37101f2ff7:   mov		dword ptr [r13 + rbp*4 + 0x30], r11d
  0x00007f37101f2ffc:   mov		dword ptr [r13 + rbp*4 + 0x34], r10d
  0x00007f37101f3001:   mov		dword ptr [r13 + rbp*4 + 0x38], esi
  0x00007f37101f3006:   vmovd		r11d, xmm2
  0x00007f37101f300b:   mov		dword ptr [r13 + rbp*4 + 0x3c], r11d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f37101f3010:   movzx		r10d, byte ptr [rcx + rbp + 0x1c]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007f37101f3016:   mov		dword ptr [r13 + rbp*4 + 0x40], r10d
  0x00007f37101f301b:   vmovd		r10d, xmm3
  0x00007f37101f3020:   mov		dword ptr [r13 + rbp*4 + 0x44], r10d
  0x00007f37101f3025:   vmovd		r11d, xmm0
  0x00007f37101f302a:   mov		dword ptr [r13 + rbp*4 + 0x48], r11d
  0x00007f37101f302f:   vmovd		r10d, xmm1
  0x00007f37101f3034:   mov		dword ptr [r13 + rbp*4 + 0x4c], r10d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f37101f3039:   add		r14d, 0x10          ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@50 (line 31)
  0x00007f37101f303d:   cmp		r14d, dword ptr [rsp + 4]
  0x00007f37101f3042:   jl		0x7f37101f2f60      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007f37101f3048:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {rcx=Oop r13=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007f37101f304c:   test		dword ptr [r10], eax;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
                                                            ;   {poll}
  0x00007f37101f304f:   cmp		r14d, dword ptr [rsp]
  0x00007f37101f3053:   jl		0x7f37101f2f12
  0x00007f37101f3059:   vmovd		ebx, xmm5
  0x00007f37101f305d:   vmovd		r8d, xmm6
  0x00007f37101f3062:   vmovd		r11d, xmm7
  0x00007f37101f3067:   cmp		r14d, ebx
  0x00007f37101f306a:   jge		0x7f37101f3089
  0x00007f37101f306c:   cmp		r14d, r8d
  0x00007f37101f306f:   jae		0x7f37101f30a8
  0x00007f37101f3071:   movzx		ebp, byte ptr [rcx + r14 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007f37101f3077:   cmp		r14d, r11d
  0x00007f37101f307a:   jae		0x7f37101f30d4
  0x00007f37101f307c:   mov		dword ptr [r13 + r14*4 + 0x10], ebp
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f37101f3081:   inc		r14d                ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@50 (line 31)
  0x00007f37101f3084:   cmp		r14d, ebx
  0x00007f37101f3087:   jl		0x7f37101f306c      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x00007f37101f3089:   add		rsp, 0x40
  0x00007f37101f308d:   pop		rbp
  0x00007f37101f308e:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007f37101f3092:   ja		0x7f37101f313c
  0x00007f37101f3098:   ret		
  0x00007f37101f3099:   xor		ecx, ecx
  0x00007f37101f309b:   jmp		0x7f37101f2e6e
  0x00007f37101f30a0:   xor		r13d, r13d
  0x00007f37101f30a3:   jmp		0x7f37101f2e88
  0x00007f37101f30a8:   mov		esi, 0xffffffe4
  0x00007f37101f30ad:   mov		dword ptr [rsp], ebx
  0x00007f37101f30b0:   mov		qword ptr [rsp + 0x10], r13
  0x00007f37101f30b5:   mov		dword ptr [rsp + 0x18], r14d
  0x00007f37101f30ba:   mov		qword ptr [rsp + 0x20], rcx
  0x00007f37101f30bf:   mov		dword ptr [rsp + 0x1c], r14d
  0x00007f37101f30c4:   nop		
  0x00007f37101f30c7:   call		0x7f370fb495e0      ; ImmutableOopMap {[16]=Oop [32]=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f37101f30cc:   nop		dword ptr [rax + rax + 0x10003c4]
                                                            ;   {post_call_nop}
  0x00007f37101f30d4:   mov		esi, 0xffffffe4
  0x00007f37101f30d9:   mov		qword ptr [rsp], rcx
  0x00007f37101f30dd:   mov		dword ptr [rsp + 8], ebx
  0x00007f37101f30e1:   mov		qword ptr [rsp + 0x18], r13
  0x00007f37101f30e6:   mov		dword ptr [rsp + 0x20], r14d
  0x00007f37101f30eb:   call		0x7f370fb495e0      ; ImmutableOopMap {[0]=Oop [24]=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f37101f30f0:   nop		dword ptr [rax + rax + 0x20003e8]
                                                            ;   {post_call_nop}
  0x00007f37101f30f8:   mov		esi, 0xffffff85
  0x00007f37101f30fd:   mov		dword ptr [rsp], ebx
  0x00007f37101f3100:   mov		qword ptr [rsp + 8], r13
  0x00007f37101f3105:   mov		dword ptr [rsp + 4], r14d
  0x00007f37101f310a:   nop		
  0x00007f37101f310b:   call		0x7f370fb495e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@31 (line 31)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f37101f3110:   nop		dword ptr [rax + rax + 0x3000408]
                                                            ;   {post_call_nop}
  0x00007f37101f3118:   mov		esi, 0xffffffbe
  0x00007f37101f311d:   mov		rbp, rcx
  0x00007f37101f3120:   mov		dword ptr [rsp], ebx
  0x00007f37101f3123:   mov		qword ptr [rsp + 8], r13
  0x00007f37101f3128:   mov		dword ptr [rsp + 4], r14d
  0x00007f37101f312d:   nop		
  0x00007f37101f312f:   call		0x7f370fb495e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@31 (line 31)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f37101f3134:   nop		dword ptr [rax + rax + 0x400042c]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
                                                            ;   {post_call_nop}
  0x00007f37101f313c:   movabs		r10, 0x7f37101f308e ;   {internal_word}
  0x00007f37101f3146:   mov		qword ptr [r15 + 0x538], r10
  0x00007f37101f314d:   jmp		0x7f370fa68b60      ;   {runtime_call SafepointBlob}
  0x00007f37101f3152:   call		0x7f370fa4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007f37101f3157:   jmp		0x7f37101f2e2a
  0x00007f37101f315c:   hlt		
  0x00007f37101f315d:   hlt		
  0x00007f37101f315e:   hlt		
  0x00007f37101f315f:   hlt		
[Exception Handler]
  0x00007f37101f3160:   jmp		0x7f370fb498e0      ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x00007f37101f3165:   call		0x7f37101f316a
  0x00007f37101f316a:   sub		qword ptr [rsp], 5
  0x00007f37101f316f:   jmp		0x7f370fa672e0      ;   {runtime_call DeoptimizationBlob}
  0x00007f37101f3174:   hlt		
  0x00007f37101f3175:   hlt		
  0x00007f37101f3176:   hlt		
  0x00007f37101f3177:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2) 224  162       4       dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode (131 bytes)
 total in heap  [0x00007f37101f3188,0x00007f37101f3530] = 936
 main code      [0x00007f37101f3280,0x00007f37101f3510] = 656
 stub code      [0x00007f37101f3510,0x00007f37101f3528] = 24
 oops           [0x00007f37101f3528,0x00007f37101f3530] = 8
 mutable data [0x00007f36a00eae50,0x00007f36a00eae78] = 40
 relocation     [0x00007f36a00eae50,0x00007f36a00eae70] = 32
 metadata       [0x00007f36a00eae70,0x00007f36a00eae78] = 8
 immutable data [0x00007f36a00eaef0,0x00007f36a00eb160] = 624
 dependencies   [0x00007f36a00eaef0,0x00007f36a00eaef8] = 8
 nul chk table  [0x00007f36a00eaef8,0x00007f36a00eaf10] = 24
 scopes pcs     [0x00007f36a00eaf10,0x00007f36a00eb0d0] = 448
 scopes data    [0x00007f36a00eb0d0,0x00007f36a00eb160] = 144

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Instructions begin]
  0x00007f37101f3280:   nop		
[Entry Point]
  # {method} {0x000000001c040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  # this:     rsi:rsi   = 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  # parm0:    rdx:rdx   = '[B'
  # parm1:    rcx       = int
  # parm2:    r8        = int
  # parm3:    r9:r9     = '[I'
  #           [sp+0x40]  (sp of caller)
  0x00007f37101f3282:   mov		r10d, dword ptr [rsi + 8]
  0x00007f37101f3286:   cmp		r10d, dword ptr [rax + 8]
  0x00007f37101f328a:   jne		0x7f370fa655e0      ;   {runtime_call Shared Runtime ic_miss_blob}
[Verified Entry Point]
  0x00007f37101f3290:   mov		dword ptr [rsp - 0x14000], eax
  0x00007f37101f3297:   push		rbp
  0x00007f37101f3298:   sub		rsp, 0x30
  0x00007f37101f329c:   cmp		dword ptr [r15 + 0x20], 1
  0x00007f37101f32a4:   jne		0x7f37101f3506      ;*synchronization entry
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@-1 (line 29)
  0x00007f37101f32aa:   cmp		r8d, 8
  0x00007f37101f32ae:   jne		0x7f37101f34cc      ;*lookupswitch {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@1 (line 29)
  0x00007f37101f32b4:   test		ecx, ecx
  0x00007f37101f32b6:   jle		0x7f37101f349e      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x00007f37101f32bc:   mov		r11d, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x00007f37101f34ae
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
  0x00007f37101f32c0:   test		r11d, r11d
  0x00007f37101f32c3:   jbe		0x7f37101f34ae
  0x00007f37101f32c9:   movsxd		r10, ecx
  0x00007f37101f32cc:   movsxd		r11, r11d
  0x00007f37101f32cf:   lea		r8, [r10 - 1]
  0x00007f37101f32d3:   cmp		r8, r11
  0x00007f37101f32d6:   jae		0x7f37101f34ae
  0x00007f37101f32dc:   mov		ebx, dword ptr [r9 + 0xc]; implicit exception: dispatches to 0x00007f37101f34ae
  0x00007f37101f32e0:   test		ebx, ebx
  0x00007f37101f32e2:   jbe		0x7f37101f34ae
  0x00007f37101f32e8:   movsxd		r11, ebx
  0x00007f37101f32eb:   cmp		r8, r11
  0x00007f37101f32ee:   jae		0x7f37101f34ae
  0x00007f37101f32f4:   movzx		r11d, byte ptr [rdx + 0x10]
  0x00007f37101f32f9:   mov		dword ptr [r9 + 0x10], r11d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f37101f32fd:   add		r10, -0xf
  0x00007f37101f3301:   mov		r11, -0x80000000
  0x00007f37101f3308:   cmp		r10, -0x80000000
  0x00007f37101f330f:   cmovl		r10, r11
  0x00007f37101f3313:   mov		r8d, r10d
  0x00007f37101f3316:   mov		r13d, 1
  0x00007f37101f331c:   cmp		r8d, 1
  0x00007f37101f3320:   jle		0x7f37101f3483      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007f37101f3326:   jmp		0x7f37101f3330
  0x00007f37101f3328:   vmovd		ecx, xmm5
  0x00007f37101f332c:   mov		r8d, dword ptr [rsp]
  0x00007f37101f3330:   mov		r11d, r8d
  0x00007f37101f3333:   sub		r11d, r13d
  0x00007f37101f3336:   xor		r10d, r10d
  0x00007f37101f3339:   cmp		r8d, r13d
  0x00007f37101f333c:   cmovl		r11d, r10d
  0x00007f37101f3340:   cmp		r11d, 0x3e80
  0x00007f37101f3347:   mov		r10d, 0x3e80
  0x00007f37101f334d:   cmova		r11d, r10d
  0x00007f37101f3351:   add		r11d, r13d
  0x00007f37101f3354:   vmovd		xmm5, ecx
  0x00007f37101f3358:   mov		dword ptr [rsp], r8d
  0x00007f37101f335c:   mov		dword ptr [rsp + 4], r11d
  0x00007f37101f3361:   nop		dword ptr [rax + rax]
  0x00007f37101f3369:   nop		dword ptr [rax]     ;*aload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@37 (line 32)
  0x00007f37101f3370:   movsxd		r14, r13d           ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f37101f3373:   movzx		r11d, byte ptr [rdx + r14 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007f37101f3379:   mov		dword ptr [r9 + r14*4 + 0x10], r11d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f37101f337e:   movzx		r11d, byte ptr [rdx + r14 + 0x1f]
  0x00007f37101f3384:   vmovd		xmm0, r11d
  0x00007f37101f3389:   movzx		r10d, byte ptr [rdx + r14 + 0x1e]
                                                            ;   {other}
  0x00007f37101f338f:   vmovd		xmm2, r10d
  0x00007f37101f3394:   movzx		r11d, byte ptr [rdx + r14 + 0x1d]
  0x00007f37101f339a:   vmovd		xmm1, r11d
  0x00007f37101f339f:   movzx		r11d, byte ptr [rdx + r14 + 0x1c]
  0x00007f37101f33a5:   vmovd		xmm4, r11d
  0x00007f37101f33aa:   movzx		r10d, byte ptr [rdx + r14 + 0x1b]
  0x00007f37101f33b0:   vmovd		xmm3, r10d
  0x00007f37101f33b5:   movzx		r11d, byte ptr [rdx + r14 + 0x1a]
  0x00007f37101f33bb:   vmovd		xmm6, r11d
  0x00007f37101f33c0:   movzx		r10d, byte ptr [rdx + r14 + 0x19]
  0x00007f37101f33c6:   movzx		r8d, byte ptr [rdx + r14 + 0x18]
  0x00007f37101f33cc:   movzx		r11d, byte ptr [rdx + r14 + 0x17]
  0x00007f37101f33d2:   movzx		ebx, byte ptr [rdx + r14 + 0x16]
  0x00007f37101f33d8:   movzx		ecx, byte ptr [rdx + r14 + 0x15]
  0x00007f37101f33de:   movzx		esi, byte ptr [rdx + r14 + 0x14]
  0x00007f37101f33e4:   movzx		edi, byte ptr [rdx + r14 + 0x13]
  0x00007f37101f33ea:   movzx		ebp, byte ptr [rdx + r14 + 0x12]
  0x00007f37101f33f0:   movzx		eax, byte ptr [rdx + r14 + 0x11]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007f37101f33f6:   mov		dword ptr [r9 + r14*4 + 0x14], eax
  0x00007f37101f33fb:   mov		dword ptr [r9 + r14*4 + 0x18], ebp
  0x00007f37101f3400:   mov		dword ptr [r9 + r14*4 + 0x1c], edi
  0x00007f37101f3405:   mov		dword ptr [r9 + r14*4 + 0x20], esi
  0x00007f37101f340a:   mov		dword ptr [r9 + r14*4 + 0x24], ecx
  0x00007f37101f340f:   mov		dword ptr [r9 + r14*4 + 0x28], ebx
  0x00007f37101f3414:   mov		dword ptr [r9 + r14*4 + 0x2c], r11d
  0x00007f37101f3419:   mov		dword ptr [r9 + r14*4 + 0x30], r8d
  0x00007f37101f341e:   mov		dword ptr [r9 + r14*4 + 0x34], r10d
  0x00007f37101f3423:   vmovd		r10d, xmm6
  0x00007f37101f3428:   mov		dword ptr [r9 + r14*4 + 0x38], r10d
  0x00007f37101f342d:   vmovd		r11d, xmm3
  0x00007f37101f3432:   mov		dword ptr [r9 + r14*4 + 0x3c], r11d
  0x00007f37101f3437:   vmovd		r10d, xmm4
  0x00007f37101f343c:   mov		dword ptr [r9 + r14*4 + 0x40], r10d
  0x00007f37101f3441:   vmovd		r11d, xmm1
  0x00007f37101f3446:   mov		dword ptr [r9 + r14*4 + 0x44], r11d
  0x00007f37101f344b:   vmovd		r10d, xmm2
  0x00007f37101f3450:   mov		dword ptr [r9 + r14*4 + 0x48], r10d
  0x00007f37101f3455:   vmovd		r11d, xmm0
  0x00007f37101f345a:   mov		dword ptr [r9 + r14*4 + 0x4c], r11d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f37101f345f:   add		r13d, 0x10          ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@50 (line 31)
  0x00007f37101f3463:   cmp		r13d, dword ptr [rsp + 4]
  0x00007f37101f3468:   jl		0x7f37101f3370      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007f37101f346e:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007f37101f3472:   test		dword ptr [r10], eax;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
                                                            ;   {poll}
  0x00007f37101f3475:   cmp		r13d, dword ptr [rsp]
  0x00007f37101f3479:   jl		0x7f37101f3328
  0x00007f37101f347f:   vmovd		ecx, xmm5
  0x00007f37101f3483:   cmp		r13d, ecx
  0x00007f37101f3486:   jge		0x7f37101f349e      ;*aload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@37 (line 32)
  0x00007f37101f3488:   movsxd		r10, r13d           ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f37101f348b:   movzx		r8d, byte ptr [rdx + r10 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@48 (line 32)
  0x00007f37101f3491:   mov		dword ptr [r9 + r10*4 + 0x10], r8d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007f37101f3496:   inc		r13d                ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@50 (line 31)
  0x00007f37101f3499:   cmp		r13d, ecx
  0x00007f37101f349c:   jl		0x7f37101f3488
  0x00007f37101f349e:   add		rsp, 0x30
  0x00007f37101f34a2:   pop		rbp
  0x00007f37101f34a3:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007f37101f34a7:   ja		0x7f37101f34f0
  0x00007f37101f34ad:   ret		                    ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x00007f37101f34ae:   mov		esi, 0xffffff6e
  0x00007f37101f34b3:   mov		rbp, rdx
  0x00007f37101f34b6:   mov		qword ptr [rsp + 8], r9
  0x00007f37101f34bb:   mov		dword ptr [rsp + 4], ecx
  0x00007f37101f34bf:   call		0x7f370fb495e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f37101f34c4:   nop		dword ptr [rax + rax + 0x100033c]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
                                                            ;   {post_call_nop}
  0x00007f37101f34cc:   mov		esi, 0xffffff45
  0x00007f37101f34d1:   mov		rbp, rdx
  0x00007f37101f34d4:   mov		dword ptr [rsp], ecx
  0x00007f37101f34d7:   mov		qword ptr [rsp + 8], r9
  0x00007f37101f34dc:   mov		dword ptr [rsp + 0x10], r8d
  0x00007f37101f34e1:   nop		
  0x00007f37101f34e3:   call		0x7f370fb495e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*lookupswitch {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@1 (line 29)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f37101f34e8:   nop		dword ptr [rax + rax + 0x2000360]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
                                                            ;   {post_call_nop}
  0x00007f37101f34f0:   movabs		r10, 0x7f37101f34a3 ;   {internal_word}
  0x00007f37101f34fa:   mov		qword ptr [r15 + 0x538], r10
  0x00007f37101f3501:   jmp		0x7f370fa68b60      ;   {runtime_call SafepointBlob}
  0x00007f37101f3506:   call		0x7f370fa4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007f37101f350b:   jmp		0x7f37101f32aa
[Exception Handler]
  0x00007f37101f3510:   jmp		0x7f370fb498e0      ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x00007f37101f3515:   call		0x7f37101f351a
  0x00007f37101f351a:   sub		qword ptr [rsp], 5
  0x00007f37101f351f:   jmp		0x7f370fa672e0      ;   {runtime_call DeoptimizationBlob}
  0x00007f37101f3524:   hlt		
  0x00007f37101f3525:   hlt		
  0x00007f37101f3526:   hlt		
  0x00007f37101f3527:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

