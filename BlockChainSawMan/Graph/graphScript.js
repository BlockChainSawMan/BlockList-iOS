window.renderGraph = function(data) {
    const width = window.innerWidth;
    const height = window.innerHeight;
    const svg = d3.select("#graph");
    svg.attr("width", width).attr("height", height);
    svg.selectAll("*").remove();

    // Links
    const link = svg.append("g")
        .selectAll("line")
        .data(data.edges)
        .enter().append("line")
        .style("stroke", "#aaa")
        .style("stroke-width", d => Math.max(1, Math.log(d.amount + 1)));

    // Nodes
    const node = svg.append("g")
        .selectAll("circle")
        .data(data.nodes)
        .enter().append("circle")
        .attr("r", 43)
        .attr("fill", d => {
            if (d.entity_type === "Normal User") return "#2C4543";
            if (d.entity_type === "unknown") return "#484A54";
            return "#4F2522";
        })
        .attr("stroke", d => {
            // border 색상 추가
            if (d.entity_type === "Normal User") return "#4BC79D";
            if (d.entity_type === "unknown") return "#C4C4C4";
            return "#FF2F00";
        })
        .attr("stroke-width", 2) 
        .call(
            d3.drag()
                .on("start", dragstarted)
                .on("drag", dragged)
                .on("end", dragended)
        )
        .on("click", (e, d) => {
            window.webkit.messageHandlers.graphEvent.postMessage(d.id);
        });

    const label = svg.append("g")
        .selectAll("text")
        .data(data.nodes)
        .enter().append("text")
        .text(d => d.id)
        .attr("font-size", "20")
        .attr("fill", "#FFFFFF")
        .attr("text-anchor", "middle")
        .attr("dominant-baseline", "middle");

    const simulation = d3.forceSimulation(data.nodes)
        .force("link", d3.forceLink(data.edges).id(d => d.id).distance(300))
        .force("charge", d3.forceManyBody().strength(-500))
        .force("center", d3.forceCenter(width / 2, height / 2))
        .on("tick", () => {
            link
                .attr("x1", d => d.source.x)
                .attr("y1", d => d.source.y)
                .attr("x2", d => d.target.x)
                .attr("y2", d => d.target.y);

            node
                .attr("cx", d => d.x)
                .attr("cy", d => d.y);

            label
                .attr("x", d => d.x)
                .attr("y", d => d.y);
        });

    function dragstarted(event, d) {
        if (!event.active) simulation.alphaTarget(0.3).restart();
        d.fx = d.x;
        d.fy = d.y;
    }

    function dragged(event, d) {
        d.fx = event.x;
        d.fy = event.y;
    }

    function dragended(event, d) {
        if (!event.active) simulation.alphaTarget(0);
        d.fx = null;
        d.fy = null;
    }
};
