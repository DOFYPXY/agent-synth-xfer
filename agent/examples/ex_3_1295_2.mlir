  func.func @partial_solution_7_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {number = "3_1295_2"} {
    %2 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.constant"(%4) {value = 0 : index} : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.constant"(%4) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.get_all_ones"(%4) : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.cmp"(%5, %7) {predicate = 0 : index} : (!transfer.integer, !transfer.integer) -> i1
    %9 = "transfer.countr_one"(%4) : (!transfer.integer) -> !transfer.integer
    %10 = "transfer.set_low_bits"(%5, %9) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.and"(%3, %2) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.set_high_bits"(%3, %6) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.sub"(%10, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.udiv"(%5, %6) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.cmp"(%7, %12) {predicate = 0 : index} : (!transfer.integer, !transfer.integer) -> i1
    %16 = "transfer.select"(%8, %13, %14) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %17 = "transfer.lshr"(%16, %11) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %18 = "transfer.select"(%15, %11, %17) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %19 = "transfer.clear_sign_bit"(%17) : (!transfer.integer) -> !transfer.integer
    %20 = "transfer.make"(%19, %18) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %20 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
