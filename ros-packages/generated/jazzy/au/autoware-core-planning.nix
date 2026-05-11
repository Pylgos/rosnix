{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-behavior-velocity-planner,
  autoware-behavior-velocity-stop-line-module,
  autoware-cmake,
  autoware-lint-common,
  autoware-mission-planner,
  autoware-motion-velocity-obstacle-stop-module,
  autoware-motion-velocity-planner,
  autoware-path-generator,
  autoware-planning-topic-converter,
  autoware-velocity-smoother,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_core_planning";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_core_planning";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-behavior-velocity-planner autoware-behavior-velocity-stop-line-module autoware-mission-planner autoware-motion-velocity-obstacle-stop-module autoware-motion-velocity-planner autoware-path-generator autoware-planning-topic-converter autoware-velocity-smoother ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-behavior-velocity-planner autoware-behavior-velocity-stop-line-module autoware-mission-planner autoware-motion-velocity-obstacle-stop-module autoware-motion-velocity-planner autoware-path-generator autoware-planning-topic-converter autoware-velocity-smoother ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core_planning" = substituteSource {
      src = fetchgit {
        name = "autoware_core_planning-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "4dc0f0e75a20f5a72baea3a75ba5dfcf74ff81ed";
        hash = "sha256-3sZ/WzejhTx87vuHurZ5C/H8lbmWOr6qDQ2EFFhYvcI=";
      };
    };
  });
  meta = {
    description = "The autoware_core_planning package";
  };
})
