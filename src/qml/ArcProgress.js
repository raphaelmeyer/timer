
function progress(from, to, value) {
    var normalized = (value - from) / (to - from);
    normalized = Math.max(0, normalized);
    normalized = Math.min(normalized, 1);
    return normalized;
}

function radius(width, height) {
    return Math.min(width, height) * 0.4;
}

function radial_to_x(r, angle) {
    return r * Math.sin(angle);
}

function radial_to_y(r, angle) {
    return -(r * Math.cos(angle));
}

function start_x(width, height, progress) {
    progress = Math.max(progress, 0.001);
    var center_x = width / 2;
    var r = radius(width, height);
    return center_x + radial_to_x(r, 2 * progress * Math.PI);
}

function start_y(width, height, progress) {
    progress = Math.max(progress, 0.001);
    var center_y = height / 2;
    var r = radius(width, height);
    return center_y + radial_to_y(r, 2 * progress * Math.PI);
}

function end_x(width, height) {
    var center_x = width / 2;
    return center_x;
}

function end_y(width, height) {
    var center_y = height / 2;
    return center_y - radius(width, height);
}

