  func.func @partial_solution_18_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "0_965_128"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %6 = "transfer.constant"(%5) {value = 0 : index} : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.get_bit_width"(%5) : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.countr_zero"(%3) : (!transfer.integer) -> !transfer.integer
    %9 = "transfer.srem"(%6, %2) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.and"(%5, %9) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.neg"(%7) : (!transfer.integer) -> !transfer.integer
    %12 = "transfer.urem"(%9, %8) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.clear_sign_bit"(%11) : (!transfer.integer) -> !transfer.integer
    %14 = "transfer.lshr"(%4, %13) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.countl_one"(%14) : (!transfer.integer) -> !transfer.integer
    %16 = "transfer.smin"(%15, %3) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %17 = "transfer.or"(%12, %16) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %18 = "transfer.smin"(%10, %2) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %19 = "transfer.make"(%18, %17) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %19 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
