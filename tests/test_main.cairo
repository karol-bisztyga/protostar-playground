%lang starknet
from src.main import balance, increase_balance
from starkware.cairo.common.cairo_builtins import HashBuiltin

@external
func test_fail{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    assert 1 = 2;
    return ();
}

@external
func test_success{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    assert 1 = 1;
    return ();
}

@external
func test_skip{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    assert 1 = 1;
    return ();
}