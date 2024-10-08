{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "microstrain_inertial_description" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_description-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "d73f69cd9800d60b2e38949842aea6ebd2c1d832";
        hash = "sha256-JoJmA6Hgdlv+t+8+Lp5/6x6Pb8STS25abugASDkVv8I=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "microstrain_inertial_description";
  version = "4.4.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_description";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "URDF and stl files for MicroStrain sensors.";
  };
})
