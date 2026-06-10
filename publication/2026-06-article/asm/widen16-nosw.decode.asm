Compiled method (c1) 184  164 %     3       dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode @ 62 (131 bytes)
 total in heap  [0x00007ba63c616008,0x00007ba63c616698] = 1680
 main code      [0x00007ba63c616100,0x00007ba63c616640] = 1344
 stub code      [0x00007ba63c616640,0x00007ba63c616690] = 80
 oops           [0x00007ba63c616690,0x00007ba63c616698] = 8
 mutable data [0x00007ba5c0037d40,0x00007ba5c0037de8] = 168
 relocation     [0x00007ba5c0037d40,0x00007ba5c0037de0] = 160
 metadata       [0x00007ba5c0037de0,0x00007ba5c0037de8] = 8
 immutable data [0x00007ba5c0037890,0x00007ba5c0037d30] = 1184
 dependencies   [0x00007ba5c0037890,0x00007ba5c0037898] = 8
 nul chk table  [0x00007ba5c0037898,0x00007ba5c00378e8] = 80
 scopes pcs     [0x00007ba5c00378e8,0x00007ba5c0037c08] = 800
 scopes data    [0x00007ba5c0037c08,0x00007ba5c0037d30] = 296

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Instructions begin]
  0x00007ba63c616100:   nop		word ptr [rax + rax]
  0x00007ba63c616109:   nop		word ptr [rax + rax]
[Entry Point]
  # {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  0x00007ba63c616112:   mov		r10d, dword ptr [rsi + 8]
  0x00007ba63c616116:   cmp		r10d, dword ptr [rax + 8]
  0x00007ba63c61611a:   jne		0x7ba643a655e0      ;   {runtime_call Shared Runtime ic_miss_blob}
[Verified Entry Point]
  0x00007ba63c616120:   mov		dword ptr [rsp - 0x14000], eax
  0x00007ba63c616127:   push		rbp
  0x00007ba63c616128:   sub		rsp, 0x60
  0x00007ba63c61612c:   cmp		dword ptr [r15 + 0x20], 1
  0x00007ba63c616134:   je		0x7ba63c61613b
  0x00007ba63c616136:   call		0x7ba643a4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007ba63c61613b:   movabs		rdi, 0x7ba5e0404080 ;   {metadata(method data for {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c616145:   mov		ebx, dword ptr [rdi + 0x90]
  0x00007ba63c61614b:   add		ebx, 2
  0x00007ba63c61614e:   mov		dword ptr [rdi + 0x90], ebx
  0x00007ba63c616154:   and		ebx, 0x7fe
  0x00007ba63c61615a:   test		ebx, ebx
  0x00007ba63c61615c:   je		0x7ba63c6164d6      ;*iload_3 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@0 (line 29)
  0x00007ba63c616162:   movabs		rsi, 0x7ba5e0404080 ;   {metadata(method data for {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c61616c:   mov		edi, 0xe0
  0x00007ba63c616171:   cmp		r8d, 8
  0x00007ba63c616175:   mov		rbx, rdi
  0x00007ba63c616178:   mov		edi, 0xf0
  0x00007ba63c61617d:   cmovne		rdi, rbx
  0x00007ba63c616181:   cmp		r8d, 0x10
  0x00007ba63c616185:   mov		rbx, rdi
  0x00007ba63c616188:   mov		edi, 0x100
  0x00007ba63c61618d:   cmovne		rdi, rbx
  0x00007ba63c616191:   mov		rbx, qword ptr [rsi + rdi]
  0x00007ba63c616195:   mov		r10d, 1
  0x00007ba63c61619b:   add		rbx, r10
  0x00007ba63c61619e:   mov		qword ptr [rsi + rdi], rbx
  0x00007ba63c6161a2:   cmp		r8d, 8
  0x00007ba63c6161a6:   je		0x7ba63c61627a
  0x00007ba63c6161ac:   cmp		r8d, 0x10
  0x00007ba63c6161b0:   jne		0x7ba63c61635a      ;*lookupswitch {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@1 (line 29)
  0x00007ba63c6161b6:   mov		esi, 0
  0x00007ba63c6161bb:   jmp		0x7ba63c61624b      ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@62 (line 36)
  0x00007ba63c6161c0:   mov		rdi, rsi
  0x00007ba63c6161c3:   shl		edi, 1
  0x00007ba63c6161c5:   cmp		edi, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x00007ba63c6164f7
  0x00007ba63c6161c8:   jae		0x7ba63c616501
  0x00007ba63c6161ce:   movsxd		rax, edi
  0x00007ba63c6161d1:   movsx		eax, byte ptr [rdx + rax + 0x10]
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
  0x00007ba63c6161d6:   and		eax, 0xff
  0x00007ba63c6161db:   inc		edi
  0x00007ba63c6161dd:   cmp		edi, dword ptr [rdx + 0xc]
  0x00007ba63c6161e0:   jae		0x7ba63c61650f
  0x00007ba63c6161e6:   movsxd		rdi, edi
  0x00007ba63c6161e9:   movsx		edi, byte ptr [rdx + rdi + 0x10]
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@87 (line 38)
  0x00007ba63c6161ee:   and		edi, 0xff
  0x00007ba63c6161f4:   shl		edi, 8
  0x00007ba63c6161f7:   or		rdi, rax
  0x00007ba63c6161fa:   cmp		esi, dword ptr [r9 + 0xc]; implicit exception: dispatches to 0x00007ba63c61651d
  0x00007ba63c6161fe:   jae		0x7ba63c616527
  0x00007ba63c616204:   movsxd		rax, esi
  0x00007ba63c616207:   mov		dword ptr [r9 + rax*4 + 0x10], edi
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007ba63c61620c:   inc		esi
  0x00007ba63c61620e:   movabs		rdi, 0x7ba5e0404080 ;   {metadata(method data for {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c616218:   mov		eax, dword ptr [rdi + 0x94]
  0x00007ba63c61621e:   add		eax, 2
  0x00007ba63c616221:   mov		dword ptr [rdi + 0x94], eax
  0x00007ba63c616227:   and		eax, 0x3ffe
  0x00007ba63c61622c:   test		eax, eax
  0x00007ba63c61622e:   je		0x7ba63c616535      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007ba63c616234:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007ba63c616238:   test		dword ptr [r10], eax;   {poll}
  0x00007ba63c61623b:   movabs		rdi, 0x7ba5e0404080 ;   {metadata(method data for {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c616245:   inc		dword ptr [rdi + 0x188];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007ba63c61624b:   cmp		esi, ecx
  0x00007ba63c61624d:   movabs		rdi, 0x7ba5e0404080 ;   {metadata(method data for {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c616257:   mov		eax, 0x168
  0x00007ba63c61625c:   jge		0x7ba63c616263
  0x00007ba63c61625e:   mov		eax, 0x178
  0x00007ba63c616263:   mov		rbx, qword ptr [rdi + rax]
  0x00007ba63c616267:   lea		rbx, [rbx + 1]
  0x00007ba63c61626b:   mov		qword ptr [rdi + rax], rbx
  0x00007ba63c61626f:   jge		0x7ba63c61633a
  0x00007ba63c616275:   jmp		0x7ba63c6161c0      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x00007ba63c61627a:   mov		esi, 0
  0x00007ba63c61627f:   jmp		0x7ba63c6162f0      ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@31 (line 31)
  0x00007ba63c616284:   nop		dword ptr [rax]
  0x00007ba63c616288:   cmp		esi, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x00007ba63c616556
  0x00007ba63c61628b:   jae		0x7ba63c616560
  0x00007ba63c616291:   movsxd		rdi, esi
  0x00007ba63c616294:   movsx		edi, byte ptr [rdx + rdi + 0x10]
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
  0x00007ba63c616299:   and		edi, 0xff
  0x00007ba63c61629f:   cmp		esi, dword ptr [r9 + 0xc]; implicit exception: dispatches to 0x00007ba63c61656e
  0x00007ba63c6162a3:   jae		0x7ba63c616578
  0x00007ba63c6162a9:   movsxd		rax, esi
  0x00007ba63c6162ac:   mov		dword ptr [r9 + rax*4 + 0x10], edi
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x00007ba63c6162b1:   inc		esi
  0x00007ba63c6162b3:   movabs		rdi, 0x7ba5e0404080 ;   {metadata(method data for {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c6162bd:   mov		eax, dword ptr [rdi + 0x94]
  0x00007ba63c6162c3:   add		eax, 2
  0x00007ba63c6162c6:   mov		dword ptr [rdi + 0x94], eax
  0x00007ba63c6162cc:   and		eax, 0x3ffe
  0x00007ba63c6162d1:   test		eax, eax
  0x00007ba63c6162d3:   je		0x7ba63c616586      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007ba63c6162d9:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007ba63c6162dd:   test		dword ptr [r10], eax;   {poll}
  0x00007ba63c6162e0:   movabs		rdi, 0x7ba5e0404080 ;   {metadata(method data for {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c6162ea:   inc		dword ptr [rdi + 0x138];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x00007ba63c6162f0:   cmp		esi, ecx
  0x00007ba63c6162f2:   movabs		rdi, 0x7ba5e0404080 ;   {metadata(method data for {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c6162fc:   mov		eax, 0x128
  0x00007ba63c616301:   jl		0x7ba63c616308
  0x00007ba63c616303:   mov		eax, 0x118
  0x00007ba63c616308:   mov		rbx, qword ptr [rdi + rax]
  0x00007ba63c61630c:   lea		rbx, [rbx + 1]
  0x00007ba63c616310:   mov		qword ptr [rdi + rax], rbx
  0x00007ba63c616314:   jl		0x7ba63c616288      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x00007ba63c61631a:   movabs		rdx, 0x7ba5e0404080 ;   {metadata(method data for {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c616324:   inc		dword ptr [rdx + 0x150];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@56 (line 34)
  0x00007ba63c61632a:   add		rsp, 0x60
  0x00007ba63c61632e:   pop		rbp
  0x00007ba63c61632f:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007ba63c616333:   ja		0x7ba63c6165a7
  0x00007ba63c616339:   ret		
  0x00007ba63c61633a:   movabs		rdx, 0x7ba5e0404080 ;   {metadata(method data for {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c616344:   inc		dword ptr [rdx + 0x1a0];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@113 (line 41)
  0x00007ba63c61634a:   add		rsp, 0x60
  0x00007ba63c61634e:   pop		rbp
  0x00007ba63c61634f:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007ba63c616353:   ja		0x7ba63c6165bd
  0x00007ba63c616359:   ret		                    ;*return {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@130 (line 45)
  0x00007ba63c61635a:   nop		word ptr [rax + rax]
  0x00007ba63c616360:   jmp		0x7ba63c6165e2      ;   {other}
  0x00007ba63c616365:   add		byte ptr [rax], al
  0x00007ba63c616367:   add		byte ptr [rax], al
  0x00007ba63c616369:   add		byte ptr [rax + 0x130ba], al
  0x00007ba63c61636f:   add		byte ptr [rdi + rcx], al
  0x00007ba63c616372:   test		dword ptr [rdx + 2], edi
  0x00007ba63c616375:   add		byte ptr [rax], al
  0x00007ba63c616377:   mov		rax, qword ptr [r15 + 0x1c8]
  0x00007ba63c61637e:   lea		rdi, [rax + 0x28]
  0x00007ba63c616382:   cmp		rdi, qword ptr [r15 + 0x1d8]
  0x00007ba63c616389:   ja		0x7ba63c6165f1
  0x00007ba63c61638f:   mov		qword ptr [r15 + 0x1c8], rdi
  0x00007ba63c616396:   mov		qword ptr [rax], 1
  0x00007ba63c61639d:   mov		rcx, rdx
  0x00007ba63c6163a0:   mov		r10d, 0xe000000
  0x00007ba63c6163a6:   sub		rcx, r10
  0x00007ba63c6163a9:   mov		dword ptr [rax + 8], ecx
  0x00007ba63c6163ac:   xor		rcx, rcx
  0x00007ba63c6163af:   mov		dword ptr [rax + 0xc], ecx
  0x00007ba63c6163b2:   xor		rcx, rcx
  0x00007ba63c6163b5:   mov		qword ptr [rax + 0x10], rcx
  0x00007ba63c6163b9:   mov		qword ptr [rax + 0x18], rcx
  0x00007ba63c6163bd:   mov		qword ptr [rax + 0x20], rcx
                                                            ;*new {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
  0x00007ba63c6163c1:   nop		dword ptr [rax]
  0x00007ba63c6163c8:   jmp		0x7ba63c61660d      ;   {other}
  0x00007ba63c6163cd:   nop		
  0x00007ba63c6163ce:   nop		
  0x00007ba63c6163cf:   nop		
  0x00007ba63c6163d0:   nop		
  0x00007ba63c6163d1:   nop		
  0x00007ba63c6163d2:   mov		rsi, r8             ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
  0x00007ba63c6163d5:   mov		qword ptr [rsp + 0x48], rax
  0x00007ba63c6163da:   nop		dword ptr [rax + rax]
  0x00007ba63c6163df:   call		0x7ba643a664e0      ; ImmutableOopMap {[72]=Oop }
                                                            ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
                                                            ;   {static_call}
  0x00007ba63c6163e4:   nop		dword ptr [rax + rax + 0x20003dc]
                                                            ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
                                                            ;   {post_call_nop}
  0x00007ba63c6163ec:   movabs		rdx, 0x7ba5e0404080 ;   {metadata(method data for {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c6163f6:   lea		rdx, [rdx + 0x1c8]
  0x00007ba63c6163fd:   test		rax, rax
  0x00007ba63c616400:   jne		0x7ba63c61640c
  0x00007ba63c616402:   test		byte ptr [rdx], 1
  0x00007ba63c616405:   jne		0x7ba63c61640c
  0x00007ba63c616407:   lock or		qword ptr [rdx], 1
  0x00007ba63c61640c:   mov		rdx, qword ptr [rsp + 0x48]
  0x00007ba63c616411:   movabs		rsi, 0x7ba5e0404080 ;   {metadata(method data for {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c61641b:   add		qword ptr [rsi + 0x1d8], 1
  0x00007ba63c616423:   mov		rdx, rax
  0x00007ba63c616426:   mov		rsi, qword ptr [rsp + 0x48]
                                                            ;*invokespecial <init> {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@126 (line 42)
  0x00007ba63c61642b:   nop		dword ptr [rax]
  0x00007ba63c61642f:   call		0x7ba643a65ae0      ; ImmutableOopMap {[72]=Oop }
                                                            ;*invokespecial <init> {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@126 (line 42)
                                                            ;   {optimized virtual_call}
  0x00007ba63c616434:   nop		dword ptr [rax + rax + 0x300042c]
                                                            ;*invokespecial <init> {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@126 (line 42)
                                                            ;   {post_call_nop}
  0x00007ba63c61643c:   mov		rax, qword ptr [rsp + 0x48]
  0x00007ba63c616441:   jmp		0x7ba63c616634      ;*athrow {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@129 (line 42)
  0x00007ba63c616446:   mov		dword ptr [rsp - 0x14000], eax
  0x00007ba63c61644d:   push		rbp
  0x00007ba63c61644e:   sub		rsp, 0x60
  0x00007ba63c616452:   nop		
  0x00007ba63c616454:   cmp		dword ptr [r15 + 0x20], 0
  0x00007ba63c61645c:   je		0x7ba63c616463
  0x00007ba63c61645e:   call		0x7ba643a4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007ba63c616463:   mov		edi, 0x30
  0x00007ba63c616468:   movsxd		rdi, edi
  0x00007ba63c61646b:   mov		rbx, qword ptr [rsi + rdi]
  0x00007ba63c61646f:   mov		edi, 0x28
  0x00007ba63c616474:   movsxd		rdi, edi
  0x00007ba63c616477:   mov		eax, dword ptr [rsi + rdi]
  0x00007ba63c61647a:   mov		edi, 0x18
  0x00007ba63c61647f:   movsxd		rdi, edi
  0x00007ba63c616482:   mov		rdx, qword ptr [rsi + rdi]
  0x00007ba63c616486:   mov		edi, 0x10
  0x00007ba63c61648b:   movsxd		rdi, edi
  0x00007ba63c61648e:   mov		ecx, dword ptr [rsi + rdi]
  0x00007ba63c616491:   mov		rdi, rsi
  0x00007ba63c616494:   mov		qword ptr [rsp + 0x40], rbx
  0x00007ba63c616499:   mov		dword ptr [rsp + 0x34], eax
  0x00007ba63c61649d:   mov		qword ptr [rsp + 0x38], rdx
  0x00007ba63c6164a2:   mov		dword ptr [rsp + 0x30], ecx
  0x00007ba63c6164a6:   call		0x7ba65ace7cd0      ;   {runtime_call SharedRuntime::OSR_migration_end(long*)}
  0x00007ba63c6164ab:   nop		dword ptr [rax + rax];   {post_call_nop}
  0x00007ba63c6164b3:   mov		ecx, dword ptr [rsp + 0x30]
  0x00007ba63c6164b7:   mov		rsi, rcx
  0x00007ba63c6164ba:   mov		rdx, qword ptr [rsp + 0x38]
  0x00007ba63c6164bf:   mov		r9, rdx
  0x00007ba63c6164c2:   mov		eax, dword ptr [rsp + 0x34]
  0x00007ba63c6164c6:   mov		rcx, rax
  0x00007ba63c6164c9:   mov		rbx, qword ptr [rsp + 0x40]
  0x00007ba63c6164ce:   mov		rdx, rbx
  0x00007ba63c6164d1:   jmp		0x7ba63c61624b
  0x00007ba63c6164d6:   movabs		r10, 0xf040f70      ;   {metadata({method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c6164e0:   mov		qword ptr [rsp + 8], r10
  0x00007ba63c6164e5:   mov		qword ptr [rsp], -1
  0x00007ba63c6164ed:   call		0x7ba643b46e60      ; ImmutableOopMap {rsi=Oop rdx=Oop r9=Oop }
                                                            ;*synchronization entry
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@-1 (line 29)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x00007ba63c6164f2:   jmp		0x7ba63c616162
  0x00007ba63c6164f7:   call		0x7ba643b3f260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007ba63c6164fc:   call		0x7ba643b3f260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007ba63c616501:   mov		qword ptr [rsp], rdi
  0x00007ba63c616505:   mov		qword ptr [rsp + 8], rdx
  0x00007ba63c61650a:   call		0x7ba643b3e960      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007ba63c61650f:   mov		qword ptr [rsp], rdi
  0x00007ba63c616513:   mov		qword ptr [rsp + 8], rdx
  0x00007ba63c616518:   call		0x7ba643b3e960      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@87 (line 38)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007ba63c61651d:   call		0x7ba643b3f260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007ba63c616522:   call		0x7ba643b3f260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007ba63c616527:   mov		qword ptr [rsp], rsi
  0x00007ba63c61652b:   mov		qword ptr [rsp + 8], r9
  0x00007ba63c616530:   call		0x7ba643b3e960      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007ba63c616535:   movabs		r10, 0xf040f70      ;   {metadata({method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c61653f:   mov		qword ptr [rsp + 8], r10
  0x00007ba63c616544:   mov		qword ptr [rsp], 0x6e
  0x00007ba63c61654c:   call		0x7ba643b46e60      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x00007ba63c616551:   jmp		0x7ba63c616234
  0x00007ba63c616556:   call		0x7ba643b3f260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007ba63c61655b:   call		0x7ba643b3f260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007ba63c616560:   mov		qword ptr [rsp], rsi
  0x00007ba63c616564:   mov		qword ptr [rsp + 8], rdx
  0x00007ba63c616569:   call		0x7ba643b3e960      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007ba63c61656e:   call		0x7ba643b3f260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007ba63c616573:   call		0x7ba643b3f260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007ba63c616578:   mov		qword ptr [rsp], rsi
  0x00007ba63c61657c:   mov		qword ptr [rsp + 8], r9
  0x00007ba63c616581:   call		0x7ba643b3e960      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x00007ba63c616586:   movabs		r10, 0xf040f70      ;   {metadata({method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x00007ba63c616590:   mov		qword ptr [rsp + 8], r10
  0x00007ba63c616595:   mov		qword ptr [rsp], 0x35
  0x00007ba63c61659d:   call		0x7ba643b46e60      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x00007ba63c6165a2:   jmp		0x7ba63c6162d9
  0x00007ba63c6165a7:   movabs		r10, 0x7ba63c61632f ;   {internal_word}
  0x00007ba63c6165b1:   mov		qword ptr [r15 + 0x538], r10
  0x00007ba63c6165b8:   jmp		0x7ba643a68b60      ;   {runtime_call SafepointBlob}
  0x00007ba63c6165bd:   movabs		r10, 0x7ba63c61634f ;   {internal_word}
  0x00007ba63c6165c7:   mov		qword ptr [r15 + 0x538], r10
  0x00007ba63c6165ce:   jmp		0x7ba643a68b60      ;   {runtime_call SafepointBlob}
  0x00007ba63c6165d3:   movabs		rdx, 0              ;   {metadata(nullptr)}
  0x00007ba63c6165dd:   mov		eax, 0xa050f00
  0x00007ba63c6165e2:   call		0x7ba643b45960      ; ImmutableOopMap {}
                                                            ;*new {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
                                                            ;   {runtime_call C1 Runtime load_klass_patching_blob}
  0x00007ba63c6165e7:   jmp		0x7ba63c616360
  0x00007ba63c6165ec:   call		0x7ba643b3f260      ; ImmutableOopMap {}
                                                            ;*new {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x00007ba63c6165f1:   mov		rdx, rdx
  0x00007ba63c6165f4:   call		0x7ba643b40ae0      ; ImmutableOopMap {}
                                                            ;*new {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
                                                            ;   {runtime_call C1 Runtime fast_new_instance_init_check_blob}
  0x00007ba63c6165f9:   jmp		0x7ba63c6163c1
  0x00007ba63c6165fe:   movabs		rdx, 0
  0x00007ba63c616608:   mov		eax, 0xa050f00
  0x00007ba63c61660d:   call		0x7ba643b46560      ; ImmutableOopMap {rax=Oop }
                                                            ;*invokedynamic {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
                                                            ;   {runtime_call C1 Runtime load_appendix_patching_blob}
  0x00007ba63c616612:   jmp		0x7ba63c6163c8
  0x00007ba63c616617:   mov		rax, qword ptr [r15 + 0x5e0]
  0x00007ba63c61661e:   mov		qword ptr [r15 + 0x5e0], 0
  0x00007ba63c616629:   mov		qword ptr [r15 + 0x5e8], 0
  0x00007ba63c616634:   add		rsp, 0x60
  0x00007ba63c616638:   pop		rbp
  0x00007ba63c616639:   jmp		0x7ba643b3e360      ;   {runtime_call C1 Runtime unwind_exception_blob}
  0x00007ba63c61663e:   hlt		
  0x00007ba63c61663f:   hlt		
[Stub Code]
  0x00007ba63c616640:   nop		dword ptr [rax + rax];   {other}
  0x00007ba63c616645:   movabs		rbx, 0              ;   {static_stub}
  0x00007ba63c61664f:   jmp		0x7ba63c61664f      ;   {runtime_call nmethod}
  0x00007ba63c616654:   nop		
  0x00007ba63c616655:   movabs		rbx, 0              ;   {static_stub}
  0x00007ba63c61665f:   jmp		0x7ba63c61665f      ;   {runtime_call nmethod}
[Exception Handler]
  0x00007ba63c616664:   call		0x7ba643b41f60      ;   {runtime_call C1 Runtime handle_exception_from_callee_blob}
  0x00007ba63c616669:   movabs		rdi, 0x7ba65b0ec7cf ;   {external_word}
  0x00007ba63c616673:   and		rsp, 0xfffffffffffffff0
  0x00007ba63c616677:   call		0x7ba65aaf8140      ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ba63c61667c:   hlt		
[Deopt Handler Code]
  0x00007ba63c61667d:   movabs		r10, 0x7ba63c61667d ;   {section_word}
  0x00007ba63c616687:   push		r10
  0x00007ba63c616689:   jmp		0x7ba643a672e0      ;   {runtime_call DeoptimizationBlob}
  0x00007ba63c61668e:   hlt		
  0x00007ba63c61668f:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

============================= C1-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2) 195  165 %     4       dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode @ 62 (131 bytes)
 total in heap  [0x00007ba6441f2408,0x00007ba6441f2878] = 1136
 main code      [0x00007ba6441f2500,0x00007ba6441f2858] = 856
 stub code      [0x00007ba6441f2858,0x00007ba6441f2870] = 24
 oops           [0x00007ba6441f2870,0x00007ba6441f2878] = 8
 mutable data [0x00007ba5c406cb10,0x00007ba5c406cb60] = 80
 relocation     [0x00007ba5c406cb10,0x00007ba5c406cb48] = 56
 metadata       [0x00007ba5c406cb48,0x00007ba5c406cb60] = 24
 immutable data [0x00007ba5c4075220,0x00007ba5c4075570] = 848
 dependencies   [0x00007ba5c4075220,0x00007ba5c4075228] = 8
 nul chk table  [0x00007ba5c4075228,0x00007ba5c4075240] = 24
 scopes pcs     [0x00007ba5c4075240,0x00007ba5c40754a0] = 608
 scopes data    [0x00007ba5c40754a0,0x00007ba5c4075570] = 208

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  0x00007ba6441f2500:   call		0x7ba65ac1e490      ;   {runtime_call os::breakpoint()}
  0x00007ba6441f2505:   nop		word ptr [rax + rax]
  0x00007ba6441f2510:   mov		dword ptr [rsp - 0x14000], eax
  0x00007ba6441f2517:   push		rbp
  0x00007ba6441f2518:   sub		rsp, 0x40
  0x00007ba6441f251c:   cmp		dword ptr [r15 + 0x20], 0
  0x00007ba6441f2524:   jne		0x7ba6441f284e
  0x00007ba6441f252a:   mov		rbp, qword ptr [rsi + 0x30]
  0x00007ba6441f252e:   mov		r14, qword ptr [rsi + 0x18]
  0x00007ba6441f2532:   mov		ebx, dword ptr [rsi + 0x10]
  0x00007ba6441f2535:   mov		r13d, dword ptr [rsi + 0x28]
  0x00007ba6441f2539:   mov		rdi, rsi
  0x00007ba6441f253c:   movabs		r10, 0x7ba65ace7cd0 ;   {runtime_call SharedRuntime::OSR_migration_end(long*)}
  0x00007ba6441f2546:   call		r10
  0x00007ba6441f2549:   nop		dword ptr [rax + rax];   {post_call_nop}
  0x00007ba6441f2551:   test		rbp, rbp
  0x00007ba6441f2554:   je		0x7ba6441f276b
  0x00007ba6441f255a:   mov		r11d, dword ptr [rbp + 8]
  0x00007ba6441f255e:   cmp		r11d, 0x173310      ;   {metadata({type array byte})}
  0x00007ba6441f2565:   jne		0x7ba6441f27f4
  0x00007ba6441f256b:   mov		r8, rbp
  0x00007ba6441f256e:   test		r14, r14
  0x00007ba6441f2571:   je		0x7ba6441f2773
  0x00007ba6441f2577:   mov		r10d, dword ptr [r14 + 8]
  0x00007ba6441f257b:   cmp		r10d, 0x173710      ;   {metadata({type array int})}
  0x00007ba6441f2582:   jne		0x7ba6441f27f4      ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@62 (line 36)
  0x00007ba6441f2588:   mov		r10d, dword ptr [r8 + 0xc]
                                                            ; implicit exception: dispatches to 0x00007ba6441f2814
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
  0x00007ba6441f258c:   mov		r11d, dword ptr [r14 + 0xc]
                                                            ; implicit exception: dispatches to 0x00007ba6441f2814
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007ba6441f2590:   cmp		ebx, r13d
  0x00007ba6441f2593:   jge		0x7ba6441f275b      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x00007ba6441f2599:   lea		r9d, [rbx + 1]
  0x00007ba6441f259d:   movsxd		rcx, r9d
  0x00007ba6441f25a0:   mov		edi, 1
  0x00007ba6441f25a5:   cmp		r9d, 1
  0x00007ba6441f25a9:   cmovl		rcx, rdi
  0x00007ba6441f25ad:   mov		edi, ecx
  0x00007ba6441f25af:   cmp		edi, r13d
  0x00007ba6441f25b2:   cmovg		edi, r13d
  0x00007ba6441f25b6:   lea		r9d, [rbx + rbx]
  0x00007ba6441f25ba:   cmp		r9d, r10d
  0x00007ba6441f25bd:   jae		0x7ba6441f277b
  0x00007ba6441f25c3:   movzx		edx, byte ptr [r8 + r9 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x00007ba6441f25c9:   lea		ebp, [r9 + 1]
  0x00007ba6441f25cd:   cmp		ebp, r10d
  0x00007ba6441f25d0:   jae		0x7ba6441f27a4
  0x00007ba6441f25d6:   movsxd		r9, r9d
  0x00007ba6441f25d9:   movzx		ebp, byte ptr [r8 + r9 + 0x11]
  0x00007ba6441f25df:   shl		ebp, 8
  0x00007ba6441f25e2:   or		ebp, edx            ;*ior {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@105 (line 39)
  0x00007ba6441f25e4:   cmp		ebx, r11d
  0x00007ba6441f25e7:   jae		0x7ba6441f27d0
  0x00007ba6441f25ed:   mov		dword ptr [r14 + rbx*4 + 0x10], ebp
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007ba6441f25f2:   inc		ebx                 ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@107 (line 36)
  0x00007ba6441f25f4:   cmp		ebx, edi
  0x00007ba6441f25f6:   jl		0x7ba6441f25b6      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x00007ba6441f25f8:   movsxd		rdx, r11d
  0x00007ba6441f25fb:   movsxd		rsi, r13d
  0x00007ba6441f25fe:   movsxd		r9, r10d
  0x00007ba6441f2601:   lea		rcx, [r9 - 1]
  0x00007ba6441f2605:   mov		rdi, r9
  0x00007ba6441f2608:   sar		rdi, 1
  0x00007ba6441f260b:   cmp		rdi, rsi
  0x00007ba6441f260e:   cmovl		rsi, rdi
  0x00007ba6441f2612:   shr		rcx, 0x3f
  0x00007ba6441f2616:   lea		r9, [rcx + r9 - 1]
  0x00007ba6441f261b:   sar		r9, 1
  0x00007ba6441f261e:   cmp		r9, rsi
  0x00007ba6441f2621:   cmovl		rsi, r9
  0x00007ba6441f2625:   cmp		rdx, rsi
  0x00007ba6441f2628:   cmovl		rsi, rdx
  0x00007ba6441f262c:   add		rsi, -3
  0x00007ba6441f2630:   mov		r9, -0x80000000
  0x00007ba6441f2637:   cmp		rsi, -0x80000000
  0x00007ba6441f263e:   cmovl		rsi, r9
  0x00007ba6441f2642:   mov		edi, esi
  0x00007ba6441f2644:   cmp		ebx, edi
  0x00007ba6441f2646:   jge		0x7ba6441f271b      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007ba6441f264c:   xor		ebp, ebp
  0x00007ba6441f264e:   mov		eax, 0xfa0
  0x00007ba6441f2653:   jmp		0x7ba6441f2664
  0x00007ba6441f2655:   vmovd		r13d, xmm1
  0x00007ba6441f265a:   vmovd		r10d, xmm0
  0x00007ba6441f265f:   vmovd		r11d, xmm3
  0x00007ba6441f2664:   mov		r9d, edi
  0x00007ba6441f2667:   sub		r9d, ebx
  0x00007ba6441f266a:   cmp		edi, ebx
  0x00007ba6441f266c:   cmovl		r9d, ebp
  0x00007ba6441f2670:   cmp		r9d, 0xfa0
  0x00007ba6441f2677:   cmova		r9d, eax            ;   {other}
  0x00007ba6441f267b:   add		r9d, ebx
  0x00007ba6441f267e:   vmovd		xmm1, r13d
  0x00007ba6441f2683:   vmovd		xmm0, r10d
  0x00007ba6441f2688:   vmovd		xmm3, r11d
  0x00007ba6441f268d:   nop		                    ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007ba6441f2690:   movsxd		r10, ebx
  0x00007ba6441f2693:   lea		r11d, [rbx + rbx]
  0x00007ba6441f2697:   movzx		r13d, byte ptr [r8 + r11 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x00007ba6441f269d:   movsxd		r11, r11d
  0x00007ba6441f26a0:   movzx		ecx, byte ptr [r8 + r11 + 0x11]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x00007ba6441f26a6:   movzx		edx, byte ptr [r8 + r11 + 0x16]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x00007ba6441f26ac:   shl		ecx, 8
  0x00007ba6441f26af:   or		ecx, r13d
  0x00007ba6441f26b2:   mov		dword ptr [r14 + rbx*4 + 0x10], ecx
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007ba6441f26b7:   movzx		r13d, byte ptr [r8 + r11 + 0x17]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x00007ba6441f26bd:   movzx		ecx, byte ptr [r8 + r11 + 0x14]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x00007ba6441f26c3:   shl		r13d, 8
  0x00007ba6441f26c7:   or		r13d, edx
  0x00007ba6441f26ca:   movzx		edx, byte ptr [r8 + r11 + 0x15]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x00007ba6441f26d0:   shl		edx, 8
  0x00007ba6441f26d3:   or		edx, ecx
  0x00007ba6441f26d5:   movzx		ecx, byte ptr [r8 + r11 + 0x12]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x00007ba6441f26db:   movzx		esi, byte ptr [r8 + r11 + 0x13]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x00007ba6441f26e1:   shl		esi, 8
  0x00007ba6441f26e4:   or		esi, ecx
  0x00007ba6441f26e6:   mov		dword ptr [r14 + r10*4 + 0x14], esi
  0x00007ba6441f26eb:   mov		dword ptr [r14 + r10*4 + 0x18], edx
  0x00007ba6441f26f0:   mov		dword ptr [r14 + r10*4 + 0x1c], r13d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007ba6441f26f5:   add		ebx, 4              ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@107 (line 36)
  0x00007ba6441f26f8:   cmp		ebx, r9d
  0x00007ba6441f26fb:   jl		0x7ba6441f2690      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007ba6441f26fd:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r8=Oop r14=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007ba6441f2701:   test		dword ptr [r10], eax;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
                                                            ;   {poll}
  0x00007ba6441f2704:   cmp		ebx, edi
  0x00007ba6441f2706:   jl		0x7ba6441f2655
  0x00007ba6441f270c:   vmovd		r13d, xmm1
  0x00007ba6441f2711:   vmovd		r10d, xmm0
  0x00007ba6441f2716:   vmovd		r11d, xmm3
  0x00007ba6441f271b:   cmp		ebx, r13d
  0x00007ba6441f271e:   jge		0x7ba6441f275b
  0x00007ba6441f2720:   lea		r9d, [rbx + rbx]
  0x00007ba6441f2724:   cmp		r9d, r10d
  0x00007ba6441f2727:   jae		0x7ba6441f277b
  0x00007ba6441f2729:   movzx		edx, byte ptr [r8 + r9 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x00007ba6441f272f:   lea		ebp, [r9 + 1]
  0x00007ba6441f2733:   cmp		ebp, r10d
  0x00007ba6441f2736:   jae		0x7ba6441f27a4
  0x00007ba6441f2738:   movsxd		r9, r9d
  0x00007ba6441f273b:   movzx		ebp, byte ptr [r8 + r9 + 0x11]
  0x00007ba6441f2741:   shl		ebp, 8
  0x00007ba6441f2744:   or		ebp, edx            ;*ior {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@105 (line 39)
  0x00007ba6441f2746:   cmp		ebx, r11d
  0x00007ba6441f2749:   jae		0x7ba6441f27d0
  0x00007ba6441f274f:   mov		dword ptr [r14 + rbx*4 + 0x10], ebp
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007ba6441f2754:   inc		ebx                 ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@107 (line 36)
  0x00007ba6441f2756:   cmp		ebx, r13d
  0x00007ba6441f2759:   jl		0x7ba6441f2720      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x00007ba6441f275b:   add		rsp, 0x40
  0x00007ba6441f275f:   pop		rbp
  0x00007ba6441f2760:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007ba6441f2764:   ja		0x7ba6441f2838
  0x00007ba6441f276a:   ret		
  0x00007ba6441f276b:   xor		r8d, r8d
  0x00007ba6441f276e:   jmp		0x7ba6441f256e
  0x00007ba6441f2773:   xor		r14d, r14d
  0x00007ba6441f2776:   jmp		0x7ba6441f2588
  0x00007ba6441f277b:   mov		esi, 0xffffffe4
  0x00007ba6441f2780:   mov		dword ptr [rsp], r13d
  0x00007ba6441f2784:   mov		qword ptr [rsp + 8], r14
  0x00007ba6441f2789:   mov		dword ptr [rsp + 4], ebx
  0x00007ba6441f278d:   mov		qword ptr [rsp + 0x10], r8
  0x00007ba6441f2792:   mov		dword ptr [rsp + 0x18], r9d
  0x00007ba6441f2797:   call		0x7ba643b4b6e0      ; ImmutableOopMap {[8]=Oop [16]=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ba6441f279c:   nop		dword ptr [rax + rax + 0x1000394]
                                                            ;   {post_call_nop}
  0x00007ba6441f27a4:   mov		esi, 0xffffffe4
  0x00007ba6441f27a9:   mov		dword ptr [rsp + 8], r13d
  0x00007ba6441f27ae:   mov		qword ptr [rsp + 0x10], r14
  0x00007ba6441f27b3:   mov		dword ptr [rsp + 0xc], ebx
  0x00007ba6441f27b7:   mov		qword ptr [rsp + 0x18], r8
  0x00007ba6441f27bc:   mov		dword ptr [rsp + 0x20], edx
  0x00007ba6441f27c0:   nop		
  0x00007ba6441f27c3:   call		0x7ba643b4b6e0      ; ImmutableOopMap {[16]=Oop [24]=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@87 (line 38)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ba6441f27c8:   nop		dword ptr [rax + rax + 0x20003c0]
                                                            ;   {post_call_nop}
  0x00007ba6441f27d0:   mov		esi, 0xffffffe4
  0x00007ba6441f27d5:   mov		qword ptr [rsp], r8
  0x00007ba6441f27d9:   mov		dword ptr [rsp + 8], r13d
  0x00007ba6441f27de:   mov		qword ptr [rsp + 0x18], r14
  0x00007ba6441f27e3:   mov		dword ptr [rsp + 0x20], ebx
  0x00007ba6441f27e7:   call		0x7ba643b4b6e0      ; ImmutableOopMap {[0]=Oop [24]=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ba6441f27ec:   nop		dword ptr [rax + rax + 0x30003e4]
                                                            ;   {post_call_nop}
  0x00007ba6441f27f4:   mov		esi, 0xffffff85
  0x00007ba6441f27f9:   mov		dword ptr [rsp], r13d
  0x00007ba6441f27fd:   mov		qword ptr [rsp + 8], r14
  0x00007ba6441f2802:   mov		dword ptr [rsp + 4], ebx
  0x00007ba6441f2806:   nop		
  0x00007ba6441f2807:   call		0x7ba643b4b6e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@62 (line 36)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ba6441f280c:   nop		dword ptr [rax + rax + 0x4000404]
                                                            ;   {post_call_nop}
  0x00007ba6441f2814:   mov		esi, 0xffffffbe
  0x00007ba6441f2819:   mov		rbp, r8
  0x00007ba6441f281c:   mov		dword ptr [rsp], r13d
  0x00007ba6441f2820:   mov		qword ptr [rsp + 8], r14
  0x00007ba6441f2825:   mov		dword ptr [rsp + 4], ebx
  0x00007ba6441f2829:   nop		
  0x00007ba6441f282b:   call		0x7ba643b4b6e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@62 (line 36)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ba6441f2830:   nop		dword ptr [rax + rax + 0x5000428]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
                                                            ;   {post_call_nop}
  0x00007ba6441f2838:   movabs		r10, 0x7ba6441f2760 ;   {internal_word}
  0x00007ba6441f2842:   mov		qword ptr [r15 + 0x538], r10
  0x00007ba6441f2849:   jmp		0x7ba643a68b60      ;   {runtime_call SafepointBlob}
  0x00007ba6441f284e:   call		0x7ba643a4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007ba6441f2853:   jmp		0x7ba6441f252a
[Exception Handler]
  0x00007ba6441f2858:   jmp		0x7ba643b4b9e0      ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x00007ba6441f285d:   call		0x7ba6441f2862
  0x00007ba6441f2862:   sub		qword ptr [rsp], 5
  0x00007ba6441f2867:   jmp		0x7ba643a672e0      ;   {runtime_call DeoptimizationBlob}
  0x00007ba6441f286c:   hlt		
  0x00007ba6441f286d:   hlt		
  0x00007ba6441f286e:   hlt		
  0x00007ba6441f286f:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

============================= C1-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2) 204  166       4       dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode (131 bytes)
 total in heap  [0x00007ba6441f3488,0x00007ba6441f37b8] = 816
 main code      [0x00007ba6441f3580,0x00007ba6441f3798] = 536
 stub code      [0x00007ba6441f3798,0x00007ba6441f37b0] = 24
 oops           [0x00007ba6441f37b0,0x00007ba6441f37b8] = 8
 mutable data [0x00007ba5c4075780,0x00007ba5c40757a8] = 40
 relocation     [0x00007ba5c4075780,0x00007ba5c40757a0] = 32
 metadata       [0x00007ba5c40757a0,0x00007ba5c40757a8] = 8
 immutable data [0x00007ba5c40757b0,0x00007ba5c4075a70] = 704
 dependencies   [0x00007ba5c40757b0,0x00007ba5c40757b8] = 8
 nul chk table  [0x00007ba5c40757b8,0x00007ba5c40757d0] = 24
 scopes pcs     [0x00007ba5c40757d0,0x00007ba5c40759e0] = 528
 scopes data    [0x00007ba5c40759e0,0x00007ba5c4075a70] = 144

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Instructions begin]
  0x00007ba6441f3580:   nop		
[Entry Point]
  # {method} {0x000000000f040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  # this:     rsi:rsi   = 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  # parm0:    rdx:rdx   = '[B'
  # parm1:    rcx       = int
  # parm2:    r8        = int
  # parm3:    r9:r9     = '[I'
  #           [sp+0x40]  (sp of caller)
  0x00007ba6441f3582:   mov		r10d, dword ptr [rsi + 8]
  0x00007ba6441f3586:   cmp		r10d, dword ptr [rax + 8]
  0x00007ba6441f358a:   jne		0x7ba643a655e0      ;   {runtime_call Shared Runtime ic_miss_blob}
[Verified Entry Point]
  0x00007ba6441f3590:   mov		dword ptr [rsp - 0x14000], eax
  0x00007ba6441f3597:   push		rbp
  0x00007ba6441f3598:   sub		rsp, 0x30
  0x00007ba6441f359c:   cmp		dword ptr [r15 + 0x20], 1
  0x00007ba6441f35a4:   jne		0x7ba6441f378e      ;*synchronization entry
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@-1 (line 29)
  0x00007ba6441f35aa:   cmp		r8d, 0x10
  0x00007ba6441f35ae:   jne		0x7ba6441f3754      ;*lookupswitch {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@1 (line 29)
  0x00007ba6441f35b4:   test		ecx, ecx
  0x00007ba6441f35b6:   jle		0x7ba6441f3725      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x00007ba6441f35bc:   mov		ebx, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x00007ba6441f3735
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
  0x00007ba6441f35bf:   test		ebx, ebx
  0x00007ba6441f35c1:   jbe		0x7ba6441f3735
  0x00007ba6441f35c7:   movsxd		rdi, ecx
  0x00007ba6441f35ca:   movsxd		r10, ebx
  0x00007ba6441f35cd:   lea		r11, [rdi + rdi]
  0x00007ba6441f35d1:   lea		r8, [r11 - 2]
  0x00007ba6441f35d5:   cmp		r8, r10
  0x00007ba6441f35d8:   jae		0x7ba6441f3735
  0x00007ba6441f35de:   cmp		ebx, 1
  0x00007ba6441f35e1:   jbe		0x7ba6441f3735
  0x00007ba6441f35e7:   dec		r11
  0x00007ba6441f35ea:   cmp		r11, r10
  0x00007ba6441f35ed:   jae		0x7ba6441f3735
  0x00007ba6441f35f3:   mov		r11d, dword ptr [r9 + 0xc]
                                                            ; implicit exception: dispatches to 0x00007ba6441f3735
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007ba6441f35f7:   test		r11d, r11d
  0x00007ba6441f35fa:   jbe		0x7ba6441f3735
  0x00007ba6441f3600:   movsxd		r10, r11d
  0x00007ba6441f3603:   lea		r11, [rdi - 1]
  0x00007ba6441f3607:   cmp		r11, r10
  0x00007ba6441f360a:   jae		0x7ba6441f3735
  0x00007ba6441f3610:   movzx		r11d, byte ptr [rdx + 0x11]
  0x00007ba6441f3615:   movzx		r10d, byte ptr [rdx + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x00007ba6441f361a:   add		rdi, -3
  0x00007ba6441f361e:   shl		r11d, 8
  0x00007ba6441f3622:   or		r11d, r10d
  0x00007ba6441f3625:   mov		dword ptr [r9 + 0x10], r11d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007ba6441f3629:   mov		r10, -0x80000000
  0x00007ba6441f3630:   cmp		rdi, -0x80000000
  0x00007ba6441f3637:   cmovl		rdi, r10
  0x00007ba6441f363b:   mov		edi, edi
  0x00007ba6441f363d:   mov		eax, 1
  0x00007ba6441f3642:   cmp		edi, 1
  0x00007ba6441f3645:   jle		0x7ba6441f36fb
  0x00007ba6441f364b:   xor		r14d, r14d          ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007ba6441f364e:   mov		r13d, 0xfa0
  0x00007ba6441f3654:   jmp		0x7ba6441f365a
  0x00007ba6441f3656:   vmovd		ecx, xmm1
  0x00007ba6441f365a:   mov		esi, edi
  0x00007ba6441f365c:   sub		esi, eax
  0x00007ba6441f365e:   cmp		edi, eax
  0x00007ba6441f3660:   cmovl		esi, r14d
  0x00007ba6441f3664:   cmp		esi, 0xfa0
  0x00007ba6441f366a:   cmova		esi, r13d
  0x00007ba6441f366e:   add		esi, eax
  0x00007ba6441f3670:   vmovd		xmm1, ecx
  0x00007ba6441f3674:   nop		word ptr [rax + rax]
  0x00007ba6441f367a:   nop		word ptr [rax + rax];*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@68 (line 37)
  0x00007ba6441f3680:   lea		r11d, [rax + rax]
  0x00007ba6441f3684:   movzx		r10d, byte ptr [rdx + r11 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
                                                            ;   {other}
  0x00007ba6441f368a:   movsxd		rcx, r11d
  0x00007ba6441f368d:   movzx		r8d, byte ptr [rdx + rcx + 0x11]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x00007ba6441f3693:   movzx		r11d, byte ptr [rdx + rcx + 0x16]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x00007ba6441f3699:   movzx		ebx, byte ptr [rdx + rcx + 0x13]
  0x00007ba6441f369e:   movzx		ebp, byte ptr [rdx + rcx + 0x17]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x00007ba6441f36a3:   shl		r8d, 8
  0x00007ba6441f36a7:   or		r8d, r10d
  0x00007ba6441f36aa:   mov		dword ptr [r9 + rax*4 + 0x10], r8d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007ba6441f36af:   movzx		r10d, byte ptr [rdx + rcx + 0x12]
  0x00007ba6441f36b5:   movzx		r8d, byte ptr [rdx + rcx + 0x14]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x00007ba6441f36bb:   movzx		ecx, byte ptr [rdx + rcx + 0x15]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x00007ba6441f36c0:   shl		ebp, 8
  0x00007ba6441f36c3:   or		ebp, r11d
  0x00007ba6441f36c6:   shl		ecx, 8
  0x00007ba6441f36c9:   or		ecx, r8d
  0x00007ba6441f36cc:   shl		ebx, 8
  0x00007ba6441f36cf:   or		ebx, r10d
  0x00007ba6441f36d2:   mov		dword ptr [r9 + rax*4 + 0x14], ebx
  0x00007ba6441f36d7:   mov		dword ptr [r9 + rax*4 + 0x18], ecx
  0x00007ba6441f36dc:   mov		dword ptr [r9 + rax*4 + 0x1c], ebp
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007ba6441f36e1:   add		eax, 4              ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@107 (line 36)
  0x00007ba6441f36e4:   cmp		eax, esi
  0x00007ba6441f36e6:   jl		0x7ba6441f3680      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007ba6441f36e8:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x00007ba6441f36ec:   test		dword ptr [r10], eax;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
                                                            ;   {poll}
  0x00007ba6441f36ef:   cmp		eax, edi
  0x00007ba6441f36f1:   jl		0x7ba6441f3656
  0x00007ba6441f36f7:   vmovd		ecx, xmm1
  0x00007ba6441f36fb:   cmp		eax, ecx
  0x00007ba6441f36fd:   jge		0x7ba6441f3725
  0x00007ba6441f36ff:   nop		                    ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@68 (line 37)
  0x00007ba6441f3700:   lea		r11d, [rax + rax]
  0x00007ba6441f3704:   movzx		r8d, byte ptr [rdx + r11 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x00007ba6441f370a:   movsxd		r10, r11d
  0x00007ba6441f370d:   movzx		r10d, byte ptr [rdx + r10 + 0x11]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x00007ba6441f3713:   shl		r10d, 8
  0x00007ba6441f3717:   or		r10d, r8d
  0x00007ba6441f371a:   mov		dword ptr [r9 + rax*4 + 0x10], r10d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x00007ba6441f371f:   inc		eax                 ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@107 (line 36)
  0x00007ba6441f3721:   cmp		eax, ecx
  0x00007ba6441f3723:   jl		0x7ba6441f3700
  0x00007ba6441f3725:   add		rsp, 0x30
  0x00007ba6441f3729:   pop		rbp
  0x00007ba6441f372a:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x00007ba6441f372e:   ja		0x7ba6441f3778
  0x00007ba6441f3734:   ret		                    ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x00007ba6441f3735:   mov		esi, 0xffffff6e
  0x00007ba6441f373a:   mov		rbp, rdx
  0x00007ba6441f373d:   mov		qword ptr [rsp + 8], r9
  0x00007ba6441f3742:   mov		dword ptr [rsp + 4], ecx
  0x00007ba6441f3746:   nop		
  0x00007ba6441f3747:   call		0x7ba643b4b6e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ba6441f374c:   nop		dword ptr [rax + rax + 0x10002c4]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
                                                            ;   {post_call_nop}
  0x00007ba6441f3754:   mov		esi, 0xffffff45
  0x00007ba6441f3759:   mov		rbp, rdx
  0x00007ba6441f375c:   mov		dword ptr [rsp], ecx
  0x00007ba6441f375f:   mov		qword ptr [rsp + 8], r9
  0x00007ba6441f3764:   mov		dword ptr [rsp + 0x10], r8d
  0x00007ba6441f3769:   nop		
  0x00007ba6441f376b:   call		0x7ba643b4b6e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*lookupswitch {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@1 (line 29)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ba6441f3770:   nop		dword ptr [rax + rax + 0x20002e8]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
                                                            ;   {post_call_nop}
  0x00007ba6441f3778:   movabs		r10, 0x7ba6441f372a ;   {internal_word}
  0x00007ba6441f3782:   mov		qword ptr [r15 + 0x538], r10
  0x00007ba6441f3789:   jmp		0x7ba643a68b60      ;   {runtime_call SafepointBlob}
  0x00007ba6441f378e:   call		0x7ba643a4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x00007ba6441f3793:   jmp		0x7ba6441f35aa
[Exception Handler]
  0x00007ba6441f3798:   jmp		0x7ba643b4b9e0      ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x00007ba6441f379d:   call		0x7ba6441f37a2
  0x00007ba6441f37a2:   sub		qword ptr [rsp], 5
  0x00007ba6441f37a7:   jmp		0x7ba643a672e0      ;   {runtime_call DeoptimizationBlob}
  0x00007ba6441f37ac:   hlt		
  0x00007ba6441f37ad:   hlt		
  0x00007ba6441f37ae:   hlt		
  0x00007ba6441f37af:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

============================= C1-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

