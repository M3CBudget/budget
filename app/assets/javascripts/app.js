/**
 * Created by mark on 27/02/15.
 */

$.fn.datepicker.defaults.format = "yyyy-mm-dd";
$.fn.datepicker.defaults.todayHighlight = true;
$.fn.datepicker.defaults.language = 'de';
$.fn.datepicker.defaults.autoclose = true;

$(document).ready(function () {

    $('[data-toggle="offcanvas"]').click(function () {
        $('.row-offcanvas').toggleClass('active')
    });

    $('.foto_enlarge img').on('click', function(){
        img_src = $(this).attr('src');
        if(img_src.indexOf('normal_') > 0)
        {
            $(this).attr('src', img_src.replace("normal_", ""));
            $(this).attr('class','img-responsive');
        }
        else
        {
            $(this).attr('src', img_src.replace("org_", "normal_org_"));
            $(this).attr('class','thumbnail');
        }
    });

    $(".popover-top").popover({
        placement : 'top'
    });

    $(".popover-bottom").popover({
        placement : 'bottom'
    });



});

angular.module('app', []).config(function() { });

angular.module('app').controller('ItemController', function ($scope) {

    // Clear Category initial
    $scope.category = '';

    $id = 0;

    $scope.sum = 0;

    $scope.items = [];

    $scope.add = function() {
        // Count Items
        $id++;



        // Validation
        if(!$scope.valid()) {
            $scope.error();
        };

        // Check if Quantity is empty, if put 1
        if($scope.quantity == 0) {
            $scope.quantity = 1;
        }

        // Check if Notice is used, if not put false

        if(!$scope.notice) {
            $scope.hasNotice = false;
        } else if (!$scope.notice.trim()) {
            $scope.hasNotice = false;
        }

        // Push Input Data to Model
        $scope.items.push(
            {
                id: $id,
                launch: $scope.launch,
                user_id: $scope.user_id,
                name: $scope.name,
                price: $scope.price,
                quantity: $scope.quantity,
                category: $scope.category,
                notice: $scope.notice,
                hasNotice: $scope.hasNotice
            }
        );

        $scope.sum = $scope.getSum();


        $scope.reset();
    };

    // Delet Item in Model
    $scope.rem = function($index) {
        $scope.items.splice($index, 1);
        $scope.sum = $scope.getSum();
    };

    // Clear
    $scope.reset = function () {
        $scope.id = '';
        $scope.name = '';
        $scope.price = '';
        $scope.quantity = 1;
        $scope.notice= '';
    };

    $scope.error = function() {
        alert("Fehler");
    };

    $scope.valid = function() {

        if (!$scope.name || !$scope.price || !$scope.category) {
            return false;
        }
        return true;
    };

    $scope.getSum = function(){
        var sum = 0;


        for(var i=0; i<$scope.items.length; i++){
            sum = sum + ($scope.items[i].price * $scope.items[i].quantity)
        }

        sum = Math.round(sum * 100) / 100;

        return sum;
    };

    $scope.reset();

});

$(document).ready(function() {
    var formId = getFormId();
    var param = "#".concat(formId);

    if(formId == "new_category" || formId.substring(0, 13) == "edit_category"){
        categoryValidation(param);
    }
    else if(formId == "new_vendor" || formId.substring(0, 11) == "edit_vendor") {
        vendorValidation(param);
    }
    else if(formId == "new_payment" || formId.substring(0, 12) == "edit_payment") {
        paymentValidation(param);
    }
    else if(formId == "new_item" || formId.substring(0, 9) == "edit_item") {
        incomeValidation(param);
    }
    else if(formId == "new_basket" || formId.substring(0, 11) == "edit_basket") {
        basketValidation(param);
    }
});

function getFormId() {
    return document.getElementsByTagName('form')[0].id;
}

jQuery.validator.addMethod("decimalPlace", function(value, element) {
    return this.optional(element) || /^\d{0,9}(\.\d{0,2})?$/i.test(value);
}, "You must include two decimal places");

jQuery.validator.addMethod("noDecimalPlace", function(value, element) {
    return this.optional(element) || /^\d{0,9}$/i.test(value);
}, "You must include two decimal places");


function categoryValidation(formId) {
    $(formId).validate({
        errorElement: 'div',
        // Specify the validation rules
        rules: {
            "category[name]": "required"
        },
        // Specify the validation error messages
        messages: {
            "category[name]": "Bitte Namen eingeben!"
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
}

function vendorValidation(formId) {
    $(formId).validate({
        errorElement: 'div',
        // Specify the validation rules
        rules: {
            "vendor[name]": "required"
        },
        // Specify the validation error messages
        messages: {
            "vendor[name]": "Bitte Namen eingeben!"
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
}

function paymentValidation(formId) {
    $(formId).validate({
        errorElement: 'div',
        // Specify the validation rules
        rules: {
            "payment[name]": "required",
            "payment[number]": {
                required: true,
                minlength: 3,
                maxlength: 32
            },
            "payment[bic]": {
                required: true,
                minlength: 12,
                maxlength: 12
            }
        },
        // Specify the validation error messages
        messages: {
            "payment[name]": "Bitte einen Namen eingeben",
            "payment[number]": "Bitte eine valide Kontoummer eingeben",
            "payment[bic]": "Bitte einen validen BIC eingeben"
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
}

function incomeValidation(formId) {
    $(formId).validate({
        errorElement: 'div',
        // Specify the validation rules
        rules: {
            "item[name]": "required",
            "item[price]": {
                required: true,
                number:true,
                decimalPlace: true
            },
            "item[category_id]": "required",
            "item[period]": {
                required: true,
                number: true,
                noDecimalPlace: true
            },
            "item[launch]": {
                required: true
            },
            "item[finish]": {
                required: true
            }
        },
        // Specify the validation error messages
        messages: {
            "item[name]": "Bitte einen Namen eingeben",
            "item[price]": "Bitte die Höhe des Einkommens eingeben",
            "item[category_id]": "Bitte eine Kategorie eingeben",
            "item[period]": "Bitte eine Periode eingeben",
            "item[launch]": "Bitte ein Startdatum eingeben",
            "item[finish]": "Bitte ein valides Enddatum eingeben"
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
}

function basketValidation(formId) {
    $(formId).validate({
        errorElement: 'div',
        // Specify the validation rules
        rules: {
            "basket[vendor_id]": "required",
            "basket[purchase_date]": {
                required: false
            },
            "basket[items_attributes][1][name]": {
                required: true
            },
            "basket[items_attributes][1][quantity]": {
                required: true,
                min: 1,
                number: true,
                noDecimalPlace: true
            },
            "basket[items_attributes][1][price]": {
                required: true,
                number: true,
                decimalPlace: true

            },
            "basket[items_attributes][1[category_id]": "required",
            "basket[payment_id]": "required",
            "basket[amount]": {
                required: true,
                number: true,
                decimalPlace: true
            }
        },
        // Specify the validation error messages
        messages: {
            "basket[vendor_id]": "Bitte einen Händler eingeben",
            "basket[purchase_date]": "Bitte ein datum eingeben",
            "basket[items_attributes][1][name]": "Bitte einen Artikelnamen eingeben",
            "basket[items_attributes][1][quantity]": "Bitte eine Artikelanzahl eingeben",
            "basket[items_attributes][1][price]": "Bitte einen Artikelprice eingeben",
            "basket[items_attributes][1][category_id]": "Bitte eine Artikel Kategorie eingeben",
            "basket[payment_id]": "Bitte eine Zahlungsmethode eingeben",
            "basket[amount]": "Biitte einen Betrag eingeben"
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
}
