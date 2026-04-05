  func.func @partial_solution_2_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {number = "3_1195_30"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %6 = "transfer.constant"(%5) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.get_bit_width"(%5) : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.set_low_bits"(%7, %6) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %9 = "transfer.countl_zero"(%8) : (!transfer.integer) -> !transfer.integer
    %10 = "transfer.set_low_bits"(%9, %8) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.add"(%2, %5) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.and"(%3, %11) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.set_high_bits"(%7, %10) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.umin"(%12, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.srem"(%5, %13) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %16 = "transfer.ashr"(%14, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %17 = "transfer.umin"(%15, %15) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %18 = "transfer.make"(%17, %16) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %18 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
