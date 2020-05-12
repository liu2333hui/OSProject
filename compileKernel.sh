#!/bin/bash
echo "hello world!"
echo "starting to compile $1"
nasm -I/home/bobkuo/eclipse-workspace/nasmCode/ $1 
