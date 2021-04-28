# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit latex-package

RELEASE_DATE=2016-03-29

DESCRIPTION="A TikZ extension to manage common UML diagrams"
HOMEPAGE="https://perso.ensta-paris.fr/~kielbasi/tikzuml/"
SRC_URI="https://perso.ensta-paris.fr/~kielbasi/tikzuml/var/files/src/tikzuml-v${PV}-${RELEASE_DATE}.tbz"

LICENSE="all-rights-reserved" # can't find any?
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND} dev-tex/pgf"
BDEPEND=""

S="${WORKDIR}/${PN}-v${PV}-${RELEASE_DATE}"
