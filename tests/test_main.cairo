use array::ArrayTrait;
use result::ResultTrait;

#[test]
fn test_deploy_contract_minimal() {
    let deployed_contract_address = deploy_contract('basic', ArrayTrait::new()).unwrap();
    assert(deployed_contract_address != 0, 'deployed_contract_address != 0');
}
