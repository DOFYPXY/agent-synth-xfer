  func.func @partial_solution_0_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "0_989_102"} {
    %2 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.constant"(%3) {value = 0 : index} : (!transfer.integer) -> !transfer.integer
    %5 = "transfer.constant"(%3) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.get_all_ones"(%3) : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.neg"(%3) : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.udiv"(%2, %7) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %9 = "transfer.smax"(%8, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.ashr"(%9, %5) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.mul"(%8, %6) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.popcount"(%10) : (!transfer.integer) -> !transfer.integer
    %13 = "transfer.make"(%12, %11) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %13 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
