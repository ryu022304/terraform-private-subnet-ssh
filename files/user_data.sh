#!/bin/bash

sudo yum update -y

# SSM Agentの再起動
sudo systemctl restart amazon-ssm-agent
