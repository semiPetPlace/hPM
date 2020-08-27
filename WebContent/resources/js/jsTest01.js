function answer01(){
	var inputVal = document.getElementById("q01_num").value;
	if(!isNaN(inputVal)){
		alert("숫자입니다.");
	}else{
		alert("숫자가 아닙니다.");
	}
}

function answer02(){
	var nameList = document.getElementById("nameList").innerHTML;
	var inputName = document.getElementsByTagName("input")[1].value;
	
	if(nameList.indexOf(inputName) != -1){
		alert("이름이 있습니다.");
	}else{
		alert("이름이 없습니다.");
	}
}

function answer03(){
	var rdoName = document.getElementsByName("rdo");
	for(var i = 0; i < rdoName.length; i++){
		if(rdoName[i].checked){
			url="http://www."+rdoName[i].value+".com";
			window.open(url);
		}
	}
}

function answer04(chk){
	var chkBox = document.getElementsByName("subject");
	for(var i = 0 ; i < chkBox.length; i++){
		chkBox[i].checked=chk;
	}
}

function answer05(){
	var randomInput = document.getElementById("randomInput");
	var randomVal = Math.floor(Math.random()*20+1);
	
	randomInput.value = randomVal;
}

function answer06(){
	var options = document.getElementById("locationSelect");
	var url="";
	for(var i = 0 ; i < options.length ; i++){
		if(options[i].selected){
			url = options[i].value;
		}
	}
	location.href="http://www."+url+".com";
}

function answer07(){
	var numVal = document.getElementById("numVal").innerHTML;
	var numList = numVal.split(",");
	numList.sort(function(a,b){
		return a-b;
	});
	alert(numList);
}

function answer08(){
	var startDate =document.getElementById("startDate").value;
	var today = new Date();
	var startDay = new Date(startDate);
	
	var res = Math.floor((today.getTime()-startDay.getTime()) / (60 * 60 * 24 * 1000)); 
	
	alert(res);
}

function answer09(){
	var doc = document.forms[0];
	var vals = [doc.name.value, doc.age.value, doc.gender.value];
	var table = document.getElementById("createTable");
	
	var tr = document.createElement("tr");
	for(var i = 0; i<vals.length; i++){
		var td = document.createElement("td");
		td.textContent = vals[i];
		tr.appendChild(td);
	}
	
	table.appendChild(tr);
}

function answer10(){
	var dan = parseInt(document.getElementById("gugudan").value);
	var res = "";
	
	for(var i = 1; i < 10 ; i++){
		res += dan + " * " + i + " = " + (dan*i) + "\n";
	}
	alert(res);
}
