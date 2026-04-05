  func.func @partial_solution_4_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "1_1699_124"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %6 = "transfer.constant"(%5) {value = 0 : index} : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.constant"(%5) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.get_all_ones"(%5) : (!transfer.integer) -> !transfer.integer
    %9 = "transfer.get_bit_width"(%5) : (!transfer.integer) -> !transfer.integer
    %10 = "transfer.cmp"(%8, %6) {predicate = 0 : index} : (!transfer.integer, !transfer.integer) -> i1
    %11 = "transfer.countr_zero"(%4) : (!transfer.integer) -> !transfer.integer
    %12 = "transfer.neg"(%11) : (!transfer.integer) -> !transfer.integer
    %13 = "transfer.lshr"(%12, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.lshr"(%9, %9) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.clear_low_bits"(%2, %14) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %16 = "transfer.clear_sign_bit"(%7) : (!transfer.integer) -> !transfer.integer
    %17 = "transfer.neg"(%3) : (!transfer.integer) -> !transfer.integer
    %18 = "transfer.smax"(%3, %16) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %19 = "transfer.cmp"(%5, %9) {predicate = 6 : index} : (!transfer.integer, !transfer.integer) -> i1
    %20 = "transfer.smin"(%17, %15) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %21 = "transfer.select"(%10, %18, %20) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %22 = "transfer.select"(%19, %17, %14) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %23 = "transfer.neg"(%22) : (!transfer.integer) -> !transfer.integer
    %24 = "transfer.select"(%19, %21, %13) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %25 = "transfer.make"(%24, %23) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %25 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
