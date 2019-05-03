Local Classic testnet
====

This configuration files allow to set up a local testnet with the EVM parameters similar to ETH Classic chain. This could be useful if you need to test your DApp locally before usage of [Kotti chain](https://github.com/goerli/testnet#meta-data-kotti-classic) or deploying the application to ETH Classic network.

[Ethereum Parity client](https://github.com/paritytech/parity-ethereum/) needs to be insalled on the system to deploy the local testnet. 

[The genesis file](classic_aura.json) configures AuRa consesus, [the Parity client configuration file](classic_aura.toml) runs the node to produce new blocks every second. The node will accessible through JSON RPC. IPC is disabled.

### Pre-configuration

Prior to run the Parity client, it is necessary to perfom pre-configuration step to generate the block issuer account.

Run `./prepare-chain.sh` script to use a default password for the block issuer.
It is possible to specify the password as a parameter if needed. E.g. `./prepare-chain.sh 'p@55w0rd'`.

```shell
$ ./prepare-chain.sh 
No password provided. Default password "C1@55ic" will be used.

New block issuer: 0x5c8075372b4ad60cc353bfab335ad71741002aa1

Modify classic_aura.json to extend the list of prefunded accounts.
Then run the node with the command "/opt/parity/parity --config classic_aura.toml".
```

If the Parity client is not accessible through the environment variable `$PATH`, the environment variable `PARITY` can be used to define full path to the Parity client:

```shell
$ env PARITY=./parity ./prepare-chain.sh 'N0P@5s'
New block issuer: 0x35c3317d90ca430b6bc4c53098839025dd7e5382

Modify classic_aura.json to extend the list of prefunded accounts.
Then run the node with the command "./parity --config classic_aura.toml".
```

### Prefunded accounts

Go to the bottom of [the genesis file](classic_aura.json) and add accounts that will have some _ether_ prefunded.  

### Run the node

As soon as the block issuer configured, run the node with:

```shell
parity --config classic_aura.toml
```

### Run the docker container

The docker container can be used to integrate the local testnet in your testing environmnet. Please refer to example of [the Docker Compose configuration file](docker-compose.yml) for reference.

Prior to running the container, go to the bottom of [the genesis file](classic_aura.json) and add accounts that will have some _ether_ prefunded.  

To try the docker container, invoke:
```shell
$ docker-compose up --build
```

To stop the container:
```shell
$ docker-compose down
```
