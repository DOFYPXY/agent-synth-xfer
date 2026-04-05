  func.func @partial_solution_6_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "3_1160_158"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.constant"(%4) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.and"(%4, %2) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %7 = "transfer.add"(%5, %3) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %8 = "transfer.countl_zero"(%7) : (!transfer.integer) -> !transfer.integer
    %9 = "transfer.or"(%5, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.xor"(%9, %9) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.and"(%7, %6) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.umin"(%8, %10) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.make"(%12, %11) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %13 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
