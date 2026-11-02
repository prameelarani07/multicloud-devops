
// =====================================
// CLOUDPILOT - JAVASCRIPT
// =====================================

// 1. Get all navigation links
const navLinks = document.querySelectorAll(".nav-link");

// 2. Get all dashboard sections
const sections = document.querySelectorAll(
    "main section[id]"
);

// 3. Highlight the selected navigation link
navLinks.forEach((link) => {
    link.addEventListener("click", function () {

        navLinks.forEach((item) => {
            item.classList.remove("active");
        });

        this.classList.add("active");
    });
});

// 4. Update active navigation while scrolling
window.addEventListener("scroll", () => {

    let currentSection = "";

    sections.forEach((section) => {

        const sectionTop = section.offsetTop - 150;
        const sectionBottom =
            sectionTop + section.offsetHeight;

        if (
            window.scrollY >= sectionTop &&
            window.scrollY < sectionBottom
        ) {
            currentSection = section.getAttribute("id");
        }
    });

    navLinks.forEach((link) => {

        link.classList.remove("active");

        if (
            link.getAttribute("href") ===
            `#${currentSection}`
        ) {
            link.classList.add("active");
        }
    });
});

// 5. Update copyright year automatically
const footer = document.querySelector("footer p");

if (footer) {
    footer.textContent =
        `CloudPilot © ${new Date().getFullYear()} | Multi-Cloud DevOps Automation Project`;
}

console.log("CloudPilot dashboard loaded successfully!");
