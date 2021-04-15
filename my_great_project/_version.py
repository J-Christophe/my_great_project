# -*- coding: utf-8 -*-
# My Great Project - My Great Project description.
# Copyright (C) 2021 - CNES (Jean-Christophe Malapert for Plato consortium)
#
# This file is part of My Great Project.
#
# My Great Project is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# My Great Project is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with My Great Project.  If not, see <https://www.gnu.org/licenses/>.
"""Project metadata."""
from pkg_resources import DistributionNotFound
from pkg_resources import get_distribution

__name_soft__ = "my_great_project"
try:
    __version__ = get_distribution(__name_soft__).version
except DistributionNotFound:
    __version__ = "0.0.0"
__title__ = "My Great Project"
__description__ = "My Great Project description."
__url__ = "https://github.com/J-Christophe/my_great_project"
__author__ = "Jean-Christophe Malapert"
__author_email__ = "jean-christophe.malapert@cnes.fr"
__license__ = "GNU General Public License v3"
__copyright__ = "2021, CNES (Jean-Christophe Malapert for Plato consortium)"

# https://medium.com/38th-street-studios/creating-your-first-python-package-181c5e31f3f8
# https://antonz.org/python-packaging/
# https://python-packaging.readthedocs.io/en/latest/
# https://github.com/audreyfeldroy/cookiecutter-pypackage/tree/master/%7B%7Bcookiecutter.project_slug%7D%7D
# https://ljvmiranda921.github.io/notebook/2018/06/21/precommits-using-black-and-flake8/
