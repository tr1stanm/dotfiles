# from the arch wiki wiki.archlinux.org/title/GDM
#
# !/bin/sh

gst=/usr/share/gnome-shell/gnome-shell-theme.gresource
workdir=${HOME}/Desktop/shell-theme

for r in `gresource list $gst`; do
	r=${r#\/org\/gnome\/shell/}
	if [ ! -d $workdir/${r%/*} ]; then
	  mkdir -p $workdir/${r%/*}
	fi
done

for r in `gresource list $gst`; do
        gresource extract $gst $r >$workdir/${r#\/org\/gnome\/shell/}
done
