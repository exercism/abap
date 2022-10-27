# Contribution Guidelines

This is the ABAP track, one of the many tracks on [exercism][web-exercism]. It holds all the _exercises_ that are currently implemented and available for students to complete. Currently, the track consists of practice exercises for students to solve. **Concept** exercises which teach the ABAP syllabus might be introduced at a later stage. You can find this in the [`config.json`][file-config].

It's not uncommon that people discover incorrect implementations of certain tests, have a suggestion for a track-specific hint to aid the student on the _ABAP specifics_, see optimisations in terms of the configurations or other dependencies, report missing edge cases, factual errors, logical errors, and, implement exercises or develop new exercises.

We welcome contributions of all sorts and sizes, from reporting issues to submitting patches, or adding completely new exercises.

## Code of Conduct

Help us keep Exercism welcoming. Please read and abide by the [Code of Conduct][coc].

## Exercises

Before contributing code to any existing exercise or any new exercise, please have a thorough look at the current exercises and dive into [open issues][issue-open].

### New exercise

There are a few ways to implement new exercises (exercises that don't exist in this track).

1. Pick one from [the list of exercises][list-of-exercises].
2. Port an exercism implemented in other tracks (check for example, the [JavaScript Track](https://exercism.org/tracks/javascript/exercises)).
3. Create a new, track-specific exercise from scratch.

#### Implementing existing exercise

The majority of exercises are _practice_ exercises.
These exercises are **not** part of the syllabus (they are not concept exercises), and often have canonical data/shared data between tracks.

Let's say you want to implement a new exercise, from the list of exercises, because you've noticed that this track could benefit from this exercise, really liked it in another track, or just because you find this interesting; the first step is to [check for an open issue][issue-new-exercise].
If it's there, make sure no one is working on it, and most of all that there is not an open Pull Request towards this exercise.

If there is no such issue, you may open one.
The baseline of work is as follows:

1. Open a new issue, we'll label it with `new exercise ✨`
2. We'll assign the issue to you, so you get to work on this exercise
3. Clone this repository to your own SAP system using [abapGit](https://github.com/abapGit/abapGit). We recommend to use SAP package `$EXERCISM`. The folder logic needs to be "Mixed". Track maintainers can create a branch in this repo, others should fork it.
4. Create a subpackage for your exercise named `$EXERCISM_<EXERCISE>`
5. Implement the exercise stub in an ABAP class named `ZCL_<EXERCISE>` (code without solution)
6. Implement unit tests for your ABAP class
  - The default display of tests on the Exercism website shows only ~50 characters
  - For best usability, try to avoid long lines of code in your test class
  - Put `act` and `exp` parameters when calling `cl_abap_unit_assert` on individual lines with little indent
  - [Not so good example](https://github.com/exercism/abap/raw/main/docs/testclass_not_so_good.png)
  - [Good example](https://github.com/exercism/abap/raw/main/docs/testclass_good.png)
7. Stage and commit the SAP package and class 
8. To create an example solution, we recommend the following approach since you can't use abapGit for it:
  - Copy class to `ZCL_<EXERCISE>` to `ZCL_<EXERCISE>_EXAMPLE` *and* put it into SAP package `$TMP` (or another package outside the repo)
  - Implement the solution in `ZCL_<EXERCISE>_EXAMPLE`
  - Add the class code and unit tests (testclasses) to the `.meta` directory of your branch
9. Create an entry in `config.json`: a unique _new_ UUID (you can use [UUID Generator Tool](https://www.uuidgenerator.net/) to generate one), give it a difficulty (should be similar to similar exercises), and make sure the _order_ of the file is sane.
   Currently, the file is ordered first on concept exercise, then on "original core", finally everything else, on difficulty low to high, and ultimately lexicographically.

The final step is opening a Pull Request, with these items all checked off.
Make sure the tests run and the linter is happy. It will run automatically on your PR.

If you want to work on a new _concept_ exercise, please talk to the current maintainers of the track.

### File formats

This repo is compatible with abapGit. This means files have to be formatted in certain ways. The rules are specified in the [`.editorconfig`](/.editorconfig) file. 

If you are creating the exercises in an ABAP system and pushing them to this repo using abapGit (as described above), then the files will be formatted automatically.

However, if you are creating the files manually (in GitHub or another git client), then please make sure that your editor complies with the `.editorconfig` specifications. The typical issues are missing empty line at the end of `.abap` and `.xml` file as well as missing [UTF-8 BOM](https://en.wikipedia.org/wiki/Byte_order_mark) at the beginning of `.xml` files. An easy way to avoid the later is to copy an existing `.xml` file and adjust it accordingly.

#### Creating a track-specific exercise

The steps for a track-specific exercise are similar to those of implementing an established, existing exercise.
The differences are:

- You'll have to write a README.md and test-suite from scratch
- You'll have to come up with a unique _slug_.
- We need to require an icon for it.
- Generate a UUID, for example using [configlet][configlet].

Open a new issue with your proposal, and we'll make sure all these steps are correctly taken.
Don't worry! You're not alone in this.

### Existing exercises

There are always improvements possible on existing exercises.

#### Improving the README.md

For _practice_ exercises, `README.md` is generated from a canonical source.

`README.md`: the description that shows up on the student's exercise page, when they are ready to start.
It's also downloaded as part of the exercise's data. The `README.md`, together with the `<slug>.spec.js` file form the contract for the implementation of the exercise.
No test should _force_ a specific implementation, no `README.md` explanation should _give away_ a certain implementation.
The `README.md` files are [generated][doc-readme], which is explained [here][doc-readme].

- This file may need to be _regenerated_ to sync with the latest canonical data.
- You may contribute track specific `hints.md`, as listed in that [document][doc-readme]
- You may improve the track-specific `exercise-readme-insert.md`, and regenerate all the READMEs.

For _concept_ exercises, `README.md` is generated from the various docs inside the exercise `.docs` directory.

- `introduction.md`: introduce the concept.
  This is placed on top of the file.
- `instructions.md`: the actual exercise instructions.
  These follow the introduction.
- `hints.md`: These are hidden behind a button for each task listed in `instructions.md`

#### Improving or adding mentor notes

Mentor notes are the notes given to the mentors to guide them with mentoring.
These notes _do not live in this repository_, but instead in the `website-copy` repository.
Find their contributing guidelines [here][contributing-website-copy].

## Documentation

There is quite a bit of student-facing documentation, which can be found in the [`docs`][file-docs] folder.
You may improve these files by making the required changes and opening a new Pull Request.

[configlet]: https://exercism.org/docs/building/configlet
[bin-fetch-configlet]: https://github.com/exercism/abap/blob/main/bin/fetch-configlet
[web-exercism]: https://exercism.org
[web-syllabus]: https://exercism.org/tracks/abap/concepts
[file-config]: https://github.com/exercism/abap/blob/main/config.json
[file-docs]: https://github.com/exercism/abap/tree/main/docs
[list-of-exercises]: https://github.com/exercism/problem-specifications/
[issue-open]: https://github.com/exercism/abap/issues
[issue-discussion]: https://github.com/exercism/abap/labels/discussion%20%3Aspeech_balloon%3A
[issue-new-exercise]: https://github.com/exercism/abap/issues?q=is%3Aopen+is%3Aissue+label%3A%22%3Asparkles%3A+new+exercise%22
[contributing-generic]: https://exercism.org/docs/building/tracks
[contributing-website-copy]: https://github.com/exercism/website-copy#contributing
[doc-readme]: https://exercism.org/docs/building/tracks
[problem-specifications]: https://github.com/exercism/problem-specifications
[coc]: https://exercism.org/code-of-conduct
