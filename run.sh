if [ -z "$BIOMETRICS_ROOT" ]; then
    echo "Set BIOMETRICS_ROOT to the root directory"
fi

find $BIOMETRICS_ROOT -iname "*.html" | xargs rm -f

python3 $BIOMETRICS_ROOT/biometrics_personal/src/daylio_csv/daylio_csv_parser.py
python3 $BIOMETRICS_ROOT/biometrics_genweb/webgen.py || true

git -C $BIOMETRICS_ROOT/web_biometrics/ add -A
git -C $BIOMETRICS_ROOT/web_biometrics/ commit -m "`date`"
git -C $BIOMETRICS_ROOT push origin HEAD:master
