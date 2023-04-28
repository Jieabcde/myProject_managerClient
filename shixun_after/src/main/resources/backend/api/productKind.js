// 查询列表接口
const getCategoryPage = (params) => {
  return $axios({
    url: '/productKind/page',
    method: 'get',
    params
  })
}

// 编辑页面反查详情接口
const queryCategoryById = (id) => {
  return $axios({
    url: `/productKind/${id}`,
    method: 'get'
  })
}

// 修改---启用禁用接口
function editStatus (params) {
  return $axios({
    url: '/productKind',
    method: 'put',
    data: { ...params }
  })
}

// 删除当前列的接口
const deleCategory = (id) => {
  return $axios({
    url: '/productKind',
    method: 'delete',
    params: { id }
  })
}

// 修改接口
const editCategory = (params) => {
  return $axios({
    url: '/productKind',
    method: 'put',
    data: { ...params }
  })
}

// 新增接口
const addCategory = (params) => {
  return $axios({
    url: '/productKind',
    method: 'post',
    data: { ...params }
  })
}