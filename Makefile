# Makefile
# -*- coding: utf-8 -*-

ENVIRONMENTS_FILE := .env

ifneq ("$(wildcard $(ENVIRONMENTS_FILE))","")
	include $(ENVIRONMENTS_FILE)
    export $(shell sed 's/=.*//' .env)
endif

.PHONY: help

# Help: List All Commands❓
help:
	@(awk '/^#/{c=substr($$0,3);next}c&&/^[[:alpha:]][[:alnum:]-]+:/{print "\033[1;32m➜\033[0m \033[1m" substr($$1,1,index($$1,":")),c}1{c=0}' $(MAKEFILE_LIST) | column -s ":" -t)

# Stack: Configure Stack 🐋
locust-configure:
	@(pip3 install -r requirements.txt; locust -V)

# Infra: Infrastructure DOWN 🐋
locust-version:
	@(locust -V)

# Locust: Locust Run Without specify Script 🐋
locust-run:
	@(locust $(filter-out $@, $(MAKECMDGOALS)))

# Locust: Locust is run by specifying script 🐋
locust-run-script:
	@(locust -f $(filter-out $@, $(MAKECMDGOALS)))

# JMeter: Configure Stack 🐋
jmeter-configure:
	@(./bin/jmeter-install)

# JMeter: jMeter Run Without specify Script 🐋
jmeter-run:
	@(./jmeter/bin/jmeter)

# JMeter: jMeter is run by specifying script 🐋
jmeter-run-script:
	@(./jmeter/bin/jmeter -t $(filter-out $@, $(MAKECMDGOALS)))
