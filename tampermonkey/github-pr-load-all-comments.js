// ==UserScript==
// @name         GitHub PR Load All Comments
// @namespace    http://tampermonkey.net/
// @version      2026-09-23
// @description  Adds a Load All button beside GitHub Load more buttons
// @match        https://github.com/*/*
// @grant        none
// @run-at       document-idle
// ==/UserScript==

(function() {
    'use strict';

    const MAX_LOADS = 1000;
    const CHECK_INTERVAL = 250;
    const MAX_IDLE_CHECKS = 20;

    let running = false;

    function isLoadMoreButton(button) {
        return /^load more(?:…|\.\.\.)$/i.test(button.textContent.trim());
    }

    function getLoadMoreButtons() {
        return [...document.querySelectorAll('button.ajax-pagination-btn')]
            .filter(button => isLoadMoreButton(button) && !button.disabled);
    }

    function addLoadAllButtons() {
        getLoadMoreButtons().forEach(loadMoreButton => {
            if (loadMoreButton.parentElement.classList.contains('tm-load-all-row')) {
                return;
            }

            const row = document.createElement('div');
            row.className = 'tm-load-all-row';
            row.style.display = 'flex';
            row.style.justifyContent = 'center';
            row.style.alignItems = 'center';
            row.style.gap = '16px';

            loadMoreButton.before(row);
            row.appendChild(loadMoreButton);

            // Clone GitHub's button so it looks identical.
            const loadAllButton = loadMoreButton.cloneNode(false);

            loadAllButton.type = 'button';
            loadAllButton.textContent = 'Load All';
            loadAllButton.classList.add('tm-load-all');
            loadAllButton.removeAttribute('data-disable-with');

            loadAllButton.addEventListener('click', event => {
                // Prevent GitHub's ajax-pagination handler from handling
                // our cloned button.
                event.preventDefault();
                event.stopPropagation();

                loadAll();
            });

            row.appendChild(loadAllButton);
        });
    }

    function loadAll(count = 0, idleChecks = 0) {
        if (running === false && count > 0) {
            return;
        }

        if (count === 0) {
            if (running) {
                return;
            }

            running = true;
        }

        if (count >= MAX_LOADS) {
            console.warn('[TM] Load All stopped: max load count reached');
            running = false;
            return;
        }

        // GitHub may have replaced the previous pagination form.
        addLoadAllButtons();

        const loadMoreButton = getLoadMoreButtons()[0];

        if (!loadMoreButton) {
            // GitHub may currently be between:
            //
            //   Load more… -> Loading… -> Load more…
            //
            // so don't immediately assume we're finished.
            if (idleChecks < MAX_IDLE_CHECKS) {
                setTimeout(
                    () => loadAll(count, idleChecks + 1),
                    CHECK_INTERVAL,
                );
                return;
            }

            console.log(`[TM] Load All complete. Clicked ${count} time(s).`);
            running = false;
            return;
        }

        loadMoreButton.click();

        setTimeout(
            () => loadAll(count + 1, 0),
            CHECK_INTERVAL,
        );
    }

    addLoadAllButtons();
})();
