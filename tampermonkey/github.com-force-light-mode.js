// ==UserScript==
// @name         Github Force Light Mode Without Login
// @namespace    http://tampermonkey.net/
// @version      2025-05-13
// @description  Always set GitHub repos to light mode, even on PJAX navigations
// @match        https://github.com/*/*
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @grant        none
// @run-at       document-body
// ==/UserScript==

function log(...args) {
    console.log('\x1b[36m [TM] \x1b[34m [github.com Github Light Mode Without Login]', ...args);
}

(function() {
    'use strict';

    function applyLightMode() {
        document.documentElement.setAttribute('data-color-mode', 'light');
    }

    // 1) Initial application
    log('init', 'applyLightMode');
    applyLightMode();

    // 2) Re-apply after GitHub PJAX loads
    document.addEventListener('pjax:end', () => {
        log('pjax:end', 'applyLightMode');
        applyLightMode();
    });

    // 3) Also hook into history API for any other in-app navigations
    ['pushState', 'replaceState'].forEach(method => {
        const original = history[method];
        history[method] = function() {
            const ret = original.apply(this, arguments);
            log(method, 'applyLightMode');
            applyLightMode();
            return ret;
        };
    });

    // 4) Handle back/forward
    window.addEventListener('popstate', () => {
        log('popstate', 'applyLightMode');
        applyLightMode();
    });
})();
