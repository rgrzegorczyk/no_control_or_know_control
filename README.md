# NO control or KNOW control? Time to rule your database changes people.

This repository is intended for usage with a presentation called "NO control or KNOW control? TIme to rule your database changes people".
# How to use my DEMO and learn how to track database changes?

**At the beginning, prepare sample objects for a demo by running [demo/prepare_demo/demo.sql](demo/prepare_demo/demo.sql)**

There are four available demo scenarios (best to run it from 1 to 4):
1. [SQLcl_Liquibase](demo/1.SQLcl_Liquibase.md)  - this is the simplest way to track your database changes, but also the most basic one. It requires only SQLcl installation and knowledge of two commands.
2. [demo/2.Liquibase_standalone.md](demo/2.Liquibase_standalone.md) - explains the basic usage of standalone Liquibase. With this demo, you can start using LB on existing / new projects in a few simple steps.
2.A. [demo/2A.Diff_and_snapshots.md](demo/2A.Diff_and_snapshots.md) - this demo is a complementary part of demo 2. It explains how to use diff, snapshot and diff-changelog commands to capture the current state and compare databases + automatically generate SQL scripts to make databases equal.
3. [demo/3.SQLcl_and_APEX.md](demo/3.SQLcl_and_APEX.md) - explains how to export/import APEX objects using SQLcl Liquibase (not fully finished yet)