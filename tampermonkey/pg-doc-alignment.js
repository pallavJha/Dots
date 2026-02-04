// ==UserScript==
// @name         PG Doc Alignment
// @namespace    http://tampermonkey.net/
// @version      2025-11-06
// @description  Left aligns the PG doc content and reduces the width
// @author       You
// @match        https://www.postgresql.org/docs/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=postgresql.org
// @grant        none
// @run-at       document-end
// ==/UserScript==

(function() {
    'use strict';

    const mainContentElement = document.getElementById('pgContentWrap');
    if (!mainContentElement) {
        return;
    }

    mainContentElement.setAttribute('id', 'pgContentWrap1');
    mainContentElement.classList.remove('col-11');
    mainContentElement.classList.add('col-5', 'offset-2');
})();
