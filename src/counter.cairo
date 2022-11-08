%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import assert_le

@storage_var
func value() -> (res: felt) {
}

@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    starting_value: felt
) {
    value.write(starting_value);
    return ();
}

@view
func get_value{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (res: felt) {
    let (res) = value.read();
    return (res,);
}

@external
func add_value{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(n: felt) -> (res: felt) {
    let (curr_value) = value.read();
    assert_le(curr_value + n, 1000);
    value.write(curr_value + n);
    let (new_value) = value.read();
    return (new_value,);
}

@external
func sub_value{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(n: felt) -> (res: felt) {
    let (curr_value) = value.read();
    assert_le(0, curr_value - n);
    value.write(curr_value - n);
    let (new_value) = value.read();
    return (new_value,);
}
