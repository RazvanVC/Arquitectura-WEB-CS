let  platosElegidos=[];
let total;
$(function(){   
   $(".platosprimeros").click(function(){
       $(".p1").show();
       $(".p2").hide();
       $(".p3").hide();

   })
   $(".platossegundos").click(function(){
       $(".p1").hide();
       $(".p2").show();
       $(".p3").hide();
    
})
   $(".postres").click(function(){
       $(".p1").hide();
       $(".p2").hide();
       $(".p3").show();
})

   $("#1").click(function(){
       let mejillones= document.getElementById("1")
       total+= mejillones.getAttribute("precio");
       platosElegidos.push(mejillones);
       let lista=document.getElementById("miLista");
       platosElegidos.forEach((item)=>{
         let li=document.createElement('li');
         li.innerText= item;
         lista.appendChild(li);
      })
   })
   $("#2").click(function(){
       const sopadeajo= document.getElementById("2")
       total+= sopadeajo.getAttribute("precio");
       platosElegidos.push(sopadeajo);
})
   $("#3").click(function(){
       const salmorejo= document.getElementById("3")
       total+= salmorejo.getAttribute("precio");
       platosElegidos.push(salmorejo);
})
});
