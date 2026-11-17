# Phira Win95 音符皮肤

Windows 95 提示窗口图标风格的 Phira 资源包，皮肤、打击特效、音效一套齐。

## 预览

| 音符 | 造型 | 单押 / 多押 |
|---|---|---|
| click | 蓝底白 X（信息提示窗） | 白描边 / 金描边 + 光晕 |
| drag | 金底问号（询问提示窗） | 白描边 / 金描边 + 光晕 |
| flick | 红底感叹号（警告提示窗） | 白描边 / 金描边 + 光晕 |
| hit_fx | Win95 选中框（虚线双框 + 四角手柄 + 八方向碎片） | — |

## 内容

| 文件 | 说明 | 尺寸 |
|---|---|---|
| `click.png` / `click_mh.png` | tap 音符 | 1148×250 |
| `drag.png` / `drag_mh.png` | drag 音符 | 1098×200 |
| `flick.png` / `flick_mh.png` | flick 音符 | 1148×322 |
| `hold.png` / `hold_mh.png` | 长条图集（沿用上游原版，暂未改） | 1000×1100 / 1150×1250 |
| `hit_fx.png` | 打击特效图集（8×7，每格 125×125） | 1000×875 |
| `click.ogg` / `drag.ogg` / `flick.ogg` | 打击音效（CHORD / DING / CHIMES，44100Hz） | — |
| `info.yml` | 资源包元信息 | — |

## 安装

下载 release 里的 zip，**不要解压成嵌套文件夹**，直接：

**Phira → 资源包 → 右上角「+」→ 选这个 zip**

导入后如果没生效，重启一次 Phira。

## 设计要点

1. **单押和多押贴图尺寸严格相同**。渲染器按 `height / width` 决定音符厚度（`prpr/src/core/note.rs` 的 `draw_center`），多押贴图比单押大就会凭空变厚。
2. 多押只是把白色描边换成金色并加光晕，几何完全一致。
3. 打击特效图集 1000×875、`hitFx: [8, 7]`、`hitFxScale: 0.9`，与上游原版同规格、同大小、同时长（0.5 秒），不设置 `hideParticles`，方块粒子保留。
4. `holdAtlas` / `holdAtlasMH` 为 50/50；`holdAtlas.x` 取贴图**底部**、`.y` 取**顶部**，中间纵向拉伸。

## 音效说明

资源包根目录的 `click.ogg` / `drag.ogg` / `flick.ogg` 会被 Phira 本体直接读取，导入即生效。

注意：部分第三方渲染器（如 `phira-render`）把音效路径写死在自身 `assets/` 根目录，那种情况才需要手动把三个 ogg 拷过去。

## 许可

音效取自 Windows 95 系统提示音，note 造型为原创绘制。仅供非商业交流使用。
