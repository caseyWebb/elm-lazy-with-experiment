#!/usr/bin/env bash

sed -i "s/return \$author\$project\$Main\$placeholder;/if(!view_.memo||!compare(view_.memo, a)){view_.memo=a;view_.view=view_(a);}return view_.view;/g" $1