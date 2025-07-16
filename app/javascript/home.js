document.addEventListener("DOMContentLoaded", () => {
// 1. フェードイン
const fadeText = document.querySelector(".fade-text");
setTimeout(() => {
    fadeText.classList.add("fade-in");
}, 500); // 0.5秒後に表示

// 2. ヘッダー追従
const headerContainer = document.querySelector(".header-container");
const triggerHeight = 300; // スクロール何pxで固定するか

window.addEventListener("scroll", () => {
    if (window.scrollY > triggerHeight) {
    headerContainer.classList.add("fixed-header");
    } else {
    headerContainer.classList.remove("fixed-header");
    }
});
});
