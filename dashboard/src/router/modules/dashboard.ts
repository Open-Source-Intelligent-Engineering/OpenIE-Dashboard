const dashboard: AuthRoute.Route = {
  name: 'dashboard',
  path: '/dashboard',
  component: 'basic',
  children: [
    {
      name: 'dashboard_analysis',
      path: '/dashboard/analysis',
      component: 'self',
      meta: {
        // title: '分析页',
        title: 'CNC Analysis',
        requiresAuth: true,
        icon: 'icon-park-outline:analysis'
      }
    },
    {
      name: 'dashboard_workbench',
      path: '/dashboard/workbench',
      component: 'self',
      meta: {
        // title: '工作台',
        title: 'Product Plan',
        requiresAuth: true,
        icon: 'icon-park-outline:workbench'
      }
    }
  ],
  meta: {
    // title: '仪表盘',
    title: 'Dashboard',
    icon: 'mdi:monitor-dashboard',
    order: 1
  }
};

export default dashboard;
