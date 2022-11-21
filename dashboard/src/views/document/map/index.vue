<!--<template>-->
<!--  <div class="h-full">-->
<!--    <iframe class="wh-full" :src="src"></iframe>-->
<!--  </div>-->
<!--</template>-->

<!--<script setup lang="ts">-->
<!--import { ref } from 'vue';-->
<!--// 这个地方回来放地图的服务器-->
<!--const src = ref('http://127.0.0.1:5500/map_core/index.html');-->
<!--</script>-->

<!--<style scoped></style>-->
<!---->
<!---->
<!---->
<template>
  <div ref="domRef" class="w-full h-full"></div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue';
import { useScriptTag } from '@vueuse/core';
import { BAIDU_MAP_SDK_URL } from '@/config';
import 'leaflet';

defineOptions({ name: 'BaiduMap' });

const { load } = useScriptTag(BAIDU_MAP_SDK_URL);

const domRef = ref<HTMLDivElement>();
//
//
async function renderMap() {
  await load(true);
  if (!domRef.value) return;
  const map = new BMap.Map(domRef.value);
  const point = new BMap.Point(113.6, 34.7);
  map.centerAndZoom(point, 8);
  map.enableScrollWheelZoom();

  const zhengzhou = new BMap.Point(113.6, 34.7);
  const marker = new BMap.Marker(zhengzhou); // 创建标注
  map.addOverlay(marker); // 将标注添加到地图中

  const opts = {
    width: 200, // 信息窗口宽度
    height: 100, // 信息窗口高度
    title: '郑州市', // 信息窗口标题
    message: '这里是郑州'
  };
  const infoWindow = new BMap.InfoWindow('地址：郑州市二七区', opts); // 创建信息窗口对象
  marker.addEventListener('click', () => {
    map.openInfoWindow(infoWindow, zhengzhou); // 开启信息窗口
  });
}
//
onMounted(() => {
  renderMap();
});
</script>

<style scoped></style>
