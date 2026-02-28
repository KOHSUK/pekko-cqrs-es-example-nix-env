# pekko-cqrs-es-example-nix-env

[j5ik2o/pekko-cqrs-es-example](https://github.com/j5ik2o/pekko-cqrs-es-example) をローカルで動かすための Nix flake + direnv 設定です。

元リポジトリは [こちらの記事](https://tech-book.precena.co.jp/entry/pekko-cqrs-es-guide) で解説されている Apache Pekko を使った CQRS/ES のサンプル実装です。

## 提供する開発環境

`flake.nix` で以下のツールを管理します：

| カテゴリ | ツール |
|---|---|
| Java / Scala | Temurin JDK 21、SBT、Scala 3 |
| インフラ | Docker Compose |
| AWS (LocalStack) | AWS CLI v2 |
| データベース | PostgreSQL 16 クライアント |
| Protocol Buffers | protoc |

環境変数 `JAVA_HOME` と `PROTOC_PATH` は `shellHook` で自動設定されます。

## 使い方

### 前提条件

- [Nix](https://nixos.org/download/) (flakes 有効化済み)
- [direnv](https://direnv.net/)

### セットアップ

```bash
# 1. この設定リポジトリをクローン（任意の場所）
git clone https://github.com/KOHSUK/pekko-cqrs-es-example-nix-env.git

# 2. 対象リポジトリをクローン
git clone https://github.com/j5ik2o/pekko-cqrs-es-example.git
cd pekko-cqrs-es-example

# 3. flake.nix と .envrc をコピー（またはシンボリックリンク）
cp /path/to/pekko-cqrs-es-example-nix-env/flake.nix .
cp /path/to/pekko-cqrs-es-example-nix-env/.envrc .

# 4. direnv を許可
direnv allow
```

direnv が自動的に `nix develop` を実行し、開発環境が有効になります。

### 動作確認

```bash
java -version   # Temurin 21 が表示されれば OK
sbt --version
docker compose version
aws --version
```

## 関連リンク

- [j5ik2o/pekko-cqrs-es-example](https://github.com/j5ik2o/pekko-cqrs-es-example) — 対象リポジトリ
- [解説記事](https://tech-book.precena.co.jp/entry/pekko-cqrs-es-guide) — pekko-cqrs-es-guide
