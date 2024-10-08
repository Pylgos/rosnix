{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "depthai_descriptions" = substituteSource {
      src = fetchgit {
        name = "depthai_descriptions-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "9b1aa37c38dd2daa0306afad52f738f7058a55e3";
        hash = "sha256-uNFjKaWZPAPZ92Wrc+Rj2wyS/KUFTWh406gyM9rIY6Q=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "depthai_descriptions";
  version = "2.10.2-1";
  src = finalAttrs.passthru.sources."depthai_descriptions";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ robot-state-publisher xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "The depthai_descriptions package";
  };
})
