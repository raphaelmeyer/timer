
function progress(from, to, value) {
    var normalized = (value - from) / (to - from);
    normalized = Math.max(0, normalized);
    normalized = Math.min(normalized, 1);
    return normalized;
}

function right_end_x(width, height) {
    return 50;
}

function right_end_y(width, height) {
    return 100;
}
