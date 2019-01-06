#!/bin/bash

set -ex

./build.sh build_test framework-test  | tee ../data/log_framework_test
./build.sh build_test delay-test   | tee ../data/log_delay_test
./build.sh build_test shutdown-test  | tee ../data/log_shutdown
./build.sh build_test chain-test  | tee ../data/log_chain
./build.sh build_test lpm  | tee ../data/log_lpm
./build.sh build_test lpm-embedded  | tee ../data/log_lpm_embeded
./build.sh build_test nat  | tee ../data/log_nat
./build.sh build_test maglev  | tee ../data/log_maglev
./build.sh build_test tcp_check  | tee ../data/log_tcp_check
./build.sh build_test sctp-test  | tee ../data/log_sctp
./build.sh build_test config-test  | tee ../data/log_config
./build.sh build_test reset-parse  | tee ../data/log_reset
./build.sh build_test tcp_reconstruction  | tee ../data/log_tcp_reconstruct
./build.sh build_test acl-fw  | tee ../data/log_acl_fw
./build.sh build_test packet_generation  | tee ../data/log_packet_gen
./build.sh build_test packet_test  | tee ../data/log_packet_test
./build.sh build_test embedded-scheduler-test  | tee ../data/log_embeded_scheduler
./build.sh build_test embedded-scheduler-dependency-test  | tee ../data/embeded_scheduler_dep
./build.sh build_test tcp_payload  | tee ../data/log_tcp_payload
./build.sh build_test macswap  | tee ../data/log_macswap


