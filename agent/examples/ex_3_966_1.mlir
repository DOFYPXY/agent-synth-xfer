  func.func @partial_solution_14_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {number = "3_966_1"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %6 = "transfer.get_bit_width"(%5) : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.countl_one"(%6) : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.neg"(%4) : (!transfer.integer) -> !transfer.integer
    %9 = "transfer.cmp"(%8, %2) {predicate = 0 : index} : (!transfer.integer, !transfer.integer) -> i1
    %10 = "transfer.select"(%9, %3, %7) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.countl_one"(%6) : (!transfer.integer) -> !transfer.integer
    %12 = "transfer.make"(%11, %10) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %12 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
