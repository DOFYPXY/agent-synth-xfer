  func.func @partial_solution_2_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "0_985_120"} {
    %2 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.constant"(%4) {value = 0 : index} : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.cmp"(%4, %2) {predicate = 7 : index} : (!transfer.integer, !transfer.integer) -> i1
    %7 = "transfer.udiv"(%5, %5) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %8 = "transfer.set_low_bits"(%4, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %9 = "transfer.select"(%6, %8, %5) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.smax"(%3, %5) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.set_high_bits"(%9, %3) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.countl_zero"(%11) : (!transfer.integer) -> !transfer.integer
    %13 = "transfer.shl"(%9, %10) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.set_low_bits"(%12, %7) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.make"(%14, %13) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %15 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
