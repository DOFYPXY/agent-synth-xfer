  func.func @partial_solution_0_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "4_3_132"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.constant"(%4) {value = 0 : index} : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.constant"(%4) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.get_all_ones"(%4) : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.get_bit_width"(%4) : (!transfer.integer) -> !transfer.integer
    %9 = "transfer.cmp"(%4, %5) {predicate = 6 : index} : (!transfer.integer, !transfer.integer) -> i1
    %10 = "transfer.select"(%9, %2, %7) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.shl"(%6, %8) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.select"(%9, %10, %3) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.clear_sign_bit"(%11) : (!transfer.integer) -> !transfer.integer
    %14 = "transfer.clear_low_bits"(%7, %13) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.umin"(%14, %13) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %16 = "transfer.and"(%6, %12) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %17 = "transfer.make"(%16, %15) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %17 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
