{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  plansys2-bringup,
  plansys2-bt-actions,
  plansys2-core,
  plansys2-domain-expert,
  plansys2-executor,
  plansys2-lifecycle-manager,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-planner,
  plansys2-popf-plan-solver,
  plansys2-problem-expert,
  plansys2-support-py,
  plansys2-terminal,
  plansys2-tools,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."plansys2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ plansys2-bringup plansys2-bt-actions plansys2-core plansys2-domain-expert plansys2-executor plansys2-lifecycle-manager plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-popf-plan-solver plansys2-problem-expert plansys2-support-py plansys2-terminal plansys2-tools ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-bringup plansys2-bt-actions plansys2-core plansys2-domain-expert plansys2-executor plansys2-lifecycle-manager plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-popf-plan-solver plansys2-problem-expert plansys2-support-py plansys2-terminal plansys2-tools ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2" = substituteSource {
      src = fetchgit {
        name = "plansys2-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "0407668e4e8da7e2d4af6fd66865305f5a57f86e";
        hash = "sha256-dRrCTiOwCYRNIRqPtPc8OerogPs0K7PL5v39y4/6ZFs=";
      };
    };
  });
  meta = {
    description = "ROS2 Planning System";
  };
})
