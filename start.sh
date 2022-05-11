#!/bin/sh

bin/elephant eval "Elephant.Release.migrate" && \
bin/elephant eval "Elephant.Release.seed" && \
bin/elephant start
