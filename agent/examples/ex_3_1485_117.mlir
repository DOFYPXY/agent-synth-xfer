  func.func @partial_solution_4_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "3_1485_117"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.constant"(%4) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.get_all_ones"(%4) : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.get_bit_width"(%4) : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.cmp"(%7, %6) {predicate = 0 : index} : (!transfer.integer, !transfer.integer) -> i1
    %9 = "transfer.countr_one"(%3) : (!transfer.integer) -> !transfer.integer
    %10 = "transfer.ashr"(%4, %3) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.shl"(%5, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.set_high_bits"(%9, %10) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.mul"(%10, %12) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.umax"(%11, %11) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.select"(%8, %13, %2) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %16 = "transfer.udiv"(%3, %14) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %17 = "transfer.udiv"(%15, %14) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %18 = "transfer.make"(%17, %16) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %18 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
