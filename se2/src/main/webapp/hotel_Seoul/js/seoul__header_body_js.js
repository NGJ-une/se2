document.addEventListener("DOMContentLoaded", function () {
  const menuItems = document.querySelectorAll(".has-submenu");
  const submenuWrap = document.querySelector(".sub-menu-wrap");
  const allSubMenus = document.querySelectorAll(".sub-menu");
  const totalWrap = document.querySelector(".menu-total-wrap");

  let currentMenu = null;

  // 메뉴 항목 hover 시 해당 서브메뉴 보여주기
  menuItems.forEach(item => {
    item.addEventListener("mouseenter", () => {
      const target = item.getAttribute("data-menu");

      allSubMenus.forEach(menu => menu.classList.remove("active"));
      const activeMenu = document.querySelector(`.sub-menu[data-menu="${target}"]`);

      if (activeMenu) {
        activeMenu.classList.add("active");
        submenuWrap.classList.add("active");
        currentMenu = target;
      }
    });
  });

  // header-nav + submenu-wrap 묶은 totalWrap 기준으로 마우스 나가면 닫기
  totalWrap.addEventListener("mouseleave", () => {
    submenuWrap.classList.remove("active");
    allSubMenus.forEach(menu => menu.classList.remove("active"));
    currentMenu = null;
  });

  totalWrap.addEventListener("mouseenter", () => {
    if (currentMenu) {
      submenuWrap.classList.add("active");
      document.querySelector(`.sub-menu[data-menu="${currentMenu}"]`).classList.add("active");
    }
  });
});
