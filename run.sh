#!/usr/bin/env sh

WATCH="${HUGO_WATCH:=false}"
SLEEP="${HUGO_REFRESH_TIME:=-1}"

echo "HUGO_WATCH:" $WATCH
echo "HUGO_REFRESH_TIME:" $HUGO_REFRESH_TIME
echo "HUGO_THEME:" $HUGO_THEME
echo "HUGO_BASEURL" $HUGO_BASEURL
echo "ARGS" $@

HUGO=/usr/local/sbin/hugo
echo "Hugo path: $HUGO"

while [ true ]
do
    if [[ $HUGO_WATCH != 'false' ]]; then
	    echo "Watching..."
        $HUGO server --watch=true --source="/tmp/source" --theme="$HUGO_THEME" --destination="/tmp/output" --baseURL="$HUGO_BASEURL" --bind="0.0.0.0" "$@" --port="$HUGO_PORT" || exit 1
    else
	    echo "Building one time..."
        $HUGO --source="/tmp/source" --theme="$HUGO_THEME" --destination="/tmp/output" --baseURL="$HUGO_BASEURL" "$@" --port="$HUGO_PORT" || exit 1
    fi

    if [[ $HUGO_REFRESH_TIME == -1 ]]; then
        exit 0
    fi
    echo "Sleeping for $HUGO_REFRESH_TIME seconds..."
    sleep $SLEEP
done

# Forked from https://github.com/jojomi/docker-hugo
