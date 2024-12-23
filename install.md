This is a guide for installing the theme

# GTK and Icons

you need to download the hackthebox theme,icon zip file and unzip it then put it in your `/usr/share/themes` and `/usr/share/icons`
and then enable the theme.

```bash
cp -r hackthebox/usr/share/icons/Hack-The-Box-Icons/ /usr/share/icons
cp -r hackthebox/usr/share/themes/Hack-The-Box/ /usr/share/themes
```

# Bash files

you need to put everything in etc/htb in the `/etc/htb` dir.
and your `.bashrc` in `~/`

```bash
cp -r hackthebox/etc/htb/ /etc
cp hackthebox/bashrc ~/.bashrc
```


> [!IMPORTANT]  
> for the bashrc to work with your ip and server name(also in the i3bar) you need to put all your vpn files in `~/.vpn`

# i3wm

starting with i3 you can just put the colors in your config and it will look as expected.

```bash
cp -r hackthebox/.config/i3/* .config/i3/
cp hackthebox/.config/i3status/config .config/i3status/config
```
if you just want the colors you can add the following but for the htb tun0 ip server and ping you would need the bash files 
i have explained below as well
```

set $fg  #bbff34
set $bg  #131C2A

# class                 border  backgr. text indicator child_border
client.focused          $bg     $bg     $fg  $fg       $fg
client.focused_inactive $bg     $bg     $fg  $bg       $bg
client.unfocused        $bg     $bg     $fg  $bg       $bg
client.urgent           $bg     $bg     $fg  $bg       $bg
client.placeholder      $bg     $bg     $fg  $bg       $bg

client.background       $bg



bar {
status_command i3status
    colors{
        background $bg
            statusline $fg
        separator  $fg

            focused_workspace  $bg $fg $bg
            active_workspace   $bg $bg $fg
            inactive_workspace $bg $bg $fg
            urgent_workspace   $fg $fg $bg
#
}
}
```

*  the first part is for i3 itself
* the bar part is for the i3 bar

### scripting i3bar
now notice the `status_command i3status`
here it runs the command i3 bar should display 
if you see in the i3 config you will notice the command is `status.sh`
*This is because there is no way to directly show sh outputs in i3wm* [reference](https://faq.i3wm.org/question/4815/adding-shell-script-to-i3statusconf.1.html)

> note for these to work you need place your vpns in `$HOME/.vpn`
> and you need to run them using `sudo openvpn <file name>`

so you run `status.sh` and it runs 
* `i3status.sh` : this gets the i3 bar json into text
* `/etc/htb/i3status-server.sh`  gets server name/ip/ping[ms] 


the bash files here are needed for running the i3status command
we are doing this so that we can see the tun0 ip/server name/ping in the i3 status bar

the `status.sh` only checks if the `/etc/htb/i3status-server.sh` and `i3status.sh` files exist or not if they do run them, merge and print.

`/etc/htb/i3status-server.sh` is a modified version of `/etc/htb/vpnpanel.sh` 

*you will see a top command is used instead of i3status CPU that is because i3status run once has a bug and it returns negative int*

to better understand this you can just run these commands yourself.


# Terminals

## mate terminal

mate terminal uses dconf to load its colors.
you can just run this 
```bash
dconf load /org/mate/terminal/profiles/default/ < mate-terminal-profiles.dconf
```

## gnome terminal

same as before
```bash
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
```
## xfce4 terminal

This uses `.theme` files for its colors. you need to put the file in `/usr/share/xfce4/terminal/colorschemes`

```bash
mv hackthebox/usr/share/xfce4/terminal/colorschemes/hackthebox.theme /usr/share/xfce4/terminal/colorschemes
```
## terminator

put the config file in `~/.config/terminator/config`

```bash
mv hackthebox/.config/terminator/config ~/.config/terminator/config
```

## kitty 

put the config file in `~/.config/kitty/kitty.conf`

```bash
mv hackthebox/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf
```
### Don't see your terminal listed here?

no need to worry just cat the sequance file and this way you can get the color theme in any terminal instantly
i recommend putting it in your bashrc (this way it also works inside tmux)

`cat hackthebox/sequences`

and any terminal will instantly have the colors 

# Application launcher 

## rofi
put the config file in `~/.config/rofi/config.rasi`

```bash
mv hackthebox/.config/rofi/config.rasi ~/.config/rofi/config.rasi
```

# Terminal multiplexer

## zellij

put the config file in `~/.config/zellij/themes`

```bash
mv hackthebox/.config/zellij/themes/htb.kdl ~/.config/zellij/themes
```

## tmux 

```bash
mv hackthebox/.config/tmux/tmux.conf ~/.config/tmux
```
the file is really small and self explanatory 
```
set-option -g default-command bash
set -g default-terminal "screen-256color"
set-option -ga terminal-overrides ",xterm-256color:Tc"
set -g status-style 'bg=#9CE907,fg=#10180D'
```

*note if you see your colors getting messed up my tmux you can cat the sequance file*

