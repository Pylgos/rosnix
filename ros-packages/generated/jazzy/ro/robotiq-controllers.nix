{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robotiq_controllers";
  version = "0.0.1-3";
  src = finalAttrs.passthru.sources."robotiq_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "robotiq_controllers" = substituteSource {
      src = fetchgit {
        name = "robotiq_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_robotiq_gripper-release.git";
        rev = "6c6fbff726bf1944fd9a5a51ed3ee60365f53e5f";
        hash = "sha256-JhCCmqa9agEkqVO3vJ372AV/ZDF6zTNZta6YYwe29Y8=";
      };
    };
  });
  meta = {
    description = "Controllers for the Robotiq gripper.";
  };
})
