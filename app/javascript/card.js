const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // 環境変数を読み込む
  const form = document.getElementById("charge-form");  // 「charge-form」とは、カード登録の入力フォームに付与されているid名
  form.addEventListener("submit", (e) => { // submitが実行されると、イベント発火
    e.preventDefault(); // preventDefaultメソッドは、Railsのフォーム送信処理をキャンセルする

    // カード情報の取得先
  const formResult = document.getElementById("charge-form");
  const formData = new FormData(formResult);

  const card = { // カードオブジェクトを生成
      number: formData.get("number"),              // カード番号
      cvc: formData.get("cvc"),                    // カード裏面の3桁の数字
      exp_month: formData.get("exp_month"),        // 有効期限の月
      exp_year: `20${formData.get("exp_year")}`,   // 有効期限の年
    };
  });
};

// setPublicKeyメソッド 公開鍵（PublicKey）を設定する
// getElementByIdメソッド idを元に要素（Element）を取得（get）する
// addEventListenerメソッド イベントを実行する
// insertAdjacentHTMLメソッド ・呼び出し元の要素にHTML要素を追加する、・呼び出し元の要素の近く（Adjacent）であれば、追加出来る場所は複数ある
// removeAttributeメソッド 指定した属性（Attribute）を削除（remove）出来る