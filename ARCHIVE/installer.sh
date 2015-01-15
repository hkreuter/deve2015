#!/bin/bash
# http://linuxconfig.org/bash-scripting-tutorial

args=("$@")
ARGVAR=${args[0]}
VAGRANTSYNC=${args[1]}
CURDIR=`pwd`
INSTDIR="${CURDIR}/${ARGVAR}"

ARCH="deve2015"
PROJ="playground"
INSTGIT="https://github.com/hkreuter/deve2015.git"
PROJECTGIT="https://github.com/hkreuter/playground.git"

if [ -z $ARGVAR ]; then
echo "Missing argument for project dir, cannot proceed!"
    echo ""
    exit
else
    echo ""
    echo "Installation directory is ${INSTDIR}"
    echo ""
    TEST=`test -d $ARGVAR && echo 'exists' || echo 'nope'`
    if [ 'exists' = $TEST ]; then
        echo "Directory ${INSTDIR} already exists."
    else
        echo "Creating subdirectory ${ARGVAR} inside ${CURDIR}"
        `mkdir ${ARGVAR}`
    fi
    echo ""
fi

cd ${INSTDIR}
WORKDIR=`pwd`
echo "Working directory is ${ARGVAR}"
echo ""
echo "Installing project"
echo ""

#cloning/updating puppet stuff
if [ -d $ARCH ]; then
    cd $ARCH
    git pull
    cd ..
else
    git clone $INSTGIT
fi

#cloning/updating project stuff
if [ -d $PROJ ]; then
    cd $PROJ
    git pull
    cd ..
else
    git clone $PROJECTGIT

    # create links
    MODULES="../../${ARCH}/modules/"

    FULLDIR="${INSTDIR}/${PROJ}"
    cd $FULLDIR
    cd vmconfig
    THEDIR=`pwd`
    echo "Working directory is ${THEDIR}"
    echo ""

    echo "- linking ${MODULES} to modules"
    ln -s $MODULES modules

fi

echo ""
echo "Creating vm, installing project"

THEDIR=`pwd`
echo "Working directory is ${THEDIR}"
vagrant up

