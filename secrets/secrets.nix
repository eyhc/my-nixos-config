let
  agePk = builtins.readFile ./age.key.pub;
  secrets = [
    "guest.pass.age"
    "ecarrot.pass.age"
  ];
in builtins.listToAttrs (map (name: {
  inherit name;
  value.publicKeys = [ agePk ];
}) secrets)
