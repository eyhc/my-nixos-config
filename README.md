# Readme : My nix-os & home-manager configuration

## 1. NixOS installation

1. Download the latest NixOS ISO from the https://nixos.org/download/#nixos-iso.
2. Install NixOs normally like any other Linux distribution.
3. Beware to the partitioning step. Especially about the EFI partition and
   the `/boot` mount point, the swap, root and home partitions. 
   
   It is recommended to have a separate partition for home directories.
   This way, you can easily keep your data when you need to reinstall an OS.
4. For the user account, you can create a temporary user (e.g. `temp`) with
   sudo privileges. This user will be deleted after applying the configuration.


## 2. Clone this repository

### 2.1. Connection to internet

If you are using a wired connection, it should be automatically detected and
connected. However, if you are using a wireless connection, you will need to
connect to the internet manually (using the `nmtui` command for example).

### 2.1. Clone the repository

After installing NixOS, you will could execute the following command to clone 
this repository to your home directory:

```bash
cd ~
nix-shell -p git --run "git clone https://github.com/eyhc/my-nixos-config.git"
cd my-nixos-config
```

### 2.2. Change the user name (if needed)

You can configure users by adaptating the `system/config.nix` file.
By default, the sudo user is `ecarrot` and the guest user is `guest`.
Passwords are encrypted with `agenix` and stored in the `secrets` directory.
Adapt `secrets` directory for your own needs and make sure to update the 
`system/config.nix` file accordingly.

## 3. Apply the configuration

1. Decrypt the private age key file:

   ```bash
   nix-shell -p gnupg pinentry-curses
   gpg -d secrets/age.key.gpg > secrets/age.key
   ```

   If you encounter an error about `pinentry`, you can fix it by running the 
   following commands:

   ```bash
   mkdir ~/.gnupg
   echo "pinentry-program $(which pinentry-curses)" > ~/.gnupg/gpg-agent.conf
   gpgconf --kill gpg-agent
   gpg -d secrets/age.key.gpg > secrets/age.key
   exit
   ```


2. Modify the `/etc/nixos/configuration.nix` file by removing all lines except 
   the import and the `system.stateVersion` lines. Then, add the `main.nix` file
   into the imports list.

   At the end, it should look like this:

   ```nix
   { config, pkgs, ... }:
   {
   imports =
      [ # Include the results of the hardware scan.
         ./hardware-configuration.nix
         /home/martin/my-nixos-config/main.nix   # ADAPT HERE !!!
      ];

   system.stateVersion = "25.11"; # Did you read the comment?
   }
   ```


3. Apply the configuration and reboot the system:

   ```bash
   sudo nixos-rebuild switch
   sudo systemctl reboot
   ```

## 4. Apply the home-manager configuration

Same as before, you need to decrypt the private age key file (if not already 
done) and adapt the line `user = "martin";` in the `home-config.nix` file to 
match your user name.

Then, you can apply the home-manager configuration by executing the following 
command:

```bash
home-manager switch -f home-config.nix
```

## 5. Configure Nextcloud

You can get the Nextcloud password by executing the following command:

```bash
agenix -d nextcloud.pass.age -i age.key
```

## 6. Enjoy!

Restart your computer with 

```bash
sudo systemctl reboot
```

and enjoy your new NixOS configuration!
