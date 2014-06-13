chrome.browserAction.onClicked.addListener( function(tab){
  console.log("An occurrence is transpiring!");
  chrome.tabs.executeScript({
    code: 'document.body.style.backgroundColor="red"'
  })
})
