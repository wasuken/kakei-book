## 購入の流れ

買い物ー＞レシートごとに登録

## 例：

1. 買い物したので,buysテーブルにレコードを登録
```sql
insert into buys(id,date) values(<id>,<日付>)
```

idは挿入する日付を利用してbuysテーブルを検索して、でてきたレコード個数を番号とする。(=buy_id)

2. 買い物でAとB商品を購入したので計上する。

* name amount

* A    100

```sql
insert into items(name,amount) values('A',100)
```

挿入後のidを名前（ユニーク）で検索して取得する。(=item_id)

その後、buy_itemテーブルに以下のレコードを挿入する。

```sql
insert into buy_item(item_id,buy_id,date) values(<item_id>,<buy_id>,<日付>)
```

* B    200

```sql
insert into items(name,amount) values('B',200)
```

挿入後のidを名前（ユニーク）で検索して取得する。(=item_id)

```sql
insert into buy_item(item_id,buy_id,date) values(<item_id>,<buy_id>,<日付>)
```
