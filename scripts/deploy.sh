#!/bin/bash

hugo &&
hugo deploy &&
aws cloudfront create-invalidation --distribution=ELJZDBLCTCBH2 --paths="/*" >&1
