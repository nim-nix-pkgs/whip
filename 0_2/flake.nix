{
  description = ''Whip is high performance web application server based on httpbeast a nest for redix tree based routing with some extra opmtizations.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-whip-0_2.flake = false;
  inputs.src-whip-0_2.owner = "mattaylor";
  inputs.src-whip-0_2.ref   = "refs/tags/0.2";
  inputs.src-whip-0_2.repo  = "whip";
  inputs.src-whip-0_2.type  = "github";
  
  inputs."packedjson".dir   = "nimpkgs/p/packedjson";
  inputs."packedjson".owner = "riinr";
  inputs."packedjson".ref   = "flake-pinning";
  inputs."packedjson".repo  = "flake-nimble";
  inputs."packedjson".type  = "github";
  inputs."packedjson".inputs.nixpkgs.follows = "nixpkgs";
  inputs."packedjson".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."nest".dir   = "nimpkgs/n/nest";
  inputs."nest".owner = "riinr";
  inputs."nest".ref   = "flake-pinning";
  inputs."nest".repo  = "flake-nimble";
  inputs."nest".type  = "github";
  inputs."nest".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nest".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."httpbeast".dir   = "nimpkgs/h/httpbeast";
  inputs."httpbeast".owner = "riinr";
  inputs."httpbeast".ref   = "flake-pinning";
  inputs."httpbeast".repo  = "flake-nimble";
  inputs."httpbeast".type  = "github";
  inputs."httpbeast".inputs.nixpkgs.follows = "nixpkgs";
  inputs."httpbeast".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-whip-0_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-whip-0_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}