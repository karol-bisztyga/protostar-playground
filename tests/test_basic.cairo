%lang starknet

from starkware.cairo.common.math import assert_le

@contract_interface
namespace BasicContract {
  func increase_balance(amount: felt) -> () {
  }
  func get_balance() -> (res: felt) {
  }
}

@external
func setup_basic() {
    %{
      context.contract_address = deploy_contract("./src/basic.cairo", [100]).contract_address
    %}
    return ();
}

@external
func test_basic{syscall_ptr: felt*, range_check_ptr}() {
    alloc_locals;

    local contract_address: felt;
    %{ ids.contract_address = context.contract_address %}

    let (res,) = BasicContract.get_balance(contract_address=contract_address);
    assert res = 100;

    BasicContract.increase_balance(contract_address=contract_address, amount=50);
    let (res,) = BasicContract.get_balance(contract_address=contract_address);
    assert res = 150;

    return ();
}
