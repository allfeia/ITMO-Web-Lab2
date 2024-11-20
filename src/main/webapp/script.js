//pagination
document.addEventListener('DOMContentLoaded', function () {
    const table = document.getElementById('resultsTable');
    let items = Array.from(table.getElementsByTagName('tr')).slice(1);
    const itemsPerPage = 5;
    let currentPage = 0;
    let paginationContainer;

    function showPage(page) {
        items = Array.from(table.getElementsByTagName('tr')).slice(1);

        items.sort((a, b) => {
            const timeA = new Date(a.getAttribute('data-time').split('-').reverse().join('-'));
            const timeB = new Date(b.getAttribute('data-time').split('-').reverse().join('-'));
            return timeB - timeA; // Порядок убывания
        });

        const startIndex = page * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;

        items.forEach((item, index) => {
            item.style.display = (index >= startIndex && index < endIndex) ? '' : 'none';
        });

        updateActiveButtonStates();
    }

    function createPageButtons() {
        if (paginationContainer) {
            paginationContainer.remove();
        }

        const totalPages = Math.ceil(items.length / (itemsPerPage - 1));
        paginationContainer = document.createElement('div');
        paginationContainer.classList.add('pagination');
        table.parentNode.insertBefore(paginationContainer, table.nextSibling);

        for (let i = 0; i < totalPages; i++) {
            const pageButton = document.createElement('button');
            pageButton.textContent = i + 1;
            pageButton.classList.add('page-button');
            pageButton.addEventListener('click', () => {
                currentPage = i;
                showPage(currentPage);
            });
            paginationContainer.appendChild(pageButton);
        }
    }

    function updateActiveButtonStates() {
        const pageButtons = document.querySelectorAll('.pagination .page-button');
        pageButtons.forEach((button, index) => {
            if (index === currentPage) {
                button.classList.add('active');
            } else {
                button.classList.remove('active');
            }
        });
    }

    function updatePagination() {
        createPageButtons();
        showPage(currentPage);
    }

    // Вызываем пагинацию при загрузке страницы
    updatePagination();

    //send-post
    function sendRequest(x, y, r, isClick) {
        const data = {
            x: x,
            y: y,
            r: r};
        const jsonData = JSON.stringify(data);
        fetch("controller", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: jsonData
        })
            .then(response => {
                if (!response.ok) {
                    document.getElementById("status").innerText = "Ошибка сервера"
                }
                return response.text();
            })
            .then(result => {
                const newRow = table.insertRow(1);

                const xCell = newRow.insertCell(0);
                const yCell = newRow.insertCell(1);
                const rCell = newRow.insertCell(2);
                const answerCell = newRow.insertCell(3);
                const executionTimeCell = newRow.insertCell(4);
                const currentTimeCell = newRow.insertCell(5);

                xCell.innerText = x;
                yCell.innerText = y;
                rCell.innerText = r;

                const jsonResults = JSON.parse(result);
                for (const jsonResultElement of jsonResults) {
                    answerCell.innerText = jsonResultElement.hit ? "Include" : "Not include";
                    executionTimeCell.innerText = jsonResultElement.executionTime;
                    currentTimeCell.innerText = jsonResultElement.currentTime;

                    if (isClick){
                        drawPoint(x,y,r, jsonResultElement.hit);
                    }

                }

                newRow.setAttribute('data-time', jsonResults.currentTime);

                // Обновляем пагинацию после добавления новой строки
                updatePagination();

            })
            .catch(error => {
                console.log('Error: ', error);
                document.getElementById("status").innerText = "Ошибка"
            });
    }

    function removeError(element) {
        const errorElement = element.parentNode.querySelector('.error-message');
        if (errorElement) {
            errorElement.remove();
        }
    }

    function createError(element, message) {
        const errorElement = document.createElement('div');
        errorElement.className = 'error-message';
        errorElement.innerText = message;
        element.parentNode.appendChild(errorElement);
    }

    //draw point
    const svg = document.getElementById('axis-svg');
    function drawPoint(x, y, r, answer){
        // Создаем новую точку (круг) в SVG
        const circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
        circle.setAttribute("cx", parseFloat(x) / parseFloat(r) * 100 + 150);
        circle.setAttribute("cy", parseFloat(y) / parseFloat(r) * 100 * -1 + 150);
        circle.setAttribute("r", 5);
        if (answer){
            circle.setAttribute("fill", "green");
        }else{
            circle.setAttribute("fill", "red");
        }
        svg.appendChild(circle);

    }

    svg.addEventListener('click', function(event) {

        removeError(document.getElementById('axis-svg')); // Убираем предыдущие ошибки

        const r = document.getElementById('r-select').value;

        if (r === "") {
            createError(document.getElementById('axis-svg'), "Please choose the radius R");
            return; // Останавливаем выполнение, если радиус не выбран
        }

        // Получаем координаты клика
        const rect = svg.getBoundingClientRect();
        const cx = event.clientX - rect.left;
        const cy = event.clientY - rect.top;

        const x = ((cx-150)/100*r).toFixed(2);
        const y = ((cy-150)/100*-1*r).toFixed(2);

        console.log(`Координаты точки: x=${x}, y=${y}`);
        sendRequest(x, y, r, true);
    });

    //validation
    document.getElementById("submit").onclick = function () {

        x = document.getElementById("x-select").value;
        y = document.getElementById("yInput").value;
        r = document.getElementById("r-select").value;

        removeError(document.getElementById("x-select"));
        removeError(document.getElementById("yInput"));
        removeError(document.getElementById("r-select"));

        let valid = true;

        if (x === ""){
            createError(document.getElementById("x-select"), "Please choose the coordinate X");
            valid = false;
        }
        if (r === ""){
            createError(document.getElementById("r-select"), "Please choose the radius R");
            valid = false;
        }

        y = y.replace(',', '.');
        let numberPattern = /^-?\d+(\.\d{1,2})?$/;

        if (y === "") {
            createError(document.getElementById("yInput"), "Please enter the coordinate Y");
            valid = false;

        } else if (!numberPattern.test(y)) {
            createError(document.getElementById("yInput"), "Y must be a number with at most 2 decimal places");
            valid = false;

        } else {
            y = parseFloat(y);

            if (y < -5 || y > 3){
                createError(document.getElementById("yInput"), "Y must be an number between -5 to 3");
                valid = false;
            }
        }

        if (!valid){
            return;
        }

        removeError(document.getElementById("status"));
        sendRequest(x, y, r, false);
    }
});