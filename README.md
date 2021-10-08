# Exercism ABAP Track

[![configlet](https://github.com/exercism/abap/workflows/configlet/badge.svg)](https://github.com/exercism/abap/actions?query=workflow%3Aconfiglet) [![test](https://github.com/exercism/abap/workflows/test/badge.svg)](https://github.com/exercism/abap/actions?query=workflow%3Atest)

Exercism exercises in ABAP.

## Testing

To test the exercises, run `./bin/test`.
This command will iterate over all exercises and check to see if their exemplar/example implementation passes all the tests.

### Track linting

[`configlet`](https://exercism.org/docs/building/configlet) is an Exercism-wide tool for working with tracks. You can download it by running:

```shell
$ ./bin/fetch-configlet
```

Run its [`lint` command](https://exercism.org/docs/building/configlet/lint) to verify if all exercises have all the necessary files and if config files are correct:

```shell
$ ./bin/configlet lint

The lint command is under development.
Please re-run this command regularly to see if your track passes the latest linting rules.

Basic linting finished successfully:
- config.json exists and is valid JSON
- config.json has these valid fields:
    language, slug, active, blurb, version, status, online_editor, key_features, tags
- Every concept has the required .md files
- Every concept has a valid links.json file
- Every concept has a valid .meta/config.json file
- Every concept exercise has the required .md files
- Every concept exercise has a valid .meta/config.json file
- Every practice exercise has the required .md files
- Every practice exercise has a valid .meta/config.json file
- Required track docs are present
- Required shared exercise docs are present
```
