# Homebrew-тап Cadence Lab

```bash
brew trust cadence-lab-tech/tap          # Homebrew 6: сторонние тапы грузятся только после доверия
brew install cadence-lab-tech/tap/clab
clab auth login --host https://<адрес сервиса>
```

Ставятся `clab` и `clab-runner`. Обновление — `brew upgrade clab`.

Релизы лежат в приватном репозитории
[sdlc-pipeline-backend](https://github.com/cadence-lab-tech/sdlc-pipeline-backend),
поэтому brew нужен доступ к GitHub от участника организации. Он берёт его
сам: из `gh auth login`, из `HOMEBREW_GITHUB_API_TOKEN` или из keychain
macOS. Прямая ссылка на ассет приватного релиза отвечает 404, поэтому
формула качает через `lib/private_strategy.rb`: находит ассет по имени
через API и забирает его с токеном. Сам тап тоже приватный — git должен
уметь его клонировать (те же keychain или `gh auth setup-git`; либо по ssh:
`brew tap cadence-lab-tech/tap git@github.com:cadence-lab-tech/homebrew-tap.git`).

## Без Homebrew

`install.sh` качает архив под свою платформу и `checksums.txt` тем же API,
сверяет сумму и кладёт `clab` и `clab-runner` в `/usr/local/bin` или
`~/.local/bin`:

```bash
gh api repos/cadence-lab-tech/homebrew-tap/contents/install.sh \
    -H "Accept: application/vnd.github.raw" | sh
```

`CLAB_VERSION=v0.1.0` — конкретный релиз, `CLAB_INSTALL_DIR` — куда класть.
Windows — zip из релиза: `gh release download --repo cadence-lab-tech/sdlc-pipeline-backend --pattern 'clab_*_windows_amd64.zip'`.

## Как обновляется формула

`release.yml` в `sdlc-pipeline-backend` по тегу `v*` собирает архивы,
публикует релиз и шлёт сюда `repository_dispatch` (`clab-release`) с тегом
и содержимым `checksums.txt`. `.github/workflows/update.yml` рендерит
`Formula/clab.rb` через `bin/formula.sh` и коммитит. Руками, если событие
не дошло:

```bash
gh release download v0.1.0 --repo cadence-lab-tech/sdlc-pipeline-backend --pattern checksums.txt
gh workflow run update.yml --repo cadence-lab-tech/homebrew-tap \
    -f tag=v0.1.0 -f checksums="$(cat checksums.txt)"
```

Проверить формулу локально до пуша:

```bash
brew trust --tap file://$PWD && brew tap cadence-lab-tech/tap file://$PWD
brew install --verbose clab && brew test clab
```
