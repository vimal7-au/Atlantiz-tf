#!/bin/bash
echo ECS_CLUSTER=${cluster_name} >> /etc/ecs/ecs.config
echo 'OPTIONS="$${OPTIONS} --storage-opt dm.basesize=${docker_storage_size}G"' >> /etc/sysconfig/docker
/etc/init.d/docker restart
echo ECS_ENGINE_AUTH_TYPE=dockercfg >> /etc/ecs/ecs.config