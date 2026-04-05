  func.func @partial_solution_7_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "0_827_109"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.get_all_ones"(%4) : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.get_bit_width"(%4) : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.cmp"(%5, %2) {predicate = 7 : index} : (!transfer.integer, !transfer.integer) -> i1
    %8 = "transfer.umin"(%4, %6) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %9 = "transfer.countl_one"(%6) : (!transfer.integer) -> !transfer.integer
    %10 = "transfer.clear_high_bits"(%4, %3) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.select"(%7, %3, %9) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.lshr"(%6, %6) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.set_sign_bit"(%6) : (!transfer.integer) -> !transfer.integer
    %14 = "transfer.or"(%9, %13) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.umax"(%10, %14) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %16 = "transfer.shl"(%8, %15) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %17 = "transfer.ashr"(%11, %12) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %18 = "transfer.make"(%17, %16) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %18 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
