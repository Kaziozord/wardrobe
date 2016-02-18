var filterArray = [];
var labelFadeInTime = 400;
var labelFadeOutTime = 400;
var itemsListFadeInTime = 400;
var itemsListFadeOutTime = 100;

$(document).on('click', '#submit-new-item', function sendNewItem(event){
  event.preventDefault();
  var itemName = $('#inputName').val();
  var itemDescription = $('#inputDescription').val();

  var states = [];

  $.each($('.dropdown-select-state'), function(){
    states.push($(this).val());
  });

  sendNewItemAjaxRequest(itemName, itemDescription, states);

  $('#close-modal-new-item').click();
  $('#reset-new-item').click();
});

$(document).on('click', '.dropdown-new-item li a', function (event){
  var selectedState = $(event.target).text();

  $(this).parents(".dropdown").find('.btn').html($(this).text() + ' <span class="caret"></span>');
  $(this).parents(".dropdown").find('.btn').val($(this).data('value'));
});

function sendNewItemAjaxRequest(itemName, itemDescription, states) {
  $.ajax({
    type: 'POST',
    url: '/add_item',
    data: {
      itemName: itemName,
      itemDescription: itemDescription,
      states: states
    }
  }).done(function(newHTML){replaceItemsListWith(newHTML)});
};

function replaceItemsListWith(newHTML) {
  $('.items-list').fadeOut(itemsListFadeOutTime, function(){
    $('.items-list').replaceWith($(newHTML).hide().fadeIn(itemsListFadeInTime));
  })
}

$(document).on('click', '.filter-link', function sendRequestAndReplaceItemsList(event) {
  event.preventDefault();
  var filterType = $(event.target).data('filtertype');

  sendListItemsAjaxRequest(filterArray, filterType);
});

function sendListItemsAjaxRequest(filterData, filterType) {
  $.ajax({
    type: 'POST',
    url: "/list_items",
    data: {
      filter: filterData,
      filtertype: filterType
    },
    dataType: 'text'
  }).done(function(newHTML){replaceItemsListWith(newHTML)});
};

$(document).on('click', '.menu-filter', function addFilterAndLabel(event){
  event.preventDefault();
  var filterText = $(event.target).text();

  if (filterNotPresent(filterText)) {
    addLabel(filterText);
    addFilter(filterText);
  }
});

$(document).on('click', '.label-filter', function removeFilterAndLabel(event){
  event.preventDefault();
  var filterText = $(event.target).text();

  removeLabel(event.target)
  removeFilter(filterText);
});

function filterNotPresent(filterToCheck) {
  return (filterArray.indexOf(filterToCheck) === -1 );
};

function addLabel(newFilterText) {
  var labelHTML = "<span class='label label-default label-filter'>"+newFilterText+"</span>"
  $(labelHTML).hide().appendTo('#filter-buttons-group').fadeIn(labelFadeInTime);
};

function addFilter(newFilterText) {
  filterArray.push(newFilterText);
};

function removeLabel(labelElement) {
  $(labelElement).fadeOut(labelFadeOutTime, function(){ $(this).remove(); });
};

function removeFilter(filterTextToRemove) {
  var index = filterArray.indexOf(filterTextToRemove);
  filterArray.splice(index, 1);
};
