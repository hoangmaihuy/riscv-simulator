
test/add.out:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	00000793          	addi	a5,zero,0
   100b4:	00078863          	beq	a5,zero,100c4 <register_fini+0x14>
   100b8:	00010537          	lui	a0,0x10
   100bc:	53c50513          	addi	a0,a0,1340 # 1053c <__libc_fini_array>
   100c0:	4680006f          	jal	zero,10528 <atexit>
   100c4:	00008067          	jalr	zero,0(ra)

00000000000100c8 <_start>:
   100c8:	00002197          	auipc	gp,0x2
   100cc:	dd018193          	addi	gp,gp,-560 # 11e98 <__global_pointer$>
   100d0:	f8818513          	addi	a0,gp,-120 # 11e20 <completed.1>
   100d4:	fc018613          	addi	a2,gp,-64 # 11e58 <__BSS_END__>
   100d8:	40a60633          	sub	a2,a2,a0
   100dc:	00000593          	addi	a1,zero,0
   100e0:	244000ef          	jal	ra,10324 <memset>
   100e4:	00000517          	auipc	a0,0x0
   100e8:	44450513          	addi	a0,a0,1092 # 10528 <atexit>
   100ec:	00050863          	beq	a0,zero,100fc <_start+0x34>
   100f0:	00000517          	auipc	a0,0x0
   100f4:	44c50513          	addi	a0,a0,1100 # 1053c <__libc_fini_array>
   100f8:	430000ef          	jal	ra,10528 <atexit>
   100fc:	18c000ef          	jal	ra,10288 <__libc_init_array>
   10100:	00012503          	lw	a0,0(sp)
   10104:	00810593          	addi	a1,sp,8
   10108:	00000613          	addi	a2,zero,0
   1010c:	06c000ef          	jal	ra,10178 <main>
   10110:	1480006f          	jal	zero,10258 <exit>

0000000000010114 <__do_global_dtors_aux>:
   10114:	ff010113          	addi	sp,sp,-16
   10118:	00813023          	sd	s0,0(sp)
   1011c:	f881c783          	lbu	a5,-120(gp) # 11e20 <completed.1>
   10120:	00113423          	sd	ra,8(sp)
   10124:	02079263          	bne	a5,zero,10148 <__do_global_dtors_aux+0x34>
   10128:	00000793          	addi	a5,zero,0
   1012c:	00078a63          	beq	a5,zero,10140 <__do_global_dtors_aux+0x2c>
   10130:	00011537          	lui	a0,0x11
   10134:	67850513          	addi	a0,a0,1656 # 11678 <__FRAME_END__>
   10138:	00000097          	auipc	ra,0x0
   1013c:	000000e7          	jalr	ra,0(zero) # 0 <register_fini-0x100b0>
   10140:	00100793          	addi	a5,zero,1
   10144:	f8f18423          	sb	a5,-120(gp) # 11e20 <completed.1>
   10148:	00813083          	ld	ra,8(sp)
   1014c:	00013403          	ld	s0,0(sp)
   10150:	01010113          	addi	sp,sp,16
   10154:	00008067          	jalr	zero,0(ra) # 10138 <__do_global_dtors_aux+0x24>

0000000000010158 <frame_dummy>:
   10158:	00000793          	addi	a5,zero,0
   1015c:	00078c63          	beq	a5,zero,10174 <frame_dummy+0x1c>
   10160:	00011537          	lui	a0,0x11
   10164:	f9018593          	addi	a1,gp,-112 # 11e28 <object.0>
   10168:	67850513          	addi	a0,a0,1656 # 11678 <__FRAME_END__>
   1016c:	00000317          	auipc	t1,0x0
   10170:	00000067          	jalr	zero,0(zero) # 0 <register_fini-0x100b0>
   10174:	00008067          	jalr	zero,0(ra)

0000000000010178 <main>:
   10178:	fe010113          	addi	sp,sp,-32
   1017c:	00813c23          	sd	s0,24(sp)
   10180:	02010413          	addi	s0,sp,32
   10184:	fe042623          	sw	zero,-20(s0)
   10188:	fe042623          	sw	zero,-20(s0)
   1018c:	0480006f          	jal	zero,101d4 <main+0x5c>
   10190:	000117b7          	lui	a5,0x11
   10194:	69878713          	addi	a4,a5,1688 # 11698 <result>
   10198:	fec42783          	lw	a5,-20(s0)
   1019c:	00279793          	slli	a5,a5,0x2
   101a0:	00f707b3          	add	a5,a4,a5
   101a4:	0007a783          	lw	a5,0(a5)
   101a8:	00a7879b          	addiw	a5,a5,10
   101ac:	0007871b          	addiw	a4,a5,0
   101b0:	000117b7          	lui	a5,0x11
   101b4:	69878693          	addi	a3,a5,1688 # 11698 <result>
   101b8:	fec42783          	lw	a5,-20(s0)
   101bc:	00279793          	slli	a5,a5,0x2
   101c0:	00f687b3          	add	a5,a3,a5
   101c4:	00e7a023          	sw	a4,0(a5)
   101c8:	fec42783          	lw	a5,-20(s0)
   101cc:	0017879b          	addiw	a5,a5,1
   101d0:	fef42623          	sw	a5,-20(s0)
   101d4:	fec42783          	lw	a5,-20(s0)
   101d8:	0007871b          	addiw	a4,a5,0
   101dc:	00400793          	addi	a5,zero,4
   101e0:	fae7d8e3          	bge	a5,a4,10190 <main+0x18>
   101e4:	00500793          	addi	a5,zero,5
   101e8:	fef42623          	sw	a5,-20(s0)
   101ec:	0480006f          	jal	zero,10234 <main+0xbc>
   101f0:	000117b7          	lui	a5,0x11
   101f4:	69878713          	addi	a4,a5,1688 # 11698 <result>
   101f8:	fec42783          	lw	a5,-20(s0)
   101fc:	00279793          	slli	a5,a5,0x2
   10200:	00f707b3          	add	a5,a4,a5
   10204:	0007a783          	lw	a5,0(a5)
   10208:	ffb7879b          	addiw	a5,a5,-5
   1020c:	0007871b          	addiw	a4,a5,0
   10210:	000117b7          	lui	a5,0x11
   10214:	69878693          	addi	a3,a5,1688 # 11698 <result>
   10218:	fec42783          	lw	a5,-20(s0)
   1021c:	00279793          	slli	a5,a5,0x2
   10220:	00f687b3          	add	a5,a3,a5
   10224:	00e7a023          	sw	a4,0(a5)
   10228:	fec42783          	lw	a5,-20(s0)
   1022c:	0017879b          	addiw	a5,a5,1
   10230:	fef42623          	sw	a5,-20(s0)
   10234:	fec42783          	lw	a5,-20(s0)
   10238:	0007871b          	addiw	a4,a5,0
   1023c:	00900793          	addi	a5,zero,9
   10240:	fae7d8e3          	bge	a5,a4,101f0 <main+0x78>
   10244:	00000793          	addi	a5,zero,0
   10248:	00078513          	addi	a0,a5,0
   1024c:	01813403          	ld	s0,24(sp)
   10250:	02010113          	addi	sp,sp,32
   10254:	00008067          	jalr	zero,0(ra)

0000000000010258 <exit>:
   10258:	ff010113          	addi	sp,sp,-16
   1025c:	00000593          	addi	a1,zero,0
   10260:	00813023          	sd	s0,0(sp)
   10264:	00113423          	sd	ra,8(sp)
   10268:	00050413          	addi	s0,a0,0
   1026c:	194000ef          	jal	ra,10400 <__call_exitprocs>
   10270:	f701b503          	ld	a0,-144(gp) # 11e08 <_global_impure_ptr>
   10274:	05853783          	ld	a5,88(a0)
   10278:	00078463          	beq	a5,zero,10280 <exit+0x28>
   1027c:	000780e7          	jalr	ra,0(a5)
   10280:	00040513          	addi	a0,s0,0
   10284:	3bc000ef          	jal	ra,10640 <_exit>

0000000000010288 <__libc_init_array>:
   10288:	fe010113          	addi	sp,sp,-32
   1028c:	00813823          	sd	s0,16(sp)
   10290:	01213023          	sd	s2,0(sp)
   10294:	00011437          	lui	s0,0x11
   10298:	00011937          	lui	s2,0x11
   1029c:	67c40793          	addi	a5,s0,1660 # 1167c <__preinit_array_end>
   102a0:	67c90913          	addi	s2,s2,1660 # 1167c <__preinit_array_end>
   102a4:	40f90933          	sub	s2,s2,a5
   102a8:	00113c23          	sd	ra,24(sp)
   102ac:	00913423          	sd	s1,8(sp)
   102b0:	40395913          	srai	s2,s2,0x3
   102b4:	02090063          	beq	s2,zero,102d4 <__libc_init_array+0x4c>
   102b8:	67c40413          	addi	s0,s0,1660
   102bc:	00000493          	addi	s1,zero,0
   102c0:	00043783          	ld	a5,0(s0)
   102c4:	00148493          	addi	s1,s1,1
   102c8:	00840413          	addi	s0,s0,8
   102cc:	000780e7          	jalr	ra,0(a5)
   102d0:	fe9918e3          	bne	s2,s1,102c0 <__libc_init_array+0x38>
   102d4:	00011437          	lui	s0,0x11
   102d8:	00011937          	lui	s2,0x11
   102dc:	68040793          	addi	a5,s0,1664 # 11680 <__init_array_start>
   102e0:	69090913          	addi	s2,s2,1680 # 11690 <__do_global_dtors_aux_fini_array_entry>
   102e4:	40f90933          	sub	s2,s2,a5
   102e8:	40395913          	srai	s2,s2,0x3
   102ec:	02090063          	beq	s2,zero,1030c <__libc_init_array+0x84>
   102f0:	68040413          	addi	s0,s0,1664
   102f4:	00000493          	addi	s1,zero,0
   102f8:	00043783          	ld	a5,0(s0)
   102fc:	00148493          	addi	s1,s1,1
   10300:	00840413          	addi	s0,s0,8
   10304:	000780e7          	jalr	ra,0(a5)
   10308:	fe9918e3          	bne	s2,s1,102f8 <__libc_init_array+0x70>
   1030c:	01813083          	ld	ra,24(sp)
   10310:	01013403          	ld	s0,16(sp)
   10314:	00813483          	ld	s1,8(sp)
   10318:	00013903          	ld	s2,0(sp)
   1031c:	02010113          	addi	sp,sp,32
   10320:	00008067          	jalr	zero,0(ra)

0000000000010324 <memset>:
   10324:	00f00313          	addi	t1,zero,15
   10328:	00050713          	addi	a4,a0,0
   1032c:	02c37a63          	bgeu	t1,a2,10360 <memset+0x3c>
   10330:	00f77793          	andi	a5,a4,15
   10334:	0a079063          	bne	a5,zero,103d4 <memset+0xb0>
   10338:	06059e63          	bne	a1,zero,103b4 <memset+0x90>
   1033c:	ff067693          	andi	a3,a2,-16
   10340:	00f67613          	andi	a2,a2,15
   10344:	00e686b3          	add	a3,a3,a4
   10348:	00b73023          	sd	a1,0(a4)
   1034c:	00b73423          	sd	a1,8(a4)
   10350:	01070713          	addi	a4,a4,16
   10354:	fed76ae3          	bltu	a4,a3,10348 <memset+0x24>
   10358:	00061463          	bne	a2,zero,10360 <memset+0x3c>
   1035c:	00008067          	jalr	zero,0(ra)
   10360:	40c306b3          	sub	a3,t1,a2
   10364:	00269693          	slli	a3,a3,0x2
   10368:	00000297          	auipc	t0,0x0
   1036c:	005686b3          	add	a3,a3,t0
   10370:	00c68067          	jalr	zero,12(a3)
   10374:	00b70723          	sb	a1,14(a4)
   10378:	00b706a3          	sb	a1,13(a4)
   1037c:	00b70623          	sb	a1,12(a4)
   10380:	00b705a3          	sb	a1,11(a4)
   10384:	00b70523          	sb	a1,10(a4)
   10388:	00b704a3          	sb	a1,9(a4)
   1038c:	00b70423          	sb	a1,8(a4)
   10390:	00b703a3          	sb	a1,7(a4)
   10394:	00b70323          	sb	a1,6(a4)
   10398:	00b702a3          	sb	a1,5(a4)
   1039c:	00b70223          	sb	a1,4(a4)
   103a0:	00b701a3          	sb	a1,3(a4)
   103a4:	00b70123          	sb	a1,2(a4)
   103a8:	00b700a3          	sb	a1,1(a4)
   103ac:	00b70023          	sb	a1,0(a4)
   103b0:	00008067          	jalr	zero,0(ra)
   103b4:	0ff5f593          	andi	a1,a1,255
   103b8:	00859693          	slli	a3,a1,0x8
   103bc:	00d5e5b3          	or	a1,a1,a3
   103c0:	01059693          	slli	a3,a1,0x10
   103c4:	00d5e5b3          	or	a1,a1,a3
   103c8:	02059693          	slli	a3,a1,0x20
   103cc:	00d5e5b3          	or	a1,a1,a3
   103d0:	f6dff06f          	jal	zero,1033c <memset+0x18>
   103d4:	00279693          	slli	a3,a5,0x2
   103d8:	00000297          	auipc	t0,0x0
   103dc:	005686b3          	add	a3,a3,t0
   103e0:	00008293          	addi	t0,ra,0
   103e4:	f98680e7          	jalr	ra,-104(a3)
   103e8:	00028093          	addi	ra,t0,0 # 103d8 <memset+0xb4>
   103ec:	ff078793          	addi	a5,a5,-16
   103f0:	40f70733          	sub	a4,a4,a5
   103f4:	00f60633          	add	a2,a2,a5
   103f8:	f6c374e3          	bgeu	t1,a2,10360 <memset+0x3c>
   103fc:	f3dff06f          	jal	zero,10338 <memset+0x14>

0000000000010400 <__call_exitprocs>:
   10400:	fb010113          	addi	sp,sp,-80
   10404:	03413023          	sd	s4,32(sp)
   10408:	f701ba03          	ld	s4,-144(gp) # 11e08 <_global_impure_ptr>
   1040c:	03213823          	sd	s2,48(sp)
   10410:	04113423          	sd	ra,72(sp)
   10414:	1f8a3903          	ld	s2,504(s4)
   10418:	04813023          	sd	s0,64(sp)
   1041c:	02913c23          	sd	s1,56(sp)
   10420:	03313423          	sd	s3,40(sp)
   10424:	01513c23          	sd	s5,24(sp)
   10428:	01613823          	sd	s6,16(sp)
   1042c:	01713423          	sd	s7,8(sp)
   10430:	01813023          	sd	s8,0(sp)
   10434:	04090063          	beq	s2,zero,10474 <__call_exitprocs+0x74>
   10438:	00050b13          	addi	s6,a0,0
   1043c:	00058b93          	addi	s7,a1,0
   10440:	00100a93          	addi	s5,zero,1
   10444:	fff00993          	addi	s3,zero,-1
   10448:	00892483          	lw	s1,8(s2)
   1044c:	fff4841b          	addiw	s0,s1,-1
   10450:	02044263          	blt	s0,zero,10474 <__call_exitprocs+0x74>
   10454:	00349493          	slli	s1,s1,0x3
   10458:	009904b3          	add	s1,s2,s1
   1045c:	040b8463          	beq	s7,zero,104a4 <__call_exitprocs+0xa4>
   10460:	2084b783          	ld	a5,520(s1)
   10464:	05778063          	beq	a5,s7,104a4 <__call_exitprocs+0xa4>
   10468:	fff4041b          	addiw	s0,s0,-1
   1046c:	ff848493          	addi	s1,s1,-8
   10470:	ff3416e3          	bne	s0,s3,1045c <__call_exitprocs+0x5c>
   10474:	04813083          	ld	ra,72(sp)
   10478:	04013403          	ld	s0,64(sp)
   1047c:	03813483          	ld	s1,56(sp)
   10480:	03013903          	ld	s2,48(sp)
   10484:	02813983          	ld	s3,40(sp)
   10488:	02013a03          	ld	s4,32(sp)
   1048c:	01813a83          	ld	s5,24(sp)
   10490:	01013b03          	ld	s6,16(sp)
   10494:	00813b83          	ld	s7,8(sp)
   10498:	00013c03          	ld	s8,0(sp)
   1049c:	05010113          	addi	sp,sp,80
   104a0:	00008067          	jalr	zero,0(ra)
   104a4:	00892783          	lw	a5,8(s2)
   104a8:	0084b703          	ld	a4,8(s1)
   104ac:	fff7879b          	addiw	a5,a5,-1
   104b0:	06878263          	beq	a5,s0,10514 <__call_exitprocs+0x114>
   104b4:	0004b423          	sd	zero,8(s1)
   104b8:	fa0708e3          	beq	a4,zero,10468 <__call_exitprocs+0x68>
   104bc:	31092783          	lw	a5,784(s2)
   104c0:	008a96bb          	sllw	a3,s5,s0
   104c4:	00892c03          	lw	s8,8(s2)
   104c8:	00d7f7b3          	and	a5,a5,a3
   104cc:	0007879b          	addiw	a5,a5,0
   104d0:	02079263          	bne	a5,zero,104f4 <__call_exitprocs+0xf4>
   104d4:	000700e7          	jalr	ra,0(a4)
   104d8:	00892703          	lw	a4,8(s2)
   104dc:	1f8a3783          	ld	a5,504(s4)
   104e0:	01871463          	bne	a4,s8,104e8 <__call_exitprocs+0xe8>
   104e4:	f92782e3          	beq	a5,s2,10468 <__call_exitprocs+0x68>
   104e8:	f80786e3          	beq	a5,zero,10474 <__call_exitprocs+0x74>
   104ec:	00078913          	addi	s2,a5,0
   104f0:	f59ff06f          	jal	zero,10448 <__call_exitprocs+0x48>
   104f4:	31492783          	lw	a5,788(s2)
   104f8:	1084b583          	ld	a1,264(s1)
   104fc:	00d7f7b3          	and	a5,a5,a3
   10500:	0007879b          	addiw	a5,a5,0
   10504:	00079c63          	bne	a5,zero,1051c <__call_exitprocs+0x11c>
   10508:	000b0513          	addi	a0,s6,0
   1050c:	000700e7          	jalr	ra,0(a4)
   10510:	fc9ff06f          	jal	zero,104d8 <__call_exitprocs+0xd8>
   10514:	00892423          	sw	s0,8(s2)
   10518:	fa1ff06f          	jal	zero,104b8 <__call_exitprocs+0xb8>
   1051c:	00058513          	addi	a0,a1,0
   10520:	000700e7          	jalr	ra,0(a4)
   10524:	fb5ff06f          	jal	zero,104d8 <__call_exitprocs+0xd8>

0000000000010528 <atexit>:
   10528:	00050593          	addi	a1,a0,0
   1052c:	00000693          	addi	a3,zero,0
   10530:	00000613          	addi	a2,zero,0
   10534:	00000513          	addi	a0,zero,0
   10538:	0600006f          	jal	zero,10598 <__register_exitproc>

000000000001053c <__libc_fini_array>:
   1053c:	fe010113          	addi	sp,sp,-32
   10540:	00813823          	sd	s0,16(sp)
   10544:	000117b7          	lui	a5,0x11
   10548:	00011437          	lui	s0,0x11
   1054c:	69078793          	addi	a5,a5,1680 # 11690 <__do_global_dtors_aux_fini_array_entry>
   10550:	69840413          	addi	s0,s0,1688 # 11698 <result>
   10554:	40f40433          	sub	s0,s0,a5
   10558:	00913423          	sd	s1,8(sp)
   1055c:	00113c23          	sd	ra,24(sp)
   10560:	40345493          	srai	s1,s0,0x3
   10564:	02048063          	beq	s1,zero,10584 <__libc_fini_array+0x48>
   10568:	ff840413          	addi	s0,s0,-8
   1056c:	00f40433          	add	s0,s0,a5
   10570:	00043783          	ld	a5,0(s0)
   10574:	fff48493          	addi	s1,s1,-1
   10578:	ff840413          	addi	s0,s0,-8
   1057c:	000780e7          	jalr	ra,0(a5)
   10580:	fe0498e3          	bne	s1,zero,10570 <__libc_fini_array+0x34>
   10584:	01813083          	ld	ra,24(sp)
   10588:	01013403          	ld	s0,16(sp)
   1058c:	00813483          	ld	s1,8(sp)
   10590:	02010113          	addi	sp,sp,32
   10594:	00008067          	jalr	zero,0(ra)

0000000000010598 <__register_exitproc>:
   10598:	f701b703          	ld	a4,-144(gp) # 11e08 <_global_impure_ptr>
   1059c:	1f873783          	ld	a5,504(a4)
   105a0:	06078063          	beq	a5,zero,10600 <__register_exitproc+0x68>
   105a4:	0087a703          	lw	a4,8(a5)
   105a8:	01f00813          	addi	a6,zero,31
   105ac:	08e84663          	blt	a6,a4,10638 <__register_exitproc+0xa0>
   105b0:	02050863          	beq	a0,zero,105e0 <__register_exitproc+0x48>
   105b4:	00371813          	slli	a6,a4,0x3
   105b8:	01078833          	add	a6,a5,a6
   105bc:	10c83823          	sd	a2,272(a6)
   105c0:	3107a883          	lw	a7,784(a5)
   105c4:	00100613          	addi	a2,zero,1
   105c8:	00e6163b          	sllw	a2,a2,a4
   105cc:	00c8e8b3          	or	a7,a7,a2
   105d0:	3117a823          	sw	a7,784(a5)
   105d4:	20d83823          	sd	a3,528(a6)
   105d8:	00200693          	addi	a3,zero,2
   105dc:	02d50863          	beq	a0,a3,1060c <__register_exitproc+0x74>
   105e0:	00270693          	addi	a3,a4,2
   105e4:	00369693          	slli	a3,a3,0x3
   105e8:	0017071b          	addiw	a4,a4,1
   105ec:	00e7a423          	sw	a4,8(a5)
   105f0:	00d787b3          	add	a5,a5,a3
   105f4:	00b7b023          	sd	a1,0(a5)
   105f8:	00000513          	addi	a0,zero,0
   105fc:	00008067          	jalr	zero,0(ra)
   10600:	20070793          	addi	a5,a4,512
   10604:	1ef73c23          	sd	a5,504(a4)
   10608:	f9dff06f          	jal	zero,105a4 <__register_exitproc+0xc>
   1060c:	3147a683          	lw	a3,788(a5)
   10610:	00000513          	addi	a0,zero,0
   10614:	00c6e6b3          	or	a3,a3,a2
   10618:	30d7aa23          	sw	a3,788(a5)
   1061c:	00270693          	addi	a3,a4,2
   10620:	00369693          	slli	a3,a3,0x3
   10624:	0017071b          	addiw	a4,a4,1
   10628:	00e7a423          	sw	a4,8(a5)
   1062c:	00d787b3          	add	a5,a5,a3
   10630:	00b7b023          	sd	a1,0(a5)
   10634:	00008067          	jalr	zero,0(ra)
   10638:	fff00513          	addi	a0,zero,-1
   1063c:	00008067          	jalr	zero,0(ra)

0000000000010640 <_exit>:
   10640:	05d00893          	addi	a7,zero,93
   10644:	00000073          	ecall
   10648:	00054463          	blt	a0,zero,10650 <_exit+0x10>
   1064c:	0000006f          	jal	zero,1064c <_exit+0xc>
   10650:	ff010113          	addi	sp,sp,-16
   10654:	00813023          	sd	s0,0(sp)
   10658:	00050413          	addi	s0,a0,0
   1065c:	00113423          	sd	ra,8(sp)
   10660:	4080043b          	subw	s0,zero,s0
   10664:	00c000ef          	jal	ra,10670 <__errno>
   10668:	00852023          	sw	s0,0(a0)
   1066c:	0000006f          	jal	zero,1066c <_exit+0x2c>

0000000000010670 <__errno>:
   10670:	f801b503          	ld	a0,-128(gp) # 11e18 <_impure_ptr>
   10674:	00008067          	jalr	zero,0(ra)

Disassembly of section .eh_frame:

0000000000011678 <__FRAME_END__>:
   11678:	0000                	c.unimp
	...

Disassembly of section .init_array:

0000000000011680 <__init_array_start>:
   11680:	00b0                	c.addi4spn	a2,sp,72
   11682:	0001                	c.addi	zero,0
   11684:	0000                	c.unimp
	...

0000000000011688 <__frame_dummy_init_array_entry>:
   11688:	0158                	c.addi4spn	a4,sp,132
   1168a:	0001                	c.addi	zero,0
   1168c:	0000                	c.unimp
	...

Disassembly of section .fini_array:

0000000000011690 <__do_global_dtors_aux_fini_array_entry>:
   11690:	0114                	c.addi4spn	a3,sp,128
   11692:	0001                	c.addi	zero,0
   11694:	0000                	c.unimp
	...

Disassembly of section .data:

0000000000011698 <result>:
   11698:	0001                	c.addi	zero,0
   1169a:	0000                	c.unimp
   1169c:	0002                	c.slli64	zero
   1169e:	0000                	c.unimp
   116a0:	00000003          	lb	zero,0(zero) # 0 <register_fini-0x100b0>
   116a4:	0004                	0x4
   116a6:	0000                	c.unimp
   116a8:	0005                	c.addi	zero,1
   116aa:	0000                	c.unimp
   116ac:	0006                	c.slli	zero,0x1
   116ae:	0000                	c.unimp
   116b0:	00000007          	0x7
   116b4:	0008                	0x8
   116b6:	0000                	c.unimp
   116b8:	0009                	c.addi	zero,2
   116ba:	0000                	c.unimp
   116bc:	000a                	c.slli	zero,0x2
	...

00000000000116c0 <impure_data>:
	...
   116c8:	1bf8                	c.addi4spn	a4,sp,508
   116ca:	0001                	c.addi	zero,0
   116cc:	0000                	c.unimp
   116ce:	0000                	c.unimp
   116d0:	1ca8                	c.addi4spn	a0,sp,632
   116d2:	0001                	c.addi	zero,0
   116d4:	0000                	c.unimp
   116d6:	0000                	c.unimp
   116d8:	1d58                	c.addi4spn	a4,sp,692
   116da:	0001                	c.addi	zero,0
	...
   117a8:	0001                	c.addi	zero,0
   117aa:	0000                	c.unimp
   117ac:	0000                	c.unimp
   117ae:	0000                	c.unimp
   117b0:	330e                	c.fldsp	ft6,224(sp)
   117b2:	abcd                	c.j	11da4 <impure_data+0x6e4>
   117b4:	1234                	c.addi4spn	a3,sp,296
   117b6:	e66d                	c.bnez	a2,118a0 <impure_data+0x1e0>
   117b8:	deec                	c.sw	a1,124(a3)
   117ba:	0005                	c.addi	zero,1
   117bc:	0000000b          	0xb
	...

Disassembly of section .sdata:

0000000000011e08 <_global_impure_ptr>:
   11e08:	16c0                	c.addi4spn	s0,sp,868
   11e0a:	0001                	c.addi	zero,0
   11e0c:	0000                	c.unimp
	...

0000000000011e10 <__dso_handle>:
	...

0000000000011e18 <_impure_ptr>:
   11e18:	16c0                	c.addi4spn	s0,sp,868
   11e1a:	0001                	c.addi	zero,0
   11e1c:	0000                	c.unimp
	...

Disassembly of section .bss:

0000000000011e20 <completed.1>:
	...

0000000000011e28 <object.0>:
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
