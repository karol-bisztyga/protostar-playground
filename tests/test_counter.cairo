%lang starknet

from starkware.cairo.common.math import assert_le

@contract_interface
namespace CounterContract {
  func get_value() -> (res: felt) {
  }
  func add_value(n: felt) -> (res: felt) {
  }
  func sub_value(n: felt) -> (res: felt) {
  }
  func add_3_values(a: felt, b: felt, c: felt) -> (res: felt) {
  }
}

@external
func setup_basic() {
    %{
      context.contract_address = deploy_contract("./src/counter.cairo").contract_address
    %}
    return ();
}

@external
func test_basic{syscall_ptr: felt*, range_check_ptr}() {
    alloc_locals;

    local contract_address: felt;
    %{ ids.contract_address = context.contract_address %}

    let (res,) = CounterContract.get_value(contract_address=contract_address);
    assert res = 100;

    let (res,) = CounterContract.add_value(contract_address=contract_address, n=50);
    assert res = 150;

    let (res,) = CounterContract.sub_value(contract_address=contract_address, n=60);
    assert res = 90;

    let (res,) = CounterContract.add_3_values(contract_address=contract_address, a=10, b=20, c=30);
    assert res = 150;

    return ();
}
