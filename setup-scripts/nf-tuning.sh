#!/bin/bash
set -xe


echo 0 > /proc/sys/kernel/numa_balancing
service irqbalance stop
echo 0 > /sys/kernel/mm/ksm/run
echo 4-11 > /proc/sys/kernel/watchdog_cpumask
x86_energy_perf_policy performance
modprobe msr
wrmsr -a 0x620 0x3f3f
