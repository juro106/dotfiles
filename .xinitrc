# # .xinitrc
#
# # 読み込む順番
# # 1. startx
# # 2. ~/.initrc
# # 3. DE が立ち上がる
# # 4. WM が立ち上がろうとする
# # 5. ~/.xprofile を見る
# # 6. WM が立ち上がる
# # 7. 最初の画面
#
# # fcitx5
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx
#
# # キーボード設定（xkb）
# # キーの入れ替えなど (caps -> ctrl, ctrl -> mod4)
# xkbcomp -I $HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY 2> /dev/null
#
# # amixer ※ i3 じゃないと効かないかも
# sleep 2 && amixer sset Headphone 100%,100% unmute
#
# sway用
# # session を wayland に設定
# export XDG_SESSION_TYPE=wayland
#
# # Firefox や thunderbird をwayland で起動
# export MOZ_ENABLE_WAYLAND=1
#
# # Qt を wayland で起動、wayland に対応していない場合は xWayland で起動
# export QT_QPA_PLATFORM="wayland;xcb"
#
# # Wayland で WebRTC screen sharing を利用するために必要
# export XDG_CURRENT_DESKTOP=sway
# export XDG_CURRENT_SESSION=sway
#
# # Lightdm で sway の起動前に必要
# export LIBSEAT_BACKEND=logind
#
# # hdpi 向けの scaling 設定、個人の好み
# export GDK_DPI_SCALE=1
# export QT_SCALE_FACTOR=1
#
# # 以下の設定がないと外部モニタの検出ができない環境もある？
# export WLR_DRM_NO_MODIFIERS=1
# sway用ここまで
