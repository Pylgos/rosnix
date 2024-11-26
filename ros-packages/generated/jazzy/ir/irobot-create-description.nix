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
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_description";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."irobot_create_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-control urdf xacro ];
  checkInputs = [ ament-cmake-lint-cmake ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_description" = substituteSource {
      src = fetchgit {
        name = "irobot_create_description-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "55dfe0688de4b965a4692355096c51952fc453f1";
        hash = "sha256-FqmRCHnFVkq6A9ZTsVE/iptcMQRuCBd3nyl0qznEwv8=";
      };
    };
  });
  meta = {
    description = "Provides the model description for the iRobot(R) Create(R) 3 Educational Robot.";
  };
})
