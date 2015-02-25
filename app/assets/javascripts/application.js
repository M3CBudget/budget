// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require angular
//= require bootstrap-select
//= require bootstrap-datepicker
//= require highcharts/highcharts
//= require highcharts/highcharts-more
//= require highcharts/highstock
//= require_tree .
$('[data-behaviour~=datepicker]').datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});


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

/*
function addItemRow() {
    var mSec = 0;

    idAttributName =
        "basket_items_attributes_0_name".replace("0", mSec);
    nameAttributName =
        "basket[items_attributes][0][name]".replace("0", mSec);

    idAttributQuantity =
        "basket_items_attributes_0_quantity".replace("0", mSec);
    nameAttributQuantity =
        "basket[items_attributes][0][quantity]".replace("0", mSec);

    idAttributPrice =
        "basket_items_attributes_0_price".replace("0", mSec);
    nameAttributPrice =
        "basket[items_attributes][0][price]".replace("0", mSec);

    idAttributNotice =
        "basket_items_attributes_0_notice".replace("0", mSec);
    nameAttributNotice =
        "basket[items_attributes][0][notice]".replace("0", mSec);

    idAttributCategory =
        "basket_items_attributes_0_category".replace("0", mSec);
    nameAttributCategory =
        "basket[items_attributes][0][category]".replace("0", mSec);

    idAttributIncome =
        "basket_items_attributes_0_income".replace("0", mSec);
    nameAttributIncome =
        "basket[items_attributes][0][income]".replace("0", mSec);

    idAttributLaunch =
        "basket_items_attributes_0_income".replace("0", mSec);
    nameAttributLaunch =
        "basket[items_attributes][0][income]".replace("0", mSec);

    var tr = document.createElement("tr");

    var td0 = document.createElement("td");
    tr.appendChild(td0);
    var inputName = document.createElement("INPUT");
    inputName.setAttribute("type", "text");
    inputName.setAttribute("id", idAttributName);
    inputName.setAttribute("name", nameAttributName);
    td0.appendChild(inputName);

    var td1 = document.createElement("td");
    tr.appendChild(td1);
    var inputQuantity = document.createElement("INPUT");
    inputQuantity.setAttribute("type", "text");
    inputQuantity.setAttribute("id", idAttributQuantity);
    inputQuantity.setAttribute("name", nameAttributQuantity);
    td1.appendChild(inputQuantity);

    var td2 = document.createElement("td");
    tr.appendChild(td2);
    var inputPrice = document.createElement("INPUT");
    inputPrice.setAttribute("type", "text");
    inputPrice.setAttribute("id", idAttributPrice);
    inputPrice.setAttribute("name", nameAttributPrice);
    td2.appendChild(inputPrice);

    var td3 = document.createElement("td");
    tr.appendChild(td3);
    var inputNotice = document.createElement("INPUT");
    inputNotice.setAttribute("type", "text");
    inputNotice.setAttribute("id", idAttributNotice);
    inputNotice.setAttribute("name", nameAttributNotice);
    td3.appendChild(inputNotice);

    var td4 = document.createElement("td");
    tr.appendChild(td4);
    var inputCategory = document.createElement("SELECT");
    inputCategory.setAttribute("id", idAttributCategory);
    inputCategory.setAttribute("name", nameAttributCategory);
    var opt = document.createElement('option');
    opt.value = 1;
    opt.innerHTML = "Test";
    inputCategory.appendChild(opt);
    td4.appendChild(inputCategory);

    var td5 = document.createElement("td");
    tr.appendChild(td5);
    var inputIncome = document.createElement("HIDDEN");
    inputIncome.setAttribute("value", "false");
    inputIncome.setAttribute("id", idAttributIncome);
    inputIncome.setAttribute("name", nameAttributIncome);
    td5.appendChild(inputIncome);

    var td6 = document.createElement("td");
    tr.appendChild(td6);
    var inputLaunch = document.createElement("HIDDEN");
    inputLaunch.setAttribute("value", "false");
    inputLaunch.setAttribute("id", idAttributLaunch);
    inputLaunch.setAttribute("name", nameAttributLaunch);
    td5.appendChild(inputLaunch);

    document.getElementById("items").appendChild(tr);

}*/
/*
function getPurchaseDate(){
    var currentPurchaseDate = document.getElementbyId("basket_purchase_date");
    return currentPurchaseDate;
}
*/

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

        $scope.sum = $scope.sum();
        $scope.sum = Math.round($scope.sum * 100) / 100;

        $scope.reset();
    };

    // Delet Item in Model
    $scope.rem = function($index) {
        $scope.items.splice($index, 1);
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

    $scope.sum = function(){
        var sum = 0;
        for (var item in $scope.items) {
            sum += (item.quantity * item.price);
        }
        return sum;
    };

    $scope.reset();

});

// $('.selectpicker').selectpicker('val', 'Mustard');
