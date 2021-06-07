document.addEventListener('DOMContentLoaded', function(){
   // input要素をIDで取得してる
  if(document.getElementById('item-image')){
   // ビューファイル内のdiv要素を取得してる
  const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob)=>{
      // 画像を表示させるためのdiv要素
      const imageElement = document.createElement('div');
      // p要素を作り画像表示後に題名をつける
      const textElement     = document.createElement('p');
      textElement.textContent = 'プレビュー画像';
      // ブラウザ上でファイルを貼り付けた瞬間に表示させる画像を取得し生成する
      const blobElement  = document.createElement('img');
      blobElement.setAttribute('src', blob);
      blobElement.setAttribute('class','image-js-resize');
      imageElement.appendChild(textElement);
      imageElement.appendChild(blobElement);
      ImageList.appendChild(imageElement);
    }

      // input要素内の変化で発火する
    document.getElementById('item-image').addEventListener('change',function(e){
      // 画像が表示されてる時のみ画像を削除
    const imageContent = document.querySelector('img');
    const textWithImage= document.querySelector('p');
    if(imageContent){
      imageContent.remove();
      textWithImage.remove();
    }

    // input内に添付されたファイルを取得
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    createImageHTML(blob);
  });
 }
});