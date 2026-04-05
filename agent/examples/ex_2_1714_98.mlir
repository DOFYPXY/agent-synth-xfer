  func.func @partial_solution_9_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "2_1714_98"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %6 = "transfer.constant"(%5) {value = 0 : index} : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.get_all_ones"(%5) : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.get_bit_width"(%5) : (!transfer.integer) -> !transfer.integer
    %9 = "transfer.ashr"(%7, %6) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.or"(%5, %8) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.neg"(%3) : (!transfer.integer) -> !transfer.integer
    %12 = "transfer.udiv"(%11, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.and"(%9, %12) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.srem"(%2, %2) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.add"(%4, %10) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %16 = "transfer.clear_high_bits"(%14, %15) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %17 = "transfer.shl"(%9, %13) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %18 = "transfer.make"(%17, %16) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %18 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
