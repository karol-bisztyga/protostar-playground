import subprocess, json

def run_command(cmd):
  out = subprocess.check_output(cmd.split(" "))
  return out.decode("utf-8")

print("BUILD")
run_command("./protostar build")
print("TEST")
run_command("./protostar test")
print("DECLARE")
out = run_command("./protostar declare ./build/main.json --json")
print("DEPLOY")
class_hash = json.loads(out)['class_hash']
out = run_command(f"./protostar deploy {class_hash} --inputs 100 --json")
print("CALL")
contract_address = json.loads(out)['contract_address']
out = run_command(f"./protostar call --contract-address {contract_address} --function get_balance --json")
print(out)

print("DONE")
