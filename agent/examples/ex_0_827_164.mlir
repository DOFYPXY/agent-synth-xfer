  func.func @partial_solution_5_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "0_827_164"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.constant"(%3) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %5 = "transfer.set_sign_bit"(%3) : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.set_sign_bit"(%5) : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.shl"(%4, %3) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %8 = "transfer.neg"(%6) : (!transfer.integer) -> !transfer.integer
    %9 = "transfer.set_high_bits"(%7, %7) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.and"(%2, %7) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.srem"(%8, %5) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.umin"(%11, %9) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.and"(%3, %12) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.sdiv"(%10, %12) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.make"(%14, %13) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %15 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
