#!/usr/bin/env python

from peasoup import task_funcs
from peasoup import CurlTask
import argparse
import os
import sys

from doit.tools import run_once, create_folder, title_with_actions

WDIR = '_work'
AVIDA_URL = 'git@github.com:devosoft/avida.git'

@task_funcs.create_task_object
def curl_task(url, target_fn, wdir=WDIR, label=''):
    cmd = 'curl -o {target_fn} {url}'.format(**locals())

    if not label:
        label = 'curl_{target_fn}'.format(**locals())

    return {'title': title_with_actions,
            'name': label,
            'actions': [(create_folder, [wdir]), cmd],
            'targets': [target_fn],
            'uptodate': [run_once],
            'clean': [clean_targets]}

@task_funcs.create_task_object
def git_clone_task(url, target_folder, wdir=WDIR):
    cmd = 'git clone --recursive {url} {target_folder}'.format(**locals())

    if not label:
        label = 'git_clone_{url}'.format(**locals())

    return {'title': title_with_actions,
            'name': label,
            'actions': [(create_folder, [wdir]), cmd],
            'targets': [os.path.join(target_folder, 'build_avida'), target_folder],
            'uptodate': [run_once],
            'clean': [clean_targets]}

@task_funcs.create_task_object
def build_avida_task(folder, label=''):

    cmd = 'cd {folder} && ./build_avida'.format(**locals())
    
    if not label:
        label = 'build_avida_{folder}'.format(**locals())

    return {'title': title_with_actions,
            'name': label,
            'actions': [cmd],
            'file_dep': [os.path.join(folder, 'build_avida')],
            'uptodate': [run_once],
            'clean': [clean_targets]}


def main():
    parser = argparse.ArgumentParser()
    args, doit_args = parser.parse_known_args()

    bin_tasks = [git_clone_task(AVIDA_URL, os.path.join(WDIR, 'avida')),
                build_avida_task(os.path.join(WDIR, 'avida'))]

    run_tasks(bin_tasks, doit_args)

main()
