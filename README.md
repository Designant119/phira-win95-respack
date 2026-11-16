# Phira Win95 音符皮肤

Windows 95 提示窗口图标风格的音乐游戏音符皮肤，用于 Phira / prpr 及 phira-render 渲染。

## 预览

单押（白描边）与多押（金描边 + 光晕）成对排列：

- `click` 蓝底 X（信息）
- `drag` 金底 ?（问号）
- `flick` 红底 !（警告）

## 内容

| 文件 | 说明 | 尺寸 |
|---|---|---|
| `click.png` / `click_mh.png` | tap 音符 | 1148×250 |
| `drag.png` / `drag_mh.png` | drag 音符 | 1098×200 |
| `flick.png` / `flick_mh.png` | flick 音符 | 1148×322 |
| `hold.png` / `hold_mh.png` | 长条图集（沿用上游原版，暂未改） | 1000×1100 |
| `hit_fx.png` | 打击特效图集（沿用上游原版） | 1000×875 |
| `info.yml` | 资源包元信息 | — |

## 设计要点

1. **单押和多押贴图尺寸严格相同**。渲染器按 `height / width` 决定音符厚度（`prpr/src/core/note.rs` 的 `draw_center`），如果多押贴图比单押大，多押会凭空变厚 2.5 倍。
2. 多押版本只是把白色描边换成金色并加三层金色光晕，几何完全一致。
3. `info.yml` 里 `holdAtlas` / `holdAtlasMH` 为 50/50；`holdAtlas.x` 取尾部高度、`.y` 取头部高度，头部在贴图**底部**、尾部在**顶部**。

## 用法

把本目录内容覆盖到渲染器的 `assets/respack/` 即可（prpr 默认读这个目录）。
用 `phira-render` 时也可以通过渲染参数的 `resPackPath` 指向本目录。

## 音效

本仓库不含音效。打击音效固定读取 `assets/click.ogg` / `drag.ogg` / `flick.ogg`（必须是 44100Hz），
音量用渲染参数 `volumeSfx` 调（只作用于音符音效，不影响 BGM）。

## 许可

造型为自绘，参考 Windows 95 系统提示图标；Windows 95 相关素材版权归 Microsoft。
