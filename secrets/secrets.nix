let
  agePk = builtins.readFile ./age.key.pub;
  secrets = [
    "guest.pass.age"
    "ecarrot.pass.age"
    "nextcloud.pass.age"
    "github_id_ed25519.age"
    "gitlab_id_ed25519.age"
    "gricad_id_ed25519.age"
  ];
in builtins.listToAttrs (map (name: {
  inherit name;
  value.publicKeys = [ agePk ];
}) secrets)
