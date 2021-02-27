Webpacker::Compiler.env["PAYJP_PUBLIC_KEY"] = ENV["PAYJP_PUBLIC_KEY"]

# Railsで設定した環境変数は、
# 今までの記述ではJavaScriptで呼び出す事が出来ません。
# webpackerの設定ファイルを用いることで呼び出す事ができます。