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
  done < <(curl 'https://www.jetbrains.com/updates/updates.xml') | LANG=C sort -u
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
  new_versions=()
  while read version; do
    cp -vn "$(get_template_path "$1")" "../$1/$(get_package_name "$1")-$version.ebuild"
    new_versions+=("$version")
  done < <(collect_new "$2" "$3")

  if [[ "${AR_NOAUTOCOMMIT}" -eq 0 ]] && [[ "${#new_versions[@]}" -gt 0 ]]; then
    (
      cd "../$1" && \
        git add . && \
        repoman commit -m "$1: $(echo "${new_versions[@]}")"
    )
  fi
}

mkdir state

jb_updates="/tmp/updates-$RANDOM.tsv"
jb_updates_diff="/tmp/updates-diff-$RANDOM.tsv"
parse_updates > "${jb_updates}"
touch state/updates.tsv
LANG=C comm -23 "${jb_updates}" state/updates.tsv > "${jb_updates_diff}"

update_package dev-db/datagrip-bin 'DataGrip' 'DB-RELEASE-licensing-RELEASE'
update_package dev-util/clion-bin 'CLion' 'CL-RELEASE-licensing-RELEASE'
update_package dev-util/goland-bin 'GoLand' 'GO-RELEASE-licensing-RELEASE'
update_package dev-util/idea-community-bin 'IntelliJ IDEA' 'IC-IU-RELEASE-licensing-RELEASE'
update_package dev-util/idea-ultimate-bin 'IntelliJ IDEA' 'IC-IU-RELEASE-licensing-RELEASE'
update_package dev-util/phpstorm-bin 'PhpStorm' 'PS-RELEASE-licensing-RELEASE'
update_package dev-util/pycharm-community-bin 'PyCharm' 'PC-PY-RELEASE-licensing-RELEASE'
update_package dev-util/pycharm-professional-bin 'PyCharm' 'PC-PY-RELEASE-licensing-RELEASE'
update_package dev-util/rider-bin 'Rider' 'RD-RELEASE-licensing-RELEASE'
update_package dev-util/rubymine-bin 'RubyMine' 'RM-RELEASE-licensing-RELEASE'
update_package dev-util/webstorm-bin 'WebStorm' 'WS-RELEASE-licensing-RELEASE'

LANG=C sort -muo state/updates.tsv "${jb_updates}" state/updates.tsv
rm "${jb_updates}" "${jb_updates_diff}"

git add state
git commit -m "Auto updates - $(date)" state
