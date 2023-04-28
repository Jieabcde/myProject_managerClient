// 查询列表接口
const getUserPage = (params) => {
  return $axios({
    url: '/user/page',
    method: 'get',
    params
  })
}

// 编辑页面反查详情接口
const queryCategoryById = (id) => {
  return $axios({
    url: `/user/${id}`,
    method: 'get'
  })
}

// 修改---启用禁用接口
function editStatus (params) {
  return $axios({
    url: '/user',
    method: 'put',
    data: { ...params }
  })
}

// 删除当前列的接口
const deleUser = (id) => {
  return $axios({
    url: '/user',
    method: 'delete',
    params: { id }
  })
}

// 修改接口
const editUser = (params) => {
  return $axios({
    url: '/user',
    method: 'put',
    data: { ...params }
  })
}

// 新增接口
const addCategory = (params) => {
  return $axios({
    url: '//user',
    method: 'post',
    data: { ...params }
  })
}