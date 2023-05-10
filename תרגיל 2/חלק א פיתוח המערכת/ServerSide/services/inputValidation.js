
function inputValidationOnlyNumbers(str) {
    const pattern = /^[0-9]+$/;
    if (pattern.test(str)) {
        return true
    }
    else {
        return false
    }
}

function inputValidationId(id) {
    return (id && inputValidationOnlyNumbers(id) && id > 0 && id < 999999999)
}

function inputValidationObject(obj) {
    const pattern = /^[a-zA-Z0-9.]+$/;
    for (var key in obj)
        if (!pattern.test(key))
            return false
    return true
}

module.exports = {
    inputValidationId,
    inputValidationObject
}