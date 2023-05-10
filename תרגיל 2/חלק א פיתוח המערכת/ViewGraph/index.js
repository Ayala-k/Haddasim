async function chartValues() {

    let xValues = []
    let yValues = []

    const fetchData = await fetch('http://localhost:3001/corona/getLastMonthCorona',
        {
            method: 'GET',
            headers: { 'Content-type': 'application/json' }
        })
    const results = await fetchData.json();

    for (let i = 0; i < results.length; i++) {
        xValues.push(results[i].date)
        yValues.push(results[i].result)
    }

    new Chart("myChart", {
        type: "line",
        data: {
            labels: xValues,
            datasets: [{
                fill: false,
                lineTension: 0,
                backgroundColor: "rgba(0,0,255,1.0)",
                borderColor: "rgba(0,0,255,0.1)",
                data: yValues
            }]
        },
        options: {
            legend: { display: false },
            scales: {
                yAxes: [{ ticks: { min: 0, max: 10, beginAtZero: true } }],
            }
        }
    });
}

chartValues();