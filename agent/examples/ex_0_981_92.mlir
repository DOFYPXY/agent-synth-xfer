  func.func @partial_solution_4_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {number = "0_981_92"} {
    %2 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.constant"(%3) {value = 0 : index} : (!transfer.integer) -> !transfer.integer
    %5 = "transfer.constant"(%3) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.get_all_ones"(%3) : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.get_bit_width"(%3) : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.cmp"(%7, %4) {predicate = 7 : index} : (!transfer.integer, !transfer.integer) -> i1
    %9 = "transfer.select"(%8, %5, %5) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.mul"(%2, %6) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.set_low_bits"(%7, %9) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.smin"(%10, %11) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.umin"(%12, %5) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.neg"(%5) : (!transfer.integer) -> !transfer.integer
    %15 = "transfer.make"(%14, %13) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %15 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
