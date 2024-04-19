function moveMenu() {
    let menu = document.querySelector('.menu')
    if (menu.style.display === 'block') {
        menu.style.display = 'none'
    }
    else {
        menu.style.display = 'block'
    }
}

function quitMenu() {
    let menu = document.querySelector('.menu')
    if (menu.style.display === 'none') {
        menu.style.display = 'block'
    }
    else {
        menu.style.display = 'none'
    }
}

document.querySelector('.burgerIcon').addEventListener('click', function() {
    document.querySelector('.menu').classList.add('active')
})

document.querySelector('.quitIcon').addEventListener('click', function() {
    document.querySelector('.menu').classList.remove('active')
})