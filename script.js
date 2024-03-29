// Load header and style

let header=document.createElement('header');
fetch('/header.html').then(async function(res) {
	header.innerHTML=await res.text();
}).catch(function(err) {
	header.innerHTML=`Error: <code>${err}</code>`
})

document.body.prepend(header)

if (localStorage.getItem('theme')=="dark") {
	document.body.classList.add('dark')
} else if (!localStorage.getItem('theme')) {
	localStorage.setItem('theme','light')
	toggleTheme();
}

function toggleTheme() {
	if (localStorage.getItem('theme')=="dark") {
		localStorage.setItem('theme','light')
	} else {
		localStorage.setItem('theme','dark')
	}
	if (document.body.classList.contains('dark')) {
		document.body.classList.remove('dark')
	} else {
		document.body.classList.add('dark')
	}
}
