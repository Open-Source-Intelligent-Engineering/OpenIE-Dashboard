<template>
  <n-card title="Project Info" :bordered="false" size="small" class="rounded-16px shadow-sm">
    <n-descriptions label-placement="left" bordered size="small" :column="2">
      <n-descriptions-item label="Release">
        <n-tag type="primary">{{ version }}</n-tag>
      </n-descriptions-item>
      <n-descriptions-item label="Last compile time">
        <n-tag type="primary">{{ latestBuildTime }}</n-tag>
      </n-descriptions-item>
      <n-descriptions-item label="Repository">
        <a class="text-primary" href="https://gitee.com/qian_zehao/map-source" target="_blank">Gitee Link</a>
      </n-descriptions-item>
      <n-descriptions-item label="Author Main Page">
        <a class="text-primary" href="https://github.com/QianZeHao123" target="_blank">Github Link</a>
      </n-descriptions-item>
    </n-descriptions>
  </n-card>
</template>

<script setup lang="ts">
import { pkgJson } from './model';

defineOptions({ name: 'ProjectInfo' });

const { version } = pkgJson;
const latestBuildTime = PROJECT_BUILD_TIME;
</script>

<style scoped></style>
