//ajson을 위한 코드.. 

let data;

function wck(){
if(window.XMLHttpRequest){
	return new XMLHttpRequest();

}
	
}

function members(){
	
	if(data.readyState == XMLHttpRequest.DONE && data.status==200){
		member_list(data.response);
		
	}else if(data.status==404){     
	error();
	
		}
	
	
}
data = wck();
data.onreadystatechange = members;
data.open("GET", "./index3.json", true);   //return true 시 submit , 통신규약때문에 4번 뜸..
data.send();



function member_list(jdata){
var j = JSON.parse(jdata);
console.log(j);

var total =j["members"].length;
var f;
var tbody = document.getElementById("mblist");
var tr, td, text ;

for(f in j.members){
tr = document.createElement("tr");
td = document.createElement("td");
td.innerText = total;
tr.append(td);
//	console.log(f);
var ff;
for(ff in j.members[f]){


if(ff=="id"){
	tr.setAttribute("onclick","java_get('"+j.members[f][ff]+"')");
	//	tr.getAttribute 속성값을 가져올떄쓰임 (style, onclick, class.. )
	}
	
	td = document.createElement("td");
//	console.log(j.members[f][ff]);

	if(ff == "area"){
		ff= "phone"
	}else if(ff =="phone"){
		ff="area";
	}
text = document.createTextNode(j.members[f][ff]);
td.append(text);
tr.append(td);
//	console.log(j.members[f][ff]);
	
}	
tr.append();
tbody.append(tr);
total--;
}


}

function error(){
	alert("해당 파일을 로드할 수 없습니다.");
	return false;
//	break;
}
function java_get(mid){
	alert("test");
//	location.href='./index3.html?mid='+mid;
	location.href='./first.do?'+mid;
	
}

