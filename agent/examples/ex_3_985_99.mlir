  func.func @partial_solution_7_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "3_985_99"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %6 = "transfer.constant"(%5) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.get_all_ones"(%5) : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.cmp"(%7, %3) {predicate = 6 : index} : (!transfer.integer, !transfer.integer) -> i1
    %9 = "transfer.select"(%8, %3, %6) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.clear_high_bits"(%2, %6) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.countr_one"(%10) : (!transfer.integer) -> !transfer.integer
    %12 = "transfer.and"(%4, %9) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.add"(%6, %7) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.xor"(%13, %3) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %15 = "transfer.srem"(%4, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %16 = "transfer.and"(%15, %14) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %17 = "transfer.shl"(%12, %11) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %18 = "transfer.make"(%17, %16) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %18 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
