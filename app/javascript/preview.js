document.addEventListener('DOMContentLoaded', function(){
   // ①input要素をIDで取得してる
  if(document.getElementById('item-image')){
   // ②ビューファイル内のdiv要素を取得してる
  const ImageList = document.getElementById('image-list');

    // ⑤で呼び出す関数
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

      //③ input要素内の変化で発火する
    document.getElementById('item-image').addEventListener('change',function(e){
      // 画像が表示されてる時のみ画像を削除
    const imageContent = document.querySelector('img');
    const textWithImage= document.querySelector('p');
      if(imageContent){
        imageContent.remove();
        textWithImage.remove();
    }

    //④ input内に添付されたファイルを取得
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    //⑤ プレビュー機能をHTML内に埋め込む関数
    createImageHTML(blob);
  });
 }
});