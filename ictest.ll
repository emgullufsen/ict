define i1 @samesign_inverted(i32 %x, i32 %y) {
  ; CHECK-LABEL: @samesign_inverted(
  ; CHECK-NEXT:  [[TMP1:%.*]] = xor i32 [[x:%.*]], [[y:%.*]]
  ; CHECK-NEXT:  [[TMP2:%.*]] = icmp sgt i32 [[TMP1]], -1
  ; CHECK-NEXT:  ret i1 [[TMP2]]
  %3 = and i32 %x, %y
  %4 = icmp sgt i32 %3, -1
  %5 = or i32 %x, %y
  %6 = icmp slt i32 %5, 0
  %7 = and i1 %4, %6
  ret i1 %7
}

define i1 @samesign_inverted_mult_use(i32 %x, i32 %y) {
  ; CHECK-LABEL: @samesign_inverted(
  ; CHECK-NEXT:  [[3:%.*]] = and i32 [[x:%.*]], [[y:%.*]]
  ; CHECK-NEXT:  [[4:%.*]] = xor i32 [[3:%.*]], 4
  ; CHECK-NEXT:  [[5:%.*]] = icmp sgt i32 [[3:%.*]], -1
  ; CHECK-NEXT:  [[6:%.*]] = or i32 [[x:%.*]], [[y:%.*]]
  ; CHECK-NEXT:  [[7:%.*]] = xor i32 [[6:%.*]], 4
  ; CHECK-NEXT:  [[8:%.*]] = icmp slt i32 [[5:%.*]], 0
  ; CHECK-NEXT:  [[9:%.*]] = and i1 [[4:%.*]], [[6:%.*]]
  ; CHECK-NEXT:  ret i1 [[9:%.*]]
  %3 = and i32 %x, %y
  %4 = xor i32 %3, 4
  %5 = icmp sgt i32 %3, -1
  %6 = or i32 %x, %y
  %7 = xor i32 %6, 4
  %8 = icmp slt i32 %5, 0
  %9 = and i1 %4, %6
  ret i1 %9
}
