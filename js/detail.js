// 商品数量单击事件
var vm=new Vue({
    el:".ctrnum-wrap",
    data:{
      n:1
    },
    methods:{
      change(e){
        if(e.target.innerHTML=="+"){
          this.n++;
        }else if(this.n>1){
          this.n--;
        }
      }
    }
  })

  //多标签页效果 优惠套餐 相关推荐
  var btns=document.querySelectorAll(
      "[data-click=n-combotab]"
  );
  (function(){
      var zIndex=1;
      for(var btn of btns){
          btn.onclick=function(){
              var id=this.getAttribute("data-id");
              var div=document.getElementById(id);
              div.style.zIndex=++zIndex;
          }
      }
  })();
