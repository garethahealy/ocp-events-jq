[![Build Status](https://travis-ci.org/garethahealy/ocp-events-jq.svg?branch=master)](https://travis-ci.org/garethahealy/ocp-events-jq)
[![License](https://img.shields.io/hexpm/l/plug.svg?maxAge=2592000)]()

# ocp-events-jq
A PoC to look into how OCP events could be parsed via jq so that they can be used by SNMP

## Structure
- core.sh - contains logic
- errors.sh - calls core, with variable "Error"
- warnings.sh - calls core, with variable "Warning"
