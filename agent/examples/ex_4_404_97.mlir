  func.func @partial_solution_7_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "4_404_97"} {
    %2 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.constant"(%4) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.get_bit_width"(%4) : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.cmp"(%2, %2) {predicate = 7 : index} : (!transfer.integer, !transfer.integer) -> i1
    %8 = "transfer.and"(%4, %6) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %9 = "transfer.select"(%7, %4, %8) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.and"(%9, %2) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.shl"(%10, %5) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.and"(%2, %3) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.clear_low_bits"(%11, %10) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.clear_low_bits"(%5, %6) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.and"(%13, %2) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %16 = "transfer.and"(%14, %14) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %17 = "transfer.and"(%15, %12) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %18 = "transfer.make"(%17, %16) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %18 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
