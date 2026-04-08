  func.func @partial_solution_3_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "1_1718_145"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.constant"(%4) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.cmp"(%5, %5) {predicate = 7 : index} : (!transfer.integer, !transfer.integer) -> i1
    %7 = "transfer.select"(%6, %4, %4) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %8 = "transfer.add"(%5, %3) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %9 = "transfer.and"(%2, %8) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.countl_one"(%4) : (!transfer.integer) -> !transfer.integer
    %11 = "transfer.and"(%9, %7) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.countl_one"(%10) : (!transfer.integer) -> !transfer.integer
    %13 = "transfer.make"(%12, %11) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %13 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
