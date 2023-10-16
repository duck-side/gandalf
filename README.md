# 🧙🏻‍♂️ Gandalf

Gandalf helps you to block further jobs based on time. He only needs to know between which hours and weekdays the gateway needs to be blocked.

## Input

The input Gandalf needs is the following.

| Input      | Description                                                         | Required |
| ---------- | ------------------------------------------------------------------- | -------- |
| respond    | You can overwrite the output by providing either `true` or `false`. | ❌       |
| startHours | The starting hours as number, e.g. `8` for 8 am                     | ✅       |
| endHours   | The ending hours as number, e.g. `17` for 5 pm                      | ✅       |
| startDay   | The starting day of the week as number, e.g. `1` for Monday         | ✅       |
| endDay     | The ending day of the week as number, e.g. `5` for Friday           | ✅       |

## Output

The output you receive from Gandalf is a boolean property called `you-shall-pass`. Based on this you can do further decisions for your pipeline.

## Example

The following is a basic example for using Gandalf with the resulting output.

```yml
jobs:
  gate-keeper:
    runs-on: ubuntu-latest
    name: Gandalf
    outputs:
      you-shall-pass: ${{ steps.gandalf.outputs.you-shall-pass }}
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Ask Gandalf
        id: gandalf
        with:
          startHours: 8
          endHours: 17
          startDay: 1
          endDay: 5
        uses: duck-side/gandalf

  deploy:
    if: needs.gandalf.outputs.you-shall-pass == 'true'
    runs-on: ubuntu-latest
    name: Deployment
    needs: gate-keeper
    steps:
      - name: Deployment
        run: echo "Runs only if Gandalf allows it"
```
