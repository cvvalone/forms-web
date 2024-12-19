window.onload = function () {
    document.querySelector('.header-burger-button').addEventListener("click", function () {
        this.classList.toggle('active');
        document.querySelector('.header-menu').classList.toggle('open');
        document.querySelector('.header-actions').classList.toggle('opened');
        toggleOverflowY();
    });
}

let isOverflowHidden = false;

const toggleOverflowY = () => {
    if (isOverflowHidden) {
        document.body.style.overflowY = "auto";
    }
    else {
        document.body.style.overflowY = "hidden";
    }
    isOverflowHidden = !isOverflowHidden;
}

window.addEventListener('scroll', function () {
    let toTopButton = document.querySelector('.upButton');

    let top = document.documentElement.scrollTop;

    if (top >= 400) {
        toTopButton.style.display = 'flex';
    }
    else {
        toTopButton.style.display = 'none';
    }
});


