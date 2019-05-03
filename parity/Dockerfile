FROM parity/parity:v1.11.11

WORKDIR /stuff

COPY . .

RUN env PARITY=/parity/parity ./prepare-chain.sh

CMD ["--config", "simple_poa.toml", "--jsonrpc-interface", "all"]
