
function progress(from, to, value) {
    var normalized = (value - from) / (to - from);
    normalized = Math.max(0, normalized);
    normalized = Math.min(normalized, 1);
    return normalized;
}

function radius(width, height) {
    return Math.min(width, height) * 0.4;
}

function right_start_x(width, height, progress) {
    if(progress > 0.5) {
        return 0;
    } else {
        return (width / 2) + radius(width, height) * Math.sin(2 * progress * Math.PI);
    }
}

function right_start_y(width, height, progress) {
    if(progress > 0.5) {
        return 0;
    } else {
        return (height / 2) - radius(width, height) * Math.cos(2 * progress * Math.PI);
    }
}

function right_end_x(width, height, progress) {
    return width / 2;
}

function right_end_y(width, height, progress) {
    return (height / 2) + radius(width, height);
}

