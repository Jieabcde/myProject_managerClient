// 查询列表接口
const getUserLavelPage = (params) => {
  return $axios({
    url: '/userLevel/page',
    method: 'get',
    params
  })
}

// 编辑页面反查详情接口
const queryCategoryById = (id) => {
  return $axios({
    url: `/userLevel/${id}`,
    method: 'get'
  })
}

// 修改---启用禁用接口
function editStatus (params) {
  return $axios({
    url: '/userLevel',
    method: 'put',
    data: { ...params }
  })
}

// 删除当前列的接口
const deleCategory = (id) => {
  return $axios({
    url: '/userLevel',
    method: 'delete',
    params: { id }
  })
}

// 修改接口
const editUserLevel = (params) => {
  return $axios({
    url: '/userLevel',
    method: 'put',
    data: { ...params }
  })
}

// 新增接口
const addUserLevel = (params) => {
  return $axios({
    url: '/userLevel',
    method: 'post',
    data: { ...params }
  })
}