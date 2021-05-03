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

parse_updates() {
  product=''
  channel=''

  while rdom; do
    if match_tag_id "$E" 'build'; then
      printf 'version\t%s\t%s\t%s\n' "${product}" "${channel}" "$(tag_prop "$E" 'version')"
    elif match_tag_id "$E" 'channel'; then
      channel="$(tag_prop "$E" 'id')"
    elif match_tag_id "$E" '/channel'; then
      channel=''
    elif match_tag_id "$E" 'product'; then
      product="$(tag_prop "$E" 'name')"
    elif match_tag_id "$E" '/product'; then
      product=''
    fi
  done < <(curl 'https://www.jetbrains.com/updates/updates.xml') | sort -u
}

collect_new() {
  grep "$(printf 'version\t%s\t%s\t' "$1" "$2")" "${jb_updates_diff}" | cut -f4
}

get_template_path() {
  echo "templates/$(get_package_name $1).ebuild.in"
}

get_package_name() {
  basename "$1"
}

update_package() {
  while read version; do
    cp -n "$(get_template_path "$1")" "../$1/$(get_package_name "$1")-$version.ebuild"
  done < <(collect_new "$2" "$3")
}

mkdir state

jb_updates="/tmp/updates-$RANDOM.tsv"
jb_updates_diff="/tmp/updates-diff-$RANDOM.tsv"
parse_updates > "${jb_updates}"
touch state/updates.tsv
comm -23 "${jb_updates}" state/updates.tsv > "${jb_updates_diff}"

update_package dev-util/idea-ultimate-bin 'IntelliJ IDEA' 'IC-IU-RELEASE-licensing-RELEASE'
update_package dev-util/clion-bin 'CLion' 'CL-RELEASE-licensing-RELEASE'
update_package dev-util/pycharm-professional-bin 'PyCharm' 'PC-PY-RELEASE-licensing-RELEASE'
update_package dev-util/rider-bin 'Rider' 'RD-RELEASE-licensing-RELEASE'
update_package dev-util/webstorm-bin 'WebStorm' 'WS-RELEASE-licensing-RELEASE'

sort -muo state/updates.tsv "${jb_updates}" state/updates.tsv
rm "${jb_updates}" "${jb_updates_diff}"

git add state
git commit -m "Auto updates - $(date)" state
