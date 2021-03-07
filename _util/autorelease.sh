#!/bin/sh

rdom() {
  local IFS=\>
  read -d \< E C
}

tag_id() {
  cut -d ' ' -f1 <<< "$1"
}

match_tag_id() {
  [[ "$1" =~ ^"$2"(' '|$) ]]
}

tag_prop() {
  sed -nE "s/.*$2=\"([^\"]*)\".*/\1/p" <<< "$1"
}

match_tag_prop() {
  [[ "$(tag_prop "$1" "$2")" == "$3" ]]
}

extract_versions() {
  product=''
  channel=''

  while rdom; do
    if \
      [[ "${product}" = "$1" ]] &&
      [[ "${channel}" = "$2" ]] &&
      match_tag_id "$E" 'build'
    then
      tag_prop "$E" "$3"
    elif match_tag_id "$E" 'channel'; then
      channel="$(tag_prop "$E" 'id')"
    elif match_tag_id "$E" '/channel'; then
      channel=''
    elif match_tag_id "$E" 'product'; then
      product="$(tag_prop "$E" 'name')"
    elif match_tag_id "$E" '/product'; then
      product=''
    fi
  done
}

collect_new() {
  current="/tmp/$1-current-$RANDOM"

  extract_versions "$2" "$3" "$4" < "${jb_updates}" | sort -u > "$current"

  touch "state/$1"
  comm -23 "$current" "state/$1"

  sort "state/$1" "$current" -muo "state/$1"
  rm "$current"
}

mkdir state

jb_updates="/tmp/updates-$RANDOM.xml"
wget -O "${jb_updates}" 'https://www.jetbrains.com/updates/updates.xml'

while read version; do
  cp -nv 'templates/idea-ultimate-bin.ebuild.in' "idea-ultimate-bin/idea-ultimate-bin-$version.ebuild"
done < <(collect_new 'idea' 'IntelliJ IDEA' 'IC-IU-RELEASE-licensing-RELEASE' 'version')

while read version; do
  cp -nv 'templates/clion-bin.ebuild.in' "clion-bin/clion-bin-$version.ebuild"
done < <(collect_new 'clion' 'CLion' 'CL-RELEASE-licensing-RELEASE' 'version')

while read version; do
  cp -nv 'templates/pycharm-professional-bin.ebuild.in' "pycharm-professional-bin/pycharm-professional-bin-$version.ebuild"
done < <(collect_new 'pycharm' 'PyCharm' 'PC-PY-RELEASE-licensing-RELEASE' 'version')

while read version; do
  cp -nv 'templates/rider-bin.ebuild.in' "rider-bin/rider-bin-$version.ebuild"
done < <(collect_new 'rider' 'Rider' 'RD-RELEASE-licensing-RELEASE' 'version')

rm "${jb_updates}"
