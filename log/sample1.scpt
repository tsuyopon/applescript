-- ログを出力する単純なサンプルです
-- cf. https://rcmdnk.com/blog/2016/10/27/computer-mac/
-- 
-- 実行すると~/log/sample1.scptとしてログを出力します。
-- 画面上に下記のように出力をします。
--   Log file: ~/log/hoge.log
--   [2022年8月17日 水曜日 8:08:57] test output


property DEBUG : true
property LOG_DIR : "~/log/"
property LOG_FILE : ""

-- Prepare log file
if DEBUG then
  do shell script "mkdir -p " & LOG_DIR
  set LOG_FILE to LOG_DIR & (name of me) & ".log"
  log "Log file: " & LOG_FILE
end if

-- Log output function
on echo(txt)
  if DEBUG then
    do shell script "echo '[" & (current date) & "] " & txt & "' >> " & LOG_FILE
    log "[" & (current date) & "] " & txt 
  end if
end echo

-- Main content

-- Test log
echo("test output")
