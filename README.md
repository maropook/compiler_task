# compiler_task
4年のコンパイラの課題

```
flex sample.l
gcc -o sample lex.yy.c -lfl
./sample
```

1. flex を使って C コードを生成
.l ファイルは、まず flex を使って .c に変換する必要があります。

bash
flex sample.l
このコマンドを実行すると、lex.yy.c という C 言語のソースコードが生成されます。

2. 生成された lex.yy.c をコンパイル
次に、GCC で lex.yy.c をコンパイルします。

bash
gcc -o sample lex.yy.c -lfl
ここで -lfl は、flex が提供するライブラリ libfl をリンクするために必要です。

3. 実行
コンパイルが成功したら、以下のコマンドで実行できます。

bash
./sample
入力を標準入力から受け取るので、テストする場合は以下のように入力してみてください。

bash
echo "123 abc" | ./sample
これにより、sample.l に定義したルールに従って、Number!! や other!! が出力されるはずです。
