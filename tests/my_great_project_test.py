# -*- coding: utf-8 -*-
import logging

import pytest

import my_great_project


def test_name():
    name = my_great_project.__name_soft__
    assert name == "my_great_project"


def test_logger():
    loggers = [logging.getLogger()]
    loggers = loggers + [
        logging.getLogger(name) for name in logging.root.manager.loggerDict
    ]
    assert loggers[0].name == "root"
    assert loggers[1].name == "my_great_project"
