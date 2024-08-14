#!/bin/bash

# 配置变量
ARCHETYPE_GROUP_ID="com.fei.base"
ARCHETYPE_ARTIFACT_ID="base-code-generator-archetype"
ARCHETYPE_VERSION="1.2.0"
GROUP_ID="com.fei.base"
PACKAGE="com"
VERSION="1.0.0-SNAPSHOT"
BASE_DIR="/Users/fei/Desktop/architecture/project" # 指定基础目录

# 项目名称列表
PROJECT_NAMES=("pay-cashier" "pay-config" "pay-route" "pay-core" "pay-channel-wx-2" "pay-channel-alipay" "pay-promo" "pay-trade-notify" "pay-trade-insure")

# 生成项目
for PROJECT_NAME in "${PROJECT_NAMES[@]}"
do
    # 生成项目的目录路径
    OUTPUT_DIR="${BASE_DIR}"

    # 确保目录存在
    mkdir -p "${OUTPUT_DIR}"

    mvn archetype:generate \
        -DgroupId=${GROUP_ID} \
        -DartifactId=${PROJECT_NAME} \
        -Dversion=${VERSION} \
        -Dpackage=${PACKAGE} \
        -DarchetypeGroupId=${ARCHETYPE_GROUP_ID} \
        -DarchetypeArtifactId=${ARCHETYPE_ARTIFACT_ID} \
        -DarchetypeVersion=${ARCHETYPE_VERSION} \
        -DinteractiveMode=false \
        -DoutputDirectory="${OUTPUT_DIR}" # 指定输出目录

    echo "Generated project ${PROJECT_NAME} in ${OUTPUT_DIR}"
done
