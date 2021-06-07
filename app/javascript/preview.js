document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list');
  document.getElementById('item-image').addEventListener('change',function(e){
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const imageElement = document.createElement('div');
    const textElement     = document.createElement('p');
    const blobElement  = document.createElement('img');


    textElement.textContent = 'プレビュー画像';

    blobElement.setAttribute('src', blob);
    
    blobElement.setAttribute('class','image-js-resize');
    imageElement.appendChild(textElement);
    imageElement.appendChild(blobElement);
    ImageList.appendChild(imageElement);
  });
});