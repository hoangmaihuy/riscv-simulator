
test/add_int.out:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	00000793          	addi	a5,zero,0
   100b4:	00078863          	beq	a5,zero,100c4 <register_fini+0x14>
   100b8:	00010537          	lui	a0,0x10
   100bc:	57050513          	addi	a0,a0,1392 # 10570 <__libc_fini_array>
   100c0:	49c0006f          	jal	zero,1055c <atexit>
   100c4:	00008067          	jalr	zero,0(ra)

00000000000100c8 <_start>:
   100c8:	00003197          	auipc	gp,0x3
   100cc:	de818193          	addi	gp,gp,-536 # 12eb0 <__global_pointer$>
   100d0:	77818513          	addi	a0,gp,1912 # 13628 <errno>
   100d4:	00003617          	auipc	a2,0x3
   100d8:	5dc60613          	addi	a2,a2,1500 # 136b0 <__BSS_END__>
   100dc:	40a60633          	sub	a2,a2,a0
   100e0:	00000593          	addi	a1,zero,0
   100e4:	1dc000ef          	jal	ra,102c0 <memset>
   100e8:	00000517          	auipc	a0,0x0
   100ec:	47450513          	addi	a0,a0,1140 # 1055c <atexit>
   100f0:	00050863          	beq	a0,zero,10100 <_start+0x38>
   100f4:	00000517          	auipc	a0,0x0
   100f8:	47c50513          	addi	a0,a0,1148 # 10570 <__libc_fini_array>
   100fc:	460000ef          	jal	ra,1055c <atexit>
   10100:	124000ef          	jal	ra,10224 <__libc_init_array>
   10104:	00012503          	lw	a0,0(sp)
   10108:	00810593          	addi	a1,sp,8
   1010c:	00000613          	addi	a2,zero,0
   10110:	06c000ef          	jal	ra,1017c <main>
   10114:	0e00006f          	jal	zero,101f4 <exit>

0000000000010118 <__do_global_dtors_aux>:
   10118:	ff010113          	addi	sp,sp,-16
   1011c:	00813023          	sd	s0,0(sp)
   10120:	7a01c783          	lbu	a5,1952(gp) # 13650 <completed.1>
   10124:	00113423          	sd	ra,8(sp)
   10128:	02079263          	bne	a5,zero,1014c <__do_global_dtors_aux+0x34>
   1012c:	00000793          	addi	a5,zero,0
   10130:	00078a63          	beq	a5,zero,10144 <__do_global_dtors_aux+0x2c>
   10134:	00012537          	lui	a0,0x12
   10138:	68850513          	addi	a0,a0,1672 # 12688 <__FRAME_END__>
   1013c:	00000097          	auipc	ra,0x0
   10140:	000000e7          	jalr	ra,0(zero) # 0 <register_fini-0x100b0>
   10144:	00100793          	addi	a5,zero,1
   10148:	7af18023          	sb	a5,1952(gp) # 13650 <completed.1>
   1014c:	00813083          	ld	ra,8(sp)
   10150:	00013403          	ld	s0,0(sp)
   10154:	01010113          	addi	sp,sp,16
   10158:	00008067          	jalr	zero,0(ra) # 1013c <__do_global_dtors_aux+0x24>

000000000001015c <frame_dummy>:
   1015c:	00000793          	addi	a5,zero,0
   10160:	00078c63          	beq	a5,zero,10178 <frame_dummy+0x1c>
   10164:	00012537          	lui	a0,0x12
   10168:	7a818593          	addi	a1,gp,1960 # 13658 <object.0>
   1016c:	68850513          	addi	a0,a0,1672 # 12688 <__FRAME_END__>
   10170:	00000317          	auipc	t1,0x0
   10174:	00000067          	jalr	zero,0(zero) # 0 <register_fini-0x100b0>
   10178:	00008067          	jalr	zero,0(ra)

000000000001017c <main>:
   1017c:	fe010113          	addi	sp,sp,-32
   10180:	00113c23          	sd	ra,24(sp)
   10184:	00813823          	sd	s0,16(sp)
   10188:	02010413          	addi	s0,sp,32
   1018c:	fec40793          	addi	a5,s0,-20
   10190:	00400613          	addi	a2,zero,4
   10194:	00078593          	addi	a1,a5,0
   10198:	00000513          	addi	a0,zero,0
   1019c:	200000ef          	jal	ra,1039c <read>
   101a0:	fe840793          	addi	a5,s0,-24
   101a4:	00400613          	addi	a2,zero,4
   101a8:	00078593          	addi	a1,a5,0
   101ac:	00000513          	addi	a0,zero,0
   101b0:	1ec000ef          	jal	ra,1039c <read>
   101b4:	fec42703          	lw	a4,-20(s0)
   101b8:	fe842783          	lw	a5,-24(s0)
   101bc:	00f707bb          	addw	a5,a4,a5
   101c0:	0007879b          	addiw	a5,a5,0
   101c4:	fef42223          	sw	a5,-28(s0)
   101c8:	fe440793          	addi	a5,s0,-28
   101cc:	00400613          	addi	a2,zero,4
   101d0:	00078593          	addi	a1,a5,0
   101d4:	00100513          	addi	a0,zero,1
   101d8:	1dc000ef          	jal	ra,103b4 <write>
   101dc:	00000793          	addi	a5,zero,0
   101e0:	00078513          	addi	a0,a5,0
   101e4:	01813083          	ld	ra,24(sp)
   101e8:	01013403          	ld	s0,16(sp)
   101ec:	02010113          	addi	sp,sp,32
   101f0:	00008067          	jalr	zero,0(ra)

00000000000101f4 <exit>:
   101f4:	ff010113          	addi	sp,sp,-16
   101f8:	00000593          	addi	a1,zero,0
   101fc:	00813023          	sd	s0,0(sp)
   10200:	00113423          	sd	ra,8(sp)
   10204:	00050413          	addi	s0,a0,0
   10208:	22c000ef          	jal	ra,10434 <__call_exitprocs>
   1020c:	7501b503          	ld	a0,1872(gp) # 13600 <_global_impure_ptr>
   10210:	05853783          	ld	a5,88(a0)
   10214:	00078463          	beq	a5,zero,1021c <exit+0x28>
   10218:	000780e7          	jalr	ra,0(a5)
   1021c:	00040513          	addi	a0,s0,0
   10220:	330010ef          	jal	ra,11550 <_exit>

0000000000010224 <__libc_init_array>:
   10224:	fe010113          	addi	sp,sp,-32
   10228:	00813823          	sd	s0,16(sp)
   1022c:	01213023          	sd	s2,0(sp)
   10230:	00012437          	lui	s0,0x12
   10234:	00012937          	lui	s2,0x12
   10238:	68c40793          	addi	a5,s0,1676 # 1268c <__preinit_array_end>
   1023c:	68c90913          	addi	s2,s2,1676 # 1268c <__preinit_array_end>
   10240:	40f90933          	sub	s2,s2,a5
   10244:	00113c23          	sd	ra,24(sp)
   10248:	00913423          	sd	s1,8(sp)
   1024c:	40395913          	srai	s2,s2,0x3
   10250:	02090063          	beq	s2,zero,10270 <__libc_init_array+0x4c>
   10254:	68c40413          	addi	s0,s0,1676
   10258:	00000493          	addi	s1,zero,0
   1025c:	00043783          	ld	a5,0(s0)
   10260:	00148493          	addi	s1,s1,1
   10264:	00840413          	addi	s0,s0,8
   10268:	000780e7          	jalr	ra,0(a5)
   1026c:	fe9918e3          	bne	s2,s1,1025c <__libc_init_array+0x38>
   10270:	00012437          	lui	s0,0x12
   10274:	00012937          	lui	s2,0x12
   10278:	69040793          	addi	a5,s0,1680 # 12690 <__init_array_start>
   1027c:	6a090913          	addi	s2,s2,1696 # 126a0 <__do_global_dtors_aux_fini_array_entry>
   10280:	40f90933          	sub	s2,s2,a5
   10284:	40395913          	srai	s2,s2,0x3
   10288:	02090063          	beq	s2,zero,102a8 <__libc_init_array+0x84>
   1028c:	69040413          	addi	s0,s0,1680
   10290:	00000493          	addi	s1,zero,0
   10294:	00043783          	ld	a5,0(s0)
   10298:	00148493          	addi	s1,s1,1
   1029c:	00840413          	addi	s0,s0,8
   102a0:	000780e7          	jalr	ra,0(a5)
   102a4:	fe9918e3          	bne	s2,s1,10294 <__libc_init_array+0x70>
   102a8:	01813083          	ld	ra,24(sp)
   102ac:	01013403          	ld	s0,16(sp)
   102b0:	00813483          	ld	s1,8(sp)
   102b4:	00013903          	ld	s2,0(sp)
   102b8:	02010113          	addi	sp,sp,32
   102bc:	00008067          	jalr	zero,0(ra)

00000000000102c0 <memset>:
   102c0:	00f00313          	addi	t1,zero,15
   102c4:	00050713          	addi	a4,a0,0
   102c8:	02c37a63          	bgeu	t1,a2,102fc <memset+0x3c>
   102cc:	00f77793          	andi	a5,a4,15
   102d0:	0a079063          	bne	a5,zero,10370 <memset+0xb0>
   102d4:	06059e63          	bne	a1,zero,10350 <memset+0x90>
   102d8:	ff067693          	andi	a3,a2,-16
   102dc:	00f67613          	andi	a2,a2,15
   102e0:	00e686b3          	add	a3,a3,a4
   102e4:	00b73023          	sd	a1,0(a4)
   102e8:	00b73423          	sd	a1,8(a4)
   102ec:	01070713          	addi	a4,a4,16
   102f0:	fed76ae3          	bltu	a4,a3,102e4 <memset+0x24>
   102f4:	00061463          	bne	a2,zero,102fc <memset+0x3c>
   102f8:	00008067          	jalr	zero,0(ra)
   102fc:	40c306b3          	sub	a3,t1,a2
   10300:	00269693          	slli	a3,a3,0x2
   10304:	00000297          	auipc	t0,0x0
   10308:	005686b3          	add	a3,a3,t0
   1030c:	00c68067          	jalr	zero,12(a3)
   10310:	00b70723          	sb	a1,14(a4)
   10314:	00b706a3          	sb	a1,13(a4)
   10318:	00b70623          	sb	a1,12(a4)
   1031c:	00b705a3          	sb	a1,11(a4)
   10320:	00b70523          	sb	a1,10(a4)
   10324:	00b704a3          	sb	a1,9(a4)
   10328:	00b70423          	sb	a1,8(a4)
   1032c:	00b703a3          	sb	a1,7(a4)
   10330:	00b70323          	sb	a1,6(a4)
   10334:	00b702a3          	sb	a1,5(a4)
   10338:	00b70223          	sb	a1,4(a4)
   1033c:	00b701a3          	sb	a1,3(a4)
   10340:	00b70123          	sb	a1,2(a4)
   10344:	00b700a3          	sb	a1,1(a4)
   10348:	00b70023          	sb	a1,0(a4)
   1034c:	00008067          	jalr	zero,0(ra)
   10350:	0ff5f593          	andi	a1,a1,255
   10354:	00859693          	slli	a3,a1,0x8
   10358:	00d5e5b3          	or	a1,a1,a3
   1035c:	01059693          	slli	a3,a1,0x10
   10360:	00d5e5b3          	or	a1,a1,a3
   10364:	02059693          	slli	a3,a1,0x20
   10368:	00d5e5b3          	or	a1,a1,a3
   1036c:	f6dff06f          	jal	zero,102d8 <memset+0x18>
   10370:	00279693          	slli	a3,a5,0x2
   10374:	00000297          	auipc	t0,0x0
   10378:	005686b3          	add	a3,a3,t0
   1037c:	00008293          	addi	t0,ra,0
   10380:	f98680e7          	jalr	ra,-104(a3)
   10384:	00028093          	addi	ra,t0,0 # 10374 <memset+0xb4>
   10388:	ff078793          	addi	a5,a5,-16
   1038c:	40f70733          	sub	a4,a4,a5
   10390:	00f60633          	add	a2,a2,a5
   10394:	f6c374e3          	bgeu	t1,a2,102fc <memset+0x3c>
   10398:	f3dff06f          	jal	zero,102d4 <memset+0x14>

000000000001039c <read>:
   1039c:	00050793          	addi	a5,a0,0
   103a0:	7601b503          	ld	a0,1888(gp) # 13610 <_impure_ptr>
   103a4:	00060693          	addi	a3,a2,0
   103a8:	00058613          	addi	a2,a1,0
   103ac:	00078593          	addi	a1,a5,0
   103b0:	21c0006f          	jal	zero,105cc <_read_r>

00000000000103b4 <write>:
   103b4:	00050793          	addi	a5,a0,0
   103b8:	7601b503          	ld	a0,1888(gp) # 13610 <_impure_ptr>
   103bc:	00060693          	addi	a3,a2,0
   103c0:	00058613          	addi	a2,a1,0
   103c4:	00078593          	addi	a1,a5,0
   103c8:	0040006f          	jal	zero,103cc <_write_r>

00000000000103cc <_write_r>:
   103cc:	fe010113          	addi	sp,sp,-32
   103d0:	00058713          	addi	a4,a1,0
   103d4:	00813823          	sd	s0,16(sp)
   103d8:	00913423          	sd	s1,8(sp)
   103dc:	00060593          	addi	a1,a2,0
   103e0:	00050413          	addi	s0,a0,0
   103e4:	00068613          	addi	a2,a3,0
   103e8:	00070513          	addi	a0,a4,0
   103ec:	00113c23          	sd	ra,24(sp)
   103f0:	7601ac23          	sw	zero,1912(gp) # 13628 <errno>
   103f4:	248010ef          	jal	ra,1163c <_write>
   103f8:	fff00793          	addi	a5,zero,-1
   103fc:	00f50c63          	beq	a0,a5,10414 <_write_r+0x48>
   10400:	01813083          	ld	ra,24(sp)
   10404:	01013403          	ld	s0,16(sp)
   10408:	00813483          	ld	s1,8(sp)
   1040c:	02010113          	addi	sp,sp,32
   10410:	00008067          	jalr	zero,0(ra)
   10414:	7781a783          	lw	a5,1912(gp) # 13628 <errno>
   10418:	fe0784e3          	beq	a5,zero,10400 <_write_r+0x34>
   1041c:	01813083          	ld	ra,24(sp)
   10420:	00f42023          	sw	a5,0(s0)
   10424:	01013403          	ld	s0,16(sp)
   10428:	00813483          	ld	s1,8(sp)
   1042c:	02010113          	addi	sp,sp,32
   10430:	00008067          	jalr	zero,0(ra)

0000000000010434 <__call_exitprocs>:
   10434:	fb010113          	addi	sp,sp,-80
   10438:	03413023          	sd	s4,32(sp)
   1043c:	7501ba03          	ld	s4,1872(gp) # 13600 <_global_impure_ptr>
   10440:	03213823          	sd	s2,48(sp)
   10444:	04113423          	sd	ra,72(sp)
   10448:	1f8a3903          	ld	s2,504(s4)
   1044c:	04813023          	sd	s0,64(sp)
   10450:	02913c23          	sd	s1,56(sp)
   10454:	03313423          	sd	s3,40(sp)
   10458:	01513c23          	sd	s5,24(sp)
   1045c:	01613823          	sd	s6,16(sp)
   10460:	01713423          	sd	s7,8(sp)
   10464:	01813023          	sd	s8,0(sp)
   10468:	04090063          	beq	s2,zero,104a8 <__call_exitprocs+0x74>
   1046c:	00050b13          	addi	s6,a0,0
   10470:	00058b93          	addi	s7,a1,0
   10474:	00100a93          	addi	s5,zero,1
   10478:	fff00993          	addi	s3,zero,-1
   1047c:	00892483          	lw	s1,8(s2)
   10480:	fff4841b          	addiw	s0,s1,-1
   10484:	02044263          	blt	s0,zero,104a8 <__call_exitprocs+0x74>
   10488:	00349493          	slli	s1,s1,0x3
   1048c:	009904b3          	add	s1,s2,s1
   10490:	040b8463          	beq	s7,zero,104d8 <__call_exitprocs+0xa4>
   10494:	2084b783          	ld	a5,520(s1)
   10498:	05778063          	beq	a5,s7,104d8 <__call_exitprocs+0xa4>
   1049c:	fff4041b          	addiw	s0,s0,-1
   104a0:	ff848493          	addi	s1,s1,-8
   104a4:	ff3416e3          	bne	s0,s3,10490 <__call_exitprocs+0x5c>
   104a8:	04813083          	ld	ra,72(sp)
   104ac:	04013403          	ld	s0,64(sp)
   104b0:	03813483          	ld	s1,56(sp)
   104b4:	03013903          	ld	s2,48(sp)
   104b8:	02813983          	ld	s3,40(sp)
   104bc:	02013a03          	ld	s4,32(sp)
   104c0:	01813a83          	ld	s5,24(sp)
   104c4:	01013b03          	ld	s6,16(sp)
   104c8:	00813b83          	ld	s7,8(sp)
   104cc:	00013c03          	ld	s8,0(sp)
   104d0:	05010113          	addi	sp,sp,80
   104d4:	00008067          	jalr	zero,0(ra)
   104d8:	00892783          	lw	a5,8(s2)
   104dc:	0084b703          	ld	a4,8(s1)
   104e0:	fff7879b          	addiw	a5,a5,-1
   104e4:	06878263          	beq	a5,s0,10548 <__call_exitprocs+0x114>
   104e8:	0004b423          	sd	zero,8(s1)
   104ec:	fa0708e3          	beq	a4,zero,1049c <__call_exitprocs+0x68>
   104f0:	31092783          	lw	a5,784(s2)
   104f4:	008a96bb          	sllw	a3,s5,s0
   104f8:	00892c03          	lw	s8,8(s2)
   104fc:	00d7f7b3          	and	a5,a5,a3
   10500:	0007879b          	addiw	a5,a5,0
   10504:	02079263          	bne	a5,zero,10528 <__call_exitprocs+0xf4>
   10508:	000700e7          	jalr	ra,0(a4)
   1050c:	00892703          	lw	a4,8(s2)
   10510:	1f8a3783          	ld	a5,504(s4)
   10514:	01871463          	bne	a4,s8,1051c <__call_exitprocs+0xe8>
   10518:	f92782e3          	beq	a5,s2,1049c <__call_exitprocs+0x68>
   1051c:	f80786e3          	beq	a5,zero,104a8 <__call_exitprocs+0x74>
   10520:	00078913          	addi	s2,a5,0
   10524:	f59ff06f          	jal	zero,1047c <__call_exitprocs+0x48>
   10528:	31492783          	lw	a5,788(s2)
   1052c:	1084b583          	ld	a1,264(s1)
   10530:	00d7f7b3          	and	a5,a5,a3
   10534:	0007879b          	addiw	a5,a5,0
   10538:	00079c63          	bne	a5,zero,10550 <__call_exitprocs+0x11c>
   1053c:	000b0513          	addi	a0,s6,0
   10540:	000700e7          	jalr	ra,0(a4)
   10544:	fc9ff06f          	jal	zero,1050c <__call_exitprocs+0xd8>
   10548:	00892423          	sw	s0,8(s2)
   1054c:	fa1ff06f          	jal	zero,104ec <__call_exitprocs+0xb8>
   10550:	00058513          	addi	a0,a1,0
   10554:	000700e7          	jalr	ra,0(a4)
   10558:	fb5ff06f          	jal	zero,1050c <__call_exitprocs+0xd8>

000000000001055c <atexit>:
   1055c:	00050593          	addi	a1,a0,0
   10560:	00000693          	addi	a3,zero,0
   10564:	00000613          	addi	a2,zero,0
   10568:	00000513          	addi	a0,zero,0
   1056c:	2780006f          	jal	zero,107e4 <__register_exitproc>

0000000000010570 <__libc_fini_array>:
   10570:	fe010113          	addi	sp,sp,-32
   10574:	00813823          	sd	s0,16(sp)
   10578:	000127b7          	lui	a5,0x12
   1057c:	00012437          	lui	s0,0x12
   10580:	6a078793          	addi	a5,a5,1696 # 126a0 <__do_global_dtors_aux_fini_array_entry>
   10584:	6a840413          	addi	s0,s0,1704 # 126a8 <impure_data>
   10588:	40f40433          	sub	s0,s0,a5
   1058c:	00913423          	sd	s1,8(sp)
   10590:	00113c23          	sd	ra,24(sp)
   10594:	40345493          	srai	s1,s0,0x3
   10598:	02048063          	beq	s1,zero,105b8 <__libc_fini_array+0x48>
   1059c:	ff840413          	addi	s0,s0,-8
   105a0:	00f40433          	add	s0,s0,a5
   105a4:	00043783          	ld	a5,0(s0)
   105a8:	fff48493          	addi	s1,s1,-1
   105ac:	ff840413          	addi	s0,s0,-8
   105b0:	000780e7          	jalr	ra,0(a5)
   105b4:	fe0498e3          	bne	s1,zero,105a4 <__libc_fini_array+0x34>
   105b8:	01813083          	ld	ra,24(sp)
   105bc:	01013403          	ld	s0,16(sp)
   105c0:	00813483          	ld	s1,8(sp)
   105c4:	02010113          	addi	sp,sp,32
   105c8:	00008067          	jalr	zero,0(ra)

00000000000105cc <_read_r>:
   105cc:	fe010113          	addi	sp,sp,-32
   105d0:	00058713          	addi	a4,a1,0
   105d4:	00813823          	sd	s0,16(sp)
   105d8:	00913423          	sd	s1,8(sp)
   105dc:	00060593          	addi	a1,a2,0
   105e0:	00050413          	addi	s0,a0,0
   105e4:	00068613          	addi	a2,a3,0
   105e8:	00070513          	addi	a0,a4,0
   105ec:	00113c23          	sd	ra,24(sp)
   105f0:	7601ac23          	sw	zero,1912(gp) # 13628 <errno>
   105f4:	78d000ef          	jal	ra,11580 <_read>
   105f8:	fff00793          	addi	a5,zero,-1
   105fc:	00f50c63          	beq	a0,a5,10614 <_read_r+0x48>
   10600:	01813083          	ld	ra,24(sp)
   10604:	01013403          	ld	s0,16(sp)
   10608:	00813483          	ld	s1,8(sp)
   1060c:	02010113          	addi	sp,sp,32
   10610:	00008067          	jalr	zero,0(ra)
   10614:	7781a783          	lw	a5,1912(gp) # 13628 <errno>
   10618:	fe0784e3          	beq	a5,zero,10600 <_read_r+0x34>
   1061c:	01813083          	ld	ra,24(sp)
   10620:	00f42023          	sw	a5,0(s0)
   10624:	01013403          	ld	s0,16(sp)
   10628:	00813483          	ld	s1,8(sp)
   1062c:	02010113          	addi	sp,sp,32
   10630:	00008067          	jalr	zero,0(ra)

0000000000010634 <cleanup_glue>:
   10634:	fd010113          	addi	sp,sp,-48
   10638:	01213823          	sd	s2,16(sp)
   1063c:	0005b903          	ld	s2,0(a1)
   10640:	02813023          	sd	s0,32(sp)
   10644:	00913c23          	sd	s1,24(sp)
   10648:	02113423          	sd	ra,40(sp)
   1064c:	01313423          	sd	s3,8(sp)
   10650:	01413023          	sd	s4,0(sp)
   10654:	00058413          	addi	s0,a1,0
   10658:	00050493          	addi	s1,a0,0
   1065c:	04090263          	beq	s2,zero,106a0 <cleanup_glue+0x6c>
   10660:	00093983          	ld	s3,0(s2)
   10664:	02098863          	beq	s3,zero,10694 <cleanup_glue+0x60>
   10668:	0009ba03          	ld	s4,0(s3)
   1066c:	000a0e63          	beq	s4,zero,10688 <cleanup_glue+0x54>
   10670:	000a3583          	ld	a1,0(s4)
   10674:	00058463          	beq	a1,zero,1067c <cleanup_glue+0x48>
   10678:	fbdff0ef          	jal	ra,10634 <cleanup_glue>
   1067c:	000a0593          	addi	a1,s4,0
   10680:	00048513          	addi	a0,s1,0
   10684:	344000ef          	jal	ra,109c8 <_free_r>
   10688:	00098593          	addi	a1,s3,0
   1068c:	00048513          	addi	a0,s1,0
   10690:	338000ef          	jal	ra,109c8 <_free_r>
   10694:	00090593          	addi	a1,s2,0
   10698:	00048513          	addi	a0,s1,0
   1069c:	32c000ef          	jal	ra,109c8 <_free_r>
   106a0:	00040593          	addi	a1,s0,0
   106a4:	02013403          	ld	s0,32(sp)
   106a8:	02813083          	ld	ra,40(sp)
   106ac:	01013903          	ld	s2,16(sp)
   106b0:	00813983          	ld	s3,8(sp)
   106b4:	00013a03          	ld	s4,0(sp)
   106b8:	00048513          	addi	a0,s1,0
   106bc:	01813483          	ld	s1,24(sp)
   106c0:	03010113          	addi	sp,sp,48
   106c4:	3040006f          	jal	zero,109c8 <_free_r>

00000000000106c8 <_reclaim_reent>:
   106c8:	7601b783          	ld	a5,1888(gp) # 13610 <_impure_ptr>
   106cc:	10a78a63          	beq	a5,a0,107e0 <_reclaim_reent+0x118>
   106d0:	07853583          	ld	a1,120(a0)
   106d4:	fd010113          	addi	sp,sp,-48
   106d8:	00913c23          	sd	s1,24(sp)
   106dc:	02113423          	sd	ra,40(sp)
   106e0:	02813023          	sd	s0,32(sp)
   106e4:	01213823          	sd	s2,16(sp)
   106e8:	01313423          	sd	s3,8(sp)
   106ec:	00050493          	addi	s1,a0,0
   106f0:	04058063          	beq	a1,zero,10730 <_reclaim_reent+0x68>
   106f4:	00000913          	addi	s2,zero,0
   106f8:	20000993          	addi	s3,zero,512
   106fc:	012587b3          	add	a5,a1,s2
   10700:	0007b403          	ld	s0,0(a5)
   10704:	00040e63          	beq	s0,zero,10720 <_reclaim_reent+0x58>
   10708:	00040593          	addi	a1,s0,0
   1070c:	00043403          	ld	s0,0(s0)
   10710:	00048513          	addi	a0,s1,0
   10714:	2b4000ef          	jal	ra,109c8 <_free_r>
   10718:	fe0418e3          	bne	s0,zero,10708 <_reclaim_reent+0x40>
   1071c:	0784b583          	ld	a1,120(s1)
   10720:	00890913          	addi	s2,s2,8
   10724:	fd391ce3          	bne	s2,s3,106fc <_reclaim_reent+0x34>
   10728:	00048513          	addi	a0,s1,0
   1072c:	29c000ef          	jal	ra,109c8 <_free_r>
   10730:	0604b583          	ld	a1,96(s1)
   10734:	00058663          	beq	a1,zero,10740 <_reclaim_reent+0x78>
   10738:	00048513          	addi	a0,s1,0
   1073c:	28c000ef          	jal	ra,109c8 <_free_r>
   10740:	1f84b403          	ld	s0,504(s1)
   10744:	02040063          	beq	s0,zero,10764 <_reclaim_reent+0x9c>
   10748:	20048913          	addi	s2,s1,512
   1074c:	01240c63          	beq	s0,s2,10764 <_reclaim_reent+0x9c>
   10750:	00040593          	addi	a1,s0,0
   10754:	00043403          	ld	s0,0(s0)
   10758:	00048513          	addi	a0,s1,0
   1075c:	26c000ef          	jal	ra,109c8 <_free_r>
   10760:	fe8918e3          	bne	s2,s0,10750 <_reclaim_reent+0x88>
   10764:	0884b583          	ld	a1,136(s1)
   10768:	00058663          	beq	a1,zero,10774 <_reclaim_reent+0xac>
   1076c:	00048513          	addi	a0,s1,0
   10770:	258000ef          	jal	ra,109c8 <_free_r>
   10774:	0504a783          	lw	a5,80(s1)
   10778:	04078663          	beq	a5,zero,107c4 <_reclaim_reent+0xfc>
   1077c:	0584b783          	ld	a5,88(s1)
   10780:	00048513          	addi	a0,s1,0
   10784:	000780e7          	jalr	ra,0(a5)
   10788:	5204b403          	ld	s0,1312(s1)
   1078c:	02040c63          	beq	s0,zero,107c4 <_reclaim_reent+0xfc>
   10790:	00043583          	ld	a1,0(s0)
   10794:	00058663          	beq	a1,zero,107a0 <_reclaim_reent+0xd8>
   10798:	00048513          	addi	a0,s1,0
   1079c:	e99ff0ef          	jal	ra,10634 <cleanup_glue>
   107a0:	00040593          	addi	a1,s0,0
   107a4:	02013403          	ld	s0,32(sp)
   107a8:	02813083          	ld	ra,40(sp)
   107ac:	01013903          	ld	s2,16(sp)
   107b0:	00813983          	ld	s3,8(sp)
   107b4:	00048513          	addi	a0,s1,0
   107b8:	01813483          	ld	s1,24(sp)
   107bc:	03010113          	addi	sp,sp,48
   107c0:	2080006f          	jal	zero,109c8 <_free_r>
   107c4:	02813083          	ld	ra,40(sp)
   107c8:	02013403          	ld	s0,32(sp)
   107cc:	01813483          	ld	s1,24(sp)
   107d0:	01013903          	ld	s2,16(sp)
   107d4:	00813983          	ld	s3,8(sp)
   107d8:	03010113          	addi	sp,sp,48
   107dc:	00008067          	jalr	zero,0(ra)
   107e0:	00008067          	jalr	zero,0(ra)

00000000000107e4 <__register_exitproc>:
   107e4:	7501b703          	ld	a4,1872(gp) # 13600 <_global_impure_ptr>
   107e8:	1f873783          	ld	a5,504(a4)
   107ec:	06078063          	beq	a5,zero,1084c <__register_exitproc+0x68>
   107f0:	0087a703          	lw	a4,8(a5)
   107f4:	01f00813          	addi	a6,zero,31
   107f8:	08e84663          	blt	a6,a4,10884 <__register_exitproc+0xa0>
   107fc:	02050863          	beq	a0,zero,1082c <__register_exitproc+0x48>
   10800:	00371813          	slli	a6,a4,0x3
   10804:	01078833          	add	a6,a5,a6
   10808:	10c83823          	sd	a2,272(a6)
   1080c:	3107a883          	lw	a7,784(a5)
   10810:	00100613          	addi	a2,zero,1
   10814:	00e6163b          	sllw	a2,a2,a4
   10818:	00c8e8b3          	or	a7,a7,a2
   1081c:	3117a823          	sw	a7,784(a5)
   10820:	20d83823          	sd	a3,528(a6)
   10824:	00200693          	addi	a3,zero,2
   10828:	02d50863          	beq	a0,a3,10858 <__register_exitproc+0x74>
   1082c:	00270693          	addi	a3,a4,2
   10830:	00369693          	slli	a3,a3,0x3
   10834:	0017071b          	addiw	a4,a4,1
   10838:	00e7a423          	sw	a4,8(a5)
   1083c:	00d787b3          	add	a5,a5,a3
   10840:	00b7b023          	sd	a1,0(a5)
   10844:	00000513          	addi	a0,zero,0
   10848:	00008067          	jalr	zero,0(ra)
   1084c:	20070793          	addi	a5,a4,512
   10850:	1ef73c23          	sd	a5,504(a4)
   10854:	f9dff06f          	jal	zero,107f0 <__register_exitproc+0xc>
   10858:	3147a683          	lw	a3,788(a5)
   1085c:	00000513          	addi	a0,zero,0
   10860:	00c6e6b3          	or	a3,a3,a2
   10864:	30d7aa23          	sw	a3,788(a5)
   10868:	00270693          	addi	a3,a4,2
   1086c:	00369693          	slli	a3,a3,0x3
   10870:	0017071b          	addiw	a4,a4,1
   10874:	00e7a423          	sw	a4,8(a5)
   10878:	00d787b3          	add	a5,a5,a3
   1087c:	00b7b023          	sd	a1,0(a5)
   10880:	00008067          	jalr	zero,0(ra)
   10884:	fff00513          	addi	a0,zero,-1
   10888:	00008067          	jalr	zero,0(ra)

000000000001088c <_malloc_trim_r>:
   1088c:	fd010113          	addi	sp,sp,-48
   10890:	01313423          	sd	s3,8(sp)
   10894:	000139b7          	lui	s3,0x13
   10898:	02813023          	sd	s0,32(sp)
   1089c:	00913c23          	sd	s1,24(sp)
   108a0:	01213823          	sd	s2,16(sp)
   108a4:	01413023          	sd	s4,0(sp)
   108a8:	02113423          	sd	ra,40(sp)
   108ac:	00058a13          	addi	s4,a1,0
   108b0:	00050913          	addi	s2,a0,0
   108b4:	df098993          	addi	s3,s3,-528 # 12df0 <__malloc_av_>
   108b8:	435000ef          	jal	ra,114ec <__malloc_lock>
   108bc:	0109b703          	ld	a4,16(s3)
   108c0:	000017b7          	lui	a5,0x1
   108c4:	fdf78413          	addi	s0,a5,-33 # fdf <register_fini-0xf0d1>
   108c8:	00873483          	ld	s1,8(a4)
   108cc:	41440433          	sub	s0,s0,s4
   108d0:	ffc4f493          	andi	s1,s1,-4
   108d4:	00940433          	add	s0,s0,s1
   108d8:	00c45413          	srli	s0,s0,0xc
   108dc:	fff40413          	addi	s0,s0,-1
   108e0:	00c41413          	slli	s0,s0,0xc
   108e4:	00f44e63          	blt	s0,a5,10900 <_malloc_trim_r+0x74>
   108e8:	00000593          	addi	a1,zero,0
   108ec:	00090513          	addi	a0,s2,0
   108f0:	405000ef          	jal	ra,114f4 <_sbrk_r>
   108f4:	0109b783          	ld	a5,16(s3)
   108f8:	009787b3          	add	a5,a5,s1
   108fc:	02f50863          	beq	a0,a5,1092c <_malloc_trim_r+0xa0>
   10900:	00090513          	addi	a0,s2,0
   10904:	3ed000ef          	jal	ra,114f0 <__malloc_unlock>
   10908:	02813083          	ld	ra,40(sp)
   1090c:	02013403          	ld	s0,32(sp)
   10910:	01813483          	ld	s1,24(sp)
   10914:	01013903          	ld	s2,16(sp)
   10918:	00813983          	ld	s3,8(sp)
   1091c:	00013a03          	ld	s4,0(sp)
   10920:	00000513          	addi	a0,zero,0
   10924:	03010113          	addi	sp,sp,48
   10928:	00008067          	jalr	zero,0(ra)
   1092c:	408005b3          	sub	a1,zero,s0
   10930:	00090513          	addi	a0,s2,0
   10934:	3c1000ef          	jal	ra,114f4 <_sbrk_r>
   10938:	fff00793          	addi	a5,zero,-1
   1093c:	04f50a63          	beq	a0,a5,10990 <_malloc_trim_r+0x104>
   10940:	000137b7          	lui	a5,0x13
   10944:	68878793          	addi	a5,a5,1672 # 13688 <__malloc_current_mallinfo>
   10948:	0007a703          	lw	a4,0(a5)
   1094c:	0109b683          	ld	a3,16(s3)
   10950:	408484b3          	sub	s1,s1,s0
   10954:	0014e493          	ori	s1,s1,1
   10958:	4087073b          	subw	a4,a4,s0
   1095c:	00090513          	addi	a0,s2,0
   10960:	0096b423          	sd	s1,8(a3)
   10964:	00e7a023          	sw	a4,0(a5)
   10968:	389000ef          	jal	ra,114f0 <__malloc_unlock>
   1096c:	02813083          	ld	ra,40(sp)
   10970:	02013403          	ld	s0,32(sp)
   10974:	01813483          	ld	s1,24(sp)
   10978:	01013903          	ld	s2,16(sp)
   1097c:	00813983          	ld	s3,8(sp)
   10980:	00013a03          	ld	s4,0(sp)
   10984:	00100513          	addi	a0,zero,1
   10988:	03010113          	addi	sp,sp,48
   1098c:	00008067          	jalr	zero,0(ra)
   10990:	00000593          	addi	a1,zero,0
   10994:	00090513          	addi	a0,s2,0
   10998:	35d000ef          	jal	ra,114f4 <_sbrk_r>
   1099c:	0109b703          	ld	a4,16(s3)
   109a0:	01f00693          	addi	a3,zero,31
   109a4:	40e507b3          	sub	a5,a0,a4
   109a8:	f4f6dce3          	bge	a3,a5,10900 <_malloc_trim_r+0x74>
   109ac:	7681b683          	ld	a3,1896(gp) # 13618 <__malloc_sbrk_base>
   109b0:	0017e793          	ori	a5,a5,1
   109b4:	00f73423          	sd	a5,8(a4)
   109b8:	40d50533          	sub	a0,a0,a3
   109bc:	000136b7          	lui	a3,0x13
   109c0:	68a6a423          	sw	a0,1672(a3) # 13688 <__malloc_current_mallinfo>
   109c4:	f3dff06f          	jal	zero,10900 <_malloc_trim_r+0x74>

00000000000109c8 <_free_r>:
   109c8:	12058e63          	beq	a1,zero,10b04 <_free_r+0x13c>
   109cc:	fe010113          	addi	sp,sp,-32
   109d0:	00813823          	sd	s0,16(sp)
   109d4:	00913423          	sd	s1,8(sp)
   109d8:	00058413          	addi	s0,a1,0
   109dc:	00050493          	addi	s1,a0,0
   109e0:	00113c23          	sd	ra,24(sp)
   109e4:	309000ef          	jal	ra,114ec <__malloc_lock>
   109e8:	ff843503          	ld	a0,-8(s0)
   109ec:	ff040713          	addi	a4,s0,-16
   109f0:	000135b7          	lui	a1,0x13
   109f4:	ffe57793          	andi	a5,a0,-2
   109f8:	00f70633          	add	a2,a4,a5
   109fc:	df058593          	addi	a1,a1,-528 # 12df0 <__malloc_av_>
   10a00:	00863683          	ld	a3,8(a2)
   10a04:	0105b803          	ld	a6,16(a1)
   10a08:	ffc6f693          	andi	a3,a3,-4
   10a0c:	1cc80063          	beq	a6,a2,10bcc <_free_r+0x204>
   10a10:	00d63423          	sd	a3,8(a2)
   10a14:	00157513          	andi	a0,a0,1
   10a18:	00d60833          	add	a6,a2,a3
   10a1c:	0a051463          	bne	a0,zero,10ac4 <_free_r+0xfc>
   10a20:	ff043303          	ld	t1,-16(s0)
   10a24:	00883803          	ld	a6,8(a6)
   10a28:	00013537          	lui	a0,0x13
   10a2c:	40670733          	sub	a4,a4,t1
   10a30:	01073883          	ld	a7,16(a4)
   10a34:	e0050513          	addi	a0,a0,-512 # 12e00 <__malloc_av_+0x10>
   10a38:	006787b3          	add	a5,a5,t1
   10a3c:	00187813          	andi	a6,a6,1
   10a40:	14a88663          	beq	a7,a0,10b8c <_free_r+0x1c4>
   10a44:	01873303          	ld	t1,24(a4)
   10a48:	0068bc23          	sd	t1,24(a7)
   10a4c:	01133823          	sd	a7,16(t1) # 10180 <main+0x4>
   10a50:	1e080863          	beq	a6,zero,10c40 <_free_r+0x278>
   10a54:	0017e693          	ori	a3,a5,1
   10a58:	00d73423          	sd	a3,8(a4)
   10a5c:	00f63023          	sd	a5,0(a2)
   10a60:	1ff00693          	addi	a3,zero,511
   10a64:	0af6ec63          	bltu	a3,a5,10b1c <_free_r+0x154>
   10a68:	0037d793          	srli	a5,a5,0x3
   10a6c:	0017869b          	addiw	a3,a5,1
   10a70:	0016969b          	slliw	a3,a3,0x1
   10a74:	00369693          	slli	a3,a3,0x3
   10a78:	0085b803          	ld	a6,8(a1)
   10a7c:	00d586b3          	add	a3,a1,a3
   10a80:	0006b503          	ld	a0,0(a3)
   10a84:	4027d61b          	sraiw	a2,a5,0x2
   10a88:	00100793          	addi	a5,zero,1
   10a8c:	00c797b3          	sll	a5,a5,a2
   10a90:	0107e7b3          	or	a5,a5,a6
   10a94:	ff068613          	addi	a2,a3,-16
   10a98:	00c73c23          	sd	a2,24(a4)
   10a9c:	00a73823          	sd	a0,16(a4)
   10aa0:	00f5b423          	sd	a5,8(a1)
   10aa4:	00e6b023          	sd	a4,0(a3)
   10aa8:	00e53c23          	sd	a4,24(a0)
   10aac:	01013403          	ld	s0,16(sp)
   10ab0:	01813083          	ld	ra,24(sp)
   10ab4:	00048513          	addi	a0,s1,0
   10ab8:	00813483          	ld	s1,8(sp)
   10abc:	02010113          	addi	sp,sp,32
   10ac0:	2310006f          	jal	zero,114f0 <__malloc_unlock>
   10ac4:	00883503          	ld	a0,8(a6)
   10ac8:	00157513          	andi	a0,a0,1
   10acc:	02051e63          	bne	a0,zero,10b08 <_free_r+0x140>
   10ad0:	00013537          	lui	a0,0x13
   10ad4:	00d787b3          	add	a5,a5,a3
   10ad8:	e0050513          	addi	a0,a0,-512 # 12e00 <__malloc_av_+0x10>
   10adc:	01063683          	ld	a3,16(a2)
   10ae0:	0017e893          	ori	a7,a5,1
   10ae4:	00f70833          	add	a6,a4,a5
   10ae8:	16a68a63          	beq	a3,a0,10c5c <_free_r+0x294>
   10aec:	01863603          	ld	a2,24(a2)
   10af0:	00c6bc23          	sd	a2,24(a3)
   10af4:	00d63823          	sd	a3,16(a2)
   10af8:	01173423          	sd	a7,8(a4)
   10afc:	00f83023          	sd	a5,0(a6)
   10b00:	f61ff06f          	jal	zero,10a60 <_free_r+0x98>
   10b04:	00008067          	jalr	zero,0(ra)
   10b08:	0017e693          	ori	a3,a5,1
   10b0c:	fed43c23          	sd	a3,-8(s0)
   10b10:	00f63023          	sd	a5,0(a2)
   10b14:	1ff00693          	addi	a3,zero,511
   10b18:	f4f6f8e3          	bgeu	a3,a5,10a68 <_free_r+0xa0>
   10b1c:	0097d693          	srli	a3,a5,0x9
   10b20:	00400613          	addi	a2,zero,4
   10b24:	0ed66a63          	bltu	a2,a3,10c18 <_free_r+0x250>
   10b28:	0067d693          	srli	a3,a5,0x6
   10b2c:	0396851b          	addiw	a0,a3,57
   10b30:	0015151b          	slliw	a0,a0,0x1
   10b34:	0386861b          	addiw	a2,a3,56
   10b38:	00351513          	slli	a0,a0,0x3
   10b3c:	00a58533          	add	a0,a1,a0
   10b40:	00053683          	ld	a3,0(a0)
   10b44:	ff050513          	addi	a0,a0,-16
   10b48:	12d50863          	beq	a0,a3,10c78 <_free_r+0x2b0>
   10b4c:	0086b603          	ld	a2,8(a3)
   10b50:	ffc67613          	andi	a2,a2,-4
   10b54:	00c7f663          	bgeu	a5,a2,10b60 <_free_r+0x198>
   10b58:	0106b683          	ld	a3,16(a3)
   10b5c:	fed518e3          	bne	a0,a3,10b4c <_free_r+0x184>
   10b60:	0186b503          	ld	a0,24(a3)
   10b64:	00a73c23          	sd	a0,24(a4)
   10b68:	00d73823          	sd	a3,16(a4)
   10b6c:	01013403          	ld	s0,16(sp)
   10b70:	00e53823          	sd	a4,16(a0)
   10b74:	01813083          	ld	ra,24(sp)
   10b78:	00048513          	addi	a0,s1,0
   10b7c:	00813483          	ld	s1,8(sp)
   10b80:	00e6bc23          	sd	a4,24(a3)
   10b84:	02010113          	addi	sp,sp,32
   10b88:	1690006f          	jal	zero,114f0 <__malloc_unlock>
   10b8c:	14081a63          	bne	a6,zero,10ce0 <_free_r+0x318>
   10b90:	01863583          	ld	a1,24(a2)
   10b94:	01063603          	ld	a2,16(a2)
   10b98:	00f686b3          	add	a3,a3,a5
   10b9c:	01013403          	ld	s0,16(sp)
   10ba0:	00b63c23          	sd	a1,24(a2)
   10ba4:	00c5b823          	sd	a2,16(a1)
   10ba8:	0016e793          	ori	a5,a3,1
   10bac:	01813083          	ld	ra,24(sp)
   10bb0:	00f73423          	sd	a5,8(a4)
   10bb4:	00048513          	addi	a0,s1,0
   10bb8:	00d70733          	add	a4,a4,a3
   10bbc:	00813483          	ld	s1,8(sp)
   10bc0:	00d73023          	sd	a3,0(a4)
   10bc4:	02010113          	addi	sp,sp,32
   10bc8:	1290006f          	jal	zero,114f0 <__malloc_unlock>
   10bcc:	00157513          	andi	a0,a0,1
   10bd0:	00d786b3          	add	a3,a5,a3
   10bd4:	02051063          	bne	a0,zero,10bf4 <_free_r+0x22c>
   10bd8:	ff043503          	ld	a0,-16(s0)
   10bdc:	40a70733          	sub	a4,a4,a0
   10be0:	01873783          	ld	a5,24(a4)
   10be4:	01073603          	ld	a2,16(a4)
   10be8:	00a686b3          	add	a3,a3,a0
   10bec:	00f63c23          	sd	a5,24(a2)
   10bf0:	00c7b823          	sd	a2,16(a5)
   10bf4:	0016e613          	ori	a2,a3,1
   10bf8:	7701b783          	ld	a5,1904(gp) # 13620 <__malloc_trim_threshold>
   10bfc:	00c73423          	sd	a2,8(a4)
   10c00:	00e5b823          	sd	a4,16(a1)
   10c04:	eaf6e4e3          	bltu	a3,a5,10aac <_free_r+0xe4>
   10c08:	7901b583          	ld	a1,1936(gp) # 13640 <__malloc_top_pad>
   10c0c:	00048513          	addi	a0,s1,0
   10c10:	c7dff0ef          	jal	ra,1088c <_malloc_trim_r>
   10c14:	e99ff06f          	jal	zero,10aac <_free_r+0xe4>
   10c18:	01400613          	addi	a2,zero,20
   10c1c:	02d67663          	bgeu	a2,a3,10c48 <_free_r+0x280>
   10c20:	05400613          	addi	a2,zero,84
   10c24:	06d66863          	bltu	a2,a3,10c94 <_free_r+0x2cc>
   10c28:	00c7d693          	srli	a3,a5,0xc
   10c2c:	06f6851b          	addiw	a0,a3,111
   10c30:	0015151b          	slliw	a0,a0,0x1
   10c34:	06e6861b          	addiw	a2,a3,110
   10c38:	00351513          	slli	a0,a0,0x3
   10c3c:	f01ff06f          	jal	zero,10b3c <_free_r+0x174>
   10c40:	00d787b3          	add	a5,a5,a3
   10c44:	e99ff06f          	jal	zero,10adc <_free_r+0x114>
   10c48:	05c6851b          	addiw	a0,a3,92
   10c4c:	0015151b          	slliw	a0,a0,0x1
   10c50:	05b6861b          	addiw	a2,a3,91
   10c54:	00351513          	slli	a0,a0,0x3
   10c58:	ee5ff06f          	jal	zero,10b3c <_free_r+0x174>
   10c5c:	02e5b423          	sd	a4,40(a1)
   10c60:	02e5b023          	sd	a4,32(a1)
   10c64:	00a73c23          	sd	a0,24(a4)
   10c68:	00a73823          	sd	a0,16(a4)
   10c6c:	01173423          	sd	a7,8(a4)
   10c70:	00f83023          	sd	a5,0(a6)
   10c74:	e39ff06f          	jal	zero,10aac <_free_r+0xe4>
   10c78:	0085b803          	ld	a6,8(a1)
   10c7c:	4026561b          	sraiw	a2,a2,0x2
   10c80:	00100793          	addi	a5,zero,1
   10c84:	00c797b3          	sll	a5,a5,a2
   10c88:	0107e7b3          	or	a5,a5,a6
   10c8c:	00f5b423          	sd	a5,8(a1)
   10c90:	ed5ff06f          	jal	zero,10b64 <_free_r+0x19c>
   10c94:	15400613          	addi	a2,zero,340
   10c98:	00d66e63          	bltu	a2,a3,10cb4 <_free_r+0x2ec>
   10c9c:	00f7d693          	srli	a3,a5,0xf
   10ca0:	0786851b          	addiw	a0,a3,120
   10ca4:	0015151b          	slliw	a0,a0,0x1
   10ca8:	0776861b          	addiw	a2,a3,119
   10cac:	00351513          	slli	a0,a0,0x3
   10cb0:	e8dff06f          	jal	zero,10b3c <_free_r+0x174>
   10cb4:	55400613          	addi	a2,zero,1364
   10cb8:	00d66e63          	bltu	a2,a3,10cd4 <_free_r+0x30c>
   10cbc:	0127d693          	srli	a3,a5,0x12
   10cc0:	07d6851b          	addiw	a0,a3,125
   10cc4:	0015151b          	slliw	a0,a0,0x1
   10cc8:	07c6861b          	addiw	a2,a3,124
   10ccc:	00351513          	slli	a0,a0,0x3
   10cd0:	e6dff06f          	jal	zero,10b3c <_free_r+0x174>
   10cd4:	7f000513          	addi	a0,zero,2032
   10cd8:	07e00613          	addi	a2,zero,126
   10cdc:	e61ff06f          	jal	zero,10b3c <_free_r+0x174>
   10ce0:	0017e693          	ori	a3,a5,1
   10ce4:	00d73423          	sd	a3,8(a4)
   10ce8:	00f63023          	sd	a5,0(a2)
   10cec:	dc1ff06f          	jal	zero,10aac <_free_r+0xe4>

0000000000010cf0 <_malloc_r>:
   10cf0:	fa010113          	addi	sp,sp,-96
   10cf4:	04913423          	sd	s1,72(sp)
   10cf8:	05213023          	sd	s2,64(sp)
   10cfc:	04113c23          	sd	ra,88(sp)
   10d00:	04813823          	sd	s0,80(sp)
   10d04:	03313c23          	sd	s3,56(sp)
   10d08:	03413823          	sd	s4,48(sp)
   10d0c:	03513423          	sd	s5,40(sp)
   10d10:	03613023          	sd	s6,32(sp)
   10d14:	01713c23          	sd	s7,24(sp)
   10d18:	01813823          	sd	s8,16(sp)
   10d1c:	01913423          	sd	s9,8(sp)
   10d20:	01758493          	addi	s1,a1,23
   10d24:	02e00793          	addi	a5,zero,46
   10d28:	00050913          	addi	s2,a0,0
   10d2c:	0697e663          	bltu	a5,s1,10d98 <_malloc_r+0xa8>
   10d30:	02000793          	addi	a5,zero,32
   10d34:	26b7e063          	bltu	a5,a1,10f94 <_malloc_r+0x2a4>
   10d38:	7b4000ef          	jal	ra,114ec <__malloc_lock>
   10d3c:	02000493          	addi	s1,zero,32
   10d40:	05000793          	addi	a5,zero,80
   10d44:	00400613          	addi	a2,zero,4
   10d48:	000139b7          	lui	s3,0x13
   10d4c:	df098993          	addi	s3,s3,-528 # 12df0 <__malloc_av_>
   10d50:	00f987b3          	add	a5,s3,a5
   10d54:	0087b403          	ld	s0,8(a5)
   10d58:	ff078713          	addi	a4,a5,-16
   10d5c:	26e40c63          	beq	s0,a4,10fd4 <_malloc_r+0x2e4>
   10d60:	00843783          	ld	a5,8(s0)
   10d64:	01843683          	ld	a3,24(s0)
   10d68:	01043603          	ld	a2,16(s0)
   10d6c:	ffc7f793          	andi	a5,a5,-4
   10d70:	00f407b3          	add	a5,s0,a5
   10d74:	0087b703          	ld	a4,8(a5)
   10d78:	00d63c23          	sd	a3,24(a2)
   10d7c:	00c6b823          	sd	a2,16(a3)
   10d80:	00176713          	ori	a4,a4,1
   10d84:	00090513          	addi	a0,s2,0
   10d88:	00e7b423          	sd	a4,8(a5)
   10d8c:	764000ef          	jal	ra,114f0 <__malloc_unlock>
   10d90:	01040513          	addi	a0,s0,16
   10d94:	20c0006f          	jal	zero,10fa0 <_malloc_r+0x2b0>
   10d98:	800007b7          	lui	a5,0x80000
   10d9c:	ff04f493          	andi	s1,s1,-16
   10da0:	fff7c793          	xori	a5,a5,-1
   10da4:	1e97e863          	bltu	a5,s1,10f94 <_malloc_r+0x2a4>
   10da8:	1eb4e663          	bltu	s1,a1,10f94 <_malloc_r+0x2a4>
   10dac:	740000ef          	jal	ra,114ec <__malloc_lock>
   10db0:	1f700793          	addi	a5,zero,503
   10db4:	4e97f063          	bgeu	a5,s1,11294 <_malloc_r+0x5a4>
   10db8:	0094d793          	srli	a5,s1,0x9
   10dbc:	34078663          	beq	a5,zero,11108 <_malloc_r+0x418>
   10dc0:	00400713          	addi	a4,zero,4
   10dc4:	40f76663          	bltu	a4,a5,111d0 <_malloc_r+0x4e0>
   10dc8:	0064d793          	srli	a5,s1,0x6
   10dcc:	0397861b          	addiw	a2,a5,57
   10dd0:	0016169b          	slliw	a3,a2,0x1
   10dd4:	0387851b          	addiw	a0,a5,56
   10dd8:	00369693          	slli	a3,a3,0x3
   10ddc:	000139b7          	lui	s3,0x13
   10de0:	df098993          	addi	s3,s3,-528 # 12df0 <__malloc_av_>
   10de4:	00d986b3          	add	a3,s3,a3
   10de8:	0086b403          	ld	s0,8(a3)
   10dec:	ff068693          	addi	a3,a3,-16
   10df0:	1e868863          	beq	a3,s0,10fe0 <_malloc_r+0x2f0>
   10df4:	01f00593          	addi	a1,zero,31
   10df8:	0100006f          	jal	zero,10e08 <_malloc_r+0x118>
   10dfc:	36075263          	bge	a4,zero,11160 <_malloc_r+0x470>
   10e00:	01843403          	ld	s0,24(s0)
   10e04:	1c868e63          	beq	a3,s0,10fe0 <_malloc_r+0x2f0>
   10e08:	00843783          	ld	a5,8(s0)
   10e0c:	ffc7f793          	andi	a5,a5,-4
   10e10:	40978733          	sub	a4,a5,s1
   10e14:	fee5d4e3          	bge	a1,a4,10dfc <_malloc_r+0x10c>
   10e18:	0209b403          	ld	s0,32(s3)
   10e1c:	00013837          	lui	a6,0x13
   10e20:	e0080813          	addi	a6,a6,-512 # 12e00 <__malloc_av_+0x10>
   10e24:	00050613          	addi	a2,a0,0
   10e28:	1d041463          	bne	s0,a6,10ff0 <_malloc_r+0x300>
   10e2c:	0089b783          	ld	a5,8(s3)
   10e30:	4026571b          	sraiw	a4,a2,0x2
   10e34:	00100593          	addi	a1,zero,1
   10e38:	00e595b3          	sll	a1,a1,a4
   10e3c:	22b7f863          	bgeu	a5,a1,1106c <_malloc_r+0x37c>
   10e40:	0109b403          	ld	s0,16(s3)
   10e44:	00843a83          	ld	s5,8(s0)
   10e48:	ffcafa93          	andi	s5,s5,-4
   10e4c:	009ae863          	bltu	s5,s1,10e5c <_malloc_r+0x16c>
   10e50:	409a87b3          	sub	a5,s5,s1
   10e54:	01f00713          	addi	a4,zero,31
   10e58:	2ef74063          	blt	a4,a5,11138 <_malloc_r+0x448>
   10e5c:	7901ba03          	ld	s4,1936(gp) # 13640 <__malloc_top_pad>
   10e60:	7681b703          	ld	a4,1896(gp) # 13618 <__malloc_sbrk_base>
   10e64:	fff00793          	addi	a5,zero,-1
   10e68:	01540c33          	add	s8,s0,s5
   10e6c:	01448a33          	add	s4,s1,s4
   10e70:	4ef70663          	beq	a4,a5,1135c <_malloc_r+0x66c>
   10e74:	000017b7          	lui	a5,0x1
   10e78:	01f78793          	addi	a5,a5,31 # 101f <register_fini-0xf091>
   10e7c:	00fa0a33          	add	s4,s4,a5
   10e80:	fffff7b7          	lui	a5,0xfffff
   10e84:	00fa7a33          	and	s4,s4,a5
   10e88:	000a0593          	addi	a1,s4,0
   10e8c:	00090513          	addi	a0,s2,0
   10e90:	664000ef          	jal	ra,114f4 <_sbrk_r>
   10e94:	fff00793          	addi	a5,zero,-1
   10e98:	00050b13          	addi	s6,a0,0
   10e9c:	42f50663          	beq	a0,a5,112c8 <_malloc_r+0x5d8>
   10ea0:	43856263          	bltu	a0,s8,112c4 <_malloc_r+0x5d4>
   10ea4:	7d818b93          	addi	s7,gp,2008 # 13688 <__malloc_current_mallinfo>
   10ea8:	000ba703          	lw	a4,0(s7)
   10eac:	014707bb          	addw	a5,a4,s4
   10eb0:	00fba023          	sw	a5,0(s7)
   10eb4:	00078693          	addi	a3,a5,0 # fffffffffffff000 <__BSS_END__+0xfffffffffffeb950>
   10eb8:	54ac0463          	beq	s8,a0,11400 <_malloc_r+0x710>
   10ebc:	7681b703          	ld	a4,1896(gp) # 13618 <__malloc_sbrk_base>
   10ec0:	fff00793          	addi	a5,zero,-1
   10ec4:	54f70c63          	beq	a4,a5,1141c <_malloc_r+0x72c>
   10ec8:	418b07b3          	sub	a5,s6,s8
   10ecc:	00d787bb          	addw	a5,a5,a3
   10ed0:	00fba023          	sw	a5,0(s7)
   10ed4:	00fb7c93          	andi	s9,s6,15
   10ed8:	4a0c8463          	beq	s9,zero,11380 <_malloc_r+0x690>
   10edc:	000017b7          	lui	a5,0x1
   10ee0:	419b0b33          	sub	s6,s6,s9
   10ee4:	01078c13          	addi	s8,a5,16 # 1010 <register_fini-0xf0a0>
   10ee8:	010b0b13          	addi	s6,s6,16
   10eec:	419c0c33          	sub	s8,s8,s9
   10ef0:	014b0a33          	add	s4,s6,s4
   10ef4:	fff78793          	addi	a5,a5,-1
   10ef8:	414c0c33          	sub	s8,s8,s4
   10efc:	00fc7c33          	and	s8,s8,a5
   10f00:	000c0593          	addi	a1,s8,0
   10f04:	00090513          	addi	a0,s2,0
   10f08:	5ec000ef          	jal	ra,114f4 <_sbrk_r>
   10f0c:	fff00793          	addi	a5,zero,-1
   10f10:	56f50463          	beq	a0,a5,11478 <_malloc_r+0x788>
   10f14:	41650533          	sub	a0,a0,s6
   10f18:	000c071b          	addiw	a4,s8,0
   10f1c:	01850a33          	add	s4,a0,s8
   10f20:	000ba783          	lw	a5,0(s7)
   10f24:	0169b823          	sd	s6,16(s3)
   10f28:	001a6a13          	ori	s4,s4,1
   10f2c:	00e787bb          	addw	a5,a5,a4
   10f30:	00fba023          	sw	a5,0(s7)
   10f34:	014b3423          	sd	s4,8(s6)
   10f38:	4f340663          	beq	s0,s3,11424 <_malloc_r+0x734>
   10f3c:	01f00613          	addi	a2,zero,31
   10f40:	4f567663          	bgeu	a2,s5,1142c <_malloc_r+0x73c>
   10f44:	00843683          	ld	a3,8(s0)
   10f48:	fe8a8713          	addi	a4,s5,-24
   10f4c:	ff077713          	andi	a4,a4,-16
   10f50:	0016f693          	andi	a3,a3,1
   10f54:	00e6e6b3          	or	a3,a3,a4
   10f58:	00d43423          	sd	a3,8(s0)
   10f5c:	00900593          	addi	a1,zero,9
   10f60:	00e406b3          	add	a3,s0,a4
   10f64:	00b6b423          	sd	a1,8(a3)
   10f68:	00b6b823          	sd	a1,16(a3)
   10f6c:	52e66063          	bltu	a2,a4,1148c <_malloc_r+0x79c>
   10f70:	008b3a03          	ld	s4,8(s6)
   10f74:	000b0413          	addi	s0,s6,0
   10f78:	7881b683          	ld	a3,1928(gp) # 13638 <__malloc_max_sbrked_mem>
   10f7c:	00f6f463          	bgeu	a3,a5,10f84 <_malloc_r+0x294>
   10f80:	78f1b423          	sd	a5,1928(gp) # 13638 <__malloc_max_sbrked_mem>
   10f84:	7801b683          	ld	a3,1920(gp) # 13630 <__malloc_max_total_mem>
   10f88:	34f6f463          	bgeu	a3,a5,112d0 <_malloc_r+0x5e0>
   10f8c:	78f1b023          	sd	a5,1920(gp) # 13630 <__malloc_max_total_mem>
   10f90:	3400006f          	jal	zero,112d0 <_malloc_r+0x5e0>
   10f94:	00c00793          	addi	a5,zero,12
   10f98:	00f92023          	sw	a5,0(s2)
   10f9c:	00000513          	addi	a0,zero,0
   10fa0:	05813083          	ld	ra,88(sp)
   10fa4:	05013403          	ld	s0,80(sp)
   10fa8:	04813483          	ld	s1,72(sp)
   10fac:	04013903          	ld	s2,64(sp)
   10fb0:	03813983          	ld	s3,56(sp)
   10fb4:	03013a03          	ld	s4,48(sp)
   10fb8:	02813a83          	ld	s5,40(sp)
   10fbc:	02013b03          	ld	s6,32(sp)
   10fc0:	01813b83          	ld	s7,24(sp)
   10fc4:	01013c03          	ld	s8,16(sp)
   10fc8:	00813c83          	ld	s9,8(sp)
   10fcc:	06010113          	addi	sp,sp,96
   10fd0:	00008067          	jalr	zero,0(ra)
   10fd4:	0187b403          	ld	s0,24(a5)
   10fd8:	0026061b          	addiw	a2,a2,2
   10fdc:	d88792e3          	bne	a5,s0,10d60 <_malloc_r+0x70>
   10fe0:	0209b403          	ld	s0,32(s3)
   10fe4:	00013837          	lui	a6,0x13
   10fe8:	e0080813          	addi	a6,a6,-512 # 12e00 <__malloc_av_+0x10>
   10fec:	e50400e3          	beq	s0,a6,10e2c <_malloc_r+0x13c>
   10ff0:	00843783          	ld	a5,8(s0)
   10ff4:	01f00693          	addi	a3,zero,31
   10ff8:	ffc7f793          	andi	a5,a5,-4
   10ffc:	40978733          	sub	a4,a5,s1
   11000:	24e6cc63          	blt	a3,a4,11258 <_malloc_r+0x568>
   11004:	0309b423          	sd	a6,40(s3)
   11008:	0309b023          	sd	a6,32(s3)
   1100c:	10075663          	bge	a4,zero,11118 <_malloc_r+0x428>
   11010:	1ff00713          	addi	a4,zero,511
   11014:	14f76c63          	bltu	a4,a5,1116c <_malloc_r+0x47c>
   11018:	0037d793          	srli	a5,a5,0x3
   1101c:	0017871b          	addiw	a4,a5,1
   11020:	0017171b          	slliw	a4,a4,0x1
   11024:	00371713          	slli	a4,a4,0x3
   11028:	0089b503          	ld	a0,8(s3)
   1102c:	00e98733          	add	a4,s3,a4
   11030:	00073583          	ld	a1,0(a4)
   11034:	4027d69b          	sraiw	a3,a5,0x2
   11038:	00100793          	addi	a5,zero,1
   1103c:	00d797b3          	sll	a5,a5,a3
   11040:	00a7e7b3          	or	a5,a5,a0
   11044:	ff070693          	addi	a3,a4,-16
   11048:	00d43c23          	sd	a3,24(s0)
   1104c:	00b43823          	sd	a1,16(s0)
   11050:	00f9b423          	sd	a5,8(s3)
   11054:	00873023          	sd	s0,0(a4)
   11058:	0085bc23          	sd	s0,24(a1)
   1105c:	4026571b          	sraiw	a4,a2,0x2
   11060:	00100593          	addi	a1,zero,1
   11064:	00e595b3          	sll	a1,a1,a4
   11068:	dcb7ece3          	bltu	a5,a1,10e40 <_malloc_r+0x150>
   1106c:	00f5f733          	and	a4,a1,a5
   11070:	02071463          	bne	a4,zero,11098 <_malloc_r+0x3a8>
   11074:	00159593          	slli	a1,a1,0x1
   11078:	ffc67613          	andi	a2,a2,-4
   1107c:	00f5f733          	and	a4,a1,a5
   11080:	0046061b          	addiw	a2,a2,4
   11084:	00071a63          	bne	a4,zero,11098 <_malloc_r+0x3a8>
   11088:	00159593          	slli	a1,a1,0x1
   1108c:	00f5f733          	and	a4,a1,a5
   11090:	0046061b          	addiw	a2,a2,4
   11094:	fe070ae3          	beq	a4,zero,11088 <_malloc_r+0x398>
   11098:	01f00893          	addi	a7,zero,31
   1109c:	0016031b          	addiw	t1,a2,1
   110a0:	0013131b          	slliw	t1,t1,0x1
   110a4:	00331313          	slli	t1,t1,0x3
   110a8:	ff030313          	addi	t1,t1,-16
   110ac:	00698333          	add	t1,s3,t1
   110b0:	00030513          	addi	a0,t1,0
   110b4:	01853783          	ld	a5,24(a0)
   110b8:	00060e13          	addi	t3,a2,0
   110bc:	12f50e63          	beq	a0,a5,111f8 <_malloc_r+0x508>
   110c0:	0087b703          	ld	a4,8(a5)
   110c4:	00078413          	addi	s0,a5,0
   110c8:	0187b783          	ld	a5,24(a5)
   110cc:	ffc77713          	andi	a4,a4,-4
   110d0:	409706b3          	sub	a3,a4,s1
   110d4:	12d8ce63          	blt	a7,a3,11210 <_malloc_r+0x520>
   110d8:	fe06c2e3          	blt	a3,zero,110bc <_malloc_r+0x3cc>
   110dc:	00e40733          	add	a4,s0,a4
   110e0:	00873683          	ld	a3,8(a4)
   110e4:	01043603          	ld	a2,16(s0)
   110e8:	00090513          	addi	a0,s2,0
   110ec:	0016e693          	ori	a3,a3,1
   110f0:	00d73423          	sd	a3,8(a4)
   110f4:	00f63c23          	sd	a5,24(a2)
   110f8:	00c7b823          	sd	a2,16(a5)
   110fc:	3f4000ef          	jal	ra,114f0 <__malloc_unlock>
   11100:	01040513          	addi	a0,s0,16
   11104:	e9dff06f          	jal	zero,10fa0 <_malloc_r+0x2b0>
   11108:	40000693          	addi	a3,zero,1024
   1110c:	04000613          	addi	a2,zero,64
   11110:	03f00513          	addi	a0,zero,63
   11114:	cc9ff06f          	jal	zero,10ddc <_malloc_r+0xec>
   11118:	00f407b3          	add	a5,s0,a5
   1111c:	0087b703          	ld	a4,8(a5)
   11120:	00090513          	addi	a0,s2,0
   11124:	00176713          	ori	a4,a4,1
   11128:	00e7b423          	sd	a4,8(a5)
   1112c:	3c4000ef          	jal	ra,114f0 <__malloc_unlock>
   11130:	01040513          	addi	a0,s0,16
   11134:	e6dff06f          	jal	zero,10fa0 <_malloc_r+0x2b0>
   11138:	0014e713          	ori	a4,s1,1
   1113c:	00e43423          	sd	a4,8(s0)
   11140:	009404b3          	add	s1,s0,s1
   11144:	0099b823          	sd	s1,16(s3)
   11148:	0017e793          	ori	a5,a5,1
   1114c:	00090513          	addi	a0,s2,0
   11150:	00f4b423          	sd	a5,8(s1)
   11154:	39c000ef          	jal	ra,114f0 <__malloc_unlock>
   11158:	01040513          	addi	a0,s0,16
   1115c:	e45ff06f          	jal	zero,10fa0 <_malloc_r+0x2b0>
   11160:	01843683          	ld	a3,24(s0)
   11164:	01043603          	ld	a2,16(s0)
   11168:	c09ff06f          	jal	zero,10d70 <_malloc_r+0x80>
   1116c:	0097d713          	srli	a4,a5,0x9
   11170:	00400693          	addi	a3,zero,4
   11174:	12e6fc63          	bgeu	a3,a4,112ac <_malloc_r+0x5bc>
   11178:	01400693          	addi	a3,zero,20
   1117c:	22e6e863          	bltu	a3,a4,113ac <_malloc_r+0x6bc>
   11180:	05c7059b          	addiw	a1,a4,92
   11184:	0015959b          	slliw	a1,a1,0x1
   11188:	05b7069b          	addiw	a3,a4,91
   1118c:	00359593          	slli	a1,a1,0x3
   11190:	00b985b3          	add	a1,s3,a1
   11194:	0005b703          	ld	a4,0(a1)
   11198:	ff058593          	addi	a1,a1,-16
   1119c:	1ce58463          	beq	a1,a4,11364 <_malloc_r+0x674>
   111a0:	00873683          	ld	a3,8(a4)
   111a4:	ffc6f693          	andi	a3,a3,-4
   111a8:	00d7f663          	bgeu	a5,a3,111b4 <_malloc_r+0x4c4>
   111ac:	01073703          	ld	a4,16(a4)
   111b0:	fee598e3          	bne	a1,a4,111a0 <_malloc_r+0x4b0>
   111b4:	01873583          	ld	a1,24(a4)
   111b8:	0089b783          	ld	a5,8(s3)
   111bc:	00b43c23          	sd	a1,24(s0)
   111c0:	00e43823          	sd	a4,16(s0)
   111c4:	0085b823          	sd	s0,16(a1)
   111c8:	00873c23          	sd	s0,24(a4)
   111cc:	e91ff06f          	jal	zero,1105c <_malloc_r+0x36c>
   111d0:	01400713          	addi	a4,zero,20
   111d4:	12f77063          	bgeu	a4,a5,112f4 <_malloc_r+0x604>
   111d8:	05400713          	addi	a4,zero,84
   111dc:	1ef76863          	bltu	a4,a5,113cc <_malloc_r+0x6dc>
   111e0:	00c4d793          	srli	a5,s1,0xc
   111e4:	06f7861b          	addiw	a2,a5,111
   111e8:	0016169b          	slliw	a3,a2,0x1
   111ec:	06e7851b          	addiw	a0,a5,110
   111f0:	00369693          	slli	a3,a3,0x3
   111f4:	be9ff06f          	jal	zero,10ddc <_malloc_r+0xec>
   111f8:	001e0e1b          	addiw	t3,t3,1
   111fc:	003e7793          	andi	a5,t3,3
   11200:	01050513          	addi	a0,a0,16
   11204:	10078863          	beq	a5,zero,11314 <_malloc_r+0x624>
   11208:	01853783          	ld	a5,24(a0)
   1120c:	eb1ff06f          	jal	zero,110bc <_malloc_r+0x3cc>
   11210:	01043603          	ld	a2,16(s0)
   11214:	0014e593          	ori	a1,s1,1
   11218:	00b43423          	sd	a1,8(s0)
   1121c:	00f63c23          	sd	a5,24(a2)
   11220:	00c7b823          	sd	a2,16(a5)
   11224:	009404b3          	add	s1,s0,s1
   11228:	0299b423          	sd	s1,40(s3)
   1122c:	0299b023          	sd	s1,32(s3)
   11230:	0016e793          	ori	a5,a3,1
   11234:	0104bc23          	sd	a6,24(s1)
   11238:	0104b823          	sd	a6,16(s1)
   1123c:	00f4b423          	sd	a5,8(s1)
   11240:	00e40733          	add	a4,s0,a4
   11244:	00090513          	addi	a0,s2,0
   11248:	00d73023          	sd	a3,0(a4)
   1124c:	2a4000ef          	jal	ra,114f0 <__malloc_unlock>
   11250:	01040513          	addi	a0,s0,16
   11254:	d4dff06f          	jal	zero,10fa0 <_malloc_r+0x2b0>
   11258:	0014e693          	ori	a3,s1,1
   1125c:	00d43423          	sd	a3,8(s0)
   11260:	009404b3          	add	s1,s0,s1
   11264:	0299b423          	sd	s1,40(s3)
   11268:	0299b023          	sd	s1,32(s3)
   1126c:	00176693          	ori	a3,a4,1
   11270:	0104bc23          	sd	a6,24(s1)
   11274:	0104b823          	sd	a6,16(s1)
   11278:	00d4b423          	sd	a3,8(s1)
   1127c:	00f407b3          	add	a5,s0,a5
   11280:	00090513          	addi	a0,s2,0
   11284:	00e7b023          	sd	a4,0(a5)
   11288:	268000ef          	jal	ra,114f0 <__malloc_unlock>
   1128c:	01040513          	addi	a0,s0,16
   11290:	d11ff06f          	jal	zero,10fa0 <_malloc_r+0x2b0>
   11294:	0034d613          	srli	a2,s1,0x3
   11298:	0016079b          	addiw	a5,a2,1
   1129c:	0017979b          	slliw	a5,a5,0x1
   112a0:	0006061b          	addiw	a2,a2,0
   112a4:	00379793          	slli	a5,a5,0x3
   112a8:	aa1ff06f          	jal	zero,10d48 <_malloc_r+0x58>
   112ac:	0067d713          	srli	a4,a5,0x6
   112b0:	0397059b          	addiw	a1,a4,57
   112b4:	0015959b          	slliw	a1,a1,0x1
   112b8:	0387069b          	addiw	a3,a4,56
   112bc:	00359593          	slli	a1,a1,0x3
   112c0:	ed1ff06f          	jal	zero,11190 <_malloc_r+0x4a0>
   112c4:	13340463          	beq	s0,s3,113ec <_malloc_r+0x6fc>
   112c8:	0109b403          	ld	s0,16(s3)
   112cc:	00843a03          	ld	s4,8(s0)
   112d0:	ffca7a13          	andi	s4,s4,-4
   112d4:	409a07b3          	sub	a5,s4,s1
   112d8:	009a6663          	bltu	s4,s1,112e4 <_malloc_r+0x5f4>
   112dc:	01f00713          	addi	a4,zero,31
   112e0:	e4f74ce3          	blt	a4,a5,11138 <_malloc_r+0x448>
   112e4:	00090513          	addi	a0,s2,0
   112e8:	208000ef          	jal	ra,114f0 <__malloc_unlock>
   112ec:	00000513          	addi	a0,zero,0
   112f0:	cb1ff06f          	jal	zero,10fa0 <_malloc_r+0x2b0>
   112f4:	05c7861b          	addiw	a2,a5,92
   112f8:	0016169b          	slliw	a3,a2,0x1
   112fc:	05b7851b          	addiw	a0,a5,91
   11300:	00369693          	slli	a3,a3,0x3
   11304:	ad9ff06f          	jal	zero,10ddc <_malloc_r+0xec>
   11308:	01033783          	ld	a5,16(t1)
   1130c:	fff6061b          	addiw	a2,a2,-1
   11310:	1c679a63          	bne	a5,t1,114e4 <_malloc_r+0x7f4>
   11314:	00367793          	andi	a5,a2,3
   11318:	ff030313          	addi	t1,t1,-16
   1131c:	fe0796e3          	bne	a5,zero,11308 <_malloc_r+0x618>
   11320:	0089b703          	ld	a4,8(s3)
   11324:	fff5c793          	xori	a5,a1,-1
   11328:	00e7f7b3          	and	a5,a5,a4
   1132c:	00f9b423          	sd	a5,8(s3)
   11330:	00159593          	slli	a1,a1,0x1
   11334:	b0b7e6e3          	bltu	a5,a1,10e40 <_malloc_r+0x150>
   11338:	b00584e3          	beq	a1,zero,10e40 <_malloc_r+0x150>
   1133c:	00f5f733          	and	a4,a1,a5
   11340:	00071a63          	bne	a4,zero,11354 <_malloc_r+0x664>
   11344:	00159593          	slli	a1,a1,0x1
   11348:	00f5f733          	and	a4,a1,a5
   1134c:	004e0e1b          	addiw	t3,t3,4
   11350:	fe070ae3          	beq	a4,zero,11344 <_malloc_r+0x654>
   11354:	000e0613          	addi	a2,t3,0
   11358:	d45ff06f          	jal	zero,1109c <_malloc_r+0x3ac>
   1135c:	020a0a13          	addi	s4,s4,32
   11360:	b29ff06f          	jal	zero,10e88 <_malloc_r+0x198>
   11364:	0089b503          	ld	a0,8(s3)
   11368:	4026d69b          	sraiw	a3,a3,0x2
   1136c:	00100793          	addi	a5,zero,1
   11370:	00d797b3          	sll	a5,a5,a3
   11374:	00a7e7b3          	or	a5,a5,a0
   11378:	00f9b423          	sd	a5,8(s3)
   1137c:	e41ff06f          	jal	zero,111bc <_malloc_r+0x4cc>
   11380:	014b0c33          	add	s8,s6,s4
   11384:	41800c33          	sub	s8,zero,s8
   11388:	034c1c13          	slli	s8,s8,0x34
   1138c:	034c5c13          	srli	s8,s8,0x34
   11390:	000c0593          	addi	a1,s8,0
   11394:	00090513          	addi	a0,s2,0
   11398:	15c000ef          	jal	ra,114f4 <_sbrk_r>
   1139c:	fff00793          	addi	a5,zero,-1
   113a0:	00000713          	addi	a4,zero,0
   113a4:	b6f518e3          	bne	a0,a5,10f14 <_malloc_r+0x224>
   113a8:	b79ff06f          	jal	zero,10f20 <_malloc_r+0x230>
   113ac:	05400693          	addi	a3,zero,84
   113b0:	08e6e463          	bltu	a3,a4,11438 <_malloc_r+0x748>
   113b4:	00c7d713          	srli	a4,a5,0xc
   113b8:	06f7059b          	addiw	a1,a4,111
   113bc:	0015959b          	slliw	a1,a1,0x1
   113c0:	06e7069b          	addiw	a3,a4,110
   113c4:	00359593          	slli	a1,a1,0x3
   113c8:	dc9ff06f          	jal	zero,11190 <_malloc_r+0x4a0>
   113cc:	15400713          	addi	a4,zero,340
   113d0:	08f76463          	bltu	a4,a5,11458 <_malloc_r+0x768>
   113d4:	00f4d793          	srli	a5,s1,0xf
   113d8:	0787861b          	addiw	a2,a5,120
   113dc:	0016169b          	slliw	a3,a2,0x1
   113e0:	0777851b          	addiw	a0,a5,119
   113e4:	00369693          	slli	a3,a3,0x3
   113e8:	9f5ff06f          	jal	zero,10ddc <_malloc_r+0xec>
   113ec:	7d818b93          	addi	s7,gp,2008 # 13688 <__malloc_current_mallinfo>
   113f0:	000ba783          	lw	a5,0(s7)
   113f4:	014786bb          	addw	a3,a5,s4
   113f8:	00dba023          	sw	a3,0(s7)
   113fc:	ac1ff06f          	jal	zero,10ebc <_malloc_r+0x1cc>
   11400:	034c1713          	slli	a4,s8,0x34
   11404:	aa071ce3          	bne	a4,zero,10ebc <_malloc_r+0x1cc>
   11408:	0109b403          	ld	s0,16(s3)
   1140c:	014a8a33          	add	s4,s5,s4
   11410:	001a6a13          	ori	s4,s4,1
   11414:	01443423          	sd	s4,8(s0)
   11418:	b61ff06f          	jal	zero,10f78 <_malloc_r+0x288>
   1141c:	7761b423          	sd	s6,1896(gp) # 13618 <__malloc_sbrk_base>
   11420:	ab5ff06f          	jal	zero,10ed4 <_malloc_r+0x1e4>
   11424:	000b0413          	addi	s0,s6,0
   11428:	b51ff06f          	jal	zero,10f78 <_malloc_r+0x288>
   1142c:	00100793          	addi	a5,zero,1
   11430:	00fb3423          	sd	a5,8(s6)
   11434:	eb1ff06f          	jal	zero,112e4 <_malloc_r+0x5f4>
   11438:	15400693          	addi	a3,zero,340
   1143c:	06e6e663          	bltu	a3,a4,114a8 <_malloc_r+0x7b8>
   11440:	00f7d713          	srli	a4,a5,0xf
   11444:	0787059b          	addiw	a1,a4,120
   11448:	0015959b          	slliw	a1,a1,0x1
   1144c:	0777069b          	addiw	a3,a4,119
   11450:	00359593          	slli	a1,a1,0x3
   11454:	d3dff06f          	jal	zero,11190 <_malloc_r+0x4a0>
   11458:	55400713          	addi	a4,zero,1364
   1145c:	06f76663          	bltu	a4,a5,114c8 <_malloc_r+0x7d8>
   11460:	0124d793          	srli	a5,s1,0x12
   11464:	07d7861b          	addiw	a2,a5,125
   11468:	0016169b          	slliw	a3,a2,0x1
   1146c:	07c7851b          	addiw	a0,a5,124
   11470:	00369693          	slli	a3,a3,0x3
   11474:	969ff06f          	jal	zero,10ddc <_malloc_r+0xec>
   11478:	ff0c8c93          	addi	s9,s9,-16
   1147c:	019a0a33          	add	s4,s4,s9
   11480:	416a0a33          	sub	s4,s4,s6
   11484:	00000713          	addi	a4,zero,0
   11488:	a99ff06f          	jal	zero,10f20 <_malloc_r+0x230>
   1148c:	01040593          	addi	a1,s0,16
   11490:	00090513          	addi	a0,s2,0
   11494:	d34ff0ef          	jal	ra,109c8 <_free_r>
   11498:	0109b403          	ld	s0,16(s3)
   1149c:	000ba783          	lw	a5,0(s7)
   114a0:	00843a03          	ld	s4,8(s0)
   114a4:	ad5ff06f          	jal	zero,10f78 <_malloc_r+0x288>
   114a8:	55400693          	addi	a3,zero,1364
   114ac:	02e6e663          	bltu	a3,a4,114d8 <_malloc_r+0x7e8>
   114b0:	0127d713          	srli	a4,a5,0x12
   114b4:	07d7059b          	addiw	a1,a4,125
   114b8:	0015959b          	slliw	a1,a1,0x1
   114bc:	07c7069b          	addiw	a3,a4,124
   114c0:	00359593          	slli	a1,a1,0x3
   114c4:	ccdff06f          	jal	zero,11190 <_malloc_r+0x4a0>
   114c8:	7f000693          	addi	a3,zero,2032
   114cc:	07f00613          	addi	a2,zero,127
   114d0:	07e00513          	addi	a0,zero,126
   114d4:	909ff06f          	jal	zero,10ddc <_malloc_r+0xec>
   114d8:	7f000593          	addi	a1,zero,2032
   114dc:	07e00693          	addi	a3,zero,126
   114e0:	cb1ff06f          	jal	zero,11190 <_malloc_r+0x4a0>
   114e4:	0089b783          	ld	a5,8(s3)
   114e8:	e49ff06f          	jal	zero,11330 <_malloc_r+0x640>

00000000000114ec <__malloc_lock>:
   114ec:	00008067          	jalr	zero,0(ra)

00000000000114f0 <__malloc_unlock>:
   114f0:	00008067          	jalr	zero,0(ra)

00000000000114f4 <_sbrk_r>:
   114f4:	fe010113          	addi	sp,sp,-32
   114f8:	00813823          	sd	s0,16(sp)
   114fc:	00913423          	sd	s1,8(sp)
   11500:	00050413          	addi	s0,a0,0
   11504:	00058513          	addi	a0,a1,0
   11508:	00113c23          	sd	ra,24(sp)
   1150c:	7601ac23          	sw	zero,1912(gp) # 13628 <errno>
   11510:	0b4000ef          	jal	ra,115c4 <_sbrk>
   11514:	fff00793          	addi	a5,zero,-1
   11518:	00f50c63          	beq	a0,a5,11530 <_sbrk_r+0x3c>
   1151c:	01813083          	ld	ra,24(sp)
   11520:	01013403          	ld	s0,16(sp)
   11524:	00813483          	ld	s1,8(sp)
   11528:	02010113          	addi	sp,sp,32
   1152c:	00008067          	jalr	zero,0(ra)
   11530:	7781a783          	lw	a5,1912(gp) # 13628 <errno>
   11534:	fe0784e3          	beq	a5,zero,1151c <_sbrk_r+0x28>
   11538:	01813083          	ld	ra,24(sp)
   1153c:	00f42023          	sw	a5,0(s0)
   11540:	01013403          	ld	s0,16(sp)
   11544:	00813483          	ld	s1,8(sp)
   11548:	02010113          	addi	sp,sp,32
   1154c:	00008067          	jalr	zero,0(ra)

0000000000011550 <_exit>:
   11550:	05d00893          	addi	a7,zero,93
   11554:	00000073          	ecall
   11558:	00054463          	blt	a0,zero,11560 <_exit+0x10>
   1155c:	0000006f          	jal	zero,1155c <_exit+0xc>
   11560:	ff010113          	addi	sp,sp,-16
   11564:	00813023          	sd	s0,0(sp)
   11568:	00050413          	addi	s0,a0,0
   1156c:	00113423          	sd	ra,8(sp)
   11570:	4080043b          	subw	s0,zero,s0
   11574:	10c000ef          	jal	ra,11680 <__errno>
   11578:	00852023          	sw	s0,0(a0)
   1157c:	0000006f          	jal	zero,1157c <_exit+0x2c>

0000000000011580 <_read>:
   11580:	ff010113          	addi	sp,sp,-16
   11584:	00113423          	sd	ra,8(sp)
   11588:	00813023          	sd	s0,0(sp)
   1158c:	03f00893          	addi	a7,zero,63
   11590:	00000073          	ecall
   11594:	00050413          	addi	s0,a0,0
   11598:	00054c63          	blt	a0,zero,115b0 <_read+0x30>
   1159c:	00813083          	ld	ra,8(sp)
   115a0:	00040513          	addi	a0,s0,0
   115a4:	00013403          	ld	s0,0(sp)
   115a8:	01010113          	addi	sp,sp,16
   115ac:	00008067          	jalr	zero,0(ra)
   115b0:	4080043b          	subw	s0,zero,s0
   115b4:	0cc000ef          	jal	ra,11680 <__errno>
   115b8:	00852023          	sw	s0,0(a0)
   115bc:	fff00413          	addi	s0,zero,-1
   115c0:	fddff06f          	jal	zero,1159c <_read+0x1c>

00000000000115c4 <_sbrk>:
   115c4:	7981b703          	ld	a4,1944(gp) # 13648 <heap_end.0>
   115c8:	ff010113          	addi	sp,sp,-16
   115cc:	00113423          	sd	ra,8(sp)
   115d0:	00050793          	addi	a5,a0,0
   115d4:	02071063          	bne	a4,zero,115f4 <_sbrk+0x30>
   115d8:	0d600893          	addi	a7,zero,214
   115dc:	00000513          	addi	a0,zero,0
   115e0:	00000073          	ecall
   115e4:	fff00613          	addi	a2,zero,-1
   115e8:	00050713          	addi	a4,a0,0
   115ec:	02c50a63          	beq	a0,a2,11620 <_sbrk+0x5c>
   115f0:	78a1bc23          	sd	a0,1944(gp) # 13648 <heap_end.0>
   115f4:	0d600893          	addi	a7,zero,214
   115f8:	00e78533          	add	a0,a5,a4
   115fc:	00000073          	ecall
   11600:	7981b703          	ld	a4,1944(gp) # 13648 <heap_end.0>
   11604:	00e787b3          	add	a5,a5,a4
   11608:	00f51c63          	bne	a0,a5,11620 <_sbrk+0x5c>
   1160c:	00813083          	ld	ra,8(sp)
   11610:	78a1bc23          	sd	a0,1944(gp) # 13648 <heap_end.0>
   11614:	00070513          	addi	a0,a4,0
   11618:	01010113          	addi	sp,sp,16
   1161c:	00008067          	jalr	zero,0(ra)
   11620:	060000ef          	jal	ra,11680 <__errno>
   11624:	00813083          	ld	ra,8(sp)
   11628:	00c00793          	addi	a5,zero,12
   1162c:	00f52023          	sw	a5,0(a0)
   11630:	fff00513          	addi	a0,zero,-1
   11634:	01010113          	addi	sp,sp,16
   11638:	00008067          	jalr	zero,0(ra)

000000000001163c <_write>:
   1163c:	ff010113          	addi	sp,sp,-16
   11640:	00113423          	sd	ra,8(sp)
   11644:	00813023          	sd	s0,0(sp)
   11648:	04000893          	addi	a7,zero,64
   1164c:	00000073          	ecall
   11650:	00050413          	addi	s0,a0,0
   11654:	00054c63          	blt	a0,zero,1166c <_write+0x30>
   11658:	00813083          	ld	ra,8(sp)
   1165c:	00040513          	addi	a0,s0,0
   11660:	00013403          	ld	s0,0(sp)
   11664:	01010113          	addi	sp,sp,16
   11668:	00008067          	jalr	zero,0(ra)
   1166c:	4080043b          	subw	s0,zero,s0
   11670:	010000ef          	jal	ra,11680 <__errno>
   11674:	00852023          	sw	s0,0(a0)
   11678:	fff00413          	addi	s0,zero,-1
   1167c:	fddff06f          	jal	zero,11658 <_write+0x1c>

0000000000011680 <__errno>:
   11680:	7601b503          	ld	a0,1888(gp) # 13610 <_impure_ptr>
   11684:	00008067          	jalr	zero,0(ra)

Disassembly of section .eh_frame:

0000000000012688 <__FRAME_END__>:
   12688:	0000                	c.unimp
	...

Disassembly of section .init_array:

0000000000012690 <__init_array_start>:
   12690:	00b0                	c.addi4spn	a2,sp,72
   12692:	0001                	c.addi	zero,0
   12694:	0000                	c.unimp
	...

0000000000012698 <__frame_dummy_init_array_entry>:
   12698:	015c                	c.addi4spn	a5,sp,132
   1269a:	0001                	c.addi	zero,0
   1269c:	0000                	c.unimp
	...

Disassembly of section .fini_array:

00000000000126a0 <__do_global_dtors_aux_fini_array_entry>:
   126a0:	0118                	c.addi4spn	a4,sp,128
   126a2:	0001                	c.addi	zero,0
   126a4:	0000                	c.unimp
	...

Disassembly of section .data:

00000000000126a8 <impure_data>:
	...
   126b0:	2be0                	c.fld	fs0,208(a5)
   126b2:	0001                	c.addi	zero,0
   126b4:	0000                	c.unimp
   126b6:	0000                	c.unimp
   126b8:	2c90                	c.fld	fa2,24(s1)
   126ba:	0001                	c.addi	zero,0
   126bc:	0000                	c.unimp
   126be:	0000                	c.unimp
   126c0:	2d40                	c.fld	fs0,152(a0)
   126c2:	0001                	c.addi	zero,0
	...
   12790:	0001                	c.addi	zero,0
   12792:	0000                	c.unimp
   12794:	0000                	c.unimp
   12796:	0000                	c.unimp
   12798:	330e                	c.fldsp	ft6,224(sp)
   1279a:	abcd                	c.j	12d8c <impure_data+0x6e4>
   1279c:	1234                	c.addi4spn	a3,sp,296
   1279e:	e66d                	c.bnez	a2,12888 <impure_data+0x1e0>
   127a0:	deec                	c.sw	a1,124(a3)
   127a2:	0005                	c.addi	zero,1
   127a4:	0000000b          	0xb
	...

0000000000012df0 <__malloc_av_>:
	...
   12e00:	2df0                	c.fld	fa2,216(a1)
   12e02:	0001                	c.addi	zero,0
   12e04:	0000                	c.unimp
   12e06:	0000                	c.unimp
   12e08:	2df0                	c.fld	fa2,216(a1)
   12e0a:	0001                	c.addi	zero,0
   12e0c:	0000                	c.unimp
   12e0e:	0000                	c.unimp
   12e10:	2e00                	c.fld	fs0,24(a2)
   12e12:	0001                	c.addi	zero,0
   12e14:	0000                	c.unimp
   12e16:	0000                	c.unimp
   12e18:	2e00                	c.fld	fs0,24(a2)
   12e1a:	0001                	c.addi	zero,0
   12e1c:	0000                	c.unimp
   12e1e:	0000                	c.unimp
   12e20:	2e10                	c.fld	fa2,24(a2)
   12e22:	0001                	c.addi	zero,0
   12e24:	0000                	c.unimp
   12e26:	0000                	c.unimp
   12e28:	2e10                	c.fld	fa2,24(a2)
   12e2a:	0001                	c.addi	zero,0
   12e2c:	0000                	c.unimp
   12e2e:	0000                	c.unimp
   12e30:	2e20                	c.fld	fs0,88(a2)
   12e32:	0001                	c.addi	zero,0
   12e34:	0000                	c.unimp
   12e36:	0000                	c.unimp
   12e38:	2e20                	c.fld	fs0,88(a2)
   12e3a:	0001                	c.addi	zero,0
   12e3c:	0000                	c.unimp
   12e3e:	0000                	c.unimp
   12e40:	2e30                	c.fld	fa2,88(a2)
   12e42:	0001                	c.addi	zero,0
   12e44:	0000                	c.unimp
   12e46:	0000                	c.unimp
   12e48:	2e30                	c.fld	fa2,88(a2)
   12e4a:	0001                	c.addi	zero,0
   12e4c:	0000                	c.unimp
   12e4e:	0000                	c.unimp
   12e50:	2e40                	c.fld	fs0,152(a2)
   12e52:	0001                	c.addi	zero,0
   12e54:	0000                	c.unimp
   12e56:	0000                	c.unimp
   12e58:	2e40                	c.fld	fs0,152(a2)
   12e5a:	0001                	c.addi	zero,0
   12e5c:	0000                	c.unimp
   12e5e:	0000                	c.unimp
   12e60:	2e50                	c.fld	fa2,152(a2)
   12e62:	0001                	c.addi	zero,0
   12e64:	0000                	c.unimp
   12e66:	0000                	c.unimp
   12e68:	2e50                	c.fld	fa2,152(a2)
   12e6a:	0001                	c.addi	zero,0
   12e6c:	0000                	c.unimp
   12e6e:	0000                	c.unimp
   12e70:	2e60                	c.fld	fs0,216(a2)
   12e72:	0001                	c.addi	zero,0
   12e74:	0000                	c.unimp
   12e76:	0000                	c.unimp
   12e78:	2e60                	c.fld	fs0,216(a2)
   12e7a:	0001                	c.addi	zero,0
   12e7c:	0000                	c.unimp
   12e7e:	0000                	c.unimp
   12e80:	2e70                	c.fld	fa2,216(a2)
   12e82:	0001                	c.addi	zero,0
   12e84:	0000                	c.unimp
   12e86:	0000                	c.unimp
   12e88:	2e70                	c.fld	fa2,216(a2)
   12e8a:	0001                	c.addi	zero,0
   12e8c:	0000                	c.unimp
   12e8e:	0000                	c.unimp
   12e90:	2e80                	c.fld	fs0,24(a3)
   12e92:	0001                	c.addi	zero,0
   12e94:	0000                	c.unimp
   12e96:	0000                	c.unimp
   12e98:	2e80                	c.fld	fs0,24(a3)
   12e9a:	0001                	c.addi	zero,0
   12e9c:	0000                	c.unimp
   12e9e:	0000                	c.unimp
   12ea0:	2e90                	c.fld	fa2,24(a3)
   12ea2:	0001                	c.addi	zero,0
   12ea4:	0000                	c.unimp
   12ea6:	0000                	c.unimp
   12ea8:	2e90                	c.fld	fa2,24(a3)
   12eaa:	0001                	c.addi	zero,0
   12eac:	0000                	c.unimp
   12eae:	0000                	c.unimp
   12eb0:	2ea0                	c.fld	fs0,88(a3)
   12eb2:	0001                	c.addi	zero,0
   12eb4:	0000                	c.unimp
   12eb6:	0000                	c.unimp
   12eb8:	2ea0                	c.fld	fs0,88(a3)
   12eba:	0001                	c.addi	zero,0
   12ebc:	0000                	c.unimp
   12ebe:	0000                	c.unimp
   12ec0:	2eb0                	c.fld	fa2,88(a3)
   12ec2:	0001                	c.addi	zero,0
   12ec4:	0000                	c.unimp
   12ec6:	0000                	c.unimp
   12ec8:	2eb0                	c.fld	fa2,88(a3)
   12eca:	0001                	c.addi	zero,0
   12ecc:	0000                	c.unimp
   12ece:	0000                	c.unimp
   12ed0:	2ec0                	c.fld	fs0,152(a3)
   12ed2:	0001                	c.addi	zero,0
   12ed4:	0000                	c.unimp
   12ed6:	0000                	c.unimp
   12ed8:	2ec0                	c.fld	fs0,152(a3)
   12eda:	0001                	c.addi	zero,0
   12edc:	0000                	c.unimp
   12ede:	0000                	c.unimp
   12ee0:	2ed0                	c.fld	fa2,152(a3)
   12ee2:	0001                	c.addi	zero,0
   12ee4:	0000                	c.unimp
   12ee6:	0000                	c.unimp
   12ee8:	2ed0                	c.fld	fa2,152(a3)
   12eea:	0001                	c.addi	zero,0
   12eec:	0000                	c.unimp
   12eee:	0000                	c.unimp
   12ef0:	2ee0                	c.fld	fs0,216(a3)
   12ef2:	0001                	c.addi	zero,0
   12ef4:	0000                	c.unimp
   12ef6:	0000                	c.unimp
   12ef8:	2ee0                	c.fld	fs0,216(a3)
   12efa:	0001                	c.addi	zero,0
   12efc:	0000                	c.unimp
   12efe:	0000                	c.unimp
   12f00:	2ef0                	c.fld	fa2,216(a3)
   12f02:	0001                	c.addi	zero,0
   12f04:	0000                	c.unimp
   12f06:	0000                	c.unimp
   12f08:	2ef0                	c.fld	fa2,216(a3)
   12f0a:	0001                	c.addi	zero,0
   12f0c:	0000                	c.unimp
   12f0e:	0000                	c.unimp
   12f10:	2f00                	c.fld	fs0,24(a4)
   12f12:	0001                	c.addi	zero,0
   12f14:	0000                	c.unimp
   12f16:	0000                	c.unimp
   12f18:	2f00                	c.fld	fs0,24(a4)
   12f1a:	0001                	c.addi	zero,0
   12f1c:	0000                	c.unimp
   12f1e:	0000                	c.unimp
   12f20:	2f10                	c.fld	fa2,24(a4)
   12f22:	0001                	c.addi	zero,0
   12f24:	0000                	c.unimp
   12f26:	0000                	c.unimp
   12f28:	2f10                	c.fld	fa2,24(a4)
   12f2a:	0001                	c.addi	zero,0
   12f2c:	0000                	c.unimp
   12f2e:	0000                	c.unimp
   12f30:	2f20                	c.fld	fs0,88(a4)
   12f32:	0001                	c.addi	zero,0
   12f34:	0000                	c.unimp
   12f36:	0000                	c.unimp
   12f38:	2f20                	c.fld	fs0,88(a4)
   12f3a:	0001                	c.addi	zero,0
   12f3c:	0000                	c.unimp
   12f3e:	0000                	c.unimp
   12f40:	2f30                	c.fld	fa2,88(a4)
   12f42:	0001                	c.addi	zero,0
   12f44:	0000                	c.unimp
   12f46:	0000                	c.unimp
   12f48:	2f30                	c.fld	fa2,88(a4)
   12f4a:	0001                	c.addi	zero,0
   12f4c:	0000                	c.unimp
   12f4e:	0000                	c.unimp
   12f50:	2f40                	c.fld	fs0,152(a4)
   12f52:	0001                	c.addi	zero,0
   12f54:	0000                	c.unimp
   12f56:	0000                	c.unimp
   12f58:	2f40                	c.fld	fs0,152(a4)
   12f5a:	0001                	c.addi	zero,0
   12f5c:	0000                	c.unimp
   12f5e:	0000                	c.unimp
   12f60:	2f50                	c.fld	fa2,152(a4)
   12f62:	0001                	c.addi	zero,0
   12f64:	0000                	c.unimp
   12f66:	0000                	c.unimp
   12f68:	2f50                	c.fld	fa2,152(a4)
   12f6a:	0001                	c.addi	zero,0
   12f6c:	0000                	c.unimp
   12f6e:	0000                	c.unimp
   12f70:	2f60                	c.fld	fs0,216(a4)
   12f72:	0001                	c.addi	zero,0
   12f74:	0000                	c.unimp
   12f76:	0000                	c.unimp
   12f78:	2f60                	c.fld	fs0,216(a4)
   12f7a:	0001                	c.addi	zero,0
   12f7c:	0000                	c.unimp
   12f7e:	0000                	c.unimp
   12f80:	2f70                	c.fld	fa2,216(a4)
   12f82:	0001                	c.addi	zero,0
   12f84:	0000                	c.unimp
   12f86:	0000                	c.unimp
   12f88:	2f70                	c.fld	fa2,216(a4)
   12f8a:	0001                	c.addi	zero,0
   12f8c:	0000                	c.unimp
   12f8e:	0000                	c.unimp
   12f90:	2f80                	c.fld	fs0,24(a5)
   12f92:	0001                	c.addi	zero,0
   12f94:	0000                	c.unimp
   12f96:	0000                	c.unimp
   12f98:	2f80                	c.fld	fs0,24(a5)
   12f9a:	0001                	c.addi	zero,0
   12f9c:	0000                	c.unimp
   12f9e:	0000                	c.unimp
   12fa0:	2f90                	c.fld	fa2,24(a5)
   12fa2:	0001                	c.addi	zero,0
   12fa4:	0000                	c.unimp
   12fa6:	0000                	c.unimp
   12fa8:	2f90                	c.fld	fa2,24(a5)
   12faa:	0001                	c.addi	zero,0
   12fac:	0000                	c.unimp
   12fae:	0000                	c.unimp
   12fb0:	2fa0                	c.fld	fs0,88(a5)
   12fb2:	0001                	c.addi	zero,0
   12fb4:	0000                	c.unimp
   12fb6:	0000                	c.unimp
   12fb8:	2fa0                	c.fld	fs0,88(a5)
   12fba:	0001                	c.addi	zero,0
   12fbc:	0000                	c.unimp
   12fbe:	0000                	c.unimp
   12fc0:	2fb0                	c.fld	fa2,88(a5)
   12fc2:	0001                	c.addi	zero,0
   12fc4:	0000                	c.unimp
   12fc6:	0000                	c.unimp
   12fc8:	2fb0                	c.fld	fa2,88(a5)
   12fca:	0001                	c.addi	zero,0
   12fcc:	0000                	c.unimp
   12fce:	0000                	c.unimp
   12fd0:	2fc0                	c.fld	fs0,152(a5)
   12fd2:	0001                	c.addi	zero,0
   12fd4:	0000                	c.unimp
   12fd6:	0000                	c.unimp
   12fd8:	2fc0                	c.fld	fs0,152(a5)
   12fda:	0001                	c.addi	zero,0
   12fdc:	0000                	c.unimp
   12fde:	0000                	c.unimp
   12fe0:	2fd0                	c.fld	fa2,152(a5)
   12fe2:	0001                	c.addi	zero,0
   12fe4:	0000                	c.unimp
   12fe6:	0000                	c.unimp
   12fe8:	2fd0                	c.fld	fa2,152(a5)
   12fea:	0001                	c.addi	zero,0
   12fec:	0000                	c.unimp
   12fee:	0000                	c.unimp
   12ff0:	2fe0                	c.fld	fs0,216(a5)
   12ff2:	0001                	c.addi	zero,0
   12ff4:	0000                	c.unimp
   12ff6:	0000                	c.unimp
   12ff8:	2fe0                	c.fld	fs0,216(a5)
   12ffa:	0001                	c.addi	zero,0
   12ffc:	0000                	c.unimp
   12ffe:	0000                	c.unimp
   13000:	2ff0                	c.fld	fa2,216(a5)
   13002:	0001                	c.addi	zero,0
   13004:	0000                	c.unimp
   13006:	0000                	c.unimp
   13008:	2ff0                	c.fld	fa2,216(a5)
   1300a:	0001                	c.addi	zero,0
   1300c:	0000                	c.unimp
   1300e:	0000                	c.unimp
   13010:	3000                	c.fld	fs0,32(s0)
   13012:	0001                	c.addi	zero,0
   13014:	0000                	c.unimp
   13016:	0000                	c.unimp
   13018:	3000                	c.fld	fs0,32(s0)
   1301a:	0001                	c.addi	zero,0
   1301c:	0000                	c.unimp
   1301e:	0000                	c.unimp
   13020:	3010                	c.fld	fa2,32(s0)
   13022:	0001                	c.addi	zero,0
   13024:	0000                	c.unimp
   13026:	0000                	c.unimp
   13028:	3010                	c.fld	fa2,32(s0)
   1302a:	0001                	c.addi	zero,0
   1302c:	0000                	c.unimp
   1302e:	0000                	c.unimp
   13030:	3020                	c.fld	fs0,96(s0)
   13032:	0001                	c.addi	zero,0
   13034:	0000                	c.unimp
   13036:	0000                	c.unimp
   13038:	3020                	c.fld	fs0,96(s0)
   1303a:	0001                	c.addi	zero,0
   1303c:	0000                	c.unimp
   1303e:	0000                	c.unimp
   13040:	3030                	c.fld	fa2,96(s0)
   13042:	0001                	c.addi	zero,0
   13044:	0000                	c.unimp
   13046:	0000                	c.unimp
   13048:	3030                	c.fld	fa2,96(s0)
   1304a:	0001                	c.addi	zero,0
   1304c:	0000                	c.unimp
   1304e:	0000                	c.unimp
   13050:	3040                	c.fld	fs0,160(s0)
   13052:	0001                	c.addi	zero,0
   13054:	0000                	c.unimp
   13056:	0000                	c.unimp
   13058:	3040                	c.fld	fs0,160(s0)
   1305a:	0001                	c.addi	zero,0
   1305c:	0000                	c.unimp
   1305e:	0000                	c.unimp
   13060:	3050                	c.fld	fa2,160(s0)
   13062:	0001                	c.addi	zero,0
   13064:	0000                	c.unimp
   13066:	0000                	c.unimp
   13068:	3050                	c.fld	fa2,160(s0)
   1306a:	0001                	c.addi	zero,0
   1306c:	0000                	c.unimp
   1306e:	0000                	c.unimp
   13070:	3060                	c.fld	fs0,224(s0)
   13072:	0001                	c.addi	zero,0
   13074:	0000                	c.unimp
   13076:	0000                	c.unimp
   13078:	3060                	c.fld	fs0,224(s0)
   1307a:	0001                	c.addi	zero,0
   1307c:	0000                	c.unimp
   1307e:	0000                	c.unimp
   13080:	3070                	c.fld	fa2,224(s0)
   13082:	0001                	c.addi	zero,0
   13084:	0000                	c.unimp
   13086:	0000                	c.unimp
   13088:	3070                	c.fld	fa2,224(s0)
   1308a:	0001                	c.addi	zero,0
   1308c:	0000                	c.unimp
   1308e:	0000                	c.unimp
   13090:	3080                	c.fld	fs0,32(s1)
   13092:	0001                	c.addi	zero,0
   13094:	0000                	c.unimp
   13096:	0000                	c.unimp
   13098:	3080                	c.fld	fs0,32(s1)
   1309a:	0001                	c.addi	zero,0
   1309c:	0000                	c.unimp
   1309e:	0000                	c.unimp
   130a0:	3090                	c.fld	fa2,32(s1)
   130a2:	0001                	c.addi	zero,0
   130a4:	0000                	c.unimp
   130a6:	0000                	c.unimp
   130a8:	3090                	c.fld	fa2,32(s1)
   130aa:	0001                	c.addi	zero,0
   130ac:	0000                	c.unimp
   130ae:	0000                	c.unimp
   130b0:	30a0                	c.fld	fs0,96(s1)
   130b2:	0001                	c.addi	zero,0
   130b4:	0000                	c.unimp
   130b6:	0000                	c.unimp
   130b8:	30a0                	c.fld	fs0,96(s1)
   130ba:	0001                	c.addi	zero,0
   130bc:	0000                	c.unimp
   130be:	0000                	c.unimp
   130c0:	30b0                	c.fld	fa2,96(s1)
   130c2:	0001                	c.addi	zero,0
   130c4:	0000                	c.unimp
   130c6:	0000                	c.unimp
   130c8:	30b0                	c.fld	fa2,96(s1)
   130ca:	0001                	c.addi	zero,0
   130cc:	0000                	c.unimp
   130ce:	0000                	c.unimp
   130d0:	30c0                	c.fld	fs0,160(s1)
   130d2:	0001                	c.addi	zero,0
   130d4:	0000                	c.unimp
   130d6:	0000                	c.unimp
   130d8:	30c0                	c.fld	fs0,160(s1)
   130da:	0001                	c.addi	zero,0
   130dc:	0000                	c.unimp
   130de:	0000                	c.unimp
   130e0:	30d0                	c.fld	fa2,160(s1)
   130e2:	0001                	c.addi	zero,0
   130e4:	0000                	c.unimp
   130e6:	0000                	c.unimp
   130e8:	30d0                	c.fld	fa2,160(s1)
   130ea:	0001                	c.addi	zero,0
   130ec:	0000                	c.unimp
   130ee:	0000                	c.unimp
   130f0:	30e0                	c.fld	fs0,224(s1)
   130f2:	0001                	c.addi	zero,0
   130f4:	0000                	c.unimp
   130f6:	0000                	c.unimp
   130f8:	30e0                	c.fld	fs0,224(s1)
   130fa:	0001                	c.addi	zero,0
   130fc:	0000                	c.unimp
   130fe:	0000                	c.unimp
   13100:	30f0                	c.fld	fa2,224(s1)
   13102:	0001                	c.addi	zero,0
   13104:	0000                	c.unimp
   13106:	0000                	c.unimp
   13108:	30f0                	c.fld	fa2,224(s1)
   1310a:	0001                	c.addi	zero,0
   1310c:	0000                	c.unimp
   1310e:	0000                	c.unimp
   13110:	3100                	c.fld	fs0,32(a0)
   13112:	0001                	c.addi	zero,0
   13114:	0000                	c.unimp
   13116:	0000                	c.unimp
   13118:	3100                	c.fld	fs0,32(a0)
   1311a:	0001                	c.addi	zero,0
   1311c:	0000                	c.unimp
   1311e:	0000                	c.unimp
   13120:	3110                	c.fld	fa2,32(a0)
   13122:	0001                	c.addi	zero,0
   13124:	0000                	c.unimp
   13126:	0000                	c.unimp
   13128:	3110                	c.fld	fa2,32(a0)
   1312a:	0001                	c.addi	zero,0
   1312c:	0000                	c.unimp
   1312e:	0000                	c.unimp
   13130:	3120                	c.fld	fs0,96(a0)
   13132:	0001                	c.addi	zero,0
   13134:	0000                	c.unimp
   13136:	0000                	c.unimp
   13138:	3120                	c.fld	fs0,96(a0)
   1313a:	0001                	c.addi	zero,0
   1313c:	0000                	c.unimp
   1313e:	0000                	c.unimp
   13140:	3130                	c.fld	fa2,96(a0)
   13142:	0001                	c.addi	zero,0
   13144:	0000                	c.unimp
   13146:	0000                	c.unimp
   13148:	3130                	c.fld	fa2,96(a0)
   1314a:	0001                	c.addi	zero,0
   1314c:	0000                	c.unimp
   1314e:	0000                	c.unimp
   13150:	3140                	c.fld	fs0,160(a0)
   13152:	0001                	c.addi	zero,0
   13154:	0000                	c.unimp
   13156:	0000                	c.unimp
   13158:	3140                	c.fld	fs0,160(a0)
   1315a:	0001                	c.addi	zero,0
   1315c:	0000                	c.unimp
   1315e:	0000                	c.unimp
   13160:	3150                	c.fld	fa2,160(a0)
   13162:	0001                	c.addi	zero,0
   13164:	0000                	c.unimp
   13166:	0000                	c.unimp
   13168:	3150                	c.fld	fa2,160(a0)
   1316a:	0001                	c.addi	zero,0
   1316c:	0000                	c.unimp
   1316e:	0000                	c.unimp
   13170:	3160                	c.fld	fs0,224(a0)
   13172:	0001                	c.addi	zero,0
   13174:	0000                	c.unimp
   13176:	0000                	c.unimp
   13178:	3160                	c.fld	fs0,224(a0)
   1317a:	0001                	c.addi	zero,0
   1317c:	0000                	c.unimp
   1317e:	0000                	c.unimp
   13180:	3170                	c.fld	fa2,224(a0)
   13182:	0001                	c.addi	zero,0
   13184:	0000                	c.unimp
   13186:	0000                	c.unimp
   13188:	3170                	c.fld	fa2,224(a0)
   1318a:	0001                	c.addi	zero,0
   1318c:	0000                	c.unimp
   1318e:	0000                	c.unimp
   13190:	3180                	c.fld	fs0,32(a1)
   13192:	0001                	c.addi	zero,0
   13194:	0000                	c.unimp
   13196:	0000                	c.unimp
   13198:	3180                	c.fld	fs0,32(a1)
   1319a:	0001                	c.addi	zero,0
   1319c:	0000                	c.unimp
   1319e:	0000                	c.unimp
   131a0:	3190                	c.fld	fa2,32(a1)
   131a2:	0001                	c.addi	zero,0
   131a4:	0000                	c.unimp
   131a6:	0000                	c.unimp
   131a8:	3190                	c.fld	fa2,32(a1)
   131aa:	0001                	c.addi	zero,0
   131ac:	0000                	c.unimp
   131ae:	0000                	c.unimp
   131b0:	31a0                	c.fld	fs0,96(a1)
   131b2:	0001                	c.addi	zero,0
   131b4:	0000                	c.unimp
   131b6:	0000                	c.unimp
   131b8:	31a0                	c.fld	fs0,96(a1)
   131ba:	0001                	c.addi	zero,0
   131bc:	0000                	c.unimp
   131be:	0000                	c.unimp
   131c0:	31b0                	c.fld	fa2,96(a1)
   131c2:	0001                	c.addi	zero,0
   131c4:	0000                	c.unimp
   131c6:	0000                	c.unimp
   131c8:	31b0                	c.fld	fa2,96(a1)
   131ca:	0001                	c.addi	zero,0
   131cc:	0000                	c.unimp
   131ce:	0000                	c.unimp
   131d0:	31c0                	c.fld	fs0,160(a1)
   131d2:	0001                	c.addi	zero,0
   131d4:	0000                	c.unimp
   131d6:	0000                	c.unimp
   131d8:	31c0                	c.fld	fs0,160(a1)
   131da:	0001                	c.addi	zero,0
   131dc:	0000                	c.unimp
   131de:	0000                	c.unimp
   131e0:	31d0                	c.fld	fa2,160(a1)
   131e2:	0001                	c.addi	zero,0
   131e4:	0000                	c.unimp
   131e6:	0000                	c.unimp
   131e8:	31d0                	c.fld	fa2,160(a1)
   131ea:	0001                	c.addi	zero,0
   131ec:	0000                	c.unimp
   131ee:	0000                	c.unimp
   131f0:	31e0                	c.fld	fs0,224(a1)
   131f2:	0001                	c.addi	zero,0
   131f4:	0000                	c.unimp
   131f6:	0000                	c.unimp
   131f8:	31e0                	c.fld	fs0,224(a1)
   131fa:	0001                	c.addi	zero,0
   131fc:	0000                	c.unimp
   131fe:	0000                	c.unimp
   13200:	31f0                	c.fld	fa2,224(a1)
   13202:	0001                	c.addi	zero,0
   13204:	0000                	c.unimp
   13206:	0000                	c.unimp
   13208:	31f0                	c.fld	fa2,224(a1)
   1320a:	0001                	c.addi	zero,0
   1320c:	0000                	c.unimp
   1320e:	0000                	c.unimp
   13210:	3200                	c.fld	fs0,32(a2)
   13212:	0001                	c.addi	zero,0
   13214:	0000                	c.unimp
   13216:	0000                	c.unimp
   13218:	3200                	c.fld	fs0,32(a2)
   1321a:	0001                	c.addi	zero,0
   1321c:	0000                	c.unimp
   1321e:	0000                	c.unimp
   13220:	3210                	c.fld	fa2,32(a2)
   13222:	0001                	c.addi	zero,0
   13224:	0000                	c.unimp
   13226:	0000                	c.unimp
   13228:	3210                	c.fld	fa2,32(a2)
   1322a:	0001                	c.addi	zero,0
   1322c:	0000                	c.unimp
   1322e:	0000                	c.unimp
   13230:	3220                	c.fld	fs0,96(a2)
   13232:	0001                	c.addi	zero,0
   13234:	0000                	c.unimp
   13236:	0000                	c.unimp
   13238:	3220                	c.fld	fs0,96(a2)
   1323a:	0001                	c.addi	zero,0
   1323c:	0000                	c.unimp
   1323e:	0000                	c.unimp
   13240:	3230                	c.fld	fa2,96(a2)
   13242:	0001                	c.addi	zero,0
   13244:	0000                	c.unimp
   13246:	0000                	c.unimp
   13248:	3230                	c.fld	fa2,96(a2)
   1324a:	0001                	c.addi	zero,0
   1324c:	0000                	c.unimp
   1324e:	0000                	c.unimp
   13250:	3240                	c.fld	fs0,160(a2)
   13252:	0001                	c.addi	zero,0
   13254:	0000                	c.unimp
   13256:	0000                	c.unimp
   13258:	3240                	c.fld	fs0,160(a2)
   1325a:	0001                	c.addi	zero,0
   1325c:	0000                	c.unimp
   1325e:	0000                	c.unimp
   13260:	3250                	c.fld	fa2,160(a2)
   13262:	0001                	c.addi	zero,0
   13264:	0000                	c.unimp
   13266:	0000                	c.unimp
   13268:	3250                	c.fld	fa2,160(a2)
   1326a:	0001                	c.addi	zero,0
   1326c:	0000                	c.unimp
   1326e:	0000                	c.unimp
   13270:	3260                	c.fld	fs0,224(a2)
   13272:	0001                	c.addi	zero,0
   13274:	0000                	c.unimp
   13276:	0000                	c.unimp
   13278:	3260                	c.fld	fs0,224(a2)
   1327a:	0001                	c.addi	zero,0
   1327c:	0000                	c.unimp
   1327e:	0000                	c.unimp
   13280:	3270                	c.fld	fa2,224(a2)
   13282:	0001                	c.addi	zero,0
   13284:	0000                	c.unimp
   13286:	0000                	c.unimp
   13288:	3270                	c.fld	fa2,224(a2)
   1328a:	0001                	c.addi	zero,0
   1328c:	0000                	c.unimp
   1328e:	0000                	c.unimp
   13290:	3280                	c.fld	fs0,32(a3)
   13292:	0001                	c.addi	zero,0
   13294:	0000                	c.unimp
   13296:	0000                	c.unimp
   13298:	3280                	c.fld	fs0,32(a3)
   1329a:	0001                	c.addi	zero,0
   1329c:	0000                	c.unimp
   1329e:	0000                	c.unimp
   132a0:	3290                	c.fld	fa2,32(a3)
   132a2:	0001                	c.addi	zero,0
   132a4:	0000                	c.unimp
   132a6:	0000                	c.unimp
   132a8:	3290                	c.fld	fa2,32(a3)
   132aa:	0001                	c.addi	zero,0
   132ac:	0000                	c.unimp
   132ae:	0000                	c.unimp
   132b0:	32a0                	c.fld	fs0,96(a3)
   132b2:	0001                	c.addi	zero,0
   132b4:	0000                	c.unimp
   132b6:	0000                	c.unimp
   132b8:	32a0                	c.fld	fs0,96(a3)
   132ba:	0001                	c.addi	zero,0
   132bc:	0000                	c.unimp
   132be:	0000                	c.unimp
   132c0:	32b0                	c.fld	fa2,96(a3)
   132c2:	0001                	c.addi	zero,0
   132c4:	0000                	c.unimp
   132c6:	0000                	c.unimp
   132c8:	32b0                	c.fld	fa2,96(a3)
   132ca:	0001                	c.addi	zero,0
   132cc:	0000                	c.unimp
   132ce:	0000                	c.unimp
   132d0:	32c0                	c.fld	fs0,160(a3)
   132d2:	0001                	c.addi	zero,0
   132d4:	0000                	c.unimp
   132d6:	0000                	c.unimp
   132d8:	32c0                	c.fld	fs0,160(a3)
   132da:	0001                	c.addi	zero,0
   132dc:	0000                	c.unimp
   132de:	0000                	c.unimp
   132e0:	32d0                	c.fld	fa2,160(a3)
   132e2:	0001                	c.addi	zero,0
   132e4:	0000                	c.unimp
   132e6:	0000                	c.unimp
   132e8:	32d0                	c.fld	fa2,160(a3)
   132ea:	0001                	c.addi	zero,0
   132ec:	0000                	c.unimp
   132ee:	0000                	c.unimp
   132f0:	32e0                	c.fld	fs0,224(a3)
   132f2:	0001                	c.addi	zero,0
   132f4:	0000                	c.unimp
   132f6:	0000                	c.unimp
   132f8:	32e0                	c.fld	fs0,224(a3)
   132fa:	0001                	c.addi	zero,0
   132fc:	0000                	c.unimp
   132fe:	0000                	c.unimp
   13300:	32f0                	c.fld	fa2,224(a3)
   13302:	0001                	c.addi	zero,0
   13304:	0000                	c.unimp
   13306:	0000                	c.unimp
   13308:	32f0                	c.fld	fa2,224(a3)
   1330a:	0001                	c.addi	zero,0
   1330c:	0000                	c.unimp
   1330e:	0000                	c.unimp
   13310:	3300                	c.fld	fs0,32(a4)
   13312:	0001                	c.addi	zero,0
   13314:	0000                	c.unimp
   13316:	0000                	c.unimp
   13318:	3300                	c.fld	fs0,32(a4)
   1331a:	0001                	c.addi	zero,0
   1331c:	0000                	c.unimp
   1331e:	0000                	c.unimp
   13320:	3310                	c.fld	fa2,32(a4)
   13322:	0001                	c.addi	zero,0
   13324:	0000                	c.unimp
   13326:	0000                	c.unimp
   13328:	3310                	c.fld	fa2,32(a4)
   1332a:	0001                	c.addi	zero,0
   1332c:	0000                	c.unimp
   1332e:	0000                	c.unimp
   13330:	3320                	c.fld	fs0,96(a4)
   13332:	0001                	c.addi	zero,0
   13334:	0000                	c.unimp
   13336:	0000                	c.unimp
   13338:	3320                	c.fld	fs0,96(a4)
   1333a:	0001                	c.addi	zero,0
   1333c:	0000                	c.unimp
   1333e:	0000                	c.unimp
   13340:	3330                	c.fld	fa2,96(a4)
   13342:	0001                	c.addi	zero,0
   13344:	0000                	c.unimp
   13346:	0000                	c.unimp
   13348:	3330                	c.fld	fa2,96(a4)
   1334a:	0001                	c.addi	zero,0
   1334c:	0000                	c.unimp
   1334e:	0000                	c.unimp
   13350:	3340                	c.fld	fs0,160(a4)
   13352:	0001                	c.addi	zero,0
   13354:	0000                	c.unimp
   13356:	0000                	c.unimp
   13358:	3340                	c.fld	fs0,160(a4)
   1335a:	0001                	c.addi	zero,0
   1335c:	0000                	c.unimp
   1335e:	0000                	c.unimp
   13360:	3350                	c.fld	fa2,160(a4)
   13362:	0001                	c.addi	zero,0
   13364:	0000                	c.unimp
   13366:	0000                	c.unimp
   13368:	3350                	c.fld	fa2,160(a4)
   1336a:	0001                	c.addi	zero,0
   1336c:	0000                	c.unimp
   1336e:	0000                	c.unimp
   13370:	3360                	c.fld	fs0,224(a4)
   13372:	0001                	c.addi	zero,0
   13374:	0000                	c.unimp
   13376:	0000                	c.unimp
   13378:	3360                	c.fld	fs0,224(a4)
   1337a:	0001                	c.addi	zero,0
   1337c:	0000                	c.unimp
   1337e:	0000                	c.unimp
   13380:	3370                	c.fld	fa2,224(a4)
   13382:	0001                	c.addi	zero,0
   13384:	0000                	c.unimp
   13386:	0000                	c.unimp
   13388:	3370                	c.fld	fa2,224(a4)
   1338a:	0001                	c.addi	zero,0
   1338c:	0000                	c.unimp
   1338e:	0000                	c.unimp
   13390:	3380                	c.fld	fs0,32(a5)
   13392:	0001                	c.addi	zero,0
   13394:	0000                	c.unimp
   13396:	0000                	c.unimp
   13398:	3380                	c.fld	fs0,32(a5)
   1339a:	0001                	c.addi	zero,0
   1339c:	0000                	c.unimp
   1339e:	0000                	c.unimp
   133a0:	3390                	c.fld	fa2,32(a5)
   133a2:	0001                	c.addi	zero,0
   133a4:	0000                	c.unimp
   133a6:	0000                	c.unimp
   133a8:	3390                	c.fld	fa2,32(a5)
   133aa:	0001                	c.addi	zero,0
   133ac:	0000                	c.unimp
   133ae:	0000                	c.unimp
   133b0:	33a0                	c.fld	fs0,96(a5)
   133b2:	0001                	c.addi	zero,0
   133b4:	0000                	c.unimp
   133b6:	0000                	c.unimp
   133b8:	33a0                	c.fld	fs0,96(a5)
   133ba:	0001                	c.addi	zero,0
   133bc:	0000                	c.unimp
   133be:	0000                	c.unimp
   133c0:	33b0                	c.fld	fa2,96(a5)
   133c2:	0001                	c.addi	zero,0
   133c4:	0000                	c.unimp
   133c6:	0000                	c.unimp
   133c8:	33b0                	c.fld	fa2,96(a5)
   133ca:	0001                	c.addi	zero,0
   133cc:	0000                	c.unimp
   133ce:	0000                	c.unimp
   133d0:	33c0                	c.fld	fs0,160(a5)
   133d2:	0001                	c.addi	zero,0
   133d4:	0000                	c.unimp
   133d6:	0000                	c.unimp
   133d8:	33c0                	c.fld	fs0,160(a5)
   133da:	0001                	c.addi	zero,0
   133dc:	0000                	c.unimp
   133de:	0000                	c.unimp
   133e0:	33d0                	c.fld	fa2,160(a5)
   133e2:	0001                	c.addi	zero,0
   133e4:	0000                	c.unimp
   133e6:	0000                	c.unimp
   133e8:	33d0                	c.fld	fa2,160(a5)
   133ea:	0001                	c.addi	zero,0
   133ec:	0000                	c.unimp
   133ee:	0000                	c.unimp
   133f0:	33e0                	c.fld	fs0,224(a5)
   133f2:	0001                	c.addi	zero,0
   133f4:	0000                	c.unimp
   133f6:	0000                	c.unimp
   133f8:	33e0                	c.fld	fs0,224(a5)
   133fa:	0001                	c.addi	zero,0
   133fc:	0000                	c.unimp
   133fe:	0000                	c.unimp
   13400:	33f0                	c.fld	fa2,224(a5)
   13402:	0001                	c.addi	zero,0
   13404:	0000                	c.unimp
   13406:	0000                	c.unimp
   13408:	33f0                	c.fld	fa2,224(a5)
   1340a:	0001                	c.addi	zero,0
   1340c:	0000                	c.unimp
   1340e:	0000                	c.unimp
   13410:	3400                	c.fld	fs0,40(s0)
   13412:	0001                	c.addi	zero,0
   13414:	0000                	c.unimp
   13416:	0000                	c.unimp
   13418:	3400                	c.fld	fs0,40(s0)
   1341a:	0001                	c.addi	zero,0
   1341c:	0000                	c.unimp
   1341e:	0000                	c.unimp
   13420:	3410                	c.fld	fa2,40(s0)
   13422:	0001                	c.addi	zero,0
   13424:	0000                	c.unimp
   13426:	0000                	c.unimp
   13428:	3410                	c.fld	fa2,40(s0)
   1342a:	0001                	c.addi	zero,0
   1342c:	0000                	c.unimp
   1342e:	0000                	c.unimp
   13430:	3420                	c.fld	fs0,104(s0)
   13432:	0001                	c.addi	zero,0
   13434:	0000                	c.unimp
   13436:	0000                	c.unimp
   13438:	3420                	c.fld	fs0,104(s0)
   1343a:	0001                	c.addi	zero,0
   1343c:	0000                	c.unimp
   1343e:	0000                	c.unimp
   13440:	3430                	c.fld	fa2,104(s0)
   13442:	0001                	c.addi	zero,0
   13444:	0000                	c.unimp
   13446:	0000                	c.unimp
   13448:	3430                	c.fld	fa2,104(s0)
   1344a:	0001                	c.addi	zero,0
   1344c:	0000                	c.unimp
   1344e:	0000                	c.unimp
   13450:	3440                	c.fld	fs0,168(s0)
   13452:	0001                	c.addi	zero,0
   13454:	0000                	c.unimp
   13456:	0000                	c.unimp
   13458:	3440                	c.fld	fs0,168(s0)
   1345a:	0001                	c.addi	zero,0
   1345c:	0000                	c.unimp
   1345e:	0000                	c.unimp
   13460:	3450                	c.fld	fa2,168(s0)
   13462:	0001                	c.addi	zero,0
   13464:	0000                	c.unimp
   13466:	0000                	c.unimp
   13468:	3450                	c.fld	fa2,168(s0)
   1346a:	0001                	c.addi	zero,0
   1346c:	0000                	c.unimp
   1346e:	0000                	c.unimp
   13470:	3460                	c.fld	fs0,232(s0)
   13472:	0001                	c.addi	zero,0
   13474:	0000                	c.unimp
   13476:	0000                	c.unimp
   13478:	3460                	c.fld	fs0,232(s0)
   1347a:	0001                	c.addi	zero,0
   1347c:	0000                	c.unimp
   1347e:	0000                	c.unimp
   13480:	3470                	c.fld	fa2,232(s0)
   13482:	0001                	c.addi	zero,0
   13484:	0000                	c.unimp
   13486:	0000                	c.unimp
   13488:	3470                	c.fld	fa2,232(s0)
   1348a:	0001                	c.addi	zero,0
   1348c:	0000                	c.unimp
   1348e:	0000                	c.unimp
   13490:	3480                	c.fld	fs0,40(s1)
   13492:	0001                	c.addi	zero,0
   13494:	0000                	c.unimp
   13496:	0000                	c.unimp
   13498:	3480                	c.fld	fs0,40(s1)
   1349a:	0001                	c.addi	zero,0
   1349c:	0000                	c.unimp
   1349e:	0000                	c.unimp
   134a0:	3490                	c.fld	fa2,40(s1)
   134a2:	0001                	c.addi	zero,0
   134a4:	0000                	c.unimp
   134a6:	0000                	c.unimp
   134a8:	3490                	c.fld	fa2,40(s1)
   134aa:	0001                	c.addi	zero,0
   134ac:	0000                	c.unimp
   134ae:	0000                	c.unimp
   134b0:	34a0                	c.fld	fs0,104(s1)
   134b2:	0001                	c.addi	zero,0
   134b4:	0000                	c.unimp
   134b6:	0000                	c.unimp
   134b8:	34a0                	c.fld	fs0,104(s1)
   134ba:	0001                	c.addi	zero,0
   134bc:	0000                	c.unimp
   134be:	0000                	c.unimp
   134c0:	34b0                	c.fld	fa2,104(s1)
   134c2:	0001                	c.addi	zero,0
   134c4:	0000                	c.unimp
   134c6:	0000                	c.unimp
   134c8:	34b0                	c.fld	fa2,104(s1)
   134ca:	0001                	c.addi	zero,0
   134cc:	0000                	c.unimp
   134ce:	0000                	c.unimp
   134d0:	34c0                	c.fld	fs0,168(s1)
   134d2:	0001                	c.addi	zero,0
   134d4:	0000                	c.unimp
   134d6:	0000                	c.unimp
   134d8:	34c0                	c.fld	fs0,168(s1)
   134da:	0001                	c.addi	zero,0
   134dc:	0000                	c.unimp
   134de:	0000                	c.unimp
   134e0:	34d0                	c.fld	fa2,168(s1)
   134e2:	0001                	c.addi	zero,0
   134e4:	0000                	c.unimp
   134e6:	0000                	c.unimp
   134e8:	34d0                	c.fld	fa2,168(s1)
   134ea:	0001                	c.addi	zero,0
   134ec:	0000                	c.unimp
   134ee:	0000                	c.unimp
   134f0:	34e0                	c.fld	fs0,232(s1)
   134f2:	0001                	c.addi	zero,0
   134f4:	0000                	c.unimp
   134f6:	0000                	c.unimp
   134f8:	34e0                	c.fld	fs0,232(s1)
   134fa:	0001                	c.addi	zero,0
   134fc:	0000                	c.unimp
   134fe:	0000                	c.unimp
   13500:	34f0                	c.fld	fa2,232(s1)
   13502:	0001                	c.addi	zero,0
   13504:	0000                	c.unimp
   13506:	0000                	c.unimp
   13508:	34f0                	c.fld	fa2,232(s1)
   1350a:	0001                	c.addi	zero,0
   1350c:	0000                	c.unimp
   1350e:	0000                	c.unimp
   13510:	3500                	c.fld	fs0,40(a0)
   13512:	0001                	c.addi	zero,0
   13514:	0000                	c.unimp
   13516:	0000                	c.unimp
   13518:	3500                	c.fld	fs0,40(a0)
   1351a:	0001                	c.addi	zero,0
   1351c:	0000                	c.unimp
   1351e:	0000                	c.unimp
   13520:	3510                	c.fld	fa2,40(a0)
   13522:	0001                	c.addi	zero,0
   13524:	0000                	c.unimp
   13526:	0000                	c.unimp
   13528:	3510                	c.fld	fa2,40(a0)
   1352a:	0001                	c.addi	zero,0
   1352c:	0000                	c.unimp
   1352e:	0000                	c.unimp
   13530:	3520                	c.fld	fs0,104(a0)
   13532:	0001                	c.addi	zero,0
   13534:	0000                	c.unimp
   13536:	0000                	c.unimp
   13538:	3520                	c.fld	fs0,104(a0)
   1353a:	0001                	c.addi	zero,0
   1353c:	0000                	c.unimp
   1353e:	0000                	c.unimp
   13540:	3530                	c.fld	fa2,104(a0)
   13542:	0001                	c.addi	zero,0
   13544:	0000                	c.unimp
   13546:	0000                	c.unimp
   13548:	3530                	c.fld	fa2,104(a0)
   1354a:	0001                	c.addi	zero,0
   1354c:	0000                	c.unimp
   1354e:	0000                	c.unimp
   13550:	3540                	c.fld	fs0,168(a0)
   13552:	0001                	c.addi	zero,0
   13554:	0000                	c.unimp
   13556:	0000                	c.unimp
   13558:	3540                	c.fld	fs0,168(a0)
   1355a:	0001                	c.addi	zero,0
   1355c:	0000                	c.unimp
   1355e:	0000                	c.unimp
   13560:	3550                	c.fld	fa2,168(a0)
   13562:	0001                	c.addi	zero,0
   13564:	0000                	c.unimp
   13566:	0000                	c.unimp
   13568:	3550                	c.fld	fa2,168(a0)
   1356a:	0001                	c.addi	zero,0
   1356c:	0000                	c.unimp
   1356e:	0000                	c.unimp
   13570:	3560                	c.fld	fs0,232(a0)
   13572:	0001                	c.addi	zero,0
   13574:	0000                	c.unimp
   13576:	0000                	c.unimp
   13578:	3560                	c.fld	fs0,232(a0)
   1357a:	0001                	c.addi	zero,0
   1357c:	0000                	c.unimp
   1357e:	0000                	c.unimp
   13580:	3570                	c.fld	fa2,232(a0)
   13582:	0001                	c.addi	zero,0
   13584:	0000                	c.unimp
   13586:	0000                	c.unimp
   13588:	3570                	c.fld	fa2,232(a0)
   1358a:	0001                	c.addi	zero,0
   1358c:	0000                	c.unimp
   1358e:	0000                	c.unimp
   13590:	3580                	c.fld	fs0,40(a1)
   13592:	0001                	c.addi	zero,0
   13594:	0000                	c.unimp
   13596:	0000                	c.unimp
   13598:	3580                	c.fld	fs0,40(a1)
   1359a:	0001                	c.addi	zero,0
   1359c:	0000                	c.unimp
   1359e:	0000                	c.unimp
   135a0:	3590                	c.fld	fa2,40(a1)
   135a2:	0001                	c.addi	zero,0
   135a4:	0000                	c.unimp
   135a6:	0000                	c.unimp
   135a8:	3590                	c.fld	fa2,40(a1)
   135aa:	0001                	c.addi	zero,0
   135ac:	0000                	c.unimp
   135ae:	0000                	c.unimp
   135b0:	35a0                	c.fld	fs0,104(a1)
   135b2:	0001                	c.addi	zero,0
   135b4:	0000                	c.unimp
   135b6:	0000                	c.unimp
   135b8:	35a0                	c.fld	fs0,104(a1)
   135ba:	0001                	c.addi	zero,0
   135bc:	0000                	c.unimp
   135be:	0000                	c.unimp
   135c0:	35b0                	c.fld	fa2,104(a1)
   135c2:	0001                	c.addi	zero,0
   135c4:	0000                	c.unimp
   135c6:	0000                	c.unimp
   135c8:	35b0                	c.fld	fa2,104(a1)
   135ca:	0001                	c.addi	zero,0
   135cc:	0000                	c.unimp
   135ce:	0000                	c.unimp
   135d0:	35c0                	c.fld	fs0,168(a1)
   135d2:	0001                	c.addi	zero,0
   135d4:	0000                	c.unimp
   135d6:	0000                	c.unimp
   135d8:	35c0                	c.fld	fs0,168(a1)
   135da:	0001                	c.addi	zero,0
   135dc:	0000                	c.unimp
   135de:	0000                	c.unimp
   135e0:	35d0                	c.fld	fa2,168(a1)
   135e2:	0001                	c.addi	zero,0
   135e4:	0000                	c.unimp
   135e6:	0000                	c.unimp
   135e8:	35d0                	c.fld	fa2,168(a1)
   135ea:	0001                	c.addi	zero,0
   135ec:	0000                	c.unimp
   135ee:	0000                	c.unimp
   135f0:	35e0                	c.fld	fs0,232(a1)
   135f2:	0001                	c.addi	zero,0
   135f4:	0000                	c.unimp
   135f6:	0000                	c.unimp
   135f8:	35e0                	c.fld	fs0,232(a1)
   135fa:	0001                	c.addi	zero,0
   135fc:	0000                	c.unimp
	...

Disassembly of section .sdata:

0000000000013600 <_global_impure_ptr>:
   13600:	26a8                	c.fld	fa0,72(a3)
   13602:	0001                	c.addi	zero,0
   13604:	0000                	c.unimp
	...

0000000000013608 <__dso_handle>:
	...

0000000000013610 <_impure_ptr>:
   13610:	26a8                	c.fld	fa0,72(a3)
   13612:	0001                	c.addi	zero,0
   13614:	0000                	c.unimp
	...

0000000000013618 <__malloc_sbrk_base>:
   13618:	ffff                	0xffff
   1361a:	ffff                	0xffff
   1361c:	ffff                	0xffff
   1361e:	ffff                	0xffff

0000000000013620 <__malloc_trim_threshold>:
   13620:	0000                	c.unimp
   13622:	0002                	c.slli64	zero
   13624:	0000                	c.unimp
	...

Disassembly of section .sbss:

0000000000013628 <errno>:
	...

0000000000013630 <__malloc_max_total_mem>:
	...

0000000000013638 <__malloc_max_sbrked_mem>:
	...

0000000000013640 <__malloc_top_pad>:
	...

0000000000013648 <heap_end.0>:
	...

Disassembly of section .bss:

0000000000013650 <completed.1>:
	...

0000000000013658 <object.0>:
	...

0000000000013688 <__malloc_current_mallinfo>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	c.fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3120                	c.fld	fs0,96(a0)
   c:	2e31                	c.addiw	t3,12
   e:	2e31                	c.addiw	t3,12
  10:	0030                	c.addi4spn	a2,sp,8

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	1b41                	c.addi	s6,-16
   2:	0000                	c.unimp
   4:	7200                	c.ld	s0,32(a2)
   6:	7369                	c.lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <register_fini-0x1009c>
   c:	0011                	c.addi	zero,4
   e:	0000                	c.unimp
  10:	1004                	c.addi4spn	s1,sp,32
  12:	7205                	c.lui	tp,0xfffe1
  14:	3676                	c.fldsp	fa2,376(sp)
  16:	6934                	c.ld	a3,80(a0)
  18:	7032                	0x7032
  1a:	0030                	c.addi4spn	a2,sp,8
