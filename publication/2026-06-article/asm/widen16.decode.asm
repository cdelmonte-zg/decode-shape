Compiled method (c1) 194  163 %     3       dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode @ 62 (131 bytes)
 total in heap  [0x000074a9f8617088,0x000074a9f8617718] = 1680
 main code      [0x000074a9f8617180,0x000074a9f86176c0] = 1344
 stub code      [0x000074a9f86176c0,0x000074a9f8617710] = 80
 oops           [0x000074a9f8617710,0x000074a9f8617718] = 8
 mutable data [0x000074a988083060,0x000074a988083108] = 168
 relocation     [0x000074a988083060,0x000074a988083100] = 160
 metadata       [0x000074a988083100,0x000074a988083108] = 8
 immutable data [0x000074a988083190,0x000074a988083630] = 1184
 dependencies   [0x000074a988083190,0x000074a988083198] = 8
 nul chk table  [0x000074a988083198,0x000074a9880831e8] = 80
 scopes pcs     [0x000074a9880831e8,0x000074a988083508] = 800
 scopes data    [0x000074a988083508,0x000074a988083630] = 296

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Instructions begin]
  0x000074a9f8617180:   nop		word ptr [rax + rax]
  0x000074a9f8617189:   nop		word ptr [rax + rax]
[Entry Point]
  # {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  0x000074a9f8617192:   mov		r10d, dword ptr [rsi + 8]
  0x000074a9f8617196:   cmp		r10d, dword ptr [rax + 8]
  0x000074a9f861719a:   jne		0x74a9ffa655e0      ;   {runtime_call Shared Runtime ic_miss_blob}
[Verified Entry Point]
  0x000074a9f86171a0:   mov		dword ptr [rsp - 0x14000], eax
  0x000074a9f86171a7:   push		rbp
  0x000074a9f86171a8:   sub		rsp, 0x60
  0x000074a9f86171ac:   cmp		dword ptr [r15 + 0x20], 1
  0x000074a9f86171b4:   je		0x74a9f86171bb
  0x000074a9f86171b6:   call		0x74a9ffa4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x000074a9f86171bb:   movabs		rdi, 0x74a9a0404080 ;   {metadata(method data for {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f86171c5:   mov		ebx, dword ptr [rdi + 0x90]
  0x000074a9f86171cb:   add		ebx, 2
  0x000074a9f86171ce:   mov		dword ptr [rdi + 0x90], ebx
  0x000074a9f86171d4:   and		ebx, 0x7fe
  0x000074a9f86171da:   test		ebx, ebx
  0x000074a9f86171dc:   je		0x74a9f8617556      ;*iload_3 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@0 (line 29)
  0x000074a9f86171e2:   movabs		rsi, 0x74a9a0404080 ;   {metadata(method data for {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f86171ec:   mov		edi, 0xe0
  0x000074a9f86171f1:   cmp		r8d, 8
  0x000074a9f86171f5:   mov		rbx, rdi
  0x000074a9f86171f8:   mov		edi, 0xf0
  0x000074a9f86171fd:   cmovne		rdi, rbx
  0x000074a9f8617201:   cmp		r8d, 0x10
  0x000074a9f8617205:   mov		rbx, rdi
  0x000074a9f8617208:   mov		edi, 0x100
  0x000074a9f861720d:   cmovne		rdi, rbx
  0x000074a9f8617211:   mov		rbx, qword ptr [rsi + rdi]
  0x000074a9f8617215:   mov		r10d, 1
  0x000074a9f861721b:   add		rbx, r10
  0x000074a9f861721e:   mov		qword ptr [rsi + rdi], rbx
  0x000074a9f8617222:   cmp		r8d, 8
  0x000074a9f8617226:   je		0x74a9f86172fa
  0x000074a9f861722c:   cmp		r8d, 0x10
  0x000074a9f8617230:   jne		0x74a9f86173da      ;*lookupswitch {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@1 (line 29)
  0x000074a9f8617236:   mov		esi, 0
  0x000074a9f861723b:   jmp		0x74a9f86172cb      ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@62 (line 36)
  0x000074a9f8617240:   mov		rdi, rsi
  0x000074a9f8617243:   shl		edi, 1
  0x000074a9f8617245:   cmp		edi, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x000074a9f8617577
  0x000074a9f8617248:   jae		0x74a9f8617581
  0x000074a9f861724e:   movsxd		rax, edi
  0x000074a9f8617251:   movsx		eax, byte ptr [rdx + rax + 0x10]
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
  0x000074a9f8617256:   and		eax, 0xff
  0x000074a9f861725b:   inc		edi
  0x000074a9f861725d:   cmp		edi, dword ptr [rdx + 0xc]
  0x000074a9f8617260:   jae		0x74a9f861758f
  0x000074a9f8617266:   movsxd		rdi, edi
  0x000074a9f8617269:   movsx		edi, byte ptr [rdx + rdi + 0x10]
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@87 (line 38)
  0x000074a9f861726e:   and		edi, 0xff
  0x000074a9f8617274:   shl		edi, 8
  0x000074a9f8617277:   or		rdi, rax
  0x000074a9f861727a:   cmp		esi, dword ptr [r9 + 0xc]; implicit exception: dispatches to 0x000074a9f861759d
  0x000074a9f861727e:   jae		0x74a9f86175a7
  0x000074a9f8617284:   movsxd		rax, esi
  0x000074a9f8617287:   mov		dword ptr [r9 + rax*4 + 0x10], edi
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074a9f861728c:   inc		esi
  0x000074a9f861728e:   movabs		rdi, 0x74a9a0404080 ;   {metadata(method data for {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f8617298:   mov		eax, dword ptr [rdi + 0x94]
  0x000074a9f861729e:   add		eax, 2
  0x000074a9f86172a1:   mov		dword ptr [rdi + 0x94], eax
  0x000074a9f86172a7:   and		eax, 0x3ffe
  0x000074a9f86172ac:   test		eax, eax
  0x000074a9f86172ae:   je		0x74a9f86175b5      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x000074a9f86172b4:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x000074a9f86172b8:   test		dword ptr [r10], eax;   {poll}
  0x000074a9f86172bb:   movabs		rdi, 0x74a9a0404080 ;   {metadata(method data for {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f86172c5:   inc		dword ptr [rdi + 0x188];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x000074a9f86172cb:   cmp		esi, ecx
  0x000074a9f86172cd:   movabs		rdi, 0x74a9a0404080 ;   {metadata(method data for {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f86172d7:   mov		eax, 0x168
  0x000074a9f86172dc:   jge		0x74a9f86172e3
  0x000074a9f86172de:   mov		eax, 0x178
  0x000074a9f86172e3:   mov		rbx, qword ptr [rdi + rax]
  0x000074a9f86172e7:   lea		rbx, [rbx + 1]
  0x000074a9f86172eb:   mov		qword ptr [rdi + rax], rbx
  0x000074a9f86172ef:   jge		0x74a9f86173ba
  0x000074a9f86172f5:   jmp		0x74a9f8617240      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x000074a9f86172fa:   mov		esi, 0
  0x000074a9f86172ff:   jmp		0x74a9f8617370      ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@31 (line 31)
  0x000074a9f8617304:   nop		dword ptr [rax]
  0x000074a9f8617308:   cmp		esi, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x000074a9f86175d6
  0x000074a9f861730b:   jae		0x74a9f86175e0
  0x000074a9f8617311:   movsxd		rdi, esi
  0x000074a9f8617314:   movsx		edi, byte ptr [rdx + rdi + 0x10]
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
  0x000074a9f8617319:   and		edi, 0xff
  0x000074a9f861731f:   cmp		esi, dword ptr [r9 + 0xc]; implicit exception: dispatches to 0x000074a9f86175ee
  0x000074a9f8617323:   jae		0x74a9f86175f8
  0x000074a9f8617329:   movsxd		rax, esi
  0x000074a9f861732c:   mov		dword ptr [r9 + rax*4 + 0x10], edi
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
  0x000074a9f8617331:   inc		esi
  0x000074a9f8617333:   movabs		rdi, 0x74a9a0404080 ;   {metadata(method data for {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f861733d:   mov		eax, dword ptr [rdi + 0x94]
  0x000074a9f8617343:   add		eax, 2
  0x000074a9f8617346:   mov		dword ptr [rdi + 0x94], eax
  0x000074a9f861734c:   and		eax, 0x3ffe
  0x000074a9f8617351:   test		eax, eax
  0x000074a9f8617353:   je		0x74a9f8617606      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x000074a9f8617359:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x000074a9f861735d:   test		dword ptr [r10], eax;   {poll}
  0x000074a9f8617360:   movabs		rdi, 0x74a9a0404080 ;   {metadata(method data for {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f861736a:   inc		dword ptr [rdi + 0x138];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
  0x000074a9f8617370:   cmp		esi, ecx
  0x000074a9f8617372:   movabs		rdi, 0x74a9a0404080 ;   {metadata(method data for {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f861737c:   mov		eax, 0x128
  0x000074a9f8617381:   jl		0x74a9f8617388
  0x000074a9f8617383:   mov		eax, 0x118
  0x000074a9f8617388:   mov		rbx, qword ptr [rdi + rax]
  0x000074a9f861738c:   lea		rbx, [rbx + 1]
  0x000074a9f8617390:   mov		qword ptr [rdi + rax], rbx
  0x000074a9f8617394:   jl		0x74a9f8617308      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@34 (line 31)
  0x000074a9f861739a:   movabs		rdx, 0x74a9a0404080 ;   {metadata(method data for {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f86173a4:   inc		dword ptr [rdx + 0x150];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@56 (line 34)
  0x000074a9f86173aa:   add		rsp, 0x60
  0x000074a9f86173ae:   pop		rbp
  0x000074a9f86173af:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x000074a9f86173b3:   ja		0x74a9f8617627
  0x000074a9f86173b9:   ret		
  0x000074a9f86173ba:   movabs		rdx, 0x74a9a0404080 ;   {metadata(method data for {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f86173c4:   inc		dword ptr [rdx + 0x1a0];*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@113 (line 41)
  0x000074a9f86173ca:   add		rsp, 0x60
  0x000074a9f86173ce:   pop		rbp
  0x000074a9f86173cf:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x000074a9f86173d3:   ja		0x74a9f861763d
  0x000074a9f86173d9:   ret		                    ;*return {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@130 (line 45)
  0x000074a9f86173da:   nop		word ptr [rax + rax]
  0x000074a9f86173e0:   jmp		0x74a9f8617662      ;   {other}
  0x000074a9f86173e5:   add		byte ptr [rax], al
  0x000074a9f86173e7:   add		byte ptr [rax], al
  0x000074a9f86173e9:   add		byte ptr [rax + 0x130ba], al
  0x000074a9f86173ef:   add		byte ptr [rdi + rcx], al
  0x000074a9f86173f2:   test		dword ptr [rdx + 2], edi
  0x000074a9f86173f5:   add		byte ptr [rax], al
  0x000074a9f86173f7:   mov		rax, qword ptr [r15 + 0x1c8]
  0x000074a9f86173fe:   lea		rdi, [rax + 0x28]
  0x000074a9f8617402:   cmp		rdi, qword ptr [r15 + 0x1d8]
  0x000074a9f8617409:   ja		0x74a9f8617671
  0x000074a9f861740f:   mov		qword ptr [r15 + 0x1c8], rdi
  0x000074a9f8617416:   mov		qword ptr [rax], 1
  0x000074a9f861741d:   mov		rcx, rdx
  0x000074a9f8617420:   mov		r10d, 0x5000000
  0x000074a9f8617426:   sub		rcx, r10
  0x000074a9f8617429:   mov		dword ptr [rax + 8], ecx
  0x000074a9f861742c:   xor		rcx, rcx
  0x000074a9f861742f:   mov		dword ptr [rax + 0xc], ecx
  0x000074a9f8617432:   xor		rcx, rcx
  0x000074a9f8617435:   mov		qword ptr [rax + 0x10], rcx
  0x000074a9f8617439:   mov		qword ptr [rax + 0x18], rcx
  0x000074a9f861743d:   mov		qword ptr [rax + 0x20], rcx
                                                            ;*new {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
  0x000074a9f8617441:   nop		dword ptr [rax]
  0x000074a9f8617448:   jmp		0x74a9f861768d      ;   {other}
  0x000074a9f861744d:   nop		
  0x000074a9f861744e:   nop		
  0x000074a9f861744f:   nop		
  0x000074a9f8617450:   nop		
  0x000074a9f8617451:   nop		
  0x000074a9f8617452:   mov		rsi, r8             ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
  0x000074a9f8617455:   mov		qword ptr [rsp + 0x48], rax
  0x000074a9f861745a:   nop		dword ptr [rax + rax]
  0x000074a9f861745f:   call		0x74a9ffa664e0      ; ImmutableOopMap {[72]=Oop }
                                                            ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
                                                            ;   {static_call}
  0x000074a9f8617464:   nop		dword ptr [rax + rax + 0x20003dc]
                                                            ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
                                                            ;   {post_call_nop}
  0x000074a9f861746c:   movabs		rdx, 0x74a9a0404080 ;   {metadata(method data for {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f8617476:   lea		rdx, [rdx + 0x1c8]
  0x000074a9f861747d:   test		rax, rax
  0x000074a9f8617480:   jne		0x74a9f861748c
  0x000074a9f8617482:   test		byte ptr [rdx], 1
  0x000074a9f8617485:   jne		0x74a9f861748c
  0x000074a9f8617487:   lock or		qword ptr [rdx], 1
  0x000074a9f861748c:   mov		rdx, qword ptr [rsp + 0x48]
  0x000074a9f8617491:   movabs		rsi, 0x74a9a0404080 ;   {metadata(method data for {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f861749b:   add		qword ptr [rsi + 0x1d8], 1
  0x000074a9f86174a3:   mov		rdx, rax
  0x000074a9f86174a6:   mov		rsi, qword ptr [rsp + 0x48]
                                                            ;*invokespecial <init> {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@126 (line 42)
  0x000074a9f86174ab:   nop		dword ptr [rax]
  0x000074a9f86174af:   call		0x74a9ffa65ae0      ; ImmutableOopMap {[72]=Oop }
                                                            ;*invokespecial <init> {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@126 (line 42)
                                                            ;   {optimized virtual_call}
  0x000074a9f86174b4:   nop		dword ptr [rax + rax + 0x300042c]
                                                            ;*invokespecial <init> {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@126 (line 42)
                                                            ;   {post_call_nop}
  0x000074a9f86174bc:   mov		rax, qword ptr [rsp + 0x48]
  0x000074a9f86174c1:   jmp		0x74a9f86176b4      ;*athrow {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@129 (line 42)
  0x000074a9f86174c6:   mov		dword ptr [rsp - 0x14000], eax
  0x000074a9f86174cd:   push		rbp
  0x000074a9f86174ce:   sub		rsp, 0x60
  0x000074a9f86174d2:   nop		
  0x000074a9f86174d4:   cmp		dword ptr [r15 + 0x20], 0
  0x000074a9f86174dc:   je		0x74a9f86174e3
  0x000074a9f86174de:   call		0x74a9ffa4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x000074a9f86174e3:   mov		edi, 0x30
  0x000074a9f86174e8:   movsxd		rdi, edi
  0x000074a9f86174eb:   mov		rbx, qword ptr [rsi + rdi]
  0x000074a9f86174ef:   mov		edi, 0x28
  0x000074a9f86174f4:   movsxd		rdi, edi
  0x000074a9f86174f7:   mov		eax, dword ptr [rsi + rdi]
  0x000074a9f86174fa:   mov		edi, 0x18
  0x000074a9f86174ff:   movsxd		rdi, edi
  0x000074a9f8617502:   mov		rdx, qword ptr [rsi + rdi]
  0x000074a9f8617506:   mov		edi, 0x10
  0x000074a9f861750b:   movsxd		rdi, edi
  0x000074a9f861750e:   mov		ecx, dword ptr [rsi + rdi]
  0x000074a9f8617511:   mov		rdi, rsi
  0x000074a9f8617514:   mov		qword ptr [rsp + 0x40], rbx
  0x000074a9f8617519:   mov		dword ptr [rsp + 0x34], eax
  0x000074a9f861751d:   mov		qword ptr [rsp + 0x38], rdx
  0x000074a9f8617522:   mov		dword ptr [rsp + 0x30], ecx
  0x000074a9f8617526:   call		0x74aa160e7cd0      ;   {runtime_call SharedRuntime::OSR_migration_end(long*)}
  0x000074a9f861752b:   nop		dword ptr [rax + rax];   {post_call_nop}
  0x000074a9f8617533:   mov		ecx, dword ptr [rsp + 0x30]
  0x000074a9f8617537:   mov		rsi, rcx
  0x000074a9f861753a:   mov		rdx, qword ptr [rsp + 0x38]
  0x000074a9f861753f:   mov		r9, rdx
  0x000074a9f8617542:   mov		eax, dword ptr [rsp + 0x34]
  0x000074a9f8617546:   mov		rcx, rax
  0x000074a9f8617549:   mov		rbx, qword ptr [rsp + 0x40]
  0x000074a9f861754e:   mov		rdx, rbx
  0x000074a9f8617551:   jmp		0x74a9f86172cb
  0x000074a9f8617556:   movabs		r10, 0x6040f70      ;   {metadata({method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f8617560:   mov		qword ptr [rsp + 8], r10
  0x000074a9f8617565:   mov		qword ptr [rsp], -1
  0x000074a9f861756d:   call		0x74a9ffb46260      ; ImmutableOopMap {rsi=Oop rdx=Oop r9=Oop }
                                                            ;*synchronization entry
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@-1 (line 29)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x000074a9f8617572:   jmp		0x74a9f86171e2
  0x000074a9f8617577:   call		0x74a9ffb3e1e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x000074a9f861757c:   call		0x74a9ffb3e1e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x000074a9f8617581:   mov		qword ptr [rsp], rdi
  0x000074a9f8617585:   mov		qword ptr [rsp + 8], rdx
  0x000074a9f861758a:   call		0x74a9ffb3d8e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x000074a9f861758f:   mov		qword ptr [rsp], rdi
  0x000074a9f8617593:   mov		qword ptr [rsp + 8], rdx
  0x000074a9f8617598:   call		0x74a9ffb3d8e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@87 (line 38)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x000074a9f861759d:   call		0x74a9ffb3e1e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x000074a9f86175a2:   call		0x74a9ffb3e1e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x000074a9f86175a7:   mov		qword ptr [rsp], rsi
  0x000074a9f86175ab:   mov		qword ptr [rsp + 8], r9
  0x000074a9f86175b0:   call		0x74a9ffb3d8e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x000074a9f86175b5:   movabs		r10, 0x6040f70      ;   {metadata({method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f86175bf:   mov		qword ptr [rsp + 8], r10
  0x000074a9f86175c4:   mov		qword ptr [rsp], 0x6e
  0x000074a9f86175cc:   call		0x74a9ffb46260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x000074a9f86175d1:   jmp		0x74a9f86172b4
  0x000074a9f86175d6:   call		0x74a9ffb3e1e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x000074a9f86175db:   call		0x74a9ffb3e1e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x000074a9f86175e0:   mov		qword ptr [rsp], rsi
  0x000074a9f86175e4:   mov		qword ptr [rsp + 8], rdx
  0x000074a9f86175e9:   call		0x74a9ffb3d8e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@44 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x000074a9f86175ee:   call		0x74a9ffb3e1e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x000074a9f86175f3:   call		0x74a9ffb3e1e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x000074a9f86175f8:   mov		qword ptr [rsp], rsi
  0x000074a9f86175fc:   mov		qword ptr [rsp + 8], r9
  0x000074a9f8617601:   call		0x74a9ffb3d8e0      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@49 (line 32)
                                                            ;   {runtime_call C1 Runtime throw_range_check_failed_blob}
  0x000074a9f8617606:   movabs		r10, 0x6040f70      ;   {metadata({method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder')}
  0x000074a9f8617610:   mov		qword ptr [rsp + 8], r10
  0x000074a9f8617615:   mov		qword ptr [rsp], 0x35
  0x000074a9f861761d:   call		0x74a9ffb46260      ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@53 (line 31)
                                                            ;   {runtime_call C1 Runtime counter_overflow_blob}
  0x000074a9f8617622:   jmp		0x74a9f8617359
  0x000074a9f8617627:   movabs		r10, 0x74a9f86173af ;   {internal_word}
  0x000074a9f8617631:   mov		qword ptr [r15 + 0x538], r10
  0x000074a9f8617638:   jmp		0x74a9ffa68b60      ;   {runtime_call SafepointBlob}
  0x000074a9f861763d:   movabs		r10, 0x74a9f86173cf ;   {internal_word}
  0x000074a9f8617647:   mov		qword ptr [r15 + 0x538], r10
  0x000074a9f861764e:   jmp		0x74a9ffa68b60      ;   {runtime_call SafepointBlob}
  0x000074a9f8617653:   movabs		rdx, 0              ;   {metadata(nullptr)}
  0x000074a9f861765d:   mov		eax, 0xa050f00
  0x000074a9f8617662:   call		0x74a9ffb44d60      ; ImmutableOopMap {}
                                                            ;*new {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
                                                            ;   {runtime_call C1 Runtime load_klass_patching_blob}
  0x000074a9f8617667:   jmp		0x74a9f86173e0
  0x000074a9f861766c:   call		0x74a9ffb3e1e0      ; ImmutableOopMap {}
                                                            ;*new {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
                                                            ;   {runtime_call C1 Runtime throw_null_pointer_exception_blob}
  0x000074a9f8617671:   mov		rdx, rdx
  0x000074a9f8617674:   call		0x74a9ffb3fa60      ; ImmutableOopMap {}
                                                            ;*new {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@116 (line 42)
                                                            ;   {runtime_call C1 Runtime fast_new_instance_init_check_blob}
  0x000074a9f8617679:   jmp		0x74a9f8617441
  0x000074a9f861767e:   movabs		rdx, 0
  0x000074a9f8617688:   mov		eax, 0xa050f00
  0x000074a9f861768d:   call		0x74a9ffb45960      ; ImmutableOopMap {rax=Oop }
                                                            ;*invokedynamic {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@121 (line 42)
                                                            ;   {runtime_call C1 Runtime load_appendix_patching_blob}
  0x000074a9f8617692:   jmp		0x74a9f8617448
  0x000074a9f8617697:   mov		rax, qword ptr [r15 + 0x5e0]
  0x000074a9f861769e:   mov		qword ptr [r15 + 0x5e0], 0
  0x000074a9f86176a9:   mov		qword ptr [r15 + 0x5e8], 0
  0x000074a9f86176b4:   add		rsp, 0x60
  0x000074a9f86176b8:   pop		rbp
  0x000074a9f86176b9:   jmp		0x74a9ffb3d2e0      ;   {runtime_call C1 Runtime unwind_exception_blob}
  0x000074a9f86176be:   hlt		
  0x000074a9f86176bf:   hlt		
[Stub Code]
  0x000074a9f86176c0:   nop		dword ptr [rax + rax];   {other}
  0x000074a9f86176c5:   movabs		rbx, 0              ;   {static_stub}
  0x000074a9f86176cf:   jmp		0x74a9f86176cf      ;   {runtime_call nmethod}
  0x000074a9f86176d4:   nop		
  0x000074a9f86176d5:   movabs		rbx, 0              ;   {static_stub}
  0x000074a9f86176df:   jmp		0x74a9f86176df      ;   {runtime_call nmethod}
[Exception Handler]
  0x000074a9f86176e4:   call		0x74a9ffb41460      ;   {runtime_call C1 Runtime handle_exception_from_callee_blob}
  0x000074a9f86176e9:   movabs		rdi, 0x74aa164ec7cf ;   {external_word}
  0x000074a9f86176f3:   and		rsp, 0xfffffffffffffff0
  0x000074a9f86176f7:   call		0x74aa15ef8140      ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x000074a9f86176fc:   hlt		
[Deopt Handler Code]
  0x000074a9f86176fd:   movabs		r10, 0x74a9f86176fd ;   {section_word}
  0x000074a9f8617707:   push		r10
  0x000074a9f8617709:   jmp		0x74a9ffa672e0      ;   {runtime_call DeoptimizationBlob}
  0x000074a9f861770e:   hlt		
  0x000074a9f861770f:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

============================= C1-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2) 208  164 %     4       dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode @ 62 (131 bytes)
 total in heap  [0x000074aa001f3008,0x000074aa001f3610] = 1544
 main code      [0x000074aa001f3100,0x000074aa001f35f0] = 1264
 stub code      [0x000074aa001f35f0,0x000074aa001f3608] = 24
 oops           [0x000074aa001f3608,0x000074aa001f3610] = 8
 mutable data [0x000074a97803cf10,0x000074a97803cf60] = 80
 relocation     [0x000074a97803cf10,0x000074a97803cf48] = 56
 metadata       [0x000074a97803cf48,0x000074a97803cf60] = 24
 immutable data [0x000074a97804da00,0x000074a97804deb0] = 1200
 dependencies   [0x000074a97804da00,0x000074a97804da08] = 8
 nul chk table  [0x000074a97804da08,0x000074a97804da20] = 24
 scopes pcs     [0x000074a97804da20,0x000074a97804dde0] = 960
 scopes data    [0x000074a97804dde0,0x000074a97804deb0] = 208

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  0x000074aa001f3100:   call		0x74aa1601e490      ;   {runtime_call os::breakpoint()}
  0x000074aa001f3105:   nop		word ptr [rax + rax]
  0x000074aa001f3110:   mov		dword ptr [rsp - 0x14000], eax
  0x000074aa001f3117:   push		rbp
  0x000074aa001f3118:   sub		rsp, 0x40
  0x000074aa001f311c:   cmp		dword ptr [r15 + 0x20], 0
  0x000074aa001f3124:   jne		0x74aa001f35e2
  0x000074aa001f312a:   mov		rbp, qword ptr [rsi + 0x30]
  0x000074aa001f312e:   mov		r14, qword ptr [rsi + 0x18]
  0x000074aa001f3132:   mov		ebx, dword ptr [rsi + 0x10]
  0x000074aa001f3135:   mov		r13d, dword ptr [rsi + 0x28]
  0x000074aa001f3139:   mov		rdi, rsi
  0x000074aa001f313c:   movabs		r10, 0x74aa160e7cd0 ;   {runtime_call SharedRuntime::OSR_migration_end(long*)}
  0x000074aa001f3146:   call		r10
  0x000074aa001f3149:   nop		dword ptr [rax + rax];   {post_call_nop}
  0x000074aa001f3151:   test		rbp, rbp
  0x000074aa001f3154:   je		0x74aa001f34fe
  0x000074aa001f315a:   mov		r10d, dword ptr [rbp + 8]
  0x000074aa001f315e:   cmp		r10d, 0x173310      ;   {metadata({type array byte})}
  0x000074aa001f3165:   jne		0x74aa001f3588
  0x000074aa001f316b:   mov		r9, rbp
  0x000074aa001f316e:   test		r14, r14
  0x000074aa001f3171:   je		0x74aa001f3506
  0x000074aa001f3177:   mov		r11d, dword ptr [r14 + 8]
  0x000074aa001f317b:   cmp		r11d, 0x173710      ;   {metadata({type array int})}
  0x000074aa001f3182:   jne		0x74aa001f3588      ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@62 (line 36)
  0x000074aa001f3188:   mov		r8d, dword ptr [r9 + 0xc]; implicit exception: dispatches to 0x000074aa001f35a8
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
  0x000074aa001f318c:   mov		r11d, dword ptr [r14 + 0xc]
                                                            ; implicit exception: dispatches to 0x000074aa001f35a8
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f3190:   cmp		ebx, r13d
  0x000074aa001f3193:   jge		0x74aa001f34ee      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x000074aa001f3199:   lea		ecx, [rbx + 1]
  0x000074aa001f319c:   movsxd		r10, ecx
  0x000074aa001f319f:   mov		edi, 1
  0x000074aa001f31a4:   cmp		ecx, 1
  0x000074aa001f31a7:   cmovl		r10, rdi
  0x000074aa001f31ab:   mov		edi, r10d
  0x000074aa001f31ae:   cmp		edi, r13d
  0x000074aa001f31b1:   cmovg		edi, r13d
  0x000074aa001f31b5:   lea		ecx, [rbx + rbx]
  0x000074aa001f31b8:   cmp		ecx, r8d
  0x000074aa001f31bb:   jae		0x74aa001f350e
  0x000074aa001f31c1:   movzx		r10d, byte ptr [r9 + rcx + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f31c7:   lea		ebp, [rcx + 1]
  0x000074aa001f31ca:   cmp		ebp, r8d
  0x000074aa001f31cd:   jae		0x74aa001f3538
  0x000074aa001f31d3:   movsxd		rcx, ecx
  0x000074aa001f31d6:   movzx		ebp, byte ptr [r9 + rcx + 0x11]
  0x000074aa001f31dc:   shl		ebp, 8
  0x000074aa001f31df:   or		ebp, r10d           ;*ior {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@105 (line 39)
  0x000074aa001f31e2:   cmp		ebx, r11d
  0x000074aa001f31e5:   jae		0x74aa001f3564
  0x000074aa001f31eb:   mov		dword ptr [r14 + rbx*4 + 0x10], ebp
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f31f0:   inc		ebx                 ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@107 (line 36)
  0x000074aa001f31f2:   cmp		ebx, edi
  0x000074aa001f31f4:   jl		0x74aa001f31b5      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x000074aa001f31f6:   movsxd		rdx, r11d
  0x000074aa001f31f9:   movsxd		rsi, r13d
  0x000074aa001f31fc:   movsxd		r10, r8d
  0x000074aa001f31ff:   lea		rcx, [r10 - 1]
  0x000074aa001f3203:   mov		rdi, r10
  0x000074aa001f3206:   sar		rdi, 1
  0x000074aa001f3209:   cmp		rdi, rsi
  0x000074aa001f320c:   cmovl		rsi, rdi
  0x000074aa001f3210:   shr		rcx, 0x3f
  0x000074aa001f3214:   lea		r10, [rcx + r10 - 1]
  0x000074aa001f3219:   sar		r10, 1
  0x000074aa001f321c:   cmp		r10, rsi
  0x000074aa001f321f:   cmovl		rsi, r10
  0x000074aa001f3223:   cmp		rdx, rsi
  0x000074aa001f3226:   cmovl		rsi, rdx
  0x000074aa001f322a:   add		rsi, -0xf
  0x000074aa001f322e:   mov		r10, -0x80000000
  0x000074aa001f3235:   cmp		rsi, -0x80000000
  0x000074aa001f323c:   cmovl		rsi, r10
  0x000074aa001f3240:   mov		r10d, esi
  0x000074aa001f3243:   cmp		ebx, r10d
  0x000074aa001f3246:   jge		0x74aa001f34af      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x000074aa001f324c:   jmp		0x74aa001f3467
  0x000074aa001f3251:   nop		dword ptr [rax + rax]
  0x000074aa001f3259:   nop		dword ptr [rax]
  0x000074aa001f3260:   mov		ebx, r11d           ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f3263:   movsxd		rax, ebx
  0x000074aa001f3266:   vmovd		xmm0, ebx
  0x000074aa001f326a:   shl		ebx, 1              ;*imul {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@72 (line 37)
  0x000074aa001f326c:   movzx		r11d, byte ptr [r9 + rbx + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f3272:   movsxd		rdi, ebx
  0x000074aa001f3275:   movzx		ecx, byte ptr [r9 + rdi + 0x11]
                                                            ;   {other}
  0x000074aa001f327b:   movzx		r10d, byte ptr [r9 + rdi + 0x2f]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f3281:   shl		ecx, 8
  0x000074aa001f3284:   or		ecx, r11d
  0x000074aa001f3287:   vmovd		r11d, xmm0
  0x000074aa001f328c:   mov		dword ptr [r14 + r11*4 + 0x10], ecx
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f3291:   movzx		esi, byte ptr [r9 + rdi + 0x12]
  0x000074aa001f3297:   movzx		r11d, byte ptr [r9 + rdi + 0x2e]
  0x000074aa001f329d:   shl		r10d, 8
  0x000074aa001f32a1:   or		r11d, r10d
  0x000074aa001f32a4:   vmovd		xmm2, r11d
  0x000074aa001f32a9:   movzx		r10d, byte ptr [r9 + rdi + 0x2c]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f32af:   vmovd		xmm1, r10d
  0x000074aa001f32b4:   movzx		r10d, byte ptr [r9 + rdi + 0x2b]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f32ba:   shl		r10d, 8
  0x000074aa001f32be:   movzx		r11d, byte ptr [r9 + rdi + 0x2a]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f32c4:   or		r11d, r10d
  0x000074aa001f32c7:   vmovd		xmm4, r11d
  0x000074aa001f32cc:   movzx		r11d, byte ptr [r9 + rdi + 0x29]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f32d2:   shl		r11d, 8
  0x000074aa001f32d6:   movzx		r10d, byte ptr [r9 + rdi + 0x28]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f32dc:   or		r10d, r11d
  0x000074aa001f32df:   vmovd		xmm3, r10d
  0x000074aa001f32e4:   movzx		r10d, byte ptr [r9 + rdi + 0x27]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f32ea:   shl		r10d, 8
  0x000074aa001f32ee:   movzx		r11d, byte ptr [r9 + rdi + 0x26]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f32f4:   or		r11d, r10d
  0x000074aa001f32f7:   vmovd		xmm6, r11d
  0x000074aa001f32fc:   movzx		r11d, byte ptr [r9 + rdi + 0x25]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f3302:   shl		r11d, 8
  0x000074aa001f3306:   movzx		r10d, byte ptr [r9 + rdi + 0x24]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f330c:   or		r10d, r11d
  0x000074aa001f330f:   vmovd		xmm5, r10d
  0x000074aa001f3314:   movzx		r10d, byte ptr [r9 + rdi + 0x23]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f331a:   shl		r10d, 8
  0x000074aa001f331e:   movzx		r11d, byte ptr [r9 + rdi + 0x22]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f3324:   or		r11d, r10d
  0x000074aa001f3327:   vmovd		xmm10, r11d
  0x000074aa001f332c:   movzx		r11d, byte ptr [r9 + rdi + 0x21]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f3332:   shl		r11d, 8
  0x000074aa001f3336:   movzx		ebp, byte ptr [r9 + rdi + 0x20]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f333c:   or		ebp, r11d
  0x000074aa001f333f:   movzx		r10d, byte ptr [r9 + rdi + 0x1f]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f3345:   shl		r10d, 8
  0x000074aa001f3349:   movzx		r13d, byte ptr [r9 + rdi + 0x1e]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f334f:   or		r13d, r10d
  0x000074aa001f3352:   movzx		r8d, byte ptr [r9 + rdi + 0x1d]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f3358:   shl		r8d, 8
  0x000074aa001f335c:   movzx		r10d, byte ptr [r9 + rdi + 0x1c]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f3362:   or		r10d, r8d
  0x000074aa001f3365:   movzx		ecx, byte ptr [r9 + rdi + 0x1b]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f336b:   shl		ecx, 8
  0x000074aa001f336e:   movzx		r8d, byte ptr [r9 + rdi + 0x1a]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f3374:   or		r8d, ecx
  0x000074aa001f3377:   movzx		ecx, byte ptr [r9 + rdi + 0x19]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
                                                            ;   {other}
  0x000074aa001f337d:   shl		ecx, 8
  0x000074aa001f3380:   movzx		r11d, byte ptr [r9 + rdi + 0x18]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f3386:   or		r11d, ecx
  0x000074aa001f3389:   movzx		ecx, byte ptr [r9 + rdi + 0x17]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f338f:   shl		ecx, 8
  0x000074aa001f3392:   movzx		ebx, byte ptr [r9 + rdi + 0x16]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f3398:   or		ebx, ecx
  0x000074aa001f339a:   movzx		edx, byte ptr [r9 + rdi + 0x15]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f33a0:   shl		edx, 8
  0x000074aa001f33a3:   movzx		ecx, byte ptr [r9 + rdi + 0x14]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f33a9:   or		ecx, edx
  0x000074aa001f33ab:   movzx		edx, byte ptr [r9 + rdi + 0x13]
  0x000074aa001f33b1:   movzx		edi, byte ptr [r9 + rdi + 0x2d]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f33b7:   shl		edx, 8
  0x000074aa001f33ba:   or		esi, edx
  0x000074aa001f33bc:   mov		dword ptr [r14 + rax*4 + 0x14], esi
  0x000074aa001f33c1:   mov		dword ptr [r14 + rax*4 + 0x18], ecx
  0x000074aa001f33c6:   mov		dword ptr [r14 + rax*4 + 0x1c], ebx
  0x000074aa001f33cb:   mov		dword ptr [r14 + rax*4 + 0x20], r11d
  0x000074aa001f33d0:   mov		dword ptr [r14 + rax*4 + 0x24], r8d
  0x000074aa001f33d5:   mov		dword ptr [r14 + rax*4 + 0x28], r10d
  0x000074aa001f33da:   mov		dword ptr [r14 + rax*4 + 0x2c], r13d
  0x000074aa001f33df:   mov		dword ptr [r14 + rax*4 + 0x30], ebp
  0x000074aa001f33e4:   vmovd		r10d, xmm10
  0x000074aa001f33e9:   mov		dword ptr [r14 + rax*4 + 0x34], r10d
  0x000074aa001f33ee:   vmovd		r10d, xmm5
  0x000074aa001f33f3:   mov		dword ptr [r14 + rax*4 + 0x38], r10d
  0x000074aa001f33f8:   vmovd		r11d, xmm6
  0x000074aa001f33fd:   mov		dword ptr [r14 + rax*4 + 0x3c], r11d
  0x000074aa001f3402:   vmovd		r11d, xmm3
  0x000074aa001f3407:   mov		dword ptr [r14 + rax*4 + 0x40], r11d
  0x000074aa001f340c:   vmovd		r11d, xmm4
  0x000074aa001f3411:   mov		dword ptr [r14 + rax*4 + 0x44], r11d
  0x000074aa001f3416:   shl		edi, 8
  0x000074aa001f3419:   vmovd		r11d, xmm1
  0x000074aa001f341e:   or		r11d, edi
  0x000074aa001f3421:   mov		dword ptr [r14 + rax*4 + 0x48], r11d
  0x000074aa001f3426:   vmovd		r11d, xmm2
  0x000074aa001f342b:   mov		dword ptr [r14 + rax*4 + 0x4c], r11d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f3430:   vmovd		r11d, xmm0
  0x000074aa001f3435:   add		r11d, 0x10          ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@107 (line 36)
  0x000074aa001f3439:   cmp		r11d, dword ptr [rsp + 4]
  0x000074aa001f343e:   jl		0x74aa001f3260      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x000074aa001f3444:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r9=Oop r14=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x000074aa001f3448:   test		dword ptr [r10], eax;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
                                                            ;   {poll}
  0x000074aa001f344b:   mov		ebx, r11d
  0x000074aa001f344e:   cmp		r11d, dword ptr [rsp]
  0x000074aa001f3452:   jge		0x74aa001f34a0
  0x000074aa001f3454:   vmovd		r13d, xmm7
  0x000074aa001f3459:   vmovd		r8d, xmm9
  0x000074aa001f345e:   vmovd		r11d, xmm8
  0x000074aa001f3463:   mov		r10d, dword ptr [rsp];*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f3467:   mov		ecx, r10d
  0x000074aa001f346a:   sub		ecx, ebx
  0x000074aa001f346c:   xor		edi, edi
  0x000074aa001f346e:   cmp		r10d, ebx
  0x000074aa001f3471:   cmovl		ecx, edi
  0x000074aa001f3474:   cmp		ecx, 0x3e80
  0x000074aa001f347a:   mov		edi, 0x3e80
  0x000074aa001f347f:   cmova		ecx, edi
  0x000074aa001f3482:   add		ecx, ebx
  0x000074aa001f3484:   vmovd		xmm7, r13d
  0x000074aa001f3489:   vmovd		xmm9, r8d
  0x000074aa001f348e:   vmovd		xmm8, r11d
  0x000074aa001f3493:   mov		dword ptr [rsp], r10d
  0x000074aa001f3497:   mov		dword ptr [rsp + 4], ecx
  0x000074aa001f349b:   jmp		0x74aa001f3263
  0x000074aa001f34a0:   vmovd		r13d, xmm7
  0x000074aa001f34a5:   vmovd		r8d, xmm9
  0x000074aa001f34aa:   vmovd		r11d, xmm8
  0x000074aa001f34af:   cmp		ebx, r13d
  0x000074aa001f34b2:   jge		0x74aa001f34ee
  0x000074aa001f34b4:   lea		ecx, [rbx + rbx]
  0x000074aa001f34b7:   cmp		ecx, r8d
  0x000074aa001f34ba:   jae		0x74aa001f350e
  0x000074aa001f34bc:   movzx		r10d, byte ptr [r9 + rcx + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f34c2:   lea		ebp, [rcx + 1]
  0x000074aa001f34c5:   cmp		ebp, r8d
  0x000074aa001f34c8:   jae		0x74aa001f3538
  0x000074aa001f34ca:   movsxd		rcx, ecx
  0x000074aa001f34cd:   movzx		ebp, byte ptr [r9 + rcx + 0x11]
  0x000074aa001f34d3:   shl		ebp, 8
  0x000074aa001f34d6:   or		ebp, r10d           ;*ior {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@105 (line 39)
  0x000074aa001f34d9:   cmp		ebx, r11d
  0x000074aa001f34dc:   jae		0x74aa001f3564
  0x000074aa001f34e2:   mov		dword ptr [r14 + rbx*4 + 0x10], ebp
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f34e7:   inc		ebx                 ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@107 (line 36)
  0x000074aa001f34e9:   cmp		ebx, r13d
  0x000074aa001f34ec:   jl		0x74aa001f34b4      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x000074aa001f34ee:   add		rsp, 0x40
  0x000074aa001f34f2:   pop		rbp
  0x000074aa001f34f3:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x000074aa001f34f7:   ja		0x74aa001f35cc
  0x000074aa001f34fd:   ret		
  0x000074aa001f34fe:   xor		r9d, r9d
  0x000074aa001f3501:   jmp		0x74aa001f316e
  0x000074aa001f3506:   xor		r14d, r14d
  0x000074aa001f3509:   jmp		0x74aa001f3188
  0x000074aa001f350e:   mov		esi, 0xffffffe4
  0x000074aa001f3513:   mov		dword ptr [rsp], r13d
  0x000074aa001f3517:   mov		qword ptr [rsp + 8], r14
  0x000074aa001f351c:   mov		dword ptr [rsp + 4], ebx
  0x000074aa001f3520:   mov		qword ptr [rsp + 0x10], r9
  0x000074aa001f3525:   mov		dword ptr [rsp + 0x18], ecx
  0x000074aa001f3529:   nop		
  0x000074aa001f352b:   call		0x74a9ffb495e0      ; ImmutableOopMap {[8]=Oop [16]=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x000074aa001f3530:   nop		dword ptr [rax + rax + 0x1000528]
                                                            ;   {post_call_nop}
  0x000074aa001f3538:   mov		esi, 0xffffffe4
  0x000074aa001f353d:   mov		dword ptr [rsp + 8], r13d
  0x000074aa001f3542:   mov		qword ptr [rsp + 0x10], r14
  0x000074aa001f3547:   mov		dword ptr [rsp + 0xc], ebx
  0x000074aa001f354b:   mov		qword ptr [rsp + 0x18], r9
  0x000074aa001f3550:   mov		dword ptr [rsp + 0x20], r10d
  0x000074aa001f3555:   nop		
  0x000074aa001f3557:   call		0x74a9ffb495e0      ; ImmutableOopMap {[16]=Oop [24]=Oop }
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@87 (line 38)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x000074aa001f355c:   nop		dword ptr [rax + rax + 0x2000554]
                                                            ;   {post_call_nop}
  0x000074aa001f3564:   mov		esi, 0xffffffe4
  0x000074aa001f3569:   mov		qword ptr [rsp], r9
  0x000074aa001f356d:   mov		dword ptr [rsp + 8], r13d
  0x000074aa001f3572:   mov		qword ptr [rsp + 0x18], r14
  0x000074aa001f3577:   mov		dword ptr [rsp + 0x20], ebx
  0x000074aa001f357b:   call		0x74a9ffb495e0      ; ImmutableOopMap {[0]=Oop [24]=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x000074aa001f3580:   nop		dword ptr [rax + rax + 0x3000578]
                                                            ;   {post_call_nop}
  0x000074aa001f3588:   mov		esi, 0xffffff85
  0x000074aa001f358d:   mov		dword ptr [rsp], r13d
  0x000074aa001f3591:   mov		qword ptr [rsp + 8], r14
  0x000074aa001f3596:   mov		dword ptr [rsp + 4], ebx
  0x000074aa001f359a:   nop		
  0x000074aa001f359b:   call		0x74a9ffb495e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@62 (line 36)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x000074aa001f35a0:   nop		dword ptr [rax + rax + 0x4000598]
                                                            ;   {post_call_nop}
  0x000074aa001f35a8:   mov		esi, 0xffffffbe
  0x000074aa001f35ad:   mov		rbp, r9
  0x000074aa001f35b0:   mov		dword ptr [rsp], r13d
  0x000074aa001f35b4:   mov		qword ptr [rsp + 8], r14
  0x000074aa001f35b9:   mov		dword ptr [rsp + 4], ebx
  0x000074aa001f35bd:   nop		
  0x000074aa001f35bf:   call		0x74a9ffb495e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@62 (line 36)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x000074aa001f35c4:   nop		dword ptr [rax + rax + 0x50005bc]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
                                                            ;   {post_call_nop}
  0x000074aa001f35cc:   movabs		r10, 0x74aa001f34f3 ;   {internal_word}
  0x000074aa001f35d6:   mov		qword ptr [r15 + 0x538], r10
  0x000074aa001f35dd:   jmp		0x74a9ffa68b60      ;   {runtime_call SafepointBlob}
  0x000074aa001f35e2:   call		0x74a9ffa4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x000074aa001f35e7:   jmp		0x74aa001f312a
  0x000074aa001f35ec:   hlt		
  0x000074aa001f35ed:   hlt		
  0x000074aa001f35ee:   hlt		
  0x000074aa001f35ef:   hlt		
[Exception Handler]
  0x000074aa001f35f0:   jmp		0x74a9ffb498e0      ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x000074aa001f35f5:   call		0x74aa001f35fa
  0x000074aa001f35fa:   sub		qword ptr [rsp], 5
  0x000074aa001f35ff:   jmp		0x74a9ffa672e0      ;   {runtime_call DeoptimizationBlob}
  0x000074aa001f3604:   hlt		
  0x000074aa001f3605:   hlt		
  0x000074aa001f3606:   hlt		
  0x000074aa001f3607:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

============================= C1-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2) 214  165       4       dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode (131 bytes)
 total in heap  [0x000074aa001f3688,0x000074aa001f3b20] = 1176
 main code      [0x000074aa001f3780,0x000074aa001f3b00] = 896
 stub code      [0x000074aa001f3b00,0x000074aa001f3b18] = 24
 oops           [0x000074aa001f3b18,0x000074aa001f3b20] = 8
 mutable data [0x000074a990102c20,0x000074a990102c48] = 40
 relocation     [0x000074a990102c20,0x000074a990102c40] = 32
 metadata       [0x000074a990102c40,0x000074a990102c48] = 8
 immutable data [0x000074a9901027c0,0x000074a990102c10] = 1104
 dependencies   [0x000074a9901027c0,0x000074a9901027c8] = 8
 nul chk table  [0x000074a9901027c8,0x000074a9901027e0] = 24
 scopes pcs     [0x000074a9901027e0,0x000074a990102b80] = 928
 scopes data    [0x000074a990102b80,0x000074a990102c10] = 144

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Instructions begin]
  0x000074aa001f3780:   nop		
[Entry Point]
  # {method} {0x0000000006040f70} 'decode' '([BII[I)V' in 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  # this:     rsi:rsi   = 'dev/cdelmonte/decodeshape/phase1/ScalarWidenDecoder'
  # parm0:    rdx:rdx   = '[B'
  # parm1:    rcx       = int
  # parm2:    r8        = int
  # parm3:    r9:r9     = '[I'
  #           [sp+0x40]  (sp of caller)
  0x000074aa001f3782:   mov		r10d, dword ptr [rsi + 8]
  0x000074aa001f3786:   cmp		r10d, dword ptr [rax + 8]
  0x000074aa001f378a:   jne		0x74a9ffa655e0      ;   {runtime_call Shared Runtime ic_miss_blob}
[Verified Entry Point]
  0x000074aa001f3790:   mov		dword ptr [rsp - 0x14000], eax
  0x000074aa001f3797:   push		rbp
  0x000074aa001f3798:   sub		rsp, 0x30
  0x000074aa001f379c:   cmp		dword ptr [r15 + 0x20], 1
  0x000074aa001f37a4:   jne		0x74aa001f3af6      ;*synchronization entry
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@-1 (line 29)
  0x000074aa001f37aa:   cmp		r8d, 0x10
  0x000074aa001f37ae:   jne		0x74aa001f3abc      ;*lookupswitch {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@1 (line 29)
  0x000074aa001f37b4:   test		ecx, ecx
  0x000074aa001f37b6:   jle		0x74aa001f3a8d      ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x000074aa001f37bc:   mov		edi, dword ptr [rdx + 0xc]
                                                            ; implicit exception: dispatches to 0x000074aa001f3a9d
                                                            ;*baload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@73 (line 37)
  0x000074aa001f37bf:   test		edi, edi
  0x000074aa001f37c1:   jbe		0x74aa001f3a9d
  0x000074aa001f37c7:   movsxd		rbx, ecx
  0x000074aa001f37ca:   movsxd		r10, edi
  0x000074aa001f37cd:   lea		r11, [rbx + rbx]
  0x000074aa001f37d1:   lea		r8, [r11 - 2]
  0x000074aa001f37d5:   cmp		r8, r10
  0x000074aa001f37d8:   jae		0x74aa001f3a9d
  0x000074aa001f37de:   cmp		edi, 1
  0x000074aa001f37e1:   jbe		0x74aa001f3a9d
  0x000074aa001f37e7:   dec		r11
  0x000074aa001f37ea:   cmp		r11, r10
  0x000074aa001f37ed:   jae		0x74aa001f3a9d
  0x000074aa001f37f3:   mov		r10d, dword ptr [r9 + 0xc]
                                                            ; implicit exception: dispatches to 0x000074aa001f3a9d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f37f7:   test		r10d, r10d
  0x000074aa001f37fa:   jbe		0x74aa001f3a9d
  0x000074aa001f3800:   movsxd		r10, r10d
  0x000074aa001f3803:   lea		r11, [rbx - 1]
  0x000074aa001f3807:   cmp		r11, r10
  0x000074aa001f380a:   jae		0x74aa001f3a9d
  0x000074aa001f3810:   movzx		r10d, byte ptr [rdx + 0x11]
  0x000074aa001f3815:   movzx		r8d, byte ptr [rdx + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f381a:   add		rbx, -0xf
  0x000074aa001f381e:   shl		r10d, 8
  0x000074aa001f3822:   or		r10d, r8d
  0x000074aa001f3825:   mov		dword ptr [r9 + 0x10], r10d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f3829:   mov		r10, -0x80000000
  0x000074aa001f3830:   cmp		rbx, -0x80000000
  0x000074aa001f3837:   cmovl		rbx, r10
  0x000074aa001f383b:   mov		ebx, ebx
  0x000074aa001f383d:   mov		edi, 1
  0x000074aa001f3842:   cmp		ebx, 1
  0x000074aa001f3845:   jle		0x74aa001f3a62      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x000074aa001f384b:   jmp		0x74aa001f3855
  0x000074aa001f384d:   vmovd		ecx, xmm0
  0x000074aa001f3851:   mov		ebx, dword ptr [rsp + 4]
  0x000074aa001f3855:   mov		r11d, ebx
  0x000074aa001f3858:   sub		r11d, edi
  0x000074aa001f385b:   xor		r10d, r10d
  0x000074aa001f385e:   cmp		ebx, edi
  0x000074aa001f3860:   cmovl		r11d, r10d
  0x000074aa001f3864:   cmp		r11d, 0x3e80
  0x000074aa001f386b:   mov		r10d, 0x3e80
  0x000074aa001f3871:   cmova		r11d, r10d
  0x000074aa001f3875:   add		r11d, edi
  0x000074aa001f3878:   vmovd		xmm0, ecx
  0x000074aa001f387c:   mov		dword ptr [rsp + 4], ebx
  0x000074aa001f3880:   mov		dword ptr [rsp + 8], r11d
  0x000074aa001f3885:   nop		word ptr [rax + rax];*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@68 (line 37)
                                                            ;   {other}
  0x000074aa001f3890:   lea		r8d, [rdi + rdi]
  0x000074aa001f3894:   movzx		r10d, byte ptr [rdx + r8 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f389a:   movsxd		rbp, r8d
  0x000074aa001f389d:   movzx		esi, byte ptr [rdx + rbp + 0x11]
  0x000074aa001f38a2:   movzx		r8d, byte ptr [rdx + rbp + 0x2f]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f38a8:   movzx		ecx, byte ptr [rdx + rbp + 0x12]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f38ad:   movzx		r11d, byte ptr [rdx + rbp + 0x13]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f38b3:   shl		esi, 8
  0x000074aa001f38b6:   or		esi, r10d
  0x000074aa001f38b9:   mov		dword ptr [r9 + rdi*4 + 0x10], esi
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f38be:   movzx		r10d, byte ptr [rdx + rbp + 0x2e]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f38c4:   movzx		esi, byte ptr [rdx + rbp + 0x2d]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f38c9:   shl		r11d, 8
  0x000074aa001f38cd:   or		ecx, r11d
  0x000074aa001f38d0:   mov		dword ptr [r9 + rdi*4 + 0x14], ecx
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f38d5:   movzx		ebx, byte ptr [rdx + rbp + 0x2c]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f38da:   movzx		r11d, byte ptr [rdx + rbp + 0x2b]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f38e0:   shl		esi, 8
  0x000074aa001f38e3:   or		ebx, esi
  0x000074aa001f38e5:   vmovd		xmm1, ebx
  0x000074aa001f38e9:   movzx		ecx, byte ptr [rdx + rbp + 0x2a]
  0x000074aa001f38ee:   shl		r11d, 8
  0x000074aa001f38f2:   or		ecx, r11d
  0x000074aa001f38f5:   vmovd		xmm2, ecx
  0x000074aa001f38f9:   movzx		r11d, byte ptr [rdx + rbp + 0x28]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f38ff:   vmovd		xmm3, r11d
  0x000074aa001f3904:   shl		r8d, 8
  0x000074aa001f3908:   or		r10d, r8d
  0x000074aa001f390b:   vmovd		xmm4, r10d
  0x000074aa001f3910:   movzx		r11d, byte ptr [rdx + rbp + 0x27]
  0x000074aa001f3916:   shl		r11d, 8
  0x000074aa001f391a:   mov		dword ptr [rsp], r11d
  0x000074aa001f391e:   movzx		r10d, byte ptr [rdx + rbp + 0x25]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f3924:   shl		r10d, 8
  0x000074aa001f3928:   movzx		r11d, byte ptr [rdx + rbp + 0x24]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f392e:   or		r11d, r10d
  0x000074aa001f3931:   vmovd		xmm5, r11d
  0x000074aa001f3936:   movzx		r11d, byte ptr [rdx + rbp + 0x23]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f393c:   shl		r11d, 8
  0x000074aa001f3940:   movzx		r14d, byte ptr [rdx + rbp + 0x22]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f3946:   or		r14d, r11d
  0x000074aa001f3949:   movzx		r10d, byte ptr [rdx + rbp + 0x21]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f394f:   shl		r10d, 8
  0x000074aa001f3953:   movzx		r8d, byte ptr [rdx + rbp + 0x20]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f3959:   or		r8d, r10d
  0x000074aa001f395c:   movzx		r10d, byte ptr [rdx + rbp + 0x1f]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f3962:   shl		r10d, 8
  0x000074aa001f3966:   movzx		r11d, byte ptr [rdx + rbp + 0x1e]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f396c:   or		r11d, r10d
  0x000074aa001f396f:   movzx		r10d, byte ptr [rdx + rbp + 0x1d]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f3975:   shl		r10d, 8
  0x000074aa001f3979:   movzx		ebx, byte ptr [rdx + rbp + 0x1c]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f397e:   or		ebx, r10d
  0x000074aa001f3981:   movzx		r10d, byte ptr [rdx + rbp + 0x1b]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f3987:   shl		r10d, 8             ;   {other}
  0x000074aa001f398b:   movzx		ecx, byte ptr [rdx + rbp + 0x1a]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f3990:   or		ecx, r10d
  0x000074aa001f3993:   movzx		r10d, byte ptr [rdx + rbp + 0x19]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f3999:   shl		r10d, 8
  0x000074aa001f399d:   movzx		eax, byte ptr [rdx + rbp + 0x18]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f39a2:   or		eax, r10d
  0x000074aa001f39a5:   movzx		r10d, byte ptr [rdx + rbp + 0x17]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f39ab:   shl		r10d, 8
  0x000074aa001f39af:   movzx		esi, byte ptr [rdx + rbp + 0x16]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f39b4:   or		esi, r10d
  0x000074aa001f39b7:   movzx		r10d, byte ptr [rdx + rbp + 0x15]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f39bd:   shl		r10d, 8
  0x000074aa001f39c1:   movzx		r13d, byte ptr [rdx + rbp + 0x14]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f39c7:   or		r13d, r10d
  0x000074aa001f39ca:   mov		dword ptr [r9 + rdi*4 + 0x18], r13d
  0x000074aa001f39cf:   mov		dword ptr [r9 + rdi*4 + 0x1c], esi
  0x000074aa001f39d4:   mov		dword ptr [r9 + rdi*4 + 0x20], eax
  0x000074aa001f39d9:   mov		dword ptr [r9 + rdi*4 + 0x24], ecx
  0x000074aa001f39de:   mov		dword ptr [r9 + rdi*4 + 0x28], ebx
  0x000074aa001f39e3:   mov		dword ptr [r9 + rdi*4 + 0x2c], r11d
  0x000074aa001f39e8:   mov		dword ptr [r9 + rdi*4 + 0x30], r8d
  0x000074aa001f39ed:   mov		dword ptr [r9 + rdi*4 + 0x34], r14d
  0x000074aa001f39f2:   vmovd		r11d, xmm5
  0x000074aa001f39f7:   mov		dword ptr [r9 + rdi*4 + 0x38], r11d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f39fc:   movzx		r10d, byte ptr [rdx + rbp + 0x29]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f3a02:   movzx		r11d, byte ptr [rdx + rbp + 0x26]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f3a08:   or		r11d, dword ptr [rsp]
  0x000074aa001f3a0c:   mov		dword ptr [r9 + rdi*4 + 0x3c], r11d
  0x000074aa001f3a11:   shl		r10d, 8
  0x000074aa001f3a15:   vmovd		r8d, xmm3
  0x000074aa001f3a1a:   or		r8d, r10d
  0x000074aa001f3a1d:   mov		dword ptr [r9 + rdi*4 + 0x40], r8d
  0x000074aa001f3a22:   vmovd		r10d, xmm2
  0x000074aa001f3a27:   mov		dword ptr [r9 + rdi*4 + 0x44], r10d
  0x000074aa001f3a2c:   vmovd		r11d, xmm1
  0x000074aa001f3a31:   mov		dword ptr [r9 + rdi*4 + 0x48], r11d
  0x000074aa001f3a36:   vmovd		r10d, xmm4
  0x000074aa001f3a3b:   mov		dword ptr [r9 + rdi*4 + 0x4c], r10d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f3a40:   add		edi, 0x10           ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@107 (line 36)
  0x000074aa001f3a43:   cmp		edi, dword ptr [rsp + 8]
  0x000074aa001f3a47:   jl		0x74aa001f3890      ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x000074aa001f3a4d:   mov		r10, qword ptr [r15 + 0x30]
                                                            ; ImmutableOopMap {r9=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
  0x000074aa001f3a51:   test		dword ptr [r10], eax;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@110 (line 36)
                                                            ;   {poll}
  0x000074aa001f3a54:   cmp		edi, dword ptr [rsp + 4]
  0x000074aa001f3a58:   jl		0x74aa001f384d
  0x000074aa001f3a5e:   vmovd		ecx, xmm0
  0x000074aa001f3a62:   cmp		edi, ecx
  0x000074aa001f3a64:   jge		0x74aa001f3a8d
  0x000074aa001f3a66:   nop		                    ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@68 (line 37)
  0x000074aa001f3a68:   lea		r10d, [rdi + rdi]
  0x000074aa001f3a6c:   movzx		r11d, byte ptr [rdx + r10 + 0x10]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@77 (line 37)
  0x000074aa001f3a72:   movsxd		r10, r10d
  0x000074aa001f3a75:   movzx		r8d, byte ptr [rdx + r10 + 0x11]
                                                            ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@91 (line 38)
  0x000074aa001f3a7b:   shl		r8d, 8
  0x000074aa001f3a7f:   or		r8d, r11d
  0x000074aa001f3a82:   mov		dword ptr [r9 + rdi*4 + 0x10], r8d
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@106 (line 39)
  0x000074aa001f3a87:   inc		edi                 ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@107 (line 36)
  0x000074aa001f3a89:   cmp		edi, ecx
  0x000074aa001f3a8b:   jl		0x74aa001f3a68
  0x000074aa001f3a8d:   add		rsp, 0x30
  0x000074aa001f3a91:   pop		rbp
  0x000074aa001f3a92:   cmp		rsp, qword ptr [r15 + 0x28]
                                                            ;   {poll_return}
  0x000074aa001f3a96:   ja		0x74aa001f3ae0
  0x000074aa001f3a9c:   ret		                    ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
  0x000074aa001f3a9d:   mov		esi, 0xffffff6e
  0x000074aa001f3aa2:   mov		rbp, rdx
  0x000074aa001f3aa5:   mov		qword ptr [rsp + 8], r9
  0x000074aa001f3aaa:   mov		dword ptr [rsp + 4], ecx
  0x000074aa001f3aae:   nop		
  0x000074aa001f3aaf:   call		0x74a9ffb495e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x000074aa001f3ab4:   nop		dword ptr [rax + rax + 0x100042c]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
                                                            ;   {post_call_nop}
  0x000074aa001f3abc:   mov		esi, 0xffffff45
  0x000074aa001f3ac1:   mov		rbp, rdx
  0x000074aa001f3ac4:   mov		dword ptr [rsp], ecx
  0x000074aa001f3ac7:   mov		qword ptr [rsp + 8], r9
  0x000074aa001f3acc:   mov		dword ptr [rsp + 0x10], r8d
  0x000074aa001f3ad1:   nop		
  0x000074aa001f3ad3:   call		0x74a9ffb495e0      ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*lookupswitch {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@1 (line 29)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x000074aa001f3ad8:   nop		dword ptr [rax + rax + 0x2000450]
                                                            ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder::decode@65 (line 36)
                                                            ;   {post_call_nop}
  0x000074aa001f3ae0:   movabs		r10, 0x74aa001f3a92 ;   {internal_word}
  0x000074aa001f3aea:   mov		qword ptr [r15 + 0x538], r10
  0x000074aa001f3af1:   jmp		0x74a9ffa68b60      ;   {runtime_call SafepointBlob}
  0x000074aa001f3af6:   call		0x74a9ffa4f5c0      ;   {runtime_call Stub::method_entry_barrier}
  0x000074aa001f3afb:   jmp		0x74aa001f37aa
[Exception Handler]
  0x000074aa001f3b00:   jmp		0x74a9ffb498e0      ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x000074aa001f3b05:   call		0x74aa001f3b0a
  0x000074aa001f3b0a:   sub		qword ptr [rsp], 5
  0x000074aa001f3b0f:   jmp		0x74a9ffa672e0      ;   {runtime_call DeoptimizationBlob}
  0x000074aa001f3b14:   hlt		
  0x000074aa001f3b15:   hlt		
  0x000074aa001f3b16:   hlt		
  0x000074aa001f3b17:   hlt		
--------------------------------------------------------------------------------
[/Disassembly]

