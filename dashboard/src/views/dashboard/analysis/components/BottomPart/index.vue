<template>
  <n-grid :x-gap="16" :y-gap="16" :item-responsive="true">
    <!--    <n-grid-item span="0:24 640:24 1024:8">-->
    <!--      <n-card title="时间线" :bordered="false" class="rounded-16px shadow-sm">-->
    <!--        <div class="h-360px">-->
    <!--          <n-timeline>-->
    <!--            <n-timeline-item v-for="item in timelines" :key="item.type" v-bind="item" />-->
    <!--          </n-timeline>-->
    <!--        </div>-->
    <!--      </n-card>-->
    <!--    </n-grid-item>-->
    <n-grid-item span="0:24 640:24 1024:12">
      <n-card title="Port data in 2022" :bordered="false" class="rounded-16px shadow-sm">
        <div class="h-360px">
          <n-data-table size="small" :columns="columns" :data="tableData" />
        </div>
      </n-card>
    </n-grid-item>

    <n-grid-item span="0:24 640:24 1024:12">
      <n-card title="Port data in 2021" :bordered="false" class="rounded-16px shadow-sm">
        <div class="h-360px">
          <n-data-table size="small" :columns="columns" :data="tableData" />
        </div>
      </n-card>
    </n-grid-item>

    <n-grid-item span="0:24 640:24 1024:12">
      <n-card title="Port data in 2020" :bordered="false" class="rounded-16px shadow-sm">
        <div class="h-360px">
          <n-data-table size="small" :columns="columns" :data="tableData" />
        </div>
      </n-card>
    </n-grid-item>

    <n-grid-item span="0:24 640:24 1024:12">
      <n-card title="Port data in 2019" :bordered="false" class="rounded-16px shadow-sm">
        <div class="h-360px">
          <n-data-table size="small" :columns="columns" :data="tableData" />
        </div>
      </n-card>
    </n-grid-item>
  </n-grid>
</template>

<script setup lang="ts">
// import { h } from 'vue';
// import { NTag } from 'naive-ui';

defineOptions({ name: 'DashboardAnalysisBottomPart' });

// interface TimelineData {
//   type: 'default' | 'info' | 'success' | 'warning' | 'error';
//   title: string;
//   content: string;
//   time: string;
// }

interface TableData {
  key: number;
  name: string;
  age: number;
  address: string;
  tags: string[];
}

// const timelines: TimelineData[] = [
//   { type: 'default', title: '啊', content: '', time: '2021-10-10 20:46' },
//   { type: 'success', title: '成功', content: '哪里成功', time: '2021-10-10 20:46' },
//   { type: 'error', title: '错误', content: '哪里错误', time: '2021-10-10 20:46' },
//   { type: 'warning', title: '警告', content: '哪里警告', time: '2021-10-10 20:46' },
//   { type: 'info', title: '信息', content: '是的', time: '2021-10-10 20:46' }
// ];

const columns = [
  {
    title: 'Port Name',
    key: 'name'
  },
  {
    title: 'Throughput',
    key: 'age'
  },
  {
    title: 'Data 2',
    key: 'address'
  },
  {
    title: 'Data 3',
    key: 'address'
  },
  {
    title: 'Data 4',
    key: 'address'
  }
];

const tableData: TableData[] = [
  {
    key: 0,
    name: 'Yi Bin',
    age: 32,
    address: '',
    tags: ['nice', 'developer']
  },
  {
    key: 1,
    name: 'Lu Zhou',
    age: 42,
    address: '',
    tags: ['wow']
  },
  {
    key: 2,
    name: 'Chong Qing',
    age: 32,
    address: '',
    tags: ['cool', 'teacher']
  },
  {
    key: 3,
    name: 'Yi Chang',
    age: 25,
    address: '',
    tags: ['handsome', 'programmer']
  },
  {
    key: 4,
    name: 'Jing Zhou',
    age: 1,
    address: '',
    tags: ['nice', 'developer']
  },
  {
    key: 5,
    name: 'Yue Yang',
    age: 2,
    address: '',
    tags: ['wow']
  },
  {
    key: 6,
    name: 'Chang Sha',
    age: 32,
    address: '',
    tags: ['cool', 'teacher']
  }
];
</script>

<style scoped></style>
