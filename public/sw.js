 
 
var CACHE_STATIC_NAME = 'appV4';
 


this.addEventListener("install", (event) => {
    event.waitUntil(
        caches.open(CACHE_STATIC_NAME).then((cache) => {
            cache.addAll([
                '/static/js/main.chunk.js',
                '/static/js/0.chunk.js',
                '/static/js/bundle.js', 
                '/index.html',
                '/customer',
                '/customer/edit',
                '/customer/list',
                '/list',
                '/item',                
                '/'
            ])
        })
    )
})


this.addEventListener("fetch", (event) => { 


    if(event.request.url === "http://localhost:8000/item/add" ){
        event.waitUntil(
            this.registration.showNotification("Item",{
                body: "New Item Save Successfully",
            })
        )
    }

     

    if (!navigator.onLine) {        
        event.respondWith(
            caches.match(event.request).then((resp) => {
                if (resp) {
                    return resp
                }
                let requestUrl = event.request.clone();
                fetch(requestUrl)
            })
        )
    }
}) 

 

 


this.addEventListener('sync', event => {
    if (event.tag === 'myFirstSync') {
      event.waitUntil(
        event.waitUntil(sendPostToServer())
      );
    }
});

 

async function sendPostToServer() {
    
    console.warn('[Service Worker] Sync Service Worker ....');
    // var db;
    // var request = indexedDB.open("pwaPosReact", 1);  

    // request.onsuccess = function (evt) {
    //     db = request.result; 
    //     var transaction = db.transaction(["tbl_customer"]);
    //     var objectStore = transaction.objectStore("id");
    //     var requesttrans = objectStore.get('1');

    //     requesttrans.onerror = function(event) {

    //     };

    //     requesttrans.onsuccess = function(event) {
    //     alert(requesttrans.result);
    //     };      
    // };


     

    
}

 
 

 


