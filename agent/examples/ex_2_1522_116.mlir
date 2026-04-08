  func.func @partial_solution_4_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "2_1522_116"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.constant"(%4) {value = 0 : index} : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.constant"(%4) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.get_bit_width"(%4) : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.neg"(%4) : (!transfer.integer) -> !transfer.integer
    %9 = "transfer.and"(%4, %2) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.udiv"(%2, %5) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.mul"(%3, %9) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.neg"(%7) : (!transfer.integer) -> !transfer.integer
    %13 = "transfer.umin"(%6, %12) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.sub"(%13, %10) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.and"(%11, %14) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %16 = "transfer.and"(%8, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %17 = "transfer.make"(%16, %15) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %17 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
