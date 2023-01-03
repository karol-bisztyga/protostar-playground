%lang starknet

from src.main import balance, increase_balance
from starkware.cairo.common.cairo_builtins import HashBuiltin

@external
func setup_fail() {
    %{
        given(a = strategy.felts(), b = strategy.felts(), c = strategy.felts(), d = strategy.felts())
    %}
    return ();
}

@external
func test_fail{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}(a: felt, b: felt, c: felt, d: felt) {
    assert 1 = 2;
    return ();
}
