#!/bin/bash
kill $(ps aux | grep 'unison' | awk '{print $2}')

