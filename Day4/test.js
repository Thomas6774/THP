function show(){
	document.getElementById("mainlogo").className = 'notHidden';
	document.getElementById("search").className = 'notHidden';
	document.getElementById("recherche").className = 'notHidden';
	document.getElementById("jaidlachance").className = 'notHidden';
	var dummy = document.getElementById("chk");

	dummy.parentNode.removeChild(dummy);


}