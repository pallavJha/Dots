// ==UserScript==
// @name         Github PR Page Experience
// @namespace    http://tampermonkey.net/
// @version      2025-05-13
// @description  Updates the github PR page file tree with Collapse All and Expand All buttons
// @match        https://github.com/*/*
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @grant        none
// @run-at       document-body
// ==/UserScript==

function log(...args) {
    console.log('\x1b[36m [TM] \x1b[34m [github.com Github PR Page Experience]', ...args);
}

function expandAll() {
    [...document.querySelectorAll('li[role=treeitem] > button[aria-expanded=false]')].forEach(e => e.click())
}

function collapseAll() {
    [...document.querySelectorAll('li[role=treeitem] > button[aria-expanded=true]')].forEach(e => e.click())
}

function appendHelpButtons() {
    // Create (or reuse) a container section so buttons aren't direct children of <body>
    let controlsSection = document.querySelector(".x-expand-collapse-controls");

    if (!controlsSection) {
        controlsSection = document.createElement("section");
        controlsSection.className = "x-expand-collapse-controls";

        // Position the container once (instead of each button)
        controlsSection.style.position = "fixed";
        controlsSection.style.top = "95vh";
        controlsSection.style.left = "1em";
        controlsSection.style.zIndex = "100";
        controlsSection.style.display = "flex";
        controlsSection.style.gap = "0.5em";

        document.body.appendChild(controlsSection);
    }

    // Expand button
    if (!controlsSection.querySelector(".x-expand-all-btn")) {
        const expandAllButton = document.createElement("button");
        expandAllButton.type = "button";
        expandAllButton.textContent = "Expand All";
        expandAllButton.className = "Button--secondary Button--small x-expand-all-btn";

        expandAllButton.addEventListener("click", () => {
            if (typeof expandAll === "function") expandAll();
            else log("expandAll is not defined.");
        });

        controlsSection.appendChild(expandAllButton);
    }

    // Collapse button
    if (!controlsSection.querySelector(".x-collapse-all-btn")) {
        const collapseAllButton = document.createElement("button");
        collapseAllButton.type = "button";
        collapseAllButton.textContent = "Collapse All";
        collapseAllButton.className = "Button--secondary Button--small x-collapse-all-btn";

        collapseAllButton.addEventListener("click", () => {
            if (typeof collapseAll === "function") collapseAll();
            else log("collapseAll is not defined.");
        });

        controlsSection.appendChild(collapseAllButton);
    }
}

function isPRPage() {
    const regexPattern = /pull\/\d+\/files/i;
    if (regexPattern.test(location.href)) {
        log('isPRPage', true, location.href);
        return true;
    }
    return false;
}



(function() {
    // 3) Also hook into history API for any other in-app navigations
    ['pushState', 'replaceState'].forEach(method => {
        const original = history[method];
        history[method] = function() {
            const ret = original.apply(this, arguments);
            if (isPRPage()) {
                appendHelpButtons();
            }
            return ret;
        };
    });

    // 4) Handle back/forward
    window.addEventListener('popstate', () => {
        if (isPRPage()) {
            appendHelpButtons();
        }
    });

})();
