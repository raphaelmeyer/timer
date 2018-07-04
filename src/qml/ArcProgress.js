
function progress(from, to, value) {
    var normalized = (value - from) / (to - from);
    normalized = Math.max(0, normalized);
    normalized = Math.min(normalized, 1);
    return normalized;
}

