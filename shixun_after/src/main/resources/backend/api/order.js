// 查询列表页接口
const getOrderDetailPage = (params) => {
  return $axios({
    url: '/order/page',
    method: 'get',
    params
  })
}

// 删除接口
const deleteOrder = (oid) => {
  return $axios({
    url: '/product',
    method: 'delete',
    params: { oid }
  })
}


// 查看接口
const queryOrderDetailById = (id) => {
  return $axios({
    url: `/orderDetail/${id}`,
    method: 'get'
  })
}

// 查询详情
const queryOrderById = (id) => {
  return $axios({
    url: `/order/${id}`,
    method: 'get'
  })
}

// 修改接口
const editOrder = (params) => {
  return $axios({
    url: '/order',
    method: 'put',
    data: { ...params }
  })
}


// 获取物流分类列表
const getlogcompanyList = () => {
  return $axios({
    url: '/logcompany/list',
    method: 'get',
  })
}


// 取消，派送，完成接口
const editOrderDetail = (params) => {
  return $axios({
    url: '/order',
    method: 'put',
    data: { ...params }
  })




}
