# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -iterations=3 -timeline -register-file-stats < %s | FileCheck %s

pxor %mm0, %mm0
movq %mm0, %mm1

xorps %xmm0, %xmm0
movaps %xmm0, %xmm1
movups %xmm1, %xmm2
movapd %xmm2, %xmm3
movupd %xmm3, %xmm4
movdqa %xmm4, %xmm5
movdqu %xmm5, %xmm0

# CHECK:      Iterations:        3
# CHECK-NEXT: Instructions:      27
# CHECK-NEXT: Total Cycles:      22
# CHECK-NEXT: Total uOps:        27

# CHECK:      Dispatch Width:    4
# CHECK-NEXT: uOps Per Cycle:    1.23
# CHECK-NEXT: IPC:               1.23
# CHECK-NEXT: Block RThroughput: 4.0

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      1     0.33                        pxor	%mm0, %mm0
# CHECK-NEXT:  1      1     0.50                        movq	%mm0, %mm1
# CHECK-NEXT:  1      0     0.25                        xorps	%xmm0, %xmm0
# CHECK-NEXT:  1      1     1.00                        movaps	%xmm0, %xmm1
# CHECK-NEXT:  1      1     1.00                        movups	%xmm1, %xmm2
# CHECK-NEXT:  1      1     1.00                        movapd	%xmm2, %xmm3
# CHECK-NEXT:  1      1     1.00                        movupd	%xmm3, %xmm4
# CHECK-NEXT:  1      1     0.33                        movdqa	%xmm4, %xmm5
# CHECK-NEXT:  1      1     0.33                        movdqu	%xmm5, %xmm0

# CHECK:      Register File statistics:
# CHECK-NEXT: Total number of mappings created:    27
# CHECK-NEXT: Max number of mappings used:         21

# CHECK:      Resources:
# CHECK-NEXT: [0]   - SBDivider
# CHECK-NEXT: [1]   - SBFPDivider
# CHECK-NEXT: [2]   - SBPort0
# CHECK-NEXT: [3]   - SBPort1
# CHECK-NEXT: [4]   - SBPort4
# CHECK-NEXT: [5]   - SBPort5
# CHECK-NEXT: [6.0] - SBPort23
# CHECK-NEXT: [6.1] - SBPort23

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]
# CHECK-NEXT:  -      -     1.67   1.67    -     4.67    -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
# CHECK-NEXT:  -      -      -     0.67    -     0.33    -      -     pxor	%mm0, %mm0
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -     movq	%mm0, %mm1
# CHECK-NEXT:  -      -      -      -      -      -      -      -     xorps	%xmm0, %xmm0
# CHECK-NEXT:  -      -      -      -      -     1.00    -      -     movaps	%xmm0, %xmm1
# CHECK-NEXT:  -      -      -      -      -     1.00    -      -     movups	%xmm1, %xmm2
# CHECK-NEXT:  -      -      -      -      -     1.00    -      -     movapd	%xmm2, %xmm3
# CHECK-NEXT:  -      -      -      -      -     1.00    -      -     movupd	%xmm3, %xmm4
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     movdqa	%xmm4, %xmm5
# CHECK-NEXT:  -      -     0.67    -      -     0.33    -      -     movdqu	%xmm5, %xmm0

# CHECK:      Timeline view:
# CHECK-NEXT:                     0123456789
# CHECK-NEXT: Index     0123456789          01

# CHECK:      [0,0]     DeER .    .    .    ..   pxor	%mm0, %mm0
# CHECK-NEXT: [0,1]     D=eER.    .    .    ..   movq	%mm0, %mm1
# CHECK-NEXT: [0,2]     D---R.    .    .    ..   xorps	%xmm0, %xmm0
# CHECK-NEXT: [0,3]     D=eER.    .    .    ..   movaps	%xmm0, %xmm1
# CHECK-NEXT: [0,4]     .D=eER    .    .    ..   movups	%xmm1, %xmm2
# CHECK-NEXT: [0,5]     .D==eER   .    .    ..   movapd	%xmm2, %xmm3
# CHECK-NEXT: [0,6]     .D===eER  .    .    ..   movupd	%xmm3, %xmm4
# CHECK-NEXT: [0,7]     .D====eER .    .    ..   movdqa	%xmm4, %xmm5
# CHECK-NEXT: [0,8]     . D====eER.    .    ..   movdqu	%xmm5, %xmm0
# CHECK-NEXT: [1,0]     . DeE----R.    .    ..   pxor	%mm0, %mm0
# CHECK-NEXT: [1,1]     . D=eE---R.    .    ..   movq	%mm0, %mm1
# CHECK-NEXT: [1,2]     . D=====ER.    .    ..   xorps	%xmm0, %xmm0
# CHECK-NEXT: [1,3]     .  D====eER    .    ..   movaps	%xmm0, %xmm1
# CHECK-NEXT: [1,4]     .  D=====eER   .    ..   movups	%xmm1, %xmm2
# CHECK-NEXT: [1,5]     .  D======eER  .    ..   movapd	%xmm2, %xmm3
# CHECK-NEXT: [1,6]     .  D=======eER .    ..   movupd	%xmm3, %xmm4
# CHECK-NEXT: [1,7]     .   D=======eER.    ..   movdqa	%xmm4, %xmm5
# CHECK-NEXT: [1,8]     .   D========eER    ..   movdqu	%xmm5, %xmm0
# CHECK-NEXT: [2,0]     .   DeE--------R    ..   pxor	%mm0, %mm0
# CHECK-NEXT: [2,1]     .   D=eE-------R    ..   movq	%mm0, %mm1
# CHECK-NEXT: [2,2]     .    D========ER    ..   xorps	%xmm0, %xmm0
# CHECK-NEXT: [2,3]     .    D========eER   ..   movaps	%xmm0, %xmm1
# CHECK-NEXT: [2,4]     .    D=========eER  ..   movups	%xmm1, %xmm2
# CHECK-NEXT: [2,5]     .    D==========eER ..   movapd	%xmm2, %xmm3
# CHECK-NEXT: [2,6]     .    .D==========eER..   movupd	%xmm3, %xmm4
# CHECK-NEXT: [2,7]     .    .D===========eER.   movdqa	%xmm4, %xmm5
# CHECK-NEXT: [2,8]     .    .D============eER   movdqu	%xmm5, %xmm0

# CHECK:      Average Wait times (based on the timeline view):
# CHECK-NEXT: [0]: Executions
# CHECK-NEXT: [1]: Average time spent waiting in a scheduler's queue
# CHECK-NEXT: [2]: Average time spent waiting in a scheduler's queue while ready
# CHECK-NEXT: [3]: Average time elapsed from WB until retire stage

# CHECK:            [0]    [1]    [2]    [3]
# CHECK-NEXT: 0.     3     1.0    1.0    4.0       pxor	%mm0, %mm0
# CHECK-NEXT: 1.     3     2.0    0.0    3.3       movq	%mm0, %mm1
# CHECK-NEXT: 2.     3     5.0    0.0    1.0       xorps	%xmm0, %xmm0
# CHECK-NEXT: 3.     3     5.3    0.7    0.0       movaps	%xmm0, %xmm1
# CHECK-NEXT: 4.     3     6.0    0.0    0.0       movups	%xmm1, %xmm2
# CHECK-NEXT: 5.     3     7.0    0.0    0.0       movapd	%xmm2, %xmm3
# CHECK-NEXT: 6.     3     7.7    0.0    0.0       movupd	%xmm3, %xmm4
# CHECK-NEXT: 7.     3     8.3    0.0    0.0       movdqa	%xmm4, %xmm5
# CHECK-NEXT: 8.     3     9.0    0.0    0.0       movdqu	%xmm5, %xmm0
# CHECK-NEXT:        3     5.7    0.2    0.9       <total>
