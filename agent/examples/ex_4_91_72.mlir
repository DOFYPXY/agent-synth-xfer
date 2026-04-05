  func.func @partial_solution_5_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {number = "4_91_72"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %6 = "transfer.constant"(%5) {value = 0 : index} : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.constant"(%5) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.get_all_ones"(%5) : (!transfer.integer) -> !transfer.integer
    %9 = "transfer.sdiv"(%2, %7) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.and"(%3, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.sdiv"(%6, %5) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %12 = "transfer.clear_sign_bit"(%3) : (!transfer.integer) -> !transfer.integer
    %13 = "transfer.urem"(%11, %11) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.add"(%5, %9) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.clear_sign_bit"(%14) : (!transfer.integer) -> !transfer.integer
    %16 = "transfer.and"(%15, %10) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %17 = "transfer.smax"(%8, %12) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %18 = "transfer.srem"(%17, %7) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %19 = "transfer.sub"(%16, %13) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %20 = "transfer.make"(%19, %18) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %20 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
