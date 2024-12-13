{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  canopen-402-driver,
  canopen-core,
  canopen-fake-slaves,
  canopen-proxy-driver,
  canopen-ros2-controllers,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward-command-controller,
  joint-state-broadcaster,
  joint-trajectory-controller,
  lely-core-libraries,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_tests";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."canopen_tests";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ canopen-402-driver canopen-core canopen-fake-slaves canopen-proxy-driver canopen-ros2-controllers controller-manager forward-command-controller joint-state-broadcaster joint-trajectory-controller lely-core-libraries robot-state-publisher xacro ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_tests" = substituteSource {
      src = fetchgit {
        name = "canopen_tests-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "5b386d574abe5a169deb8e8d53d1144d2a3ac0a7";
        hash = "sha256-ZFh0pWfITN+iDUTBgGplY3gtn+9Y1FdxNAXmLJpLMEw=";
      };
    };
  });
  meta = {
    description = "Package with tests for ros2_canopen";
  };
})
