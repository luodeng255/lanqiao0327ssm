// 要操作的元素
const body=document.body;
const eye=document.querySelector('.eye');
const beam=document.querySelector('.beam');
const passwordInput=document.getElementById('password');


// 为密码框小眼睛绑定点击事件
eye.addEventListener('click',function(e){
    e.preventDefault();
    body.classList.toggle('show-password');
    passwordInput.type=passwordInput.type==='password'?'text':'password';
    eye.className='eye fa '+(passwordInput.type==='password'?'fa-eye-slash':'fa-eye');
    passwordInput.focus();
})