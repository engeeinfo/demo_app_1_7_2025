'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "2866984f309e98828c0d22f63086eb46",
".git/config": "1a88a1ce10562658ceb9a19760738d6e",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "0c0ffe514180c90106917f6e3c78e5ee",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "06b0bfe558b0941a965cf5453c7998a4",
".git/logs/refs/heads/gh-pages": "06b0bfe558b0941a965cf5453c7998a4",
".git/objects/03/10758b8e893edc28e82b2004a15608f16229b8": "4cd3be0ce965ddc6e64001df36ee1bf9",
".git/objects/11/8e1f1141ea189e77b4d5ae5e836aa116dc8219": "8d7f28f0fcfd71d3ac45e62d934a985c",
".git/objects/11/ca4099e623c5b87c81518f2b19b799356e6e64": "d47abb7e3eb741ea3cbd73de3ed2ed77",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/22/a23d26db8d78973e2ab55b7b13aface71cf79a": "60d33423c6b384d5df8b0a1b01116986",
".git/objects/3c/d95e294b42a68d683d607d443442102b48a39a": "573e8068638a2f93d71bb8cc0d0c2abd",
".git/objects/45/074c0fd22fb4bf23b11971fa60b11ec0155318": "7f16a1bcb9cc0caab4fbe81574810a71",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4c/51fb2d35630595c50f37c2bf5e1ceaf14c1a1e": "a20985c22880b353a0e347c2c6382997",
".git/objects/51/d204c5a99337ce9d152d8e759cac9867874146": "c49f5b719a20397cf509e1140aa596e6",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/5b/f85a4974e17df9181b5a0bb2ad24014f80bfc3": "ff0dbc949af1f3cde9ebc98738a0d769",
".git/objects/60/68d67e60cc56feda966a9594d37b2cad7908da": "0db25bdc2e85875d1ecbc695ea91eee3",
".git/objects/65/8dd105e61991a88d53eae3312216df71476754": "57655435809b5d5933f3396b780f7966",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/77/cdcfbeb4411607dc8c1d033ac0083b0cc0c707": "afa07c9f6e0d76dfd78f6717d8e77853",
".git/objects/7d/1ab7f3f08320757629f35d28416b96e335495b": "b4a1071aa451a9ce5d9bc48f0629afee",
".git/objects/7d/e5b082c0bee855ed2a0494114e92ff9c8015cb": "b136d5b570bc3a499d8e714c121719ab",
".git/objects/8e/3c7d6bbbef6e7cefcdd4df877e7ed0ee4af46e": "025a3d8b84f839de674cd3567fdb7b1b",
".git/objects/93/8d134d8d9209e3cbe6e407bca648ab97672c8e": "c8f59bbbb81448a925f754f03c81558a",
".git/objects/99/bdb41327bb5f0114be1c3db9e0b140301cd917": "df9668a3ba6d26c27417460983dca762",
".git/objects/99/ff1c9dc7f5a9509478db19923997f3a1f4d02f": "382b2773dfa4e616a2716d6076ddb390",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/a7/cf853d364fbd23d53a41c061f5b16c2da02231": "b6ddc6d9a24038d4a3101bf5e46ca920",
".git/objects/ad/c7a6e6bf59b31784603c1be1d09d911a7c8b7b": "763900262cbaa7a44f4b4d3b3c9eecd4",
".git/objects/b4/120743153f662dfd060638b7762f9817bda027": "d430263edcfe7b8925537a076f7143a0",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/bb/d3d0f1038fa6875c12f0f299bbc59f98c73ca1": "9e8a9aa4c3c98b5a74541cf39083781f",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/cc/c6d53c45298d90cc5fece74ff35796572ad698": "b65cf0c3b4eaea0c22ce2903300e2661",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/14becf9736b8b9742e37dc004f66758ef17061": "d4966375b22a9a5a2686bc80dce30c58",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/ea/2005c0d474697226bbb10b3d87ba2d291a74fd": "f465143edb768e5095266f5399bc651b",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f3/b55cefa7ff168865cb8ed93d2d061a6fe41a14": "cec57c19edfadec3c4d81268203e5ebb",
".git/objects/f4/d7fb3a3369af692dde38a81f331d8f89052b31": "fefdf1e726a248e60f8998d12c526002",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/fd/07ccab5c677863943ecb1fca522b9975ebed54": "1b9b35ac3051a4e769e32a4111a41657",
".git/refs/heads/gh-pages": "bc5ae3ced45e38751a86055d254b262c",
"assets/asset/images/leaves.jpg": "af4864679fbeb06a22b9bfc97437b52c",
"assets/asset/images/logo.png": "728dc072b00397c422931f00825c1efd",
"assets/asset/lotties/Animation.json": "925689b187a9f9f1e52938bfb1b41170",
"assets/AssetManifest.bin": "87b9d5d90cdc799d794430fec63fe279",
"assets/AssetManifest.bin.json": "2857366df2da289e3d858732e33cac6e",
"assets/AssetManifest.json": "c9707ae940534fb9b7e958e6d66359bd",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "06c8c1d2000853296f32f399ae734ada",
"assets/NOTICES": "0a916143dbadd66158e18b39f2dd382f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "e27c6bb6d17a3816d895a540566d22d2",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "4befb668d04b26f8a2ea4387dbf17345",
"icons/Icon-192.png": "600641b81cabb6467688e0c903c59645",
"icons/Icon-512.png": "9e72f9110f54ac8b3b71f9e255e28e50",
"icons/Icon-maskable-192.png": "600641b81cabb6467688e0c903c59645",
"icons/Icon-maskable-512.png": "9e72f9110f54ac8b3b71f9e255e28e50",
"index.html": "7d7b46ae3174b1880a7c2065f0adc2de",
"/": "7d7b46ae3174b1880a7c2065f0adc2de",
"main.dart.js": "1d18e035a7def91c12cccb70607b6dad",
"manifest.json": "8438c96b7adba1911dd63bd323198939",
"version.json": "2c247f01862f6a7ccc8c4550f5b63220"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
