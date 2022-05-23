# ABAP

[![configlet](https://github.com/exercism/abap/workflows/configlet/badge.svg)](https://github.com/exercism/abap/actions?query=workflow%3Aconfiglet) [![test](https://github.com/exercism/abap/workflows/test/badge.svg)](https://github.com/exercism/abap/actions?query=workflow%3Atest)

**Exercism exercises in ABAP**

This is the ABAP track, one of the many tracks on [Exercism](https://exercism.org/). It holds all the exercises that are currently implemented and available for students to complete. The track consists of various various practice exercises which you can find in the [config.json](https://github.com/exercism/abap/blob/main/config.json).

## Exercises for Students

With exercism, you can solve and test all exercises directly on the [Exercism](https://exercism.org/) website.

Alternatively, you can clone this repository to your own SAP system using [abapGit](https://github.com/abapGit/abapGit). Solve the exercises in your system and bring the solution back to the website.

For details, see [Testing on the ABAP track](https://exercism.org/docs/tracks/abap/tests)

## Contributing to the Track

We welcome contributions of all sorts and sizes, from reporting issues to submitting patches, or added complete new exercises. 

For details, see [Contribution Guidelines](./CONTRIBUTING.md).

## Testing

To test the exercises, run `./bin/test`.
This command will iterate over all exercises and check to see if their exemplar/example implementation passes all the tests.

### Track Linting

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
