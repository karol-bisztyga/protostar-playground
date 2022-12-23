%lang starknet
from src.main import balance, increase_balance
from starkware.cairo.common.cairo_builtins import HashBuiltin

@external
func __setup__() {
    %{
        given(a = strategy.felts())

        example(a=3)
        example(a=6)
    %}
    return ();
}

@external
func test_success{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}(a: felt) {
    assert 1 = 1;
    return ();
}

@external
func test_fail{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}(a: felt) {
    assert 1 = 2;
    return ();
}
