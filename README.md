# Readme : My nix-os & home-manager configuration

## 1. NixOS installation

1. Download the latest NixOS ISO from the https://nixos.org/download/#nixos-iso.
2. Install NixOs normally like any other Linux distribution.
3. Beware to the partitioning step. Especially about the EFI partition and
   the `/boot` mount point, the swap partition, the root partition and the home 
   partition. It is recommended to have a separate partition for the home 
   directory, it will make it easier to manage your data and configurations.
4. For the user account, you can create a temporary user (e.g. `martin`)


## 2. Clone this repository

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


## 3. Apply the configuration

1. Decrypt the private age key file:

```bash
nix-shell -p gnupg
gpg -d secrets/age.key.gpg > secrets/age.key
```

2. Copy the `configuration.nix` file to the `/etc/nixos/` directory:

```bash
sudo cp configuration.nix /etc/nixos/
```

3. Apply the configuration:

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

## 5. Configure nextcloud

You can get the nextcloud password by executing the following command:

```bash
agenix -d nextcloud.pass.age -i age.key
```

## 6. Enjoy!

Restart your computer with 

```bash
sudo systemctl reboot
```

and enjoy your new NixOS configuration!
