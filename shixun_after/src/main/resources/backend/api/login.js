function loginApi(data) {
  return $axios({
    'url': '/admin/login',
    'method': 'post',
    data
  })
}

function logoutApi(){
  return $axios({
    'url': '/admin/logout',
    'method': 'post',
  })
}

function loginMsgApi(data) {   //json对象
  return $axios({
    'url': '/admin/msgLogin',
    'method': 'post',
    data
  })
}

function loginMsgApi() {
  return $axios({
    'url': '/admin/msgLogin',
    'method': 'post',
    data
  })
}


function sendMsgApi(data) {
  return $axios({
    'url': '/admin/sendMsg',
    'method': 'post',
    data
  })
}
