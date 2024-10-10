{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-control,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "irobot_create_description" = substituteSource {
      src = fetchgit {
        name = "irobot_create_description-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "d98c61478276c8eb42fef67d79d0d2d0e6b0935d";
        hash = "sha256-pZpyQbQhGBPN7BNIF2+iYAHoUH84yxJCheCsMqXPwBk=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_description";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."irobot_create_description";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ irobot-create-control urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Provides the model description for the iRobot(R) Create(R) 3 Educational Robot.";
  };
})
