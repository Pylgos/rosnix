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
  version = "0.0.1-2";
  src = finalAttrs.passthru.sources."robotiq_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "robotiq_controllers" = substituteSource {
      src = fetchgit {
        name = "robotiq_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_robotiq_gripper-release.git";
        rev = "0d7e56423ce92d510911df6678f4ac0bb93173c2";
        hash = "sha256-JhCCmqa9agEkqVO3vJ372AV/ZDF6zTNZta6YYwe29Y8=";
      };
    };
  });
  meta = {
    description = "Controllers for the Robotiq gripper.";
  };
})
