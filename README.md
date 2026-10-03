# Homebrew-тап Cadence Lab

CLI `clab` — работа с [Cadence Lab](https://sdlc.food-cart.ru) из терминала:
задачи, гейты, апрувы, подключение агента по MCP.

```bash
brew trust cadence-lab-tech/tap          # Homebrew 6: сторонние тапы грузятся только после доверия
brew install cadence-lab-tech/tap/clab
clab auth login --host https://<адрес сервиса>
```

Ставятся `clab` и `clab-runner`. Обновление — `brew upgrade clab`.

Тап и релизы публичные: ни токена GitHub, ни участия в организации не нужно.
Архивы под macOS, Linux и Windows лежат в [релизах этого
репозитория](https://github.com/cadence-lab-tech/homebrew-tap/releases) —
формула качает их по прямой ссылке и сверяет сумму из `checksums.txt`. Код
сервиса остаётся закрытым, наружу выходят только бинарники CLI.

## Без Homebrew

`install.sh` качает архив под свою платформу и `checksums.txt`, сверяет
сумму и кладёт `clab` и `clab-runner` в `/usr/local/bin` или `~/.local/bin`:

```bash
curl -fsSL https://raw.githubusercontent.com/cadence-lab-tech/homebrew-tap/main/install.sh | sh
```

`CLAB_VERSION=v0.1.0` — конкретный релиз, `CLAB_INSTALL_DIR` — куда класть.

Windows — `clab_<версия>_windows_amd64.zip` со [страницы последнего
релиза](https://github.com/cadence-lab-tech/homebrew-tap/releases/latest):
распаковать и положить `clab.exe` в каталог из `PATH`.

## Как обновляется формула

`release.yml` в приватном `sdlc-pipeline-backend` по тегу `v*` собирает
архивы, выкладывает их релизом **здесь** и шлёт сюда `repository_dispatch`
(`clab-release`) с тегом и содержимым `checksums.txt`.
`.github/workflows/update.yml` рендерит `Formula/clab.rb` через
`bin/formula.sh` и коммитит. Руками, если событие не дошло:

```bash
gh release download v0.1.0 --repo cadence-lab-tech/homebrew-tap --pattern checksums.txt
gh workflow run update.yml --repo cadence-lab-tech/homebrew-tap \
    -f tag=v0.1.0 -f checksums="$(cat checksums.txt)"
```

Проверить формулу локально до пуша:

```bash
brew trust --tap file://$PWD && brew tap cadence-lab-tech/tap file://$PWD
brew install --verbose clab && brew test clab
```
