  func.func @partial_solution_10_body(%0 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>, %1 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]> attributes {from_weighted_dsl, number = "2_1541_161"} {
    %2 = "transfer.get"(%0) {index = 0 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %3 = "transfer.get"(%0) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %4 = "transfer.get"(%1) {index = 1 : index} : (!transfer.abs_value<[!transfer.integer, !transfer.integer]>) -> !transfer.integer
    %5 = "transfer.constant"(%4) {value = 1 : index} : (!transfer.integer) -> !transfer.integer
    %6 = "transfer.get_all_ones"(%4) : (!transfer.integer) -> !transfer.integer
    %7 = "transfer.get_bit_width"(%4) : (!transfer.integer) -> !transfer.integer
    %8 = "transfer.add"(%5, %2) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %9 = "transfer.clear_high_bits"(%8, %7) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %10 = "transfer.urem"(%6, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %11 = "transfer.cmp"(%8, %9) {predicate = 7 : index} : (!transfer.integer, !transfer.integer) -> i1
    %12 = "transfer.and"(%8, %3) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %13 = "transfer.ashr"(%4, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %14 = "transfer.countl_one"(%3) : (!transfer.integer) -> !transfer.integer
    %15 = "transfer.ashr"(%6, %14) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %16 = "transfer.clear_low_bits"(%15, %10) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %17 = "transfer.select"(%11, %8, %12) : (i1, !transfer.integer, !transfer.integer) -> !transfer.integer
    %18 = "transfer.and"(%17, %4) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %19 = "transfer.umin"(%16, %13) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %20 = "transfer.mul"(%16, %19) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %21 = "transfer.and"(%18, %15) : (!transfer.integer, !transfer.integer) -> !transfer.integer
    %22 = "transfer.make"(%21, %20) : (!transfer.integer, !transfer.integer) -> !transfer.abs_value<[!transfer.integer, !transfer.integer]>
    func.return %22 : !transfer.abs_value<[!transfer.integer, !transfer.integer]>
  }
