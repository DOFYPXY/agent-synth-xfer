# Agent Synthesis

LLM-based synthesis of transfer functions using [Pydantic AI](https://ai.pydantic.dev/) with an eval tool; the agent can iterate until the transformer passes eval.

## Setup

Set your API key in the environment (the env var depends on the provider you choose — `OPENAI_API_KEY` for OpenAI, `ANTHROPIC_API_KEY` for Anthropic, etc.):

```bash
export OPENAI_API_KEY=sk-...
```

Or put it in `.env` and `source .env`.

Then re-run `pip install -e .` to pick up the `pydantic-ai-slim[openai]` dependency.

## Quick Run

```bash
agent-synth mlir/Operations/Add.mlir \
    -o outputs/ag \
    --synth-model openai-responses:gpt-5.1-codex-mini
```

Multi-op example used as the smoke test for this project:

```bash
agent-synth mlir/Operations/And.mlir mlir/Operations/Or.mlir \
    --synth-model openai-responses:gpt-5.1-codex-mini \
    --library-model openai-responses:gpt-5.1-codex-mini \
    --rounds 1 --max-turns 10 \
    -o outputs/agent
```

## Model strings

Both `--synth-model` and `--library-model` take a Pydantic AI model identifier. Format is `<provider>:<model>`:

| Provider | Example |
|---|---|
| OpenAI Chat Completions | `openai:gpt-4o` |
| OpenAI Responses API (Codex / o-series) | `openai-responses:gpt-5.1-codex-mini` |
| Anthropic | `anthropic:claude-sonnet-4-5` |
| Google | `google:gemini-2.0-flash` |

See the [Pydantic AI model docs](https://ai.pydantic.dev/models/) for the full list. Codex / o-series models **must** use the `openai-responses:` prefix or the call will 404.

## Options

| Option | Description |
|--------|-------------|
| `op_file` | Operation MLIR file(s) (e.g. `mlir/Operations/And.mlir mlir/Operations/Or.mlir`). Mutually exclusive with `--benchmark`. |
| `--benchmark` | Path to a `bench.yaml` file specifying ops per domain (see below). Mutually exclusive with `op_file`. |
| `-i, --input` | One or more EnumData TSV datasets used for eval-driven synthesis (`--input a.tsv b.tsv ...`). Task/op and bitwidths come from each dataset's metadata. |
| `-o, --output` | Output directory (default: `outputs/agent`). |
| `--synth-model` | Pydantic AI model string for synthesis (default: `openai-responses:gpt-5.2-codex`). |
| `--library-model` | Pydantic AI model string for library learning / compression (default: `openai-responses:gpt-5.1-codex-mini`). |
| `--max-turns` | Cap on agent iterations per round (default: 20; use 2-3 for fast dev). |
| `--rounds` | Number of library-update rounds; `0` = synthesis-only (default: `0`). |
| `--meet` | Accumulate solutions across rounds into a `SolutionSet` and combine them via meet. |
| `--no-learn` | Skip the library learning step after each synthesis round. |

## Dataset mode (`--input`)

- Accepts only EnumData TSV files (frontmatter + tab-separated rows), not plain CSV.
- One TSV per op; pass multiple TSV paths to synthesize multiple ops in one run.
- Do not combine with `op_file`, `--benchmark`, `--lbw`, `--mbw`, or `--hbw`.
- Currently `KnownBits` datasets only.

```bash
agent-synth --input kb_and_input_data.tsv kb_or_input_data.tsv -o outputs/agent-kb
```

## Benchmark mode (`--benchmark`)

Instead of listing MLIR files on the command line, specify operations in a YAML file:

```yaml
# bench.yaml
KnownBits:
  concrete_ops: [And, Or]
```

```bash
agent-synth --benchmark bench.yaml \
    -o outputs/test-lib/ \
    --synth-model openai-responses:gpt-5.1-codex-mini \
    --rounds 2
```

Op names in `concrete_ops` are resolved to `mlir/Operations/{Name}.mlir` relative to the project root.

Each run prints the model in use and token usage (input / cached_input / output). The agent is prompted to reason about the operation and KnownBits before writing MLIR and to use multiple turns to improve quality rather than stopping at the first candidate that passes eval.

## Meet Mode

`--meet` enables meet-combination across synthesis rounds: each round's best solution is accumulated into a `SolutionSet`, and the final result is the meet of all collected solutions. This typically yields a more precise transformer than any single round alone.

`--no-learn` disables library learning between rounds — useful when you want to test meet-combination in isolation or when you don't yet have a library to update.

Single-op run with meet mode and no library learning (fast test):

```bash
agent-synth mlir/Operations/Umax.mlir \
    -o outputs/umax                   \
    --synth-model openai-responses:gpt-5.1-codex-mini \
    --rounds 3                        \
    --meet                            \
    --no-learn
```

Multi-op run with meet mode and library learning enabled:

```bash
agent-synth mlir/Operations/Umin.mlir mlir/Operations/Umax.mlir \
    -o outputs/meet-test              \
    --synth-model openai-responses:gpt-5.1-codex-mini \
    --rounds 3                        \
    --meet
```
