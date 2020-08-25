function calc(){
  const price = document.getElementById('item-price');
  // const profit = document.getElementById('profit');
  price.addEventListener('input', ()=>{
// jsだけで動かせるかも？
    // const getvalue = document.getElementById("item-price").value;
    // const result = document.getElementById("add-tax-price");
    // result.value = getvalue * 0.1;
    
// ajaxで非同期通信するコード
    // const formData = new FormData(document.getElementById("item-price"));
    // const XHR = new XMLHttpRequest();
    // XHR.open("POST", "/items/new", true);
    // XHR.responseType ="json";
    // XHR.send(formData);

  });
}

window.addEventListener("load", calc);
