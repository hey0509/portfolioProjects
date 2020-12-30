const passengerInfoSpan = document.querySelector('.passengerInfoSpan'); 
const passportInfoSpan= document.querySelector('.passportInfoSpan'); 
const paySpan= document.querySelector('.paySpan');
 
const passengerInfo = document.querySelector('.passengerInfo');  
const passportInfo = document.querySelector('.passportInfo');  
const pay = document.querySelector('.pay');  

const passengerInfoBtn =document.querySelector('.passengerInfoBtn'); 
const passportInfoBtn=document.querySelector('.passportInfoBtn'); 

passengerInfo.style.display = "none";
passportInfo.style.display = "none";
pay.style.display = "none";
passengerInfo.style.display = "block";

passengerInfoSpan.addEventListener("click", ()=>{
    passengerInfo.style.display = "block";
    passportInfo.style.display = "none";
    pay.style.display = "none";
});
passportInfoSpan.addEventListener("click", ()=>{
    passengerInfo.style.display = "none";
    passportInfo.style.display = "block";
    pay.style.display = "none";
});
paySpan.addEventListener("click", ()=>{
    passengerInfo.style.display = "none";
    passportInfo.style.display = "none";
    pay.style.display = "block";
});

passengerInfoBtn.addEventListener("click", ()=>{
    passengerInfo.style.display = "none";
    passportInfo.style.display = "block";
    pay.style.display = "none";
});
passportInfoBtn.addEventListener("click", ()=>{
    passengerInfo.style.display = "none";
    passportInfo.style.display = "none";
    pay.style.display = "block";
});
